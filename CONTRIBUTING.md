# Contributing to Agentic Project Seed

Thank you for your interest in contributing to the Agentic Project Seed! This project aims to provide a comprehensive template for starting new projects with AI-powered development assistance.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Contribution Guidelines](#contribution-guidelines)
- [Style Guides](#style-guides)
- [Review Process](#review-process)

## Code of Conduct

This project adheres to a Code of Conduct that all contributors are expected to follow. Please be respectful and constructive in all interactions.

## How Can I Contribute?

### Reporting Issues

Before creating an issue, please check if it already exists. When creating a new issue:

- Use a clear, descriptive title
- Provide detailed information about the problem
- Include steps to reproduce (if applicable)
- Mention your environment (OS, tools, versions)
- Add relevant labels

### Suggesting Enhancements

Enhancement suggestions are welcome! Please:

- Use a clear, descriptive title
- Provide a detailed description of the proposed functionality
- Explain why this enhancement would be useful
- Include examples or mockups if possible
- Tag with `enhancement` label

### Contributing Code

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Make your changes**
4. **Test thoroughly**
5. **Commit your changes** (see commit message guidelines below)
6. **Push to your fork** (`git push origin feature/amazing-feature`)
7. **Open a Pull Request**

## Development Setup

```bash
# Clone your fork
git clone https://github.com/your-username/agentic-project-seed.git
cd agentic-project-seed

# Create a branch
git checkout -b feature/my-feature

# Make your changes
# ...

# Validate your changes
chmod +x validate-setup.sh
./validate-setup.sh
```

## Contribution Guidelines

### Agent Files

When contributing to agent files (`.github/agents/*.md`):

1. **Maintain Structure**: Follow the existing format
   - Role description
   - Core responsibilities
   - Technical expertise
   - Development guidelines
   - Code examples
   - Best practices
   - Collaboration guidelines
   - Anti-patterns
   - Deliverables checklist

2. **Keep It Practical**: Include real-world examples and code snippets

3. **Stay Current**: Use modern best practices and up-to-date technologies

4. **Be Comprehensive**: Cover common scenarios and edge cases

5. **Add Value**: Ensure new content provides actionable guidance

### Copilot Instructions

When updating `.github/copilot-instructions.md`:

1. Keep language-agnostic where possible
2. Focus on principles over specific implementations
3. Ensure consistency with agent guidelines
4. Include rationale for recommendations
5. Update examples to reflect current best practices

### Templates

When adding or modifying templates in `templates/`:

1. **Complete Structure**: Provide full directory trees
2. **Working Examples**: Include functional code samples
3. **Configuration Files**: Add all necessary config files
4. **Documentation**: Explain the purpose of each component
5. **Getting Started**: Provide clear setup instructions
6. **Integration**: Show how to use with agent guidelines

### Documentation

When updating documentation:

1. **Clarity**: Write in clear, simple language
2. **Completeness**: Cover all necessary information
3. **Accuracy**: Ensure all information is correct
4. **Examples**: Include practical examples
5. **Formatting**: Use proper Markdown formatting
6. **Links**: Ensure all links work correctly

## Style Guides

### Markdown Style

- Use ATX-style headers (`#` not `===`)
- Use fenced code blocks with language tags
- Use reference-style links for readability
- Keep line length reasonable (80-100 characters)
- Use lists for better readability
- Include blank lines between sections

### Code Examples

- Use realistic, practical examples
- Include comments explaining key concepts
- Follow language-specific style guides
- Ensure code is tested and working
- Use TypeScript for JavaScript examples when possible
- Include error handling

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**

```
feat(agents): add mobile developer agent

Add a new specialized agent for mobile development covering
iOS, Android, and cross-platform frameworks.

Closes #42
```

```
docs(readme): update installation instructions

Clarify the steps for using cookiecutter and add troubleshooting
section for common issues.
```

```
fix(validation): correct file size check in validate-setup.sh

Use wc -c instead of stat for better cross-platform compatibility.
```

## Review Process

### Pull Request Guidelines

1. **Clear Title**: Use descriptive PR title following commit message format
2. **Description**: Explain what and why, not just how
3. **Reference Issues**: Link related issues
4. **Small PRs**: Keep changes focused and manageable
5. **Tests**: Ensure validation script passes
6. **Documentation**: Update relevant docs

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Agent update
- [ ] Template addition/modification

## Changes Made
- List specific changes
- Include file paths if relevant

## Testing
Describe testing performed

## Checklist
- [ ] Validation script passes
- [ ] Documentation updated
- [ ] Examples are working
- [ ] Follows style guidelines
- [ ] No breaking changes (or documented)
```

### Review Criteria

Reviewers will check:

1. **Accuracy**: Information is correct and current
2. **Completeness**: All necessary information is included
3. **Quality**: Code examples work and follow best practices
4. **Consistency**: Matches existing style and structure
5. **Value**: Adds meaningful improvements

### Timeline

- Initial review: Within 3-5 business days
- Follow-up reviews: Within 2 business days
- Merge: Once approved by maintainer

## Types of Contributions

### High Priority

- Bug fixes in validation script
- Corrections to agent guidelines
- Updated code examples for new framework versions
- Missing information in documentation
- Broken links

### Medium Priority

- New agent types (e.g., Mobile Developer, Data Engineer)
- Additional project structure templates
- Enhanced code examples
- Improved documentation
- New cookiecutter variables

### Low Priority

- Typo fixes
- Formatting improvements
- Minor clarifications
- Optional enhancements

## Recognition

Contributors will be recognized in:
- GitHub contributors list
- Release notes for significant contributions
- README acknowledgments for major features

## Getting Help

Need help contributing?

- **Discussions**: [GitHub Discussions](https://github.com/YannBrrd/agentic-project-seed/discussions)
- **Issues**: Tag issues with `question` label
- **Examples**: Look at previous PRs for reference

## Questions?

If you have questions about contributing, feel free to:

1. Open an issue with the `question` label
2. Start a discussion on GitHub Discussions
3. Reference existing documentation

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to Agentic Project Seed!** 🎉

Your contributions help developers worldwide start projects with better structure and AI-powered assistance.
