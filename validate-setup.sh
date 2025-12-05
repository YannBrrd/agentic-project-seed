#!/bin/bash

# Agentic Project Seed - Setup Validation Script
# This script verifies that all components of the seed project are properly set up

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║    Agentic Project Seed - Setup Validation                    ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0
WARNINGS=0

# Function to check if a file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $2"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}✗${NC} $2 (Missing: $1)"
        ((FAILED++))
        return 1
    fi
}

# Function to check if a directory exists
check_directory() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $2"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}✗${NC} $2 (Missing: $1)"
        ((FAILED++))
        return 1
    fi
}

# Function to check file size (ensure it has content)
check_file_size() {
    if [ -f "$1" ]; then
        SIZE=$(wc -c < "$1" 2>/dev/null || echo 0)
        if [ "$SIZE" -gt "$2" ]; then
            echo -e "${GREEN}✓${NC} $3 has substantial content ($SIZE bytes)"
            ((PASSED++))
            return 0
        else
            echo -e "${YELLOW}⚠${NC} $3 seems small ($SIZE bytes, expected >$2)"
            ((WARNINGS++))
            return 1
        fi
    else
        echo -e "${RED}✗${NC} $3 not found"
        ((FAILED++))
        return 1
    fi
}

echo "Checking Core Files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_file "README.md" "README.md exists"
check_file "USAGE_GUIDE.md" "USAGE_GUIDE.md exists"
check_file "cookiecutter.json" "cookiecutter.json exists"
check_file "LICENSE" "LICENSE exists"
check_file ".gitignore" ".gitignore exists"
echo ""

echo "Checking GitHub Configuration..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_directory ".github" ".github directory exists"
check_directory ".github/agents" ".github/agents directory exists"
check_file ".github/copilot-instructions.md" "GitHub Copilot instructions exist"
echo ""

echo "Checking Agent Files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_file ".github/agents/project-manager.md" "Project Manager agent"
check_file ".github/agents/backend-developer.md" "Backend Developer agent"
check_file ".github/agents/frontend-developer.md" "Frontend Developer agent"
check_file ".github/agents/qa-engineer.md" "QA Engineer agent"
check_file ".github/agents/devops-engineer.md" "DevOps Engineer agent"
check_file ".github/agents/documentation-writer.md" "Documentation Writer agent"
echo ""

echo "Checking Template Files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_directory "templates" "templates directory exists"
check_file "templates/README.md" "Templates README"
check_file "templates/fullstack-structure.md" "Fullstack structure template"
check_file "templates/backend-api-structure.md" "Backend API structure template"
check_file "templates/frontend-spa-structure.md" "Frontend SPA structure template"
echo ""

echo "Checking Content Quality..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_file_size ".github/copilot-instructions.md" 3000 "Copilot instructions"
check_file_size ".github/agents/project-manager.md" 3000 "Project Manager agent"
check_file_size ".github/agents/backend-developer.md" 5000 "Backend Developer agent"
check_file_size ".github/agents/frontend-developer.md" 5000 "Frontend Developer agent"
check_file_size ".github/agents/qa-engineer.md" 5000 "QA Engineer agent"
check_file_size ".github/agents/devops-engineer.md" 5000 "DevOps Engineer agent"
check_file_size ".github/agents/documentation-writer.md" 5000 "Documentation Writer agent"
check_file_size "README.md" 5000 "README.md"
check_file_size "USAGE_GUIDE.md" 10000 "USAGE_GUIDE.md"
echo ""

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                     Validation Summary                         ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}Passed:${NC}   $PASSED"
echo -e "${YELLOW}Warnings:${NC} $WARNINGS"
echo -e "${RED}Failed:${NC}   $FAILED"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo ""
    echo "Your agentic project seed is properly set up and ready to use."
    echo ""
    echo "Next steps:"
    echo "1. Read README.md for an overview"
    echo "2. Review USAGE_GUIDE.md for detailed instructions"
    echo "3. Browse .github/agents/ to understand each agent's role"
    echo "4. Check templates/ for project structure examples"
    echo "5. Use cookiecutter to generate a new project"
    echo ""
    exit 0
else
    echo -e "${RED}✗ Some checks failed.${NC}"
    echo ""
    echo "Please ensure all required files are present and properly configured."
    echo "Refer to the GitHub repository for the complete setup."
    echo ""
    exit 1
fi
