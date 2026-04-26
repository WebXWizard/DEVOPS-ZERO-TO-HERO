# 03. Popular CI/CD Tools

There are many tools available. Here is a breakdown of the most popular ones you will face in the industry.

## 1. Jenkins
- **The Veteran**: Jenkins is the grandfather of CI/CD. It's open-source and has been around forever.
- **Pros**: infinitely customizable, huge plugin ecosystem, free.
- **Cons**: Old UI, hard to maintain (hosting your own server), configuration can be complex ("Jenkins Purgatory").
- **Usage**: Still used in many large enterprises.

## 2. GitHub Actions
- **The Modern Standard**: Integrated directly into GitHub.
- **Pros**: No setup required (if using GitHub), easy YAML syntax, huge marketplace of pre-built "Actions".
- **Cons**: Vendor lock-in (hard to move off GitHub), limits on free tier minutes.
- **Usage**: Extremely popular for open source and new startups.

## 3. GitLab CI
- **The All-in-One**: GitLab offers built-in CI/CD that is extremely powerful.
- **Pros**: Great visualization of pipelines, integrated effectively with code, Auto-DevOps features.
- **Cons**: Best used if your code is already on GitLab.
- **Usage**: Common in DevOps-heavy organizations.

## 4. CircleCI / Travis CI
- **The SaaS Pioneers**: Dedicated CI/CD platforms.
- **Pros**: specialised solely on CI/CD, good UI.
- **Cons**: Separate account management, can get expensive.
- **Usage**: often used by teams who want a dedicated tool independent of their code host.

## Comparison Table

| Tool | Type | Difficulty | Best For |
| :--- | :--- | :--- | :--- |
| **Jenkins** | Self-Hosted | Hard | Custom, complex enterprise needs |
| **GitHub Actions** | SaaS | Easy | Fast setup, GitHub users |
| **GitLab CI** | SaaS/Self-Hosted | Medium | Integrated DevOps lifecycle |
| **CircleCI** | SaaS | Medium | Teams wanting speed and focus |
