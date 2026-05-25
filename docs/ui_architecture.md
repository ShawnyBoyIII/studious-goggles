# User Interface Architecture

We will build the Custom Web UI using **Streamlit** (simplest, Python-native) or a combination of **React (Frontend) + FastAPI (Backend)** if more complex visualization is needed.

## Key UI Views
1. **Chat Window**: Primary way to interact with the agent. Uses Server-Sent Events (SSE) to stream text generation token-by-token from the local LLM.
2. **Thought Trace**: A collapsible side-panel showing *what* the agent is doing (e.g., "Querying RAG database for 'React hooks'", "Starting Docker container").
3. **Workspace/File Explorer**: A view into the sandboxed directory so the user can inspect the code the agent has generated before approving it.
4. **Terminal View**: Real-time output (stdout/stderr) from the Docker container executions.

## Integration Path
UI (Browser) -> API Server (FastAPI) -> Agent Core (Python) -> Local LLM (Ollama) & Docker (Sandbox)
