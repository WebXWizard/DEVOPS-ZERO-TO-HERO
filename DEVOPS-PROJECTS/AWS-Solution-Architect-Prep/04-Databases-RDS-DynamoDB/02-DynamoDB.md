# Amazon DynamoDB (NoSQL)

## 1. Core Concepts
- **Serverless:** No instances to provision.
- **Schema-less:** Only Primary Key is mandatory. Items can have different attributes.
- **Performance:** Low latency (single-digit ms) at any scale.

## 2. Primary Keys
1. **Partition Key (PK):** Hashing logic determines where data is stored. Must be unique.
2. **Composite Key (PK + Sort Key):** PK to group data, Sort Key to order it. (e.g., PK=UserID, Sort=Timestamp).

## 3. Capacity Modes
1. **Provisioned:** You specify WCU (Write Capacity Units) and RCU (Read Capacity Units). Use when traffic is predictable. Cheap.
2. **On-Demand:** Auto-scales instantly. Good for unpredictable traffic. Expensive.

## 4. Indexes (Query Flexibility)
- **LSI (Local Secondary Index):** Must be created at table creation. Same PK, different Sort Key.
- **GSI (Global Secondary Index):** Can be created anytime. Different PK, different Sort Key. (Essentially a clone of the table with different keys).

## 5. Accelerator (DAX)
- In-memory cache for DynamoDB.
- **Benefit:** Microsecond (µs) latency.
- **Transparent:** No code change needed.
