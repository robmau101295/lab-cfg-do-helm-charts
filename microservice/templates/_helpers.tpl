{{/* Nombre de la app = nombre del release (= nombre de la Application de Argo CD). */}}
{{- define "microservice.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "microservice.labels" -}}
app.kubernetes.io/name: {{ include "microservice.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Values.container.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}

{{- define "microservice.selectorLabels" -}}
app.kubernetes.io/name: {{ include "microservice.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* Imagen completa: <registry>/<repository>:<tag> */}}
{{- define "microservice.image" -}}
{{- $repository := default (include "microservice.name" .) .Values.container.image.repository -}}
{{- printf "%s/%s:%s" .Values.container.image.registry $repository (required "container.image.tag es obligatorio (lo escribe el CD en <app>/<env>/app.yaml)" .Values.container.image.tag) -}}
{{- end -}}
