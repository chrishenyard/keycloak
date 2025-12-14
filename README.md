# Docker Keycloak with SQL Server

This project sets up Keycloak with SQL Server using Docker Compose for local development and testing.

## Prerequisites

- Docker and Docker Compose installed
- Basic knowledge of Keycloak and SQL Server

## Getting Started

1. Clone this repository
2. Create a `.env` file in the root directory with the following variables:

```env
MSSQL_SA_PASSWORD=YourStrongPassword123!
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=admin
```

3. Start the services:

```bash
docker-compose up -d
```

4. Wait for the services to be healthy and then access Keycloak at:
   - URL: http://localhost:8080
   - Admin Console: http://localhost:8080/admin
   - Username: admin (or the value set in KEYCLOAK_ADMIN)
   - Password: admin (or the value set in KEYCLOAK_ADMIN_PASSWORD)

## Services

### SQL Server
- **Container**: `keycloak.sqlserver`
- **Image**: Microsoft SQL Server
- **Port**: 1438 (mapped from 1433)
- **Database**: `keycloakdb` (automatically created via init script)

### Keycloak
- **Container**: `keycloak`
- **Image**: Official Keycloak image
- **Port**: 8080
- **Mode**: Development mode (`start-dev`)
- **Database**: Connected to the SQL Server container

## Configuration

The setup includes:
- Health checks for SQL Server
- Manual database creation via [`init-database.sql`](init-database.sql). Run after mssql starts.
- SSL disabled for development (not recommended for production)
- Edge proxy configuration
- Persistent volume for SQL Server data

## Stopping the Services

```bash
docker-compose down
```

To also remove volumes:

```bash
docker-compose down -v
```

## Notes

- This setup is configured for development use only
- SSL/TLS is disabled for simplicity
- The `.env` file is gitignored for security
- SQL Server data persists in a Docker volume

## Troubleshooting

- If SQL Server fails to start, ensure your password meets SQL Server requirements (8+ characters, uppercase, lowercase, numbers, symbols)
- If Keycloak can't connect to the database, check that the SQL Server container is healthy
- For connection issues, verify the environment variables in your `.env` file