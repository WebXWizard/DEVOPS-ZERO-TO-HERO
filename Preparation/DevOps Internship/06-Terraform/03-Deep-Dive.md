# Terraform Deep Dive

## 1. State Management Internals

### The State File (`terraform.tfstate`)
*   **Resource Mapping**: Maps real-world ID (i-12345) to Terraform Resource (`aws_instance.web`).
*   **Metadata**: Stores dependency order to know what to destroy first.
*   **Performance**: Caches attribute values to speed up `plan`.

### State Locking
*   Prevents corruption. When running `apply`, Terraform calculates a hash and acquires a lock in the backend (e.g., DynamoDB).
*   If another user tries to run `apply`, it checks the lock table, sees it's taken, and waits/fails.

### Remote State Isolation
1.  **Workspaces**: Same config, different state files (dev, prod) within the same backend. Good for similar environments.
2.  **Directory Structure**: (Preferred for large projects). Separate folders `envs/dev`, `envs/prod`. Better isolation.

## 2. Advanced HCL

### Meta-Arguments
*   `count`: Create N instances. Accessed via `count.index`.
*   `for_each`: Create instances based on a map/set. Accessed via `each.key`, `each.value`. (Better than count because removing an item doesn't shift all indices).
*   `lifecycle`:
    *   `create_before_destroy`: Useful for zero-downtime replacements.
    *   `prevent_destroy`: Safety mechanism.
    *   `ignore_changes`: Don't drift detect specific attributes (e.g., tags auto-added by AWS).

### Dynamic Blocks
Generate nested blocks (like `ingress` rules in a Security Group) from a list/map variable programmatically.

## 3. Policy as Code (Sentinel / OPA)
Enforce rules *before* infrastructure is created.
*   *Rule*: "No S3 buckets can be public."
*   *Rule*: "Instance type cannot be larger than t3.large in Dev."
*   If `terraform plan` violates policy, the apply is blocked.

## 4. Writing Custom Providers (Concept)
*   Terraform communicates with Providers via **gRPC**.
*   Providers are written in **Go**.
*   They implement CRUD operations (Create, Read, Update, Delete) that map to API calls of the target service.

## 5. Drift Detection
*   `terraform refresh`: Updates state file with real-world status.
*   Scenario: Someone manually deleted a Security Group rule.
*   Terraform detects the difference (Drift) and `plan` proposes to restore the missing rule.
