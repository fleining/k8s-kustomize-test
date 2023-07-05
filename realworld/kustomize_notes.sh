#!/usr/bin/env bash
exit

#
kubectl apply -k base/


# to see if new values are being applied
kustomize build overlays/dev/

$ oc diff -k overlays/dev/
diff -u -N /tmp/LIVE-042965687/autoscaling.v1.HorizontalPodAutoscaler.kustom.frontend-deployment-hpa /tmp/MERGED-347646122/autoscaling.v1.HorizontalPodAutoscaler.kustom.frontend-deployment-hpa
--- /tmp/LIVE-042965687/autoscaling.v1.HorizontalPodAutoscaler.kustom.frontend-deployment-hpa   2023-07-05 08:24:27.421553131 +0000
+++ /tmp/MERGED-347646122/autoscaling.v1.HorizontalPodAutoscaler.kustom.frontend-deployment-hpa 2023-07-05 08:24:27.422553108 +0000
@@ -43,7 +43,7 @@
   resourceVersion: "2806042"
   uid: f07e4b86-51d8-4ad4-9014-1ca5a86b0e27
 spec:
-  maxReplicas: 5
+  maxReplicas: 2
   minReplicas: 1
   scaleTargetRef:
     apiVersion: apps/v1


kustomize build overlays/dev
kubectl diff -k overlay/dev
oc diff -k overlays/dev

##############################################3

Kustomize Best Practices
- Keep your custom resources and their instances in separate packages, otherwise you will encounter race conditions and your creation will get stuck. For example, many people keep both the CertManager CRD and CertManager’s resources in the same package, which can cause problems. Most of the time, reapplying the YAML fixes the issue. But it's good practice to keep them separately.
- Try to keep the common values like namespace, common metadata in the base file.
- Organize your resources by kind, using the following naming convention: lowercase-hypenated.yaml (e.g., horizontal-pod-autoscaler.yaml). Place services in the service.yaml file.
- Follow standard directory structure, using bases/ for base files and patches/ or overlays/ for environment-specific files.
- While developing or before pushing to git, run kubectl kustomize cfg fmt file_name to format the file and set the indentation right.

crd/
  cert_crd.yaml
base_resources/
  cert-manager.yaml
common/
  namespace.yaml
  metadata.yaml
  service.yaml
patches/