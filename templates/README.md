# Project Structure Templates

This directory contains pre-designed project structure templates for common application types. Each template follows best practices and integrates seamlessly with the agent guidelines in `.github/agents/`.

## Available Templates

### 1. [Fullstack Structure](./fullstack-structure.md)
**Best for:** Complete web applications with separate backend and frontend

**Tech Stack Examples:**
- Backend: Node.js/Express, Python/FastAPI, Go/Gin
- Frontend: React, Vue, Angular
- Database: PostgreSQL, MongoDB

**Use Cases:**
- E-commerce platforms
- Social media applications
- SaaS products
- Admin dashboards with APIs

### 2. [Backend API Structure](./backend-api-structure.md)
**Best for:** RESTful API services and microservices

**Tech Stack Examples:**
- Node.js/TypeScript, Python, Go, Rust
- Express, FastAPI, Gin, Actix
- PostgreSQL, MongoDB, Redis

**Use Cases:**
- Microservices
- API-first applications
- Backend for mobile apps
- Data processing services

### 3. [Frontend SPA Structure](./frontend-spa-structure.md)
**Best for:** Single-page applications and client-side rendered apps

**Tech Stack Examples:**
- React, Vue, Angular, Svelte
- TypeScript
- Vite, Webpack
- Redux, Zustand

**Use Cases:**
- Progressive Web Apps (PWAs)
- Dashboard applications
- Client-side heavy applications
- Admin panels

## Quick Start

### Option 1: Copy a Template Structure

```bash
# Choose and copy a template
cp -r templates/fullstack-structure my-project

# Or create manually following the structure in the .md file
```

### Option 2: Use with Cookiecutter

```bash
# The cookiecutter.json uses these templates automatically
cookiecutter gh:YannBrrd/agentic-project-seed

# Select your project type when prompted
```

### Option 3: Manual Reference

Read the template files to understand the structure and create your own layout.

## Template Structure

Each template includes:

1. **Directory Tree**: Complete folder structure
2. **File Purposes**: Explanation of each directory and key files
3. **Code Examples**: Working code samples for core files
4. **Configuration Files**: Environment variables, Docker, CI/CD
5. **Getting Started Guide**: Step-by-step setup instructions
6. **Integration with Agents**: How to use with the agent guidelines

## Choosing the Right Template

### Choose Fullstack if you need:
- ✅ Both frontend and backend in one repository (monorepo)
- ✅ Tight coupling between UI and API
- ✅ Single deployment pipeline
- ✅ Shared TypeScript types between frontend and backend

### Choose Backend API if you need:
- ✅ API-only service
- ✅ Microservice architecture
- ✅ Multiple frontend clients (web, mobile, desktop)
- ✅ Focus on business logic and data

### Choose Frontend SPA if you need:
- ✅ Rich, interactive user interfaces
- ✅ Client-side routing
- ✅ Consume existing APIs
- ✅ Progressive Web App features

## Customization

All templates are starting points. Feel free to:

- Add or remove directories based on your needs
- Change naming conventions
- Integrate additional tools and libraries
- Adapt to your team's preferences

## Integration with Agents

Each template is designed to work with the agent guidelines:

### During Planning (Project Manager Agent)
Use templates to:
- Estimate project complexity
- Identify necessary components
- Plan development phases
- Allocate tasks to team members

### During Development
- **Backend Developer**: Follow backend template structure for API development
- **Frontend Developer**: Use frontend template patterns for UI
- **QA Engineer**: Structure tests according to template test directories
- **DevOps Engineer**: Use template CI/CD and Docker configurations
- **Documentation Writer**: Use template documentation structure

## Template Features

### Common Features Across All Templates

1. **TypeScript First**: Full TypeScript support
2. **Testing Ready**: Pre-configured test structure
3. **CI/CD**: GitHub Actions workflow examples
4. **Docker Support**: Dockerfile and docker-compose
5. **Environment Configuration**: .env.example files
6. **Code Quality**: ESLint, Prettier configurations
7. **Git Ready**: Proper .gitignore files

### Template-Specific Features

#### Fullstack Template
- Monorepo structure
- Shared types between frontend and backend
- Docker Compose for full stack development
- Integrated testing strategy

#### Backend API Template
- Clean architecture (Controllers → Services → Repositories)
- API versioning support
- Database migration structure
- Comprehensive error handling

#### Frontend SPA Template
- Component-based architecture
- State management setup
- API client with interceptors
- Responsive design ready

## Examples

### Creating a New Fullstack Project

```bash
# 1. Create project directory
mkdir my-awesome-app
cd my-awesome-app

# 2. Copy the agentic-project-seed
git clone https://github.com/YannBrrd/agentic-project-seed.git .
rm -rf .git

# 3. Follow fullstack-structure.md to set up directories

# 4. Install dependencies
cd backend && npm install
cd ../frontend && npm install

# 5. Start development
docker-compose up
```

### Creating a Backend API Project

```bash
# Use cookiecutter with backend template
cookiecutter gh:YannBrrd/agentic-project-seed

# Select options:
# project_type: backend
# backend_language: typescript
# backend_framework: express
# database: postgresql

# Follow the generated structure from backend-api-structure.md
```

## Tips for Success

1. **Start Simple**: Begin with the basic structure and add complexity as needed
2. **Follow Agents**: Reference agent guidelines when implementing features
3. **Keep Organized**: Maintain the directory structure as your project grows
4. **Document Changes**: Update README if you modify the structure
5. **Stay Consistent**: Use the same patterns throughout your codebase

## Additional Resources

- [Usage Guide](../USAGE_GUIDE.md) - Detailed guide on using the seed project
- [Copilot Instructions](../.github/copilot-instructions.md) - AI coding guidelines
- [Agent Guidelines](../.github/agents/) - Specialized agent documentation

## Contributing

Have a template idea? Contributions are welcome!

1. Create a new template following the existing format
2. Include comprehensive examples
3. Test the structure with a real project
4. Submit a pull request

## Support

Need help choosing a template or customizing one?
- [GitHub Discussions](https://github.com/YannBrrd/agentic-project-seed/discussions)
- [GitHub Issues](https://github.com/YannBrrd/agentic-project-seed/issues)

---

Choose your template and start building! 🚀
