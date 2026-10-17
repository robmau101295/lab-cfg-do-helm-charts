# lab-cfg-do-helm-charts

Helm chart genérico `microservice` del laboratorio.

Versionado por **tags Git** con el formato `microservice/vX.Y.Z` (el mismo formato de tags de la empresa).
Argo CD lee el chart directamente desde este repo en ese tag.
La empresa además lo empaqueta y lo publica en ECR como OCI; en el laboratorio nos saltamos ese paso.

| Versión | Cambios |
|---|---|
| `microservice/v0.1.0` | Lab v1: Deployment, Service ClusterIP, ConfigMap, ExternalSecret |
| `microservice/v0.2.0` | Lab v2: Service `LoadBalancer` opcional (+ IPs permitidas), `readinessPath`, `preStop`, PodDisruptionBudget, reparto de réplicas entre nodos |

Para publicar una versión nueva:
1. Cambia `microservice/Chart.yaml` → `version`.
2. Commit + push a `main`.
3. `git tag microservice/vX.Y.Z && git push origin microservice/vX.Y.Z`
4. Sube `chart_version` en `lab-iac-do-argo-cd/locals.prd_demo.tf`.
