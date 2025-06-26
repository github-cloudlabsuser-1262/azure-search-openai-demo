# Backend Application Documentation

## Overview

This backend is part of the Azure Search OpenAI Demo project. It provides RESTful APIs and services for document ingestion, search, chat, and AI-powered features, leveraging Azure Cognitive Services, Azure Search, and OpenAI models. The backend is built with Python using the Quart web framework and is designed for cloud-native deployment (e.g., Azure App Service, Container Apps) as well as local development.

## Main Features
- **Document Ingestion**: Supports ingestion and processing of various document types (PDF, text, images, etc.) for search and retrieval.
- **Search & Retrieval**: Integrates with Azure Cognitive Search and supports advanced retrieval approaches, including agentic and vector search.
- **Chat & Vision APIs**: Provides endpoints for chat-based and vision-based AI interactions using OpenAI models.
- **User Uploads**: Allows authenticated users to upload and manage documents.
- **Speech Services**: Integrates with Azure Speech for text-to-speech and related features.
- **Authentication**: Supports Azure AD and other authentication mechanisms.
- **Monitoring**: Integrates with Azure Monitor and OpenTelemetry for observability.

## Directory Structure
- `app.py` — Main Quart app with API endpoints and service initialization.
- `main.py` — Entrypoint for running the backend (used by Gunicorn or directly).
- `config.py` — Configuration constants for service wiring.
- `prepdocs.py` — Document ingestion and indexing utilities.
- `requirements.txt` / `requirements.in` — Python dependencies.
- `Dockerfile` — Containerization setup for deployment.
- Subfolders like `approaches/`, `core/`, `prepdocslib/` — Modular code for retrieval, processing, and core logic.

## Setup & Installation

### Prerequisites
- Python 3.11+
- Azure resources (Cognitive Search, OpenAI, Blob Storage, etc.)
- (Optional) Docker for containerized deployment

### Install Dependencies
```bash
pip install -r requirements.txt
```

### Environment Configuration
- Use environment variables or `.env` files to configure Azure credentials, endpoints, and feature flags.
- For local development, `load_azd_env.py` can help load environment variables from Azure Developer CLI.

### Running Locally
```bash
python main.py
```
Or with Gunicorn (recommended for production):
```bash
gunicorn -b 0.0.0.0:8000 main:app
```

### Using Docker
```bash
docker build -t backend-app .
docker run -p 8000:8000 backend-app
```

## Key Endpoints (see `app.py` for details)
- `/ask` — Query the AI for answers based on ingested documents
- `/chat` — Chat interface with OpenAI models
- `/upload` — Upload documents (authenticated)
- `/speech` — Text-to-speech
- `/content/<path>` — Retrieve content files

## Development Notes
- Code is organized for extensibility; add new approaches in `approaches/`.
- Uses async programming for scalability.
- Instrumented for Azure Monitor and OpenTelemetry.

## Testing

### Running Unit Tests
- Unit tests are located in the `tests/` directory.
- To run all tests, use the following command:
```bash
pytest tests/
```

### Writing New Tests
- Add new test files in the `tests/` directory.
- Use the `pytest` framework for writing tests.
- Follow the naming convention `test_<module_name>.py` for test files.

### Test Coverage
- To check test coverage, install `pytest-cov`:
```bash
pip install pytest-cov
```
- Run the following command to generate a coverage report:
```bash
pytest --cov=app tests/
```

## License
See [LICENSE](../../LICENSE) for details.

---
For more details, refer to the main project documentation or explore the codebase.
