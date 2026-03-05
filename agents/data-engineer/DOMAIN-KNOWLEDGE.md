# Domain Knowledge — Data Engineer

<data_contracts>
## Data Contract Standards
- **Source**: System name, format (JSON/CSV/SQL/API/event stream), frequency (real-time/hourly/daily), expected volume
- **Schema**: Field names, types, constraints, nullable, default values. Machine-readable schema definition (JSON Schema, Avro, Protobuf).
- **Quality expectations**: Completeness (% of required fields populated), accuracy (validation rules or source of truth), freshness (maximum data age)
- **SLA**: Availability (uptime %), latency (max time from source to destination), error budget (acceptable failure rate per period)
- **Ownership**: Who produces this data, who consumes it, who is responsible for quality, escalation path for issues
</data_contracts>

<pipeline_patterns>
## Pipeline Patterns
- **ETL (batch)**: Extract → Transform → Validate → Load. Best for periodic batch processing with complex transformations.
- **ELT (analytics)**: Extract → Load → Transform in-warehouse. Best when destination has compute power (Snowflake, BigQuery, DuckDB).
- **Streaming**: Event-driven for real-time requirements. Message queues (Kafka, SQS) for reliability. Process in-order when needed.
- **Idempotent processing**: Re-running produces same result. Essential for retry and reprocessing scenarios. Use upserts, deduplication keys.
- **Backfill**: Design every pipeline to support historical reprocessing. Parameterize by date range. Test with real volumes before production.
- **Dead letter queues**: Failed records go to DLQ for investigation rather than blocking the pipeline. Alert on DLQ depth.
</pipeline_patterns>

<data_quality>
## Data Quality Dimensions
- **Completeness**: All expected records present. All required fields populated. No unexplained gaps in time series.
- **Accuracy**: Values match real-world truth. Validation rules catch obviously wrong values (negative ages, future dates in history).
- **Freshness**: Data is current within SLA. Monitor lag between source event and destination availability.
- **Consistency**: No contradictions across sources or within dataset. Referential integrity maintained.
- **Uniqueness**: No unintended duplicates. Deduplication strategy documented. Primary keys enforced.

## Data Quality Monitoring
- Automated checks on every pipeline run: row counts, null rates, value distributions, schema drift
- Anomaly detection: alert on sudden changes in volume, distribution, or error rate
- Quality dashboards: track metrics over time. Trend analysis catches gradual degradation.
</data_quality>

<rag_data>
## RAG Data Preparation
- **Document chunking**: Size by content type — code (function/class level), prose (512-1024 tokens), tables (preserve complete tables). Never split mid-sentence.
- **Metadata preservation**: Source document, date, author, section hierarchy, document type. Metadata enables filtered retrieval.
- **Embedding model selection**: Match to domain and language. Multilingual models for non-English. Test retrieval quality with domain-specific queries.
- **Index optimization**: Vector DB tuning for query patterns. HNSW parameters (M, efConstruction) affect precision/speed tradeoff.
- **Refresh strategy**: Incremental updates for changed documents. Full reindex on embedding model change. Version embeddings with model version.
</rag_data>

<delphi_stack>
## Delphi Data Stack Reference
- **Relational**: PostgreSQL (primary), with pg_vector extension for small-scale vector search
- **Vector DB**: Pinecone or Weaviate for production RAG. Chroma for local development.
- **Cache**: Redis for hot data, session storage, rate limiting
- **Analytics**: DuckDB for analytical queries on structured data
- **ETL**: Python (pandas, polars for performance). Node.js for lightweight transforms.
- **Monitoring**: Custom quality checks in pipeline code. Prometheus metrics for pipeline health.
</delphi_stack>
