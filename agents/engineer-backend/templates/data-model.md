# Data Model: [FEATURE/SERVICE NAME]

**Date:** YYYY-MM-DD
**Author:** Engineer (Backend)
**Project:** [project name]
**Database:** [PostgreSQL / MongoDB / etc.]

## Overview
[Brief description of the data domain and relationships]

## Entities

### [Entity Name]
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, NOT NULL | Unique identifier |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Creation timestamp |
| updated_at | TIMESTAMP | NOT NULL | Last modification |
| [field] | [type] | [constraints] | [description] |

### [Entity Name]
[same structure]

## Relationships
| From | To | Type | FK | On Delete |
|------|----|------|----|----|
| [entity] | [entity] | 1:N / N:M / 1:1 | [fk_column] | CASCADE / SET NULL / RESTRICT |

## Indexes
| Table | Columns | Type | Purpose |
|-------|---------|------|---------|
| [table] | [columns] | B-tree / GIN / GiST | [query pattern] |

## Migrations
| Version | Description | Reversible? |
|---------|-------------|-------------|
| 001 | Initial schema | Yes |
| [version] | [description] | Yes / No |

## Data Constraints
- [ ] All foreign keys have appropriate ON DELETE behavior
- [ ] Indexes cover common query patterns
- [ ] PII fields identified and documented
- [ ] Soft delete vs hard delete decision documented

## PII and Security
| Field | Classification | Handling |
|-------|---------------|----------|
| [field] | PII / Sensitive / Public | Encrypt / Mask / None |

## Query Patterns
| Pattern | Frequency | Expected Performance |
|---------|-----------|---------------------|
| [describe query] | High / Medium / Low | [target latency] |
