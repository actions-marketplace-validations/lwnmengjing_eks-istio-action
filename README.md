eks-istio-operator-action
=============
Interacts with kubernetes clusters on eks by `istio` commands.

## Usage

### EKS Example
```yml
name: Deploy

on:
  push:
    branches:
      - develop

env:
  DOCKER_IMAGE: docker_image
  DOCKER_TAG: latest
  K8S_NAMESPACE: dev_namespace
  K8S_DEPLOYMENT: dev_deployment
  AWS_REGION: ap-northeast-2
  EKS_CLUSTER_NAME: dev_cluster
  ISTIO_VERSION: 1.11.3

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Deploy
        uses: lwnmengjing/eks-istio-action@v0.0.2
        env:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_region: $AWS_REGION
          cluster_name: $EKS_CLUSTER_NAME
          istio_version: $ISTIO_VERSION
        with:
          args: |
            istioctl install --set profile=demo
