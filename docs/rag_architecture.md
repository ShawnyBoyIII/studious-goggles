# Offline Knowledge Base (RAG) Architecture

Since the agent will run in completely offline environments, it cannot rely on Google or external APIs for documentation. We will build a Retrieval-Augmented Generation (RAG) system.

## Components
1. **Document Scrapers**: Python scripts to download raw HTML/Markdown from documentation sites (e.g., Python docs, React docs) while connected to the internet.
2. **Embedding Model**: A small, fast model running locally (e.g., `sentence-transformers/all-MiniLM-L6-v2`) to convert text into vector embeddings. This requires very little VRAM.
3. **Vector Database**: `ChromaDB` or `Qdrant` running in local persistent mode. This will store the embeddings on the 5800X host's SSD.

## Workflow (Offline Mode)
1. The Agent encounters a library it doesn't understand (e.g., a specific `matplotlib` function).
2. The Agent queries the Vector Database: `"How do I use matplotlib.pyplot.subplots?"`
3. The Database uses the local embedding model to find the closest matching documentation chunks.
4. The chunks are appended to the Agent's prompt, giving it the exact knowledge it needs to write the code without internet access.
