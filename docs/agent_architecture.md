# Core Agent Architecture

The agent acts as the orchestrator connecting the Local LLM, the RAG Database, and the execution Sandbox.

## The Loop
1. **Planning**: The user provides a prompt. The agent queries the LLM to generate a step-by-step plan.
2. **Context Retrieval**: If the agent is unsure about an API or syntax, it queries the local RAG (Vector Database).
3. **Coding**: The agent writes code and saves it to a file.
4. **Execution**: The agent spawns an ephemeral, isolated Docker container (`--network none` for safety). The container mounts the code file and executes it.
5. **Reflection**: The agent captures the standard output and standard error from the container.
   - If there is an error, the agent feeds the error trace back to the LLM and loops back to step 3.
   - If successful, it proceeds to the next step of the plan.

## Security
- Docker containers run with strictly limited memory and CPU (to prevent runaway loops).
- No internet access inside the sandbox container.
- The host filesystem is protected; only specific working directories are mounted.
