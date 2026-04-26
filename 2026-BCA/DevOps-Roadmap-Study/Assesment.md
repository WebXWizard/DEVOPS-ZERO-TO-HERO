# Internship Assessment Master Guide

Prepared for: Internship assessment on April 18, 2026

This guide is designed for fast preparation and interview-style answers.

## How to use this file today

1. Read the `High-Yield Checklist` first (15-20 min).
2. Practice commands and code snippets (45-60 min).
3. Solve topic-wise questions out loud (45-60 min).
4. Use the `Rapid Revision Plan` in the last section before assessment.

---

## High-Yield Checklist (Must Know)

- Cloud basics: IaaS vs PaaS vs SaaS, scalability, availability, load balancer, regions/AZs
- Linux basics: files, permissions, process management, networking commands, logs
- Git basics: branch/merge/rebase, pull request flow, resolving merge conflicts
- Node.js basics: event loop, async patterns, API creation, middleware, error handling
- Shell scripting basics: variables, loops, conditions, exit codes, script arguments
- React basics: component lifecycle through hooks, state vs props, useEffect, rendering
- TypeScript basics: type safety, interfaces/types, generics, narrowing, utility types
- DevOps basics: SDLC automation, IaC, observability, collaboration
- CI/CD basics: pipeline stages, test automation, deployment strategies
- CloudFormation basics: template structure, stack lifecycle, parameters/outputs, change sets

---

## 1) Cloud Computing

### What it is

Cloud computing is delivering compute, storage, networking, and platform services over the internet on-demand with usage-based pricing.

### Core concepts

- Elasticity: automatic scale up/down based on load
- Scalability:
  - Vertical scaling: increase machine size (CPU/RAM)
  - Horizontal scaling: add more machines
- Availability: keeping service accessible (for example 99.9% uptime)
- Fault tolerance: service continues even if part of system fails
- Multi-tenant: one physical infrastructure serves multiple customers securely

### Service models

- IaaS: You manage OS and app; cloud manages hardware (example: EC2)
- PaaS: You deploy app code; provider manages runtime/platform (example: Heroku)
- SaaS: Complete software ready to use (example: Gmail)

### Deployment models

- Public cloud: shared provider infrastructure
- Private cloud: dedicated environment
- Hybrid cloud: mix of on-prem + cloud
- Multi-cloud: use multiple providers

### Typical architecture pieces

- DNS
- CDN
- Load balancer
- Auto Scaling Group
- Application servers
- Database (SQL/NoSQL)
- Cache (Redis)
- Object storage (S3-like)
- Monitoring/alerts

### Common interview questions

1. What is the difference between scalability and elasticity?
Answer: Scalability is the ability to increase capacity; elasticity is automatic scaling based on demand.

2. Why use Availability Zones?
Answer: To isolate failures and improve resilience by deploying across physically separate data centers.

3. CAP theorem in simple terms?
Answer: In distributed systems, during network partition you can choose consistency or availability, but not both perfectly.

4. What is a load balancer?
Answer: A service that distributes incoming traffic across multiple servers.

5. When to choose NoSQL over SQL?
Answer: Highly variable schema, massive horizontal scale, or low-latency key-value/document access.

### Quick scenario

Your app crashes during traffic spikes.
Expected answer:
- Add autoscaling
- Add load balancer health checks
- Use stateless app servers
- Add caching
- Monitor CPU/memory/latency/error rate

---

## 2) Linux

### Filesystem and paths

- `/` root
- `/home` user data
- `/etc` configs
- `/var/log` logs
- `/tmp` temporary files
- `/usr/bin` executables

### Essential commands

```bash
pwd
ls -la
cd /path
mkdir -p project/src
touch file.txt
cp source dest
mv old new
rm file.txt
rm -r folder
cat file.txt
less file.txt
head -n 20 file.txt
tail -n 50 app.log
```

### Search and text tools

```bash
find . -name "*.js"
grep -R "PORT" .
awk '{print $1}' file.txt
sed 's/old/new/g' file.txt
sort file.txt | uniq
wc -l file.txt
```

### Permissions

- `r` (4), `w` (2), `x` (1)
- `chmod 755 script.sh` -> owner rwx, group r-x, others r-x
- `chmod 644 file.txt` -> owner rw-, group r--, others r--

```bash
ls -l
chmod +x deploy.sh
chown user:group file.txt
```

### Process and system monitoring

```bash
ps aux
top
htop
kill -9 <pid>
free -h
df -h
du -sh .
uptime
```

### Networking basics

```bash
ip a
ping google.com
curl -I https://example.com
ss -tuln
netstat -tuln
```

### Logs and services

```bash
tail -f /var/log/syslog
journalctl -u nginx --since "10 minutes ago"
systemctl status nginx
systemctl restart nginx
```

### Common interview questions

1. Difference between hard link and soft link?
Answer: Hard link points to inode; soft link is a path pointer and can break if target is removed.

2. What does `chmod 777` do and why avoid it?
Answer: Full permission to everyone; unsafe for production.

3. What is a daemon?
Answer: Background service process (like `sshd`, `nginx`).

4. How to check which process uses a port?
Answer: `ss -tulnp` or `lsof -i :<port>`.

---

## 3) Git

### Core model

- Working directory: your files
- Staging area: selected changes (`git add`)
- Local repository: commits (`git commit`)
- Remote repository: shared code (`git push`)

### Standard workflow

```bash
git checkout -b feature/login
git add .
git commit -m "Add login form validation"
git push -u origin feature/login
```

### Useful commands

```bash
git status
git log --oneline --graph --decorate
git diff
git diff --staged
git fetch
git pull
git merge <branch>
git rebase <branch>
git stash
git stash pop
git cherry-pick <commit>
```

### Merge vs rebase

- Merge: preserves branch history with merge commit
- Rebase: rewrites commit base for linear history

Use rebase for cleaner local history; avoid rebasing shared/public commits.

### Conflict resolution flow

1. Pull/rebase latest changes
2. Open conflict markers in files
3. Keep correct code and remove markers
4. `git add <file>`
5. Continue: `git rebase --continue` or commit merge

### Common interview questions

1. Difference between `git fetch` and `git pull`?
Answer: Fetch downloads changes only; pull = fetch + merge/rebase.

2. What is HEAD?
Answer: Pointer to your current checked out commit.

3. Detached HEAD means?
Answer: You checked out a commit directly, not a branch.

4. When use `git stash`?
Answer: Save temporary uncommitted work to switch context quickly.

---

## 4) Node.js

### What Node.js is

A JavaScript runtime built on V8 for server-side programming, optimized for asynchronous, event-driven I/O.

### Core concepts

- Single-threaded event loop
- Non-blocking I/O
- Callback queue + microtask queue
- Modules: CommonJS (`require`) and ESM (`import`)

### Async patterns

- Callback
- Promise
- async/await (most readable)

### Example: basic API with error handling

```js
import express from "express";

const app = express();
app.use(express.json());

app.get("/health", (_req, res) => {
  res.json({ ok: true, service: "api" });
});

app.get("/users/:id", async (req, res, next) => {
  try {
    const user = { id: req.params.id, name: "Alex" };
    res.json(user);
  } catch (err) {
    next(err);
  }
});

app.use((err, _req, res, _next) => {
  res.status(500).json({ error: "Internal Server Error", detail: err.message });
});

app.listen(3000, () => console.log("Server running on :3000"));
```

### Performance + reliability tips

- Never block event loop with heavy CPU tasks
- Use caching for frequent reads
- Add request validation and rate limiting
- Use structured logs and centralized error handling
- Graceful shutdown on SIGTERM for containers

### Common interview questions

1. Why is Node.js good for I/O-heavy apps?
Answer: Non-blocking async model handles many concurrent requests efficiently.

2. What is middleware in Express?
Answer: Functions in request-response pipeline for auth, parsing, logging, error handling.

3. How to handle uncaught errors?
Answer: Global error middleware, process-level handlers, logs, restart strategy (PM2/systemd/K8s).

4. `process.nextTick` vs `setImmediate`?
Answer: `nextTick` runs before event loop continues; `setImmediate` runs in check phase after I/O callbacks.

---

## 5) Shell Scripting

### Script structure

```bash
#!/usr/bin/env bash
set -euo pipefail

name="Intern"
echo "Hello, $name"
```

### Why `set -euo pipefail`

- `-e`: exit on command failure
- `-u`: error on unset variables
- `-o pipefail`: fail if any command in pipeline fails

### Variables and arguments

```bash
#!/usr/bin/env bash
file="${1:-default.txt}"
echo "Target file: $file"
echo "All args: $@"
echo "Arg count: $#"
```

### Conditions and loops

```bash
if [[ -f "$file" ]]; then
  echo "File exists"
else
  echo "Missing file"
fi

for i in {1..5}; do
  echo "Run $i"
done
```

### Functions

```bash
log_info() {
  echo "[INFO] $1"
}

backup_file() {
  local src="$1"
  cp "$src" "$src.bak"
}
```

### Useful script patterns

- Input validation
- Retry logic for flaky network commands
- Logging with timestamps
- Exit codes (`0` success, non-zero failure)

### Common interview questions

1. Difference between `$*` and `$@`?
Answer: `$@` preserves argument boundaries (preferred), `$*` joins args as one string.

2. Meaning of `$?`?
Answer: Exit status of previous command.

3. How to run script executable?
Answer: `chmod +x script.sh` then `./script.sh`.

---

## 6) React

### Core ideas

- UI is component-based
- Data flows from parent to child through props
- State drives rendering
- Hooks manage side effects and local state

### Common hooks

- `useState`: local state
- `useEffect`: side effects (API calls, subscriptions)
- `useMemo`: memoize computed value
- `useCallback`: memoize function reference
- `useRef`: mutable container, DOM access

### Example with loading + error state

```tsx
import { useEffect, useState } from "react";

type User = { id: number; name: string };

export default function Users() {
  const [users, setUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let active = true;

    async function load() {
      try {
        const res = await fetch("/api/users");
        if (!res.ok) throw new Error("Failed to fetch users");
        const data: User[] = await res.json();
        if (active) setUsers(data);
      } catch (err) {
        if (active) setError((err as Error).message);
      } finally {
        if (active) setLoading(false);
      }
    }

    load();
    return () => {
      active = false;
    };
  }, []);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error: {error}</p>;

  return (
    <ul>
      {users.map((u) => (
        <li key={u.id}>{u.name}</li>
      ))}
    </ul>
  );
}
```

### Common interview questions

1. State vs props?
Answer: State is internal mutable data; props are external read-only inputs.

2. Why key prop in lists?
Answer: Helps React identify changed/added/removed items efficiently.

3. When does `useEffect` run?
Answer: After render; dependency array controls frequency.

4. Controlled vs uncontrolled components?
Answer: Controlled inputs are managed by React state; uncontrolled rely on DOM refs.

---

## 7) TypeScript

### Why TypeScript

Adds static typing to JavaScript to catch errors early and improve editor tooling.

### Essential types

```ts
let username: string = "sam";
let age: number = 21;
let active: boolean = true;
let tags: string[] = ["node", "react"];
```

### Interfaces and type aliases

```ts
interface User {
  id: number;
  name: string;
}

type ApiResponse<T> = {
  data: T;
  error?: string;
};
```

### Generics

```ts
function identity<T>(value: T): T {
  return value;
}
```

### Narrowing and guards

```ts
function printId(id: string | number) {
  if (typeof id === "string") {
    console.log(id.toUpperCase());
  } else {
    console.log(id.toFixed(0));
  }
}
```

### Utility types

- `Partial<T>`: optional fields
- `Required<T>`: required fields
- `Pick<T, K>`: select fields
- `Omit<T, K>`: remove fields
- `Record<K, V>`: key-value object type

### Common interview questions

1. `any` vs `unknown`?
Answer: `any` disables type checking; `unknown` is safer and requires narrowing before use.

2. Interface vs type?
Answer: Both define shapes; interfaces support declaration merging and are often preferred for object contracts.

3. What are generics?
Answer: Reusable typed abstractions that keep type information.

---

## 8) DevOps

### What DevOps means

A culture + engineering practice that connects development and operations to deliver software faster and reliably.

### Key pillars

- Collaboration across teams
- Automation (build, test, deploy)
- Observability (logs, metrics, traces)
- Reliability and feedback loops
- Infrastructure as Code

### Typical DevOps lifecycle

1. Plan
2. Code
3. Build
4. Test
5. Release
6. Deploy
7. Operate
8. Monitor

### Common tools (examples)

- SCM: GitHub/GitLab/Bitbucket
- CI/CD: GitHub Actions/Jenkins/GitLab CI
- Containers: Docker
- Orchestration: Kubernetes
- IaC: Terraform/CloudFormation
- Monitoring: Prometheus/Grafana/CloudWatch

### Interview questions

1. Difference between Agile and DevOps?
Answer: Agile optimizes development process; DevOps extends to operations with delivery automation.

2. Why is automation important?
Answer: Reduces manual errors, speeds releases, improves consistency.

3. What is Infrastructure as Code?
Answer: Managing infrastructure via versioned code templates.

---

## 9) CI/CD

### CI (Continuous Integration)

Developers merge code frequently; each change triggers automated build/test.

### CD

- Continuous Delivery: code always deployable; release decision may be manual
- Continuous Deployment: code auto-deployed after passing checks

### Pipeline stages

1. Checkout source
2. Install dependencies
3. Lint + static checks
4. Unit/integration tests
5. Build artifact/container
6. Security scan
7. Deploy to staging
8. Smoke tests
9. Deploy to production (manual/auto)

### Example GitHub Actions workflow

```yaml
name: ci
on:
  push:
    branches: [main]
  pull_request:

jobs:
  build-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm run lint
      - run: npm test -- --runInBand
      - run: npm run build
```

### Deployment strategies

- Blue/Green: switch traffic between two identical environments
- Canary: release to small percentage then expand
- Rolling: update instances gradually
- Recreate: stop old, start new (higher downtime risk)

### Interview questions

1. Why run tests in pipeline instead of locally only?
Answer: Enforces consistent quality gate for every change.

2. What is a rollback strategy?
Answer: Predefined method to revert to last stable release quickly.

3. What is artifact immutability?
Answer: Build once, deploy same artifact across environments.

---

## 10) AWS CloudFormation

### What it is

AWS Infrastructure as Code service for provisioning resources from YAML/JSON templates.

### Template structure

- `AWSTemplateFormatVersion` (optional)
- `Description`
- `Parameters`
- `Mappings`
- `Conditions`
- `Resources` (required)
- `Outputs`

### Simple template example (S3 + output)

```yaml
AWSTemplateFormatVersion: "2010-09-09"
Description: Create an S3 bucket

Parameters:
  BucketName:
    Type: String
    Description: Globally unique bucket name

Resources:
  AppBucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: !Ref BucketName

Outputs:
  BucketArn:
    Value: !GetAtt AppBucket.Arn
    Description: ARN of the created bucket
```

### Important concepts

- Stack: deployed instance of template
- Change set: preview infrastructure changes before execution
- Drift detection: checks if real resources differ from template
- Stack policies: protect critical resources from accidental updates
- Nested stacks/modules: split large templates for reuse

### Intrinsic functions to know

- `!Ref`
- `!Sub`
- `!GetAtt`
- `!Join`
- `!If`
- `!ImportValue`

### Interview questions

1. CloudFormation vs Terraform?
Answer: CloudFormation is AWS-native and tightly integrated; Terraform is multi-cloud and provider-agnostic.

2. What happens on stack update failure?
Answer: By default CloudFormation rolls back to previous stable state.

3. Why use parameters and outputs?
Answer: Reusability and cross-stack communication.

---

## Cross-Topic Frequently Asked Questions

1. What happens when user opens a website URL?
Answer framework:
- DNS resolution
- TCP/TLS handshake
- HTTP request to load balancer/web server
- app logic + DB/cache calls
- response returned and browser renders HTML/CSS/JS

2. Authentication vs Authorization?
- Authentication: who you are (login)
- Authorization: what you can access (permissions/roles)

3. HTTP vs HTTPS?
- HTTPS = HTTP over TLS encryption
- Protects confidentiality and integrity in transit

4. SQL vs NoSQL?
- SQL: relational, structured schema, strong ACID
- NoSQL: flexible schema, horizontal scaling, specific use-case models

5. Caching benefits?
- Reduces latency
- Reduces backend/database load
- Improves throughput

---

## Practice Questions (Topic-Wise)

### Cloud

1. Design a highly available 3-tier web app in AWS.
2. Explain how auto scaling policy should be configured for CPU and request count.
3. How would you reduce cost for non-production environments?

### Linux

1. Write command to find top 10 largest files in current directory tree.
2. How to rotate logs for a custom service?
3. Difference between `cron` and `systemd timers`.

### Git

1. Resolve a rebase conflict and continue safely.
2. Recover deleted branch commit via reflog.
3. Compare squash merge vs regular merge for PRs.

### Node.js

1. Build REST endpoint with validation and centralized error handling.
2. Prevent blocking event loop in CSV processing.
3. Implement retry with exponential backoff for external API call.

### Shell Scripting

1. Write script: backup all `.conf` files to timestamped folder.
2. Script should fail if required env var is missing.
3. Parse log file and print unique IP addresses.

### React

1. Build searchable list with debounced input.
2. Explain and fix unnecessary re-renders in parent-child components.
3. Implement form with controlled components and validation.

### TypeScript

1. Create generic function to group items by key.
2. Define discriminated union for API states (`loading|success|error`).
3. Convert JS utility file to TS with strict mode enabled.

### DevOps/CI/CD

1. Design pipeline for Node app from commit to production.
2. Add unit test coverage gate and lint gate.
3. Implement canary deployment with automatic rollback on high error rate.

### CloudFormation

1. Create VPC + public/private subnets with outputs.
2. Add parameterized instance type and environment tags.
3. Use conditions to create resources only in production.

---

## Fast Hands-On Tasks (60-90 min)

1. Linux + Git
- Create sample repo
- Add 3 commits
- Create feature branch
- Introduce and resolve a merge conflict

2. Node + TypeScript
- Build simple `/health` and `/users` endpoints
- Add TS types for request/response

3. React
- Create component with fetch + loading/error states
- Use TypeScript types for response

4. CI
- Add GitHub Actions workflow for lint/test/build

5. CloudFormation
- Write template for one S3 bucket and validate syntax using `aws cloudformation validate-template`

---

## Rapid Revision Plan (Assessment Day)

### T-180 to T-120 min

- Revise Linux commands and Git workflow
- Speak out answers to 10 Linux/Git questions

### T-120 to T-75 min

- Revise Node.js event loop, Express middleware, error handling
- Revise TypeScript basics + generics

### T-75 to T-45 min

- Revise React hooks and rendering flow
- Practice state/props/useEffect answers

### T-45 to T-20 min

- Revise DevOps, CI/CD stages, deployment strategies
- Revise CloudFormation template anatomy

### T-20 to T-0 min

- Go through `High-Yield Checklist`
- Keep 5 project examples ready:
  - one debugging story
  - one conflict-resolution story
  - one deployment story
  - one performance optimization story
  - one automation story

---

## Interview Answer Framework (Use this structure)

For any technical question:

1. Definition (1 sentence)
2. Why it matters (1 sentence)
3. Real example (1 short scenario)
4. Tradeoff or best practice (1 line)

Example:
"CI is automatically building and testing every code change. It matters because it catches issues early and keeps main branch stable. For example, every PR runs lint + tests before merge. Best practice is to keep CI fast and fail fast."

---

## Common Mistakes to Avoid

- Giving definitions without practical example
- Saying "I know" but not showing command/code
- Ignoring error handling and monitoring
- Using `any` everywhere in TypeScript
- Using `chmod 777` in examples
- Not knowing rollback strategy in deployments

---

## Final 30 Rapid-Fire Questions

1. IaaS vs PaaS?
2. Region vs Availability Zone?
3. What is autoscaling?
4. What is load balancing?
5. `chmod 755` means?
6. `ps` vs `top`?
7. `git fetch` vs `git pull`?
8. merge vs rebase?
9. What is detached HEAD?
10. What is event loop?
11. callback vs promise?
12. Why middleware?
13. What is REST?
14. 2xx/4xx/5xx meaning?
15. state vs props?
16. Why key in React list?
17. useEffect dependency array meaning?
18. controlled component?
19. interface vs type?
20. `unknown` vs `any`?
21. what are generics?
22. what is DevOps?
23. CI vs CD?
24. blue/green vs canary?
25. what is IaC?
26. what is CloudFormation stack?
27. what is change set?
28. what is drift detection?
29. authentication vs authorization?
30. rollback strategy?

---

## Confidence Notes

- Interviewers usually evaluate clarity of fundamentals, not perfect memorization.
- If stuck, explain assumptions and how you would verify in real project.
- Use short, structured answers and one practical example per topic.

You are fully equipped to do well today. Focus on calm delivery and strong basics.
