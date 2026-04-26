# Linux Deep Dive & Internals

## 1. The Linux Kernel
The core of the OS. It manages CPU, Memory, and I/O.

### User Space vs Kernel Space
*   **Kernel Space**: Where the kernel executes constraints and manages devices. Direct hardware access.
*   **User Space**: Where user applications run. No direct hardware access.
*   **System Calls**: The interface between User Space and Kernel Space. When an app needs to read a file, it calls `read()`, which triggers a context switch to Kernel Space.

### Kernel Components
1.  **Process Scheduler**: Decides which process runs on the CPU and for how long.
    *   *CFS (Completely Fair Scheduler)*: Default scheduler.
2.  **Memory Manager**: Manages RAM. Handles Paging and Swapping.
3.  **VFS (Virtual File System)**: Abstraction layer. Allows logical access to different file systems (ext4, xfs, nfs) uniformly.

## 2. Advanced Process Management

### Load Average Explained
The average number of processes that are either in a runnable or occupiable state.
*   `uptime` output: `0.00, 0.01, 0.05` (1min, 5min, 15min average).
*   **Runnable**: Using CPU or waiting for CPU.
*   **Uninterruptible Sleep (D state)**: Waiting for I/O (Disk/Network). High load with low CPU usage usually means Disk I/O bottleneck.

### Process States
*   **R (Running)**: On CPU.
*   **S (Sleeping)**: Waiting for an event.
*   **D (Uninterruptible)**: Waiting for I/O. Impossible to kill until I/O completes.
*   **Z (Zombie)**: Terminated but parent hasn't collected exit code.
*   **T (Stopped)**: Suspended (SIGSTOP).

### Signals
*   **SIGINT (2)**: Interrupt (Ctrl+C). App can handle/ignore.
*   **SIGTERM (15)**: Terminate. "Please stop nicely." App can handle.
*   **SIGKILL (9)**: Kill. "Die immediately." Kernel removes process. App cannot handle.

## 3. Advanced Networking

### The OSI Model (Simplified for Linux)
1.  **Application**: HTTP, SSH.
2.  **Transport**: TCP/UDP. (Kernel handles connection, flow control).
3.  **Network**: IP, Routing. (Kernel routes packets).
4.  **Link**: Ethernet.

### Netfilter & IPTables
Linux's firewall framework.
*   **Tables**: Filter (allow/block), Nat (modify IPs), Mangle (modify packets).
*   **Chains**: INPUT (to me), OUTPUT (from me), FORWARD (passing through me).
*   *Modern replacement*: `nftables`.

### Namespaces (The basis of Containers)
Kernel feature to isolate system resources.
1.  **PID**: Process IDs (Container sees itself as PID 1).
2.  **NET**: Network interfaces, routes, ports (Container gets its own eth0).
3.  **MNT**: Mount points (Filesystem).
4.  **UTS**: Hostname.

## 4. Performance Tuning & Troubleshooting

### CPU Performance
*   **Context Switches**: High rate means CPU is spending time switching tasks rather than working.
*   **Interrupts**: Hardware signaling CPU. High interrupts on one core can cause bottleneck.

### Memory Tuning
*   **Swappiness**: (`/proc/sys/vm/swappiness`). Controls how aggressive Linux swaps to disk (0-100). Default 60. Set to 10 for servers to prefer RAM.
*   **OOM Killer**: Out Of Memory Killer. Sacrifices a process to save the kernel when RAM is exhausted.

### Disk I/O
*   **IOPS**: Input/Output Operations Per Second. Important for Databases.
*   **Throughput**: MB/s. Important for file streaming.
*   **Tools**: `iostat`, `iotop`.
