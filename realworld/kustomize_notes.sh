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


