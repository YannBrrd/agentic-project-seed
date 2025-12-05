# Agentic Project Seed

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Cookiecutter](https://img.shields.io/badge/cookiecutter-ready-brightgreen.svg)](https://github.com/cookiecutter/cookiecutter)

A comprehensive seed project template with GitHub Copilot instructions and AI agent presets that simulate a complete development team. Perfect for bootstrapping new projects with best practices, intelligent coding assistance, and automated workflows.

## 🎯 Features

- **🤖 GitHub Copilot Integration**: Comprehensive copilot instructions for intelligent code assistance
- **👥 AI Agent Team**: Pre-configured specialized agents simulating a full dev team:
  - Project Manager (coordinator)
  - Backend Developer
  - Frontend Developer
  - QA/Testing Engineer
  - DevOps Engineer
  - Documentation Writer
- **🍪 Cookiecutter Support**: Easy project templating and customization
- **📚 Best Practices**: Industry-standard patterns and guidelines
- **🔧 Ready to Use**: Start coding immediately with pre-configured structure

## 🚀 Quick Start

### Using with Cookiecutter

```bash
# Install cookiecutter if you haven't already
pip install cookiecutter

# Generate a new project from this template
cookiecutter gh:YannBrrd/agentic-project-seed

# Or use a local copy
cookiecutter /path/to/agentic-project-seed
```

### Manual Setup

```bash
# Clone the repository
git clone https://github.com/YannBrrd/agentic-project-seed.git my-new-project
cd my-new-project

# Remove git history to start fresh
rm -rf .git
git init
git add .
git commit -m "Initial commit from agentic-project-seed"
```

## 📖 What's Included

### GitHub Copilot Instructions

Located in `.github/copilot-instructions.md`, this file provides:
- Code quality standards and best practices
- Testing strategies and guidelines
- Documentation requirements
- Security best practices
- Performance optimization tips
- Language-specific guidelines
- Git workflow conventions
- Architecture patterns
- Common pitfalls to avoid

### AI Agent Team

Each agent in `.github/agents/` is a specialized team member with:

#### 🎯 Project Manager (`project-manager.md`)
- Coordinates between all agents
- Breaks down requirements into tasks
- Manages dependencies and timelines
- Tracks progress and reports status
- Handles task delegation

#### 🔧 Backend Developer (`backend-developer.md`)
- API design and implementation
- Database architecture
- Server-side business logic
- Authentication and authorization
- Performance optimization
- Backend testing

#### 🎨 Frontend Developer (`frontend-developer.md`)
- User interface development
- Client-side architecture
- State management
- API integration
- Responsive design
- Accessibility
- Frontend testing

#### 🧪 QA Engineer (`qa-engineer.md`)
- Test strategy development
- Unit, integration, and E2E testing
- Bug reporting and tracking
- Test automation
- Quality assurance
- Performance testing

#### ⚙️ DevOps Engineer (`devops-engineer.md`)
- CI/CD pipeline setup
- Infrastructure as Code
- Container orchestration
- Monitoring and alerting
- Security and compliance
- Backup and disaster recovery

#### 📝 Documentation Writer (`documentation-writer.md`)
- Technical documentation
- API documentation
- User guides and tutorials
- README and contributing guides
- Changelog maintenance
- Code documentation

## 💡 How to Use the Agents

### With GitHub Copilot

When working in your IDE with GitHub Copilot:

1. Copilot automatically reads `.github/copilot-instructions.md`
2. It uses these guidelines to provide better suggestions
3. For specialized tasks, reference specific agent files
4. Comment your intent, and Copilot will follow the patterns

Example:
```javascript
// Following the backend-developer agent pattern, create a user service
// with repository pattern and proper error handling
```

### Manual Reference

Use agent files as:
- **Style guides** for your work
- **Checklists** for task completion
- **Templates** for common patterns
- **Learning resources** for best practices
- **Review criteria** for code quality

### With AI Tools

When using AI coding assistants:
- Share relevant agent context with your AI
- Ask it to follow the agent's guidelines
- Use agents as a knowledge base
- Reference specific sections for detailed help

## 🛠️ Customization

### Cookiecutter Variables

Edit `cookiecutter.json` to customize:
- Project name and description
- Author information
- Programming languages and frameworks
- Database choices
- CI/CD platform
- Feature toggles (Docker, tests, docs, etc.)

### Adding Custom Agents

Create new agent files in `.github/agents/`:

```markdown
# Custom Agent Name

## Role
Description of the agent's role

## Responsibilities
- List of responsibilities

## Guidelines
Specific guidelines and best practices
```

### Modifying Existing Agents

Edit agent files to:
- Add company-specific guidelines
- Include custom tools and frameworks
- Update coding standards
- Add team-specific processes

## 📋 Project Structure

```
agentic-project-seed/
├── .github/
│   ├── copilot-instructions.md    # Main Copilot instructions
│   └── agents/                     # Specialized agent presets
│       ├── project-manager.md
│       ├── backend-developer.md
│       ├── frontend-developer.md
│       ├── qa-engineer.md
│       ├── devops-engineer.md
│       └── documentation-writer.md
├── cookiecutter.json               # Template configuration
├── .gitignore                      # Git ignore patterns
├── LICENSE                         # License file
├── README.md                       # This file
└── USAGE_GUIDE.md                  # Detailed usage guide
```

## 📚 Documentation

- [Copilot Instructions](.github/copilot-instructions.md) - Main coding guidelines
- [Usage Guide](USAGE_GUIDE.md) - Detailed instructions and examples
- [Project Manager Agent](.github/agents/project-manager.md)
- [Backend Developer Agent](.github/agents/backend-developer.md)
- [Frontend Developer Agent](.github/agents/frontend-developer.md)
- [QA Engineer Agent](.github/agents/qa-engineer.md)
- [DevOps Engineer Agent](.github/agents/devops-engineer.md)
- [Documentation Writer Agent](.github/agents/documentation-writer.md)

## 🎓 Examples

### Example 1: Starting a New Feature

1. **Consult Project Manager agent** for task breakdown
2. **Follow Backend Developer agent** for API implementation
3. **Follow Frontend Developer agent** for UI implementation
4. **Follow QA Engineer agent** for testing strategy
5. **Follow DevOps Engineer agent** for deployment
6. **Follow Documentation Writer agent** for documentation

### Example 2: Using with AI Assistant

```
You: I need to build a user authentication system

AI (following PM agent): Let me break this down:
1. Backend: API endpoints with JWT tokens
2. Frontend: Login/register forms
3. Testing: Auth flow tests
4. DevOps: Secure secret management
5. Docs: API and user documentation

Shall I proceed with the backend implementation following 
the backend-developer agent guidelines?
```

## 🤝 Contributing

We welcome contributions! To improve this seed project:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Ensure all agent files follow the established format
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by best practices from the software development community
- Built for use with GitHub Copilot and AI coding assistants
- Designed to work seamlessly with Cookiecutter

## 🔗 Related Resources

- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Cookiecutter Documentation](https://cookiecutter.readthedocs.io/)
- [Software Development Best Practices](https://github.com/topics/best-practices)

## 💬 Support

- **Issues**: [GitHub Issues](https://github.com/YannBrrd/agentic-project-seed/issues)
- **Discussions**: [GitHub Discussions](https://github.com/YannBrrd/agentic-project-seed/discussions)

---

**Happy Coding! 🚀**

Start your next project with a complete AI-powered development team at your fingertips.
