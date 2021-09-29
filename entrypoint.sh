#!/bin/sh -l

set -xe

#aws
sh -c "aws configure set region ${aws_region}"
sh -c "aws configure set aws_access_key_id ${aws_access_key_id}"
sh -c "aws configure set aws_secret_access_key ${aws_secret_access_key}"
sh -c "aws eks update-kubeconfig --region ${aws_region} --name ${cluster_name} --role-arn ${aws_role}"

#istio
sh -c "curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${istio_version} sh -"
sh -c "mv istio-${istio_version}/bin/* /usr/bin/"

sh -c "$*"