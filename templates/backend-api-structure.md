# Backend API Project Structure Template

This template provides a recommended structure for backend API projects following clean architecture principles.

## Directory Structure

```
my-backend-api/
├── .github/
│   ├── copilot-instructions.md
│   ├── agents/
│   │   ├── project-manager.md
│   │   ├── backend-developer.md
│   │   ├── qa-engineer.md
│   │   ├── devops-engineer.md
│   │   └── documentation-writer.md
│   └── workflows/
│       ├── ci.yml
│       ├── security-scan.yml
│       └── deploy.yml
├── src/
│   ├── api/
│   │   ├── v1/
│   │   │   ├── controllers/          # Request handlers
│   │   │   │   ├── userController.ts
│   │   │   │   ├── authController.ts
│   │   │   │   └── index.ts
│   │   │   ├── routes/               # Route definitions
│   │   │   │   ├── userRoutes.ts
│   │   │   │   ├── authRoutes.ts
│   │   │   │   └── index.ts
│   │   │   └── middlewares/          # Route middlewares
│   │   │       ├── auth.ts
│   │   │       ├── validation.ts
│   │   │       └── errorHandler.ts
│   │   └── index.ts                  # API version aggregator
│   ├── services/                     # Business logic
│   │   ├── userService.ts
│   │   ├── authService.ts
│   │   ├── emailService.ts
│   │   └── index.ts
│   ├── repositories/                 # Data access layer
│   │   ├── userRepository.ts
│   │   ├── sessionRepository.ts
│   │   └── index.ts
│   ├── models/                       # Domain models/entities
│   │   ├── User.ts
│   │   ├── Session.ts
│   │   └── index.ts
│   ├── database/                     # Database configuration
│   │   ├── connection.ts
│   │   ├── seeds/                    # Seed data
│   │   └── migrations/               # Database migrations
│   ├── utils/                        # Helper functions
│   │   ├── logger.ts
│   │   ├── validation.ts
│   │   ├── crypto.ts
│   │   └── index.ts
│   ├── config/                       # Configuration
│   │   ├── database.ts
│   │   ├── auth.ts
│   │   ├── app.ts
│   │   └── index.ts
│   ├── types/                        # TypeScript types
│   │   ├── express.d.ts
│   │   ├── models.ts
│   │   └── api.ts
│   ├── constants/                    # Constants
│   │   ├── errorCodes.ts
│   │   ├── roles.ts
│   │   └── index.ts
│   ├── exceptions/                   # Custom exceptions
│   │   ├── ApiError.ts
│   │   ├── ValidationError.ts
│   │   └── index.ts
│   ├── app.ts                        # Express app setup
│   └── server.ts                     # Server entry point
├── tests/
│   ├── unit/                         # Unit tests
│   │   ├── services/
│   │   ├── repositories/
│   │   └── utils/
│   ├── integration/                  # Integration tests
│   │   ├── api/
│   │   └── database/
│   ├── e2e/                          # End-to-end tests
│   ├── fixtures/                     # Test data
│   │   ├── users.ts
│   │   └── seeds.sql
│   ├── helpers/                      # Test utilities
│   │   ├── testDb.ts
│   │   └── apiClient.ts
│   └── setup.ts                      # Test setup
├── scripts/                          # Utility scripts
│   ├── seed-db.ts
│   ├── generate-migration.ts
│   └── health-check.ts
├── docs/
│   ├── api/                          # API documentation
│   │   ├── authentication.md
│   │   ├── users.md
│   │   └── errors.md
│   ├── architecture.md               # Architecture overview
│   ├── database-schema.md            # Database design
│   └── deployment.md                 # Deployment guide
├── .env.example                      # Example environment variables
├── .eslintrc.js                      # ESLint configuration
├── .prettierrc                       # Prettier configuration
├── tsconfig.json                     # TypeScript configuration
├── package.json                      # Dependencies and scripts
├── Dockerfile                        # Docker configuration
├── docker-compose.yml                # Local development setup
├── README.md                         # Project overview
├── CONTRIBUTING.md                   # Contribution guidelines
├── CHANGELOG.md                      # Version history
└── LICENSE                           # License file
```

## Core Files Explained

### `src/app.ts` - Express Application Setup

```typescript
import express from 'express';
import helmet from 'helmet';
import cors from 'cors';
import { apiV1Router } from './api/v1/routes';
import { errorHandler } from './api/v1/middlewares/errorHandler';
import { logger } from './utils/logger';

export const createApp = () => {
  const app = express();

  // Security middleware
  app.use(helmet());
  app.use(cors(corsOptions));

  // Body parsing
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));

  // Request logging
  app.use((req, res, next) => {
    logger.info(`${req.method} ${req.path}`);
    next();
  });

  // API routes
  app.use('/api/v1', apiV1Router);

  // Health check
  app.get('/health', (req, res) => {
    res.json({ status: 'ok', timestamp: new Date().toISOString() });
  });

  // Error handling
  app.use(errorHandler);

  return app;
};
```

### `src/server.ts` - Server Entry Point

```typescript
import { createApp } from './app';
import { connectDatabase } from './database/connection';
import { config } from './config';
import { logger } from './utils/logger';

const startServer = async () => {
  try {
    // Connect to database
    await connectDatabase();
    logger.info('Database connected');

    // Create and start server
    const app = createApp();
    const server = app.listen(config.port, () => {
      logger.info(`Server running on port ${config.port}`);
      logger.info(`Environment: ${config.nodeEnv}`);
    });

    // Graceful shutdown
    process.on('SIGTERM', () => {
      logger.info('SIGTERM received, shutting down gracefully');
      server.close(() => {
        logger.info('Server closed');
        process.exit(0);
      });
    });
  } catch (error) {
    logger.error('Failed to start server:', error);
    process.exit(1);
  }
};

startServer();
```

### `src/api/v1/controllers/userController.ts`

```typescript
import { Request, Response, NextFunction } from 'express';
import { userService } from '../../../services';
import { ApiError } from '../../../exceptions';

export const userController = {
  async getAll(req: Request, res: Response, next: NextFunction) {
    try {
      const { page = 1, limit = 20 } = req.query;
      const result = await userService.getAll(Number(page), Number(limit));
      
      res.json({
        success: true,
        data: result.users,
        pagination: result.pagination,
      });
    } catch (error) {
      next(error);
    }
  },

  async getById(req: Request, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;
      const user = await userService.getById(id);
      
      if (!user) {
        throw new ApiError(404, 'USER_NOT_FOUND', 'User not found');
      }

      res.json({
        success: true,
        data: user,
      });
    } catch (error) {
      next(error);
    }
  },

  async create(req: Request, res: Response, next: NextFunction) {
    try {
      const userData = req.body;
      const user = await userService.create(userData);
      
      res.status(201).json({
        success: true,
        data: user,
      });
    } catch (error) {
      next(error);
    }
  },
};
```

### `src/services/userService.ts`

```typescript
import { userRepository } from '../repositories';
import { User, CreateUserDTO } from '../types/models';
import { hashPassword } from '../utils/crypto';
import { ApiError } from '../exceptions';

export const userService = {
  async getAll(page: number, limit: number) {
    const offset = (page - 1) * limit;
    const [users, total] = await Promise.all([
      userRepository.findMany({ offset, limit }),
      userRepository.count(),
    ]);

    return {
      users,
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
      },
    };
  },

  async getById(id: string): Promise<User | null> {
    return await userRepository.findById(id);
  },

  async create(data: CreateUserDTO): Promise<User> {
    // Check if email already exists
    const existingUser = await userRepository.findByEmail(data.email);
    if (existingUser) {
      throw new ApiError(409, 'DUPLICATE_EMAIL', 'Email already exists');
    }

    // Hash password
    const hashedPassword = await hashPassword(data.password);

    // Create user
    return await userRepository.create({
      ...data,
      password: hashedPassword,
    });
  },
};
```

### `src/repositories/userRepository.ts`

```typescript
import { db } from '../database/connection';
import { User } from '../types/models';

export const userRepository = {
  async findMany({ offset, limit }: { offset: number; limit: number }): Promise<User[]> {
    return await db('users')
      .select('id', 'email', 'name', 'created_at')
      .offset(offset)
      .limit(limit);
  },

  async findById(id: string): Promise<User | null> {
    return await db('users')
      .where({ id })
      .select('id', 'email', 'name', 'created_at')
      .first();
  },

  async findByEmail(email: string): Promise<User | null> {
    return await db('users')
      .where({ email })
      .first();
  },

  async count(): Promise<number> {
    const result = await db('users').count('* as count').first();
    return Number(result?.count || 0);
  },

  async create(data: Partial<User>): Promise<User> {
    const [user] = await db('users')
      .insert(data)
      .returning(['id', 'email', 'name', 'created_at']);
    return user;
  },
};
```

## Environment Variables

```env
# Application
NODE_ENV=development
PORT=3000
API_VERSION=v1

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/mydb
DATABASE_POOL_MIN=2
DATABASE_POOL_MAX=10

# Authentication
JWT_SECRET=your-super-secret-jwt-key
JWT_EXPIRES_IN=7d
REFRESH_TOKEN_SECRET=your-refresh-token-secret
REFRESH_TOKEN_EXPIRES_IN=30d

# Redis (for sessions/cache)
REDIS_URL=redis://localhost:6379
REDIS_PASSWORD=

# Security
BCRYPT_ROUNDS=10
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# CORS
CORS_ORIGIN=http://localhost:3000,http://localhost:5173

# Email (optional)
SMTP_HOST=smtp.example.com
SMTP_PORT=587
SMTP_USER=
SMTP_PASSWORD=
EMAIL_FROM=noreply@example.com

# Logging
LOG_LEVEL=info
LOG_FORMAT=json

# Monitoring (optional)
SENTRY_DSN=
```

## Package.json Scripts

```json
{
  "scripts": {
    "dev": "nodemon src/server.ts",
    "build": "tsc",
    "start": "node dist/server.js",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:coverage": "jest --coverage",
    "lint": "eslint src/**/*.ts",
    "lint:fix": "eslint src/**/*.ts --fix",
    "format": "prettier --write \"src/**/*.ts\"",
    "migrate": "knex migrate:latest",
    "migrate:rollback": "knex migrate:rollback",
    "seed": "knex seed:run",
    "typecheck": "tsc --noEmit",
    "docker:build": "docker build -t my-api .",
    "docker:run": "docker-compose up"
  }
}
```

## Docker Configuration

### `Dockerfile`

```dockerfile
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:18-alpine
RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001
WORKDIR /app
COPY --from=builder --chown=nodejs:nodejs /app/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nodejs:nodejs /app/package.json ./
USER nodejs
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s CMD node dist/scripts/health-check.js
CMD ["node", "dist/server.js"]
```

## Testing Structure

### Unit Test Example

```typescript
// tests/unit/services/userService.test.ts
import { userService } from '../../../src/services/userService';
import { userRepository } from '../../../src/repositories/userRepository';

jest.mock('../../../src/repositories/userRepository');

describe('UserService', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('getById', () => {
    it('should return user when found', async () => {
      const mockUser = { id: '1', email: 'test@example.com', name: 'Test' };
      (userRepository.findById as jest.Mock).mockResolvedValue(mockUser);

      const result = await userService.getById('1');

      expect(result).toEqual(mockUser);
      expect(userRepository.findById).toHaveBeenCalledWith('1');
    });

    it('should return null when user not found', async () => {
      (userRepository.findById as jest.Mock).mockResolvedValue(null);

      const result = await userService.getById('999');

      expect(result).toBeNull();
    });
  });
});
```

### Integration Test Example

```typescript
// tests/integration/api/users.test.ts
import request from 'supertest';
import { createApp } from '../../../src/app';
import { setupTestDb, cleanupTestDb } from '../../helpers/testDb';

describe('User API', () => {
  let app: Express.Application;

  beforeAll(async () => {
    await setupTestDb();
    app = createApp();
  });

  afterAll(async () => {
    await cleanupTestDb();
  });

  describe('POST /api/v1/users', () => {
    it('should create a new user', async () => {
      const response = await request(app)
        .post('/api/v1/users')
        .send({
          email: 'newuser@example.com',
          name: 'New User',
          password: 'SecurePass123!',
        })
        .expect(201);

      expect(response.body.success).toBe(true);
      expect(response.body.data.email).toBe('newuser@example.com');
    });
  });
});
```

## Getting Started

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Set up environment:**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Run database migrations:**
   ```bash
   npm run migrate
   ```

4. **Seed database (optional):**
   ```bash
   npm run seed
   ```

5. **Start development server:**
   ```bash
   npm run dev
   ```

6. **Run tests:**
   ```bash
   npm test
   ```

## Next Steps

1. Review the Backend Developer agent guidelines
2. Set up your database schema
3. Implement authentication following the agent patterns
4. Add comprehensive tests using the QA Engineer agent guidelines
5. Set up CI/CD following the DevOps Engineer agent guidelines
6. Document your API using the Documentation Writer agent guidelines
