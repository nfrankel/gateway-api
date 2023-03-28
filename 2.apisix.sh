#!/bin/sh
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v0.5.0/standard-install.yaml

helm install apisix apisix/apisix \
  --namespace apigtw \
  --create-namespace \
  --set ingress-controller.image.tag="1.6.1" \
  --set ingress-controller.config.apisix.serviceNamespace=apigtw \
  --set gateway.type=NodePort \
  --set gateway.http.nodePort=30800 \
  --set ingress-controller.enabled=true \
  --set ingress-controller.config.kubernetes.enableGatewayAPI=true \
  --set ingressPublishService="apigtw/apisix"