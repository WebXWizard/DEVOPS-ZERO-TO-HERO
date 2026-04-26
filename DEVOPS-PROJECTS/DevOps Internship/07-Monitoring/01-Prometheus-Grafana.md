# Monitoring with Prometheus & Grafana

## Why Monitor?
To ensure high availability, performance, and to quicky identify/resolve issues (MTTR - Mean Time To Recovery).

## Prometheus (The Collector)
An open-source systems monitoring and alerting toolkit.
-   **Pull Model**: Prometheus periodically "scrapes" (pulls) metrics from HTTP endpoints (targets).
-   **Time Series Database (TSDB)**: Stores data as streams of timestamped values.
-   **PromQL**: Powerful query language.

### Architecture
1.  **Prometheus Server**: Scrapes and stores data.
2.  **Exporters**: Libraries that expose metrics from third-party systems (e.g., Node Exporter for Linux metrics, MySQL Exporter).
3.  **Alertmanager**: Handles alerts (grouping, routing to Email/Slack).

### Configuration (`prometheus.yml`)
```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']
```

## Grafana (The Visualizer)
An open-source platform for analytics and interactive visualization.
-   **Data Sources**: Connects to Prometheus, InfluxDB, CloudWatch, etc.
-   **Dashboards**: Displays data in graphs, gauges, heatmaps.

## Common Metrics (The Four Golden Signals)
1.  **Latency**: Time it takes to serve a request.
2.  **Traffic**: Demand on your system (req/sec).
3.  **Errors**: Rate of requests that fail.
4.  **Saturation**: How "full" your service is (CPU/Memory usage).

## Interview Questions
1.  **Push vs Pull Monitoring?**
    *Prometheus pulls (targets don't need to know about server). Push (like Datadog agents) sends data to server. Pull is generally preferred for microservices.*
2.  **What is an Exporter?**
    *A binary that runs alongside an application, fetches statistics from it, and exposes them in Prometheus format on an HTTP endpoint.*
