# System Design for DevOps Engineers

You don't code the app, but you design the house it lives in.

## 1. High Availability (HA)
**Concept**: Eliminate single points of failure.
- **Bad**: 1 Web Server. (If it crashes, site is down).
- **Good**: 2 Web Servers + 1 Load Balancer. (If one crashes, LB sends traffic to the other).
- **Best**: Servers in different **Availability Zones** (AZ). (If an entire Data Center burns down, you are still up).

## 2. Scalability
**Concept**: Handling more users.
- **Vertical Scaling (Scale Up)**: Buy a bigger server (RAM/CPU).
  - Limit: There is a max size. Expensive.
- **Horizontal Scaling (Scale Out)**: Add *more* servers.
  - Limit: Infinite. Cheaper. Harder to manage (needs Stateless apps).

## 3. Caching
**Concept**: Don't calculate the same thing twice.
1.  **CDN (CloudFront)**: Cache static files (images, CSS) at the "Edge" (near the user).
2.  **In-Memory (Redis)**: Cache Database queries in RAM.

## 4. Database: SQL vs NoSQL
- **SQL (RDS/Postgres)**: Structured data. Strict schema. Harder to scale horizontally.
- **NoSQL (DynamoDB/MongoDB)**: Unstructured. Flexible schema. Scales horizontally easily.

## 5. The "3-Tier Architecture"
The classic interview answer for "Design a web app":
1.  **Presentation Tier**: Nginx/React (Public Subnet).
2.  **Logic Tier**: Python/NodeJS (Private Subnet).
3.  **Data Tier**: Database (Private Subnet - No Internet Access).
