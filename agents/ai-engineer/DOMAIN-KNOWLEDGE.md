# Domain Knowledge — AI Engineer

<prompt_engineering>
## Prompt Engineering Patterns
- **System prompts**: Define role, constraints, output format, examples. Keep concise — shorter prompts are more reliable.
- **Few-shot**: 3-5 examples for consistent formatting. Place examples after instructions, before the user query.
- **Chain-of-thought**: Use for complex reasoning. Ask the model to think step-by-step. Structured CoT (numbered steps) outperforms freeform.
- **Tool use**: Structured tool definitions with clear descriptions, parameter types, and usage examples. Fewer, well-defined tools outperform many vague ones.
- **XML tags**: Use XML tags to structure long prompts. Claude parses these more reliably than markdown headers alone.
- **Prefilling**: Start the assistant response to constrain output format (JSON, specific structure).
- **Decomposition**: Break complex tasks into subtasks. Pipeline of focused prompts outperforms single monolithic prompt.
</prompt_engineering>

<eval_metrics>
## Evaluation Metric Definitions
- **Factuality**: Proportion of claims in output that are verifiable against source data. Measured by automated fact-checking or LLM-as-judge.
- **Faithfulness**: Alignment between generated output and retrieved context (RAG). Output should not introduce information absent from retrieved chunks.
- **Relevance**: Proportion of output that directly addresses the actual query. Penalize tangential or off-topic content.
- **Safety**: Compliance with content policy and guardrails. Includes refusal of out-of-scope requests and absence of harmful content.
- **Consistency**: Same input produces semantically equivalent output across runs. Measured by embedding similarity or LLM comparison.
- **Latency**: Time from request to complete response. Track p50, p95, p99. Streaming TTFB tracked separately.
- **Cost**: Tokens consumed per interaction (input + output). Track per-feature and per-model.
</eval_metrics>

<model_reference>
## Model Comparison Reference
| Model | Strength | Cost Tier | Use When |
|-------|----------|-----------|----------|
| Claude Opus | Highest capability, best reasoning | High | Complex analysis, coding, multi-step tasks |
| Claude Sonnet | Balanced capability/cost | Medium | General purpose, most production features |
| Claude Haiku | Fastest, lowest cost | Low | Classification, extraction, high-volume simple tasks |
| OpenAI GPT-4o | Strong multimodal, good reasoning | Medium-High | Fallback, multimodal tasks |

## Fallback Chain Design
Primary → Secondary → Cached → Graceful error. Each step should be independently testable. Fallback triggers: timeout, rate limit, quality score below threshold, cost spike.
</model_reference>

<rag_patterns>
## RAG Pipeline Patterns
- **Chunk size**: 512-1024 tokens typical. Shorter for factual Q&A, longer for summarization. Always test with eval dataset.
- **Overlap**: 10-20% between chunks for context continuity at boundaries.
- **Retrieval**: Hybrid search (semantic + BM25 keyword) outperforms either alone. Top-k typically 5-10, then rerank.
- **Reranking**: Cross-encoder reranking after initial retrieval improves precision significantly. Worth the latency cost.
- **Context assembly**: Order retrieved chunks by relevance. Include source metadata for citation. Trim to model context window with buffer.
- **Embedding models**: Match embedding model to domain. Multilingual models for non-English content. Fine-tuned embeddings for specialized domains.
</rag_patterns>

<anti_patterns>
## Anti-Patterns to Avoid
- Shipping without eval suite ("it looks good" is not a metric)
- Prompt engineering by intuition instead of measurement
- Using the most expensive model by default without benchmarking cheaper options
- RAG without retrieval quality evaluation (garbage in, garbage out)
- Ignoring token costs until the invoice arrives
- Deploying unfiltered LLM output to end users
</anti_patterns>
