FROM python:3.11-slim

WORKDIR /app

# Install uv for package management
RUN pip install --no-cache-dir uv

# Install the mcp-server-qdrant package
RUN uv pip install --system --no-cache-dir mcp-server-qdrant

# Expose the default port for SSE transport
EXPOSE 8000

# Set environment variables with defaults that can be overridden at runtime
ENV QDRANT_URL="http://localhost:6333"
ENV QDRANT_API_KEY="ChnQd6c8db77OHcb5KjBIJSY4xINayAAFt7EEack7hNVOG74C9ZiFJU3Z21W4NJV"
ENV COLLECTION_NAME="default-collection"
ENV EMBEDDING_MODEL="sentence-transformers/all-MiniLM-L6-v2"

# Run the server with streamable transport
CMD ["uvx", "mcp-server-qdrant", "--transport", "streamable-http"]
