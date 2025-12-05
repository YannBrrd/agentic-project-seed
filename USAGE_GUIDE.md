# Agentic Project Seed - Usage Guide

This comprehensive guide will help you get the most out of the Agentic Project Seed, whether you're working solo, with AI assistants, or building a real team.

## Table of Contents

- [Getting Started](#getting-started)
- [Understanding the Agent System](#understanding-the-agent-system)
- [Working with GitHub Copilot](#working-with-github-copilot)
- [Using with AI Coding Assistants](#using-with-ai-coding-assistants)
- [Cookiecutter Integration](#cookiecutter-integration)
- [Workflow Examples](#workflow-examples)
- [Best Practices](#best-practices)
- [Customization Guide](#customization-guide)
- [Troubleshooting](#troubleshooting)

## Getting Started

### Installation Options

#### Option 1: Using Cookiecutter (Recommended)

```bash
# Install cookiecutter
pip install cookiecutter

# Generate a new project
cookiecutter gh:YannBrrd/agentic-project-seed

# Answer the prompts:
# project_name [My Agentic Project]: My Awesome App
# project_slug [my-awesome-app]: 
# project_short_description: An awesome application
# author_name: John Doe
# author_email: john@example.com
# ... etc
```

#### Option 2: Direct Clone

```bash
# Clone the repository
git clone https://github.com/YannBrrd/agentic-project-seed.git my-project
cd my-project

# Remove the git history
rm -rf .git

# Initialize your own repository
git init
git add .
git commit -m "Initial commit from agentic-project-seed"

# Add your remote
git remote add origin https://github.com/yourusername/my-project.git
git push -u origin main
```

#### Option 3: Use as Template on GitHub

1. Click "Use this template" button on GitHub
2. Create your new repository
3. Clone your new repository
4. Start developing!

### Initial Setup

After creating your project:

```bash
# Navigate to your project
cd my-project

# Review the structure
tree -L 3

# Read the Copilot instructions
cat .github/copilot-instructions.md

# Browse the agents
ls -la .github/agents/
```

## Understanding the Agent System

### The Agent Architecture

The agent system is designed as a virtual development team. Each agent represents a specialized role with:

1. **Clear responsibilities**
2. **Expertise areas**
3. **Guidelines and best practices**
4. **Code examples and patterns**
5. **Collaboration protocols**

### Agent Hierarchy

```
Project Manager (Coordinator)
    ├── Backend Developer
    ├── Frontend Developer
    ├── QA Engineer
    ├── DevOps Engineer
    └── Documentation Writer
```

### When to Use Each Agent

#### Project Manager Agent
**Use for:**
- Planning new features
- Breaking down complex requirements
- Coordinating multiple workstreams
- Tracking project progress
- Making architectural decisions

**Example scenario:**
"I need to add a payment system to my app. What are the steps?"

#### Backend Developer Agent
**Use for:**
- API design and implementation
- Database schema design
- Server-side business logic
- Authentication systems
- Data processing

**Example scenario:**
"How should I structure my REST API for user management?"

#### Frontend Developer Agent
**Use for:**
- UI component development
- State management
- API integration
- Responsive design
- Accessibility

**Example scenario:**
"What's the best way to implement a dashboard with React?"

#### QA Engineer Agent
**Use for:**
- Test strategy planning
- Writing test cases
- Test automation
- Bug reporting
- Quality standards

**Example scenario:**
"How do I set up comprehensive testing for my API?"

#### DevOps Engineer Agent
**Use for:**
- CI/CD setup
- Infrastructure provisioning
- Deployment automation
- Monitoring setup
- Security configuration

**Example scenario:**
"How do I deploy this app to AWS with GitHub Actions?"

#### Documentation Writer Agent
**Use for:**
- Writing README files
- API documentation
- User guides
- Code documentation
- Tutorial creation

**Example scenario:**
"How should I document my API endpoints?"

## Working with GitHub Copilot

### How Copilot Uses This Seed

GitHub Copilot automatically reads `.github/copilot-instructions.md` and uses it to:

1. Provide better code suggestions
2. Follow project conventions
3. Generate consistent code style
4. Apply best practices
5. Use appropriate patterns

### Maximizing Copilot Effectiveness

#### 1. Write Descriptive Comments

```javascript
// Good: Specific intent with context
// Following backend-developer pattern: Create a user repository 
// with CRUD operations, proper error handling, and input validation

// Bad: Vague intent
// Create user stuff
```

#### 2. Reference Agent Guidelines

```python
# Following the QA engineer test pyramid strategy,
# create unit tests for the UserService class
def test_user_service():
    # Copilot will generate tests following the guidelines
```

#### 3. Use Consistent Naming

Copilot learns from the agent guidelines about naming conventions:

```typescript
// Copilot knows to use:
// - camelCase for variables and functions
// - PascalCase for classes and components
// - UPPER_SNAKE_CASE for constants
```

#### 4. Leverage Code Examples

When agent files contain code examples, Copilot uses them as reference:

```javascript
// Following the API service layer pattern from frontend-developer agent
import { apiClient } from './apiClient';

// Copilot will generate similar patterns
export const userService = {
  // Suggestions follow the established pattern
};
```

### Agent-Specific Copilot Usage

#### For Backend Development

```javascript
// Following backend-developer repository pattern
class UserRepository {
  // Copilot suggests:
  // - Constructor with dependency injection
  // - CRUD methods with error handling
  // - Transaction support
  // - Proper TypeScript types
}
```

#### For Frontend Development

```typescript
// Following frontend-developer component structure
interface UserCardProps {
  // Copilot suggests:
  // - Proper TypeScript interfaces
  // - Optional props with ?
  // - Event handlers
}

export const UserCard: React.FC<UserCardProps> = ({
  // Copilot follows accessibility guidelines
  // Adds proper ARIA labels
  // Implements keyboard navigation
});
```

#### For Testing

```typescript
// Following qa-engineer unit test patterns with AAA
describe('UserService', () => {
  // Copilot generates:
  // - Arrange, Act, Assert structure
  // - Proper mocking
  // - Edge case tests
  // - Descriptive test names
});
```

## Using with AI Coding Assistants

### ChatGPT, Claude, and Other AI Tools

#### Starting a Conversation

```
You: I'm working on a project using the agentic-project-seed template.
Here are the project manager guidelines: [paste project-manager.md]

I need to add user authentication. Can you help me plan this feature?

AI: Based on the project manager agent guidelines, let me break this down...
```

#### Providing Context

For best results, provide:

1. **Project type**: "I'm building a React + FastAPI app"
2. **Current state**: "I have basic user CRUD already"
3. **Goal**: "I need to add JWT authentication"
4. **Relevant agent**: "Following the backend-developer agent guidelines"

#### Example Workflow with AI Assistant

```
# Step 1: Planning with PM Agent
You: [Share project-manager.md] Help me plan a user authentication feature

AI: [Provides task breakdown]

# Step 2: Backend Implementation
You: [Share backend-developer.md] Implement the authentication API

AI: [Generates code following backend patterns]

# Step 3: Frontend Integration
You: [Share frontend-developer.md] Create the login UI

AI: [Generates React components following frontend patterns]

# Step 4: Testing
You: [Share qa-engineer.md] Create comprehensive tests

AI: [Generates test suites following QA patterns]

# Step 5: Deployment
You: [Share devops-engineer.md] Set up CI/CD

AI: [Generates GitHub Actions workflow]

# Step 6: Documentation
You: [Share documentation-writer.md] Document the auth system

AI: [Generates API docs and user guide]
```

### Best Practices with AI Assistants

1. **One agent at a time**: Focus on one role per conversation
2. **Provide examples**: Share agent examples with your AI
3. **Iterate**: Refine outputs based on agent guidelines
4. **Validate**: Review AI output against agent standards
5. **Learn**: Use agents to understand what AI generates

## Cookiecutter Integration

### Template Variables

Edit `cookiecutter.json` to customize:

```json
{
  "project_name": "My Project",
  "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '-') }}",
  "backend_framework": ["fastapi", "django", "express"],
  "use_docker": "yes"
}
```

### Hooks for Automation

Create `hooks/post_gen_project.py`:

```python
import os
import shutil

# Remove files based on choices
if '{{ cookiecutter.use_docker }}' != 'yes':
    os.remove('Dockerfile')
    os.remove('docker-compose.yml')

if '{{ cookiecutter.frontend_framework }}' == 'none':
    shutil.rmtree('frontend/')

print("Project generated successfully!")
print("Next steps:")
print("1. cd {{ cookiecutter.project_slug }}")
print("2. Review .github/copilot-instructions.md")
print("3. Browse .github/agents/ for guidelines")
```

### Conditional File Generation

Use Jinja2 templates in your files:

```markdown
# {{ cookiecutter.project_name }}

{% if cookiecutter.backend_framework != 'none' %}
## Backend Setup

This project uses {{ cookiecutter.backend_framework }}.
{% endif %}

{% if cookiecutter.frontend_framework != 'none' %}
## Frontend Setup

This project uses {{ cookiecutter.frontend_framework }}.
{% endif %}
```

## Workflow Examples

### Example 1: Building a REST API

#### Step 1: Planning (Project Manager)

```markdown
## Feature: User Management API

### Tasks:
1. [ ] Design API endpoints (Backend Dev)
2. [ ] Implement database models (Backend Dev)
3. [ ] Create API tests (QA Engineer)
4. [ ] Set up CI/CD (DevOps)
5. [ ] Document endpoints (Doc Writer)
```

#### Step 2: Implementation (Backend Developer)

```python
# Following backend-developer repository pattern
from sqlalchemy.orm import Session
from models.user import User

class UserRepository:
    def __init__(self, db: Session):
        self.db = db
    
    def create(self, email: str, name: str) -> User:
        # Following error handling guidelines
        user = User(email=email, name=name)
        self.db.add(user)
        self.db.commit()
        return user
```

#### Step 3: Testing (QA Engineer)

```python
# Following qa-engineer AAA pattern
def test_create_user():
    # Arrange
    repo = UserRepository(db)
    
    # Act
    user = repo.create("test@example.com", "Test User")
    
    # Assert
    assert user.id is not None
    assert user.email == "test@example.com"
```

#### Step 4: CI/CD (DevOps Engineer)

```yaml
# Following devops-engineer pipeline structure
name: API Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: pytest tests/
```

#### Step 5: Documentation (Documentation Writer)

```markdown
# User API Documentation

## Create User

POST /api/users

**Request Body:**
```json
{
  "email": "user@example.com",
  "name": "User Name"
}
```

**Response:**
...
```

### Example 2: Adding a New Feature

#### With GitHub Copilot

1. Open relevant agent file
2. Read the guidelines
3. Start coding with comments:

```typescript
// Following frontend-developer component structure
// Create a UserProfile component with:
// - TypeScript props interface
// - Responsive design
// - Accessibility features
// - Loading and error states

interface UserProfileProps {
  // Copilot autocompletes based on agent guidelines
}
```

#### With AI Assistant

```
You: I have this project using agentic-project-seed. 
[Paste relevant agent guidelines]

I need to add a user profile feature. Can you:
1. Plan the tasks (PM perspective)
2. Design the API (Backend perspective)
3. Create the UI (Frontend perspective)
4. Plan the tests (QA perspective)

AI: [Provides comprehensive implementation following all agent guidelines]
```

## Best Practices

### 1. Start with Project Manager

Always begin new features by consulting the project manager agent for task breakdown.

### 2. Follow the Chain

```
Planning (PM) → Implementation (Dev) → Testing (QA) → Deployment (DevOps) → Documentation (Docs)
```

### 3. Keep Agents Updated

As your project evolves, update agent files with:
- New patterns you adopt
- Company-specific guidelines
- Lessons learned
- Tool changes

### 4. Use Agents as Checklists

Before completing a task:
- ✓ Followed coding standards?
- ✓ Added tests?
- ✓ Updated documentation?
- ✓ Checked security?

### 5. Cross-Reference Agents

Different agents often need to collaborate:
- Backend ↔ Frontend: API contracts
- Backend ↔ DevOps: Environment setup
- All ↔ QA: Testability
- All ↔ Docs: Documentation

## Customization Guide

### Adding Company-Specific Guidelines

Edit agent files to include your standards:

```markdown
# Backend Developer Agent

## Our Company Standards

- Always use async/await
- Prefer functional programming
- Use our internal auth library
- Follow our error code system
```

### Creating Custom Agents

Add new specialized agents:

```markdown
# .github/agents/mobile-developer.md

# Mobile Developer Agent

## Role
iOS and Android development specialist

## Responsibilities
- Native mobile app development
- Cross-platform frameworks
- Mobile-specific UX patterns
- App store deployment

## Tech Stack
- Swift/Kotlin
- React Native
- Flutter
```

### Extending for Team Collaboration

For real teams, add collaboration sections:

```markdown
## Collaboration Protocol

### Daily Standup Format
- What I did yesterday
- What I'm doing today
- Any blockers

### Code Review Checklist
- [ ] Follows agent guidelines
- [ ] Tests included
- [ ] Documentation updated
```

## Troubleshooting

### Copilot Not Following Guidelines

**Issue**: Copilot suggestions don't match agent guidelines

**Solutions**:
1. Add more specific comments referencing agents
2. Include code examples in comments
3. Check that `.github/copilot-instructions.md` exists
4. Restart your IDE to reload Copilot

### Agent Guidelines Conflict

**Issue**: Different agents suggest different approaches

**Solutions**:
1. Consult project manager agent for decision
2. Document your choice in copilot-instructions.md
3. Update conflicting agents for consistency

### Cookiecutter Generation Fails

**Issue**: Template generation errors

**Solutions**:
1. Check `cookiecutter.json` syntax
2. Validate Jinja2 templates
3. Test hooks in isolation
4. Check file permissions

### AI Assistant Ignores Context

**Issue**: AI doesn't follow agent guidelines

**Solutions**:
1. Paste agent content in conversation
2. Be more explicit: "Follow these exact guidelines"
3. Break down into smaller tasks
4. Iterate with corrections

## Advanced Topics

### Multi-Project Management

Use this seed for multiple projects:

```bash
# Create project-specific branches
git checkout -b company-backend-seed
# Customize for backend projects

git checkout -b company-frontend-seed  
# Customize for frontend projects
```

### CI/CD Integration

Auto-validate agent guidelines:

```yaml
# .github/workflows/validate-agents.yml
name: Validate Agent Files
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check agent files exist
        run: |
          test -f .github/agents/project-manager.md
          test -f .github/agents/backend-developer.md
          # ... etc
```

### Version Control for Agents

Track agent evolution:

```bash
# Tag stable agent versions
git tag -a agents-v1.0 -m "Stable agent guidelines v1.0"

# Create changelog for agent updates
echo "## Agents v1.1" >> AGENTS_CHANGELOG.md
echo "- Updated backend-developer with new patterns" >> AGENTS_CHANGELOG.md
```

## Getting Help

### Resources
- [GitHub Issues](https://github.com/YannBrrd/agentic-project-seed/issues)
- [Discussions](https://github.com/YannBrrd/agentic-project-seed/discussions)
- Individual agent files for specific guidance

### Contributing

Help improve this seed project:
1. Share your agent customizations
2. Submit bug fixes
3. Suggest new agent types
4. Improve documentation

---

**Happy Building!** 🚀

This guide will help you leverage the full power of the agentic project seed. Start with simple projects and gradually adopt more advanced patterns as you become comfortable with the system.
