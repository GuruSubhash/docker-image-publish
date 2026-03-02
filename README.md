# Node.js Service Starter

A fully structured Node.js project scaffold with clear separation of concerns.

## Project structure

```text
.
|-- src
|   |-- app.js
|   |-- server.js
|   |-- config
|   |   `-- env.js
|   |-- controllers
|   |   `-- healthController.js
|   |-- middlewares
|   |   `-- errorHandler.js
|   |-- routes
|   |   `-- index.js
|   |-- services
|   |   `-- healthService.js
|   `-- utils
|       `-- logger.js
|-- tests
|   `-- health.test.js
|-- .env.example
|-- .gitignore
`-- package.json
```

## Quick start

1. Install dependencies:
   ```bash
   npm install
   ```
2. Create your environment file:
   ```bash
   copy .env.example .env
   ```
3. Run in development:
   ```bash
   npm run dev
   ```
4. Run tests:
   ```bash
   npm test
   ```

## Available scripts

- `npm start` - start server
- `npm run dev` - start server with nodemon
- `npm test` - run tests with Node test runner
- `npm run lint` - run ESLint

