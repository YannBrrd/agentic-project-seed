# GitHub Copilot Instructions

## Project Overview
This is an agentic seed project designed to bootstrap new projects with a simulated development team structure using AI agents. Each agent has specialized roles and responsibilities.

## Core Development Principles

### Code Quality
- Write clean, maintainable, and well-documented code
- Follow language-specific best practices and style guides
- Prioritize readability and simplicity over cleverness
- Use meaningful variable and function names
- Keep functions small and focused on a single responsibility

### Testing Strategy
- Write tests for all new features and bug fixes
- Aim for high test coverage (minimum 80%)
- Use Test-Driven Development (TDD) when appropriate
- Include unit tests, integration tests, and end-to-end tests as needed
- Mock external dependencies in tests

### Documentation
- Keep README.md up to date with installation and usage instructions
- Document all public APIs and complex algorithms
- Include inline comments for non-obvious code logic
- Maintain a CHANGELOG.md for tracking versions and changes
- Add JSDoc/docstrings for functions and classes

### Security
- Never commit sensitive data (API keys, passwords, tokens)
- Use environment variables for configuration
- Validate and sanitize all user inputs
- Keep dependencies up to date and scan for vulnerabilities
- Follow OWASP guidelines for web applications

### Performance
- Optimize for readability first, then performance
- Profile before optimizing
- Use appropriate data structures and algorithms
- Implement caching where beneficial
- Consider scalability in design decisions

## AI Agent Coordination

### When to Delegate to Agents
Use the specialized agents in `.github/agents/` for:
- **Project Manager**: Overall project planning, task coordination, and progress tracking
- **Backend Developer**: Server-side logic, APIs, database design
- **Frontend Developer**: User interfaces, client-side logic, UX/UI implementation
- **QA Engineer**: Test strategy, test implementation, quality assurance
- **DevOps Engineer**: CI/CD pipelines, deployment, infrastructure, monitoring
- **Documentation Writer**: Technical documentation, user guides, API documentation

### Agent Communication Pattern
1. **Start with Project Manager** for new features or large changes
2. **Delegate specific tasks** to specialized agents
3. **Review and integrate** agent outputs
4. **Coordinate** when multiple agents need to collaborate

## Language-Specific Guidelines

### Python
- Follow PEP 8 style guide
- Use type hints for function signatures
- Prefer `pathlib` over `os.path`
- Use virtual environments (venv, poetry, or conda)
- Format code with `black` and lint with `ruff` or `pylint`

### JavaScript/TypeScript
- Follow ESLint and Prettier configurations
- Use TypeScript for type safety
- Prefer `const` over `let`, avoid `var`
- Use async/await over callbacks
- Follow modern ES6+ syntax

### Go
- Follow official Go style guide
- Use `gofmt` for formatting
- Write idiomatic Go code
- Handle errors explicitly
- Use modules for dependency management

### Rust
- Follow Rust style guide and use `rustfmt`
- Handle errors with `Result` and `Option` types
- Prefer ownership over reference counting
- Write safe, concurrent code
- Use `clippy` for linting

## Git Workflow

### Commit Messages
- Use conventional commits format: `type(scope): description`
- Types: feat, fix, docs, style, refactor, test, chore
- Keep subject line under 50 characters
- Add detailed description in commit body if needed

### Branch Naming
- Feature: `feature/short-description`
- Bug fix: `fix/short-description`
- Hotfix: `hotfix/short-description`
- Refactor: `refactor/short-description`

### Pull Requests
- Write clear PR descriptions explaining what and why
- Reference related issues
- Request review from relevant team members
- Ensure CI/CD passes before merging
- Keep PRs focused and reasonably sized

## Architecture Patterns

### Backend
- Use RESTful API design principles
- Implement proper error handling and logging
- Follow MVC or similar architectural patterns
- Use dependency injection for testability
- Implement proper authentication and authorization

### Frontend
- Follow component-based architecture
- Separate concerns (presentation vs logic)
- Implement responsive design
- Optimize for performance (lazy loading, code splitting)
- Follow accessibility guidelines (WCAG)

### Database
- Normalize data appropriately
- Use migrations for schema changes
- Index frequently queried fields
- Implement proper backup strategies
- Use transactions for data integrity

## Collaboration Guidelines

### Code Reviews
- Review code thoroughly but respectfully
- Focus on logic, readability, and potential bugs
- Suggest improvements, don't demand changes
- Approve when code meets quality standards
- Learn from each other's approaches

### Communication
- Be clear and concise in comments and documentation
- Ask questions when requirements are unclear
- Share knowledge and help team members
- Provide context in pull requests and issues
- Use appropriate channels (PR comments, issues, discussions)

## Common Pitfalls to Avoid
- Don't commit commented-out code (use version control)
- Don't ignore warnings and linting errors
- Don't skip error handling
- Don't hard-code configuration values
- Don't merge without review (even if urgent)
- Don't write tests that depend on external state
- Don't duplicate code (DRY principle)

## AI-Specific Guidelines
- Use agents for specialized tasks in their domain
- Provide clear context and requirements to agents
- Review and validate agent outputs
- Iterate on agent responses if needed
- Combine agent strengths for complex tasks
- Document agent interactions and decisions

## Continuous Improvement
- Refactor technical debt regularly
- Update dependencies periodically
- Monitor and improve performance metrics
- Gather and act on user feedback
- Learn from production issues
- Share knowledge through documentation

## Resources
- Keep this file updated as project evolves
- Reference agent-specific guidelines in `.github/agents/`
- Maintain project-specific conventions in additional docs
- Link to external style guides and best practices
