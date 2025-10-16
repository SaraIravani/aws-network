#!/bin/bash
# ==============================================
# Professional AWS Cost Estimation Script
# CSV + JSON output
# Author: Sara Iravani
# ==============================================

# Output files
CSV_FILE="cost_estimation.csv"
JSON_FILE="cost_estimation.json"

# Colors
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NC="\033[0m"

echo -e "${GREEN}🔹 Starting AWS Cost Estimation...${NC}"

# Check Terraform
if ! command -v terraform &> /dev/null; then
    echo -e "${RED}Terraform not found. Install Terraform first.${NC}"
    exit 1
fi

# Ensure we are in Terraform root
if [ ! -f "main.tf" ]; then
    echo -e "${RED}Run this script from terraform root.${NC}"
    exit 1
fi

# Initialize Terraform
echo -e "${YELLOW}Initializing Terraform...${NC}"
terraform init -input=false > /dev/null

# Plan
PLAN_FILE="tfplan.out"
echo -e "${YELLOW}Creating Terraform plan...${NC}"
terraform plan -out=$PLAN_FILE -input=false > /dev/null

# Parse JSON plan
PLAN_JSON=$(terraform show -json $PLAN_FILE)

# Prepare CSV
echo "Module,Resource,Type,Count,Monthly_Cost_USD" > $CSV_FILE

# Prepare JSON array
JSON_ARRAY="["

# Helper function for EC2 cost
estimate_ec2() {
    local type=$1
    local count=$2
    case $type in
        t3.small) price=0.0208 ;;
        t3.medium) price=0.0416 ;;
        t3.large) price=0.0832 ;;
        *) price=0.05 ;;
    esac
    echo $(echo "$count * $price * 730" | bc)
}

# Process each resource
echo $PLAN_JSON | jq -c '.planned_values.root_module.resources[]' | while read r; do
    module=$(echo $r | jq -r '.module_address // "root"')
    type=$(echo $r | jq -r '.type')
    name=$(echo $r | jq -r '.name')
    count=$(echo $r | jq -r '.values.count // 1')

    # Rough cost
    cost=0
    if [[ $type == "aws_instance" ]]; then
        instance_type=$(echo $r | jq -r '.values.instance_type')
        cost=$(estimate_ec2 $instance_type $count)
    elif [[ $type == "aws_nat_gateway" ]]; then
        cost=$(echo "$count * 0.045 * 730" | bc)
    elif [[ $type == "aws_vpc_endpoint" ]]; then
        cost=$(echo "$count * 0.01" | bc)
    fi

    # CSV line
    echo "$module,$name,$type,$count,$cost" >> $CSV_FILE

    # JSON object
    JSON_ARRAY="$JSON_ARRAY{\"module\":\"$module\",\"resource\":\"$name\",\"type\":\"$type\",\"count\":$count,\"monthly_cost_usd\":$cost},"
done

# Remove trailing comma and close JSON array
JSON_ARRAY=$(echo $JSON_ARRAY | sed 's/,$//')
JSON_ARRAY="$JSON_ARRAY]"

# Save JSON
echo $JSON_ARRAY > $JSON_FILE

echo -e "${GREEN}✅ Cost estimation completed.${NC}"
echo -e "${GREEN}CSV file: $CSV_FILE${NC}"
echo -e "${GREEN}JSON file: $JSON_FILE${NC}"
echo -e "${YELLOW}💡 Note: Rough estimates. Replace with real AWS pricing for accuracy.${NC}"

