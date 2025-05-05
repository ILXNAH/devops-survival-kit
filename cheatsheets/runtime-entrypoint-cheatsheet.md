# 📝 Runtime Docker Image Cheat Sheet — ENTRYPOINT vs CMD

## Common Languages / Runtimes

| Language                    | Image example                               | ENTRYPOINT preset? | CMD example                                 |
| --------------------------- | ------------------------------------------- | ------------------ | ------------------------------------------- |
| **Node.js (official)**      | `node:20`, `node:20-alpine`, `node:20-slim` | ❌ No               | `["node", "app.js"]`                        |
| **Node.js (distroless)**    | `gcr.io/distroless/nodejs:20`               | ✅ Yes (`node`)     | `["app.js"]`                                |
| **Python (official)**       | `python:3.12`, `python:3.12-slim`           | ❌ No               | `["python", "script.py"]`                   |
| **Python (distroless)**     | `gcr.io/distroless/python3`                 | ✅ Yes (`python3`)  | `["script.py"]`                             |
| **Java (official OpenJDK)** | `openjdk:21-slim`                           | ❌ No               | `["java", "-jar", "app.jar"]`               |
| **Java (distroless)**       | `gcr.io/distroless/java:21`                 | ✅ Yes (`java`)     | `["-jar", "app.jar"]`                       |
| **Go**                      | `golang:1.22-alpine`                        | ❌ No               | Usually a compiled binary → `["/mybinary"]` |
| **Go (distroless/static)**  | `gcr.io/distroless/static`                  | ✅ (binary only)    | `["/mybinary"]`                             |
| **.NET (official)**         | `mcr.microsoft.com/dotnet/aspnet:8.0`       | ❌ No               | `["dotnet", "myapp.dll"]`                   |
| **Rust**                    | (No official runtime)                       | N/A                | Compiled binary → `["/mybinary"]`           |

## 🔎 Quick Rule of Thumb

✅ **Distroless images** → ENTRYPOINT is preset (runtime already included).

❌ **Official language images** → No ENTRYPOINT, you must specify the runtime in CMD.

---

