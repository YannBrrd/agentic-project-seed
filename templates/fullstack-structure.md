# Fullstack Project Structure Template

This template provides a recommended structure for fullstack applications with separate backend and frontend.

## Directory Structure

```
my-fullstack-app/
├── .github/
│   ├── copilot-instructions.md
│   ├── agents/
│   │   ├── project-manager.md
│   │   ├── backend-developer.md
│   │   ├── frontend-developer.md
│   │   ├── qa-engineer.md
│   │   ├── devops-engineer.md
│   │   └── documentation-writer.md
│   └── workflows/
│       ├── backend-ci.yml
│       ├── frontend-ci.yml
│       └── deploy.yml
├── backend/
│   ├── src/
│   │   ├── api/
│   │   │   ├── controllers/       # HTTP request handlers
│   │   │   ├── middlewares/       # Express/framework middlewares
│   │   │   └── routes/            # Route definitions
│   │   ├── services/              # Business logic layer
│   │   ├── repositories/          # Data access layer
│   │   ├── models/                # Data models/entities
│   │   ├── utils/                 # Helper functions
│   │   ├── config/                # Configuration
│   │   └── types/                 # TypeScript types
│   ├── tests/
│   │   ├── unit/                  # Unit tests
│   │   ├── integration/           # Integration tests
│   │   └── fixtures/              # Test data
│   ├── migrations/                # Database migrations
│   ├── scripts/                   # Utility scripts
│   ├── .env.example              # Example environment variables
│   ├── package.json              # Node.js dependencies
│   ├── tsconfig.json             # TypeScript config
│   └── README.md                 # Backend documentation
├── frontend/
│   ├── src/
│   │   ├── components/           # React components
│   │   │   ├── common/          # Shared components
│   │   │   ├── layout/          # Layout components
│   │   │   └── features/        # Feature-specific components
│   │   ├── pages/               # Page components
│   │   ├── hooks/               # Custom React hooks
│   │   ├── services/            # API service layer
│   │   ├── store/               # State management
│   │   ├── utils/               # Helper functions
│   │   ├── types/               # TypeScript types
│   │   ├── styles/              # Global styles
│   │   ├── assets/              # Static assets
│   │   ├── App.tsx              # Root component
│   │   └── main.tsx             # Entry point
│   ├── public/                  # Public assets
│   ├── tests/
│   │   ├── unit/               # Component tests
│   │   ├── integration/        # Integration tests
│   │   └── e2e/                # End-to-end tests
│   ├── .env.example            # Example environment variables
│   ├── package.json            # Node.js dependencies
│   ├── tsconfig.json           # TypeScript config
│   ├── vite.config.ts          # Vite configuration
│   └── README.md               # Frontend documentation
├── docs/
│   ├── api/                    # API documentation
│   ├── architecture/           # Architecture diagrams
│   ├── guides/                 # User and developer guides
│   └── deployment/             # Deployment instructions
├── infrastructure/
│   ├── terraform/              # Infrastructure as Code
│   ├── kubernetes/             # K8s manifests
│   └── docker/                 # Dockerfiles
├── docker-compose.yml          # Local development setup
├── .gitignore                  # Git ignore patterns
├── README.md                   # Project overview
├── CONTRIBUTING.md             # Contribution guidelines
├── CHANGELOG.md                # Version history
└── LICENSE                     # License file
```

## File Purpose Guide

### Backend Files

#### `src/api/controllers/`
HTTP request handlers that receive requests, validate input, call services, and return responses.

Example: `userController.ts`
```typescript
export const getUsers = async (req: Request, res: Response) => {
  const users = await userService.getAll();
  res.json({ success: true, data: users });
};
```

#### `src/services/`
Business logic layer that orchestrates operations between controllers and repositories.

Example: `userService.ts`
```typescript
export class UserService {
  async getAll(): Promise<User[]> {
    return await userRepository.findAll();
  }
}
```

#### `src/repositories/`
Data access layer that interacts directly with the database.

Example: `userRepository.ts`
```typescript
export class UserRepository {
  async findAll(): Promise<User[]> {
    return await db.query('SELECT * FROM users');
  }
}
```

### Frontend Files

#### `src/components/common/`
Reusable UI components used across the application.

Examples: `Button.tsx`, `Input.tsx`, `Modal.tsx`

#### `src/components/layout/`
Layout components that define the structure of pages.

Examples: `Header.tsx`, `Footer.tsx`, `Sidebar.tsx`

#### `src/pages/`
Page-level components that correspond to routes.

Examples: `Home.tsx`, `Dashboard.tsx`, `UserProfile.tsx`

#### `src/services/`
API client services for making HTTP requests to the backend.

Example: `userService.ts`
```typescript
export const userService = {
  async getAll(): Promise<User[]> {
    const response = await apiClient.get('/users');
    return response.data.data;
  }
};
```

## Getting Started

1. **Clone this structure:**
   ```bash
   mkdir my-fullstack-app
   cd my-fullstack-app
   # Copy this structure
   ```

2. **Set up backend:**
   ```bash
   cd backend
   npm install
   cp .env.example .env
   # Edit .env with your configuration
   npm run dev
   ```

3. **Set up frontend:**
   ```bash
   cd frontend
   npm install
   cp .env.example .env
   # Edit .env with your configuration
   npm run dev
   ```

4. **Run with Docker Compose:**
   ```bash
   docker-compose up
   ```

## Environment Variables

### Backend `.env`
```env
NODE_ENV=development
PORT=3000
DATABASE_URL=postgresql://user:pass@localhost:5432/mydb
REDIS_URL=redis://localhost:6379
JWT_SECRET=your-secret-key
CORS_ORIGIN=http://localhost:5173
```

### Frontend `.env`
```env
VITE_API_URL=http://localhost:3000/api
VITE_APP_NAME=My Fullstack App
```

## Docker Compose Example

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: mydb
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    ports:
      - "5432:5432"
    volumes:
      - postgres-data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

  backend:
    build: ./backend
    ports:
      - "3000:3000"
    environment:
      DATABASE_URL: postgresql://user:pass@postgres:5432/mydb
      REDIS_URL: redis://redis:6379
    depends_on:
      - postgres
      - redis

  frontend:
    build: ./frontend
    ports:
      - "5173:5173"
    environment:
      VITE_API_URL: http://localhost:3000/api
    depends_on:
      - backend

volumes:
  postgres-data:
```

## Next Steps

1. Review the agent guidelines in `.github/agents/`
2. Set up your development environment
3. Start with the Project Manager agent to plan your first feature
4. Follow the backend and frontend developer agents for implementation
5. Use the QA engineer agent for testing strategy
6. Use the DevOps engineer agent for deployment setup
7. Use the Documentation Writer agent for comprehensive docs
