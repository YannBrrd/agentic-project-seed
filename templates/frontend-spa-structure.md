# Frontend SPA Project Structure Template

This template provides a recommended structure for single-page applications using modern frontend frameworks (React, Vue, etc.).

## Directory Structure (React + TypeScript + Vite)

```
my-frontend-spa/
├── .github/
│   ├── copilot-instructions.md
│   ├── agents/
│   │   ├── project-manager.md
│   │   ├── frontend-developer.md
│   │   ├── qa-engineer.md
│   │   ├── devops-engineer.md
│   │   └── documentation-writer.md
│   └── workflows/
│       ├── ci.yml
│       ├── test.yml
│       └── deploy.yml
├── public/
│   ├── favicon.ico
│   ├── robots.txt
│   └── manifest.json
├── src/
│   ├── components/
│   │   ├── common/                   # Reusable components
│   │   │   ├── Button/
│   │   │   │   ├── Button.tsx
│   │   │   │   ├── Button.test.tsx
│   │   │   │   ├── Button.module.css
│   │   │   │   └── index.ts
│   │   │   ├── Input/
│   │   │   ├── Modal/
│   │   │   ├── Card/
│   │   │   └── index.ts
│   │   ├── layout/                   # Layout components
│   │   │   ├── Header/
│   │   │   ├── Footer/
│   │   │   ├── Sidebar/
│   │   │   ├── Layout/
│   │   │   └── index.ts
│   │   └── features/                 # Feature-specific components
│   │       ├── auth/
│   │       │   ├── LoginForm/
│   │       │   ├── RegisterForm/
│   │       │   └── index.ts
│   │       ├── users/
│   │       │   ├── UserList/
│   │       │   ├── UserCard/
│   │       │   ├── UserProfile/
│   │       │   └── index.ts
│   │       └── dashboard/
│   ├── pages/                        # Page components
│   │   ├── Home.tsx
│   │   ├── Dashboard.tsx
│   │   ├── Login.tsx
│   │   ├── Users.tsx
│   │   ├── NotFound.tsx
│   │   └── index.ts
│   ├── hooks/                        # Custom React hooks
│   │   ├── useAuth.ts
│   │   ├── useApi.ts
│   │   ├── useDebounce.ts
│   │   ├── useLocalStorage.ts
│   │   └── index.ts
│   ├── services/                     # API service layer
│   │   ├── api/
│   │   │   ├── apiClient.ts
│   │   │   ├── authApi.ts
│   │   │   ├── userApi.ts
│   │   │   └── index.ts
│   │   └── index.ts
│   ├── store/                        # State management
│   │   ├── slices/                   # Redux slices or Zustand stores
│   │   │   ├── authSlice.ts
│   │   │   ├── userSlice.ts
│   │   │   └── index.ts
│   │   ├── store.ts
│   │   └── index.ts
│   ├── routes/                       # Routing configuration
│   │   ├── PrivateRoute.tsx
│   │   ├── PublicRoute.tsx
│   │   ├── routes.tsx
│   │   └── index.ts
│   ├── utils/                        # Helper functions
│   │   ├── validation.ts
│   │   ├── formatting.ts
│   │   ├── date.ts
│   │   ├── storage.ts
│   │   └── index.ts
│   ├── types/                        # TypeScript types
│   │   ├── api.ts
│   │   ├── models.ts
│   │   ├── components.ts
│   │   └── index.ts
│   ├── constants/                    # Constants
│   │   ├── routes.ts
│   │   ├── api.ts
│   │   ├── config.ts
│   │   └── index.ts
│   ├── styles/                       # Global styles
│   │   ├── globals.css
│   │   ├── variables.css
│   │   ├── theme.ts
│   │   └── index.ts
│   ├── assets/                       # Static assets
│   │   ├── images/
│   │   ├── icons/
│   │   └── fonts/
│   ├── App.tsx                       # Root component
│   ├── main.tsx                      # Entry point
│   └── vite-env.d.ts                 # Vite types
├── tests/
│   ├── unit/                         # Unit tests
│   │   ├── components/
│   │   ├── hooks/
│   │   └── utils/
│   ├── integration/                  # Integration tests
│   │   └── features/
│   ├── e2e/                          # End-to-end tests
│   │   ├── auth.spec.ts
│   │   └── users.spec.ts
│   ├── mocks/                        # Mock data
│   │   ├── handlers.ts
│   │   └── server.ts
│   └── setup.ts                      # Test setup
├── .env.example                      # Example environment variables
├── .eslintrc.cjs                     # ESLint configuration
├── .prettierrc                       # Prettier configuration
├── tsconfig.json                     # TypeScript configuration
├── vite.config.ts                    # Vite configuration
├── tailwind.config.js                # Tailwind CSS configuration (if used)
├── package.json                      # Dependencies and scripts
├── index.html                        # HTML template
├── README.md                         # Project overview
└── CONTRIBUTING.md                   # Contribution guidelines
```

## Core Files Explained

### `src/main.tsx` - Application Entry Point

```typescript
import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import { Provider } from 'react-redux';
import { store } from './store';
import App from './App';
import './styles/globals.css';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>
  </React.StrictMode>
);
```

### `src/App.tsx` - Root Component

```typescript
import { Routes, Route } from 'react-router-dom';
import { Layout } from './components/layout';
import { Home, Dashboard, Login, Users, NotFound } from './pages';
import { PrivateRoute } from './routes/PrivateRoute';

function App() {
  return (
    <Layout>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route
          path="/dashboard"
          element={
            <PrivateRoute>
              <Dashboard />
            </PrivateRoute>
          }
        />
        <Route
          path="/users"
          element={
            <PrivateRoute>
              <Users />
            </PrivateRoute>
          }
        />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </Layout>
  );
}

export default App;
```

### `src/services/api/apiClient.ts` - API Client

```typescript
import axios, { AxiosInstance, AxiosRequestConfig } from 'axios';
import { API_BASE_URL } from '../../constants/api';

class ApiClient {
  private client: AxiosInstance;

  constructor() {
    this.client = axios.create({
      baseURL: API_BASE_URL,
      timeout: 10000,
      headers: {
        'Content-Type': 'application/json',
      },
    });

    this.setupInterceptors();
  }

  private setupInterceptors() {
    // Request interceptor
    this.client.interceptors.request.use(
      (config) => {
        const token = localStorage.getItem('token');
        if (token) {
          config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
      },
      (error) => Promise.reject(error)
    );

    // Response interceptor
    this.client.interceptors.response.use(
      (response) => response,
      (error) => {
        if (error.response?.status === 401) {
          localStorage.removeItem('token');
          window.location.href = '/login';
        }
        return Promise.reject(error);
      }
    );
  }

  async get<T>(url: string, config?: AxiosRequestConfig) {
    const response = await this.client.get<T>(url, config);
    return response.data;
  }

  async post<T>(url: string, data?: any, config?: AxiosRequestConfig) {
    const response = await this.client.post<T>(url, data, config);
    return response.data;
  }

  async put<T>(url: string, data?: any, config?: AxiosRequestConfig) {
    const response = await this.client.put<T>(url, data, config);
    return response.data;
  }

  async delete<T>(url: string, config?: AxiosRequestConfig) {
    const response = await this.client.delete<T>(url, config);
    return response.data;
  }
}

export const apiClient = new ApiClient();
```

### `src/services/api/userApi.ts` - User API Service

```typescript
import { apiClient } from './apiClient';
import { User, CreateUserDTO, ApiResponse } from '../../types';

export const userApi = {
  async getAll(): Promise<User[]> {
    const response = await apiClient.get<ApiResponse<User[]>>('/users');
    return response.data;
  },

  async getById(id: string): Promise<User> {
    const response = await apiClient.get<ApiResponse<User>>(`/users/${id}`);
    return response.data;
  },

  async create(data: CreateUserDTO): Promise<User> {
    const response = await apiClient.post<ApiResponse<User>>('/users', data);
    return response.data;
  },

  async update(id: string, data: Partial<User>): Promise<User> {
    const response = await apiClient.put<ApiResponse<User>>(`/users/${id}`, data);
    return response.data;
  },

  async delete(id: string): Promise<void> {
    await apiClient.delete(`/users/${id}`);
  },
};
```

### `src/hooks/useAuth.ts` - Authentication Hook

```typescript
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { RootState } from '../store';
import { setUser, clearUser } from '../store/slices/authSlice';
import { authApi } from '../services/api/authApi';

export const useAuth = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user, isAuthenticated } = useSelector((state: RootState) => state.auth);

  const login = async (email: string, password: string) => {
    const response = await authApi.login(email, password);
    localStorage.setItem('token', response.token);
    dispatch(setUser(response.user));
    navigate('/dashboard');
  };

  const logout = () => {
    localStorage.removeItem('token');
    dispatch(clearUser());
    navigate('/login');
  };

  const register = async (email: string, password: string, name: string) => {
    const response = await authApi.register(email, password, name);
    localStorage.setItem('token', response.token);
    dispatch(setUser(response.user));
    navigate('/dashboard');
  };

  return { user, isAuthenticated, login, logout, register };
};
```

### `src/components/common/Button/Button.tsx`

```typescript
import React from 'react';
import styles from './Button.module.css';

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'danger';
  size?: 'small' | 'medium' | 'large';
  isLoading?: boolean;
  children: React.ReactNode;
}

export const Button: React.FC<ButtonProps> = ({
  variant = 'primary',
  size = 'medium',
  isLoading = false,
  children,
  disabled,
  className,
  ...props
}) => {
  return (
    <button
      className={`${styles.button} ${styles[variant]} ${styles[size]} ${className || ''}`}
      disabled={disabled || isLoading}
      {...props}
    >
      {isLoading ? (
        <span className={styles.spinner}>Loading...</span>
      ) : (
        children
      )}
    </button>
  );
};
```

### `src/store/slices/authSlice.ts` - Redux Slice

```typescript
import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { User } from '../../types';

interface AuthState {
  user: User | null;
  isAuthenticated: boolean;
}

const initialState: AuthState = {
  user: null,
  isAuthenticated: false,
};

const authSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {
    setUser: (state, action: PayloadAction<User>) => {
      state.user = action.payload;
      state.isAuthenticated = true;
    },
    clearUser: (state) => {
      state.user = null;
      state.isAuthenticated = false;
    },
  },
});

export const { setUser, clearUser } = authSlice.actions;
export default authSlice.reducer;
```

## Testing Setup

### `tests/setup.ts` - Test Configuration

```typescript
import '@testing-library/jest-dom';
import { server } from './mocks/server';

beforeAll(() => server.listen());
afterEach(() => server.resetHandlers());
afterAll(() => server.close());
```

### `tests/mocks/handlers.ts` - MSW Handlers

```typescript
import { rest } from 'msw';

export const handlers = [
  rest.get('/api/users', (req, res, ctx) => {
    return res(
      ctx.json({
        success: true,
        data: [
          { id: '1', email: 'user1@example.com', name: 'User 1' },
          { id: '2', email: 'user2@example.com', name: 'User 2' },
        ],
      })
    );
  }),

  rest.post('/api/auth/login', (req, res, ctx) => {
    return res(
      ctx.json({
        success: true,
        data: {
          token: 'mock-token',
          user: { id: '1', email: 'user@example.com', name: 'Test User' },
        },
      })
    );
  }),
];
```

### Component Test Example

```typescript
import { render, screen, fireEvent } from '@testing-library/react';
import { Button } from '../Button';

describe('Button', () => {
  it('renders children correctly', () => {
    render(<Button>Click me</Button>);
    expect(screen.getByText('Click me')).toBeInTheDocument();
  });

  it('calls onClick when clicked', () => {
    const handleClick = jest.fn();
    render(<Button onClick={handleClick}>Click me</Button>);
    
    fireEvent.click(screen.getByText('Click me'));
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  it('shows loading state', () => {
    render(<Button isLoading>Click me</Button>);
    expect(screen.getByText('Loading...')).toBeInTheDocument();
  });

  it('is disabled when loading', () => {
    render(<Button isLoading>Click me</Button>);
    expect(screen.getByRole('button')).toBeDisabled();
  });
});
```

## Environment Variables

```env
# API Configuration
VITE_API_BASE_URL=http://localhost:3000/api
VITE_API_TIMEOUT=10000

# Application
VITE_APP_NAME=My SPA App
VITE_APP_VERSION=1.0.0

# Features
VITE_FEATURE_AUTH=true
VITE_FEATURE_ANALYTICS=false

# External Services
VITE_GOOGLE_ANALYTICS_ID=
VITE_SENTRY_DSN=
```

## Package.json Scripts

```json
{
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview",
    "test": "vitest",
    "test:ui": "vitest --ui",
    "test:coverage": "vitest --coverage",
    "lint": "eslint src --ext ts,tsx",
    "lint:fix": "eslint src --ext ts,tsx --fix",
    "format": "prettier --write \"src/**/*.{ts,tsx,css}\"",
    "typecheck": "tsc --noEmit",
    "e2e": "playwright test",
    "e2e:ui": "playwright test --ui"
  }
}
```

## Vite Configuration

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      '@components': path.resolve(__dirname, './src/components'),
      '@hooks': path.resolve(__dirname, './src/hooks'),
      '@services': path.resolve(__dirname, './src/services'),
      '@utils': path.resolve(__dirname, './src/utils'),
      '@types': path.resolve(__dirname, './src/types'),
    },
  },
  server: {
    port: 5173,
    proxy: {
      '/api': {
        target: 'http://localhost:3000',
        changeOrigin: true,
      },
    },
  },
  build: {
    outDir: 'dist',
    sourcemap: true,
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom', 'react-router-dom'],
          redux: ['@reduxjs/toolkit', 'react-redux'],
        },
      },
    },
  },
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

3. **Start development server:**
   ```bash
   npm run dev
   ```

4. **Run tests:**
   ```bash
   npm test
   ```

5. **Build for production:**
   ```bash
   npm run build
   ```

## Next Steps

1. Review the Frontend Developer agent guidelines
2. Set up your component library
3. Implement state management
4. Add comprehensive tests using the QA Engineer agent guidelines
5. Set up CI/CD following the DevOps Engineer agent guidelines
6. Optimize performance (code splitting, lazy loading)
7. Ensure accessibility compliance
8. Document components using the Documentation Writer agent guidelines
