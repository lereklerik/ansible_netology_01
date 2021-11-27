#!/bin/bash

declare -a imageName_array=("pycontribs/ubuntu" "pycontribs/centos" "pycontribs/fedora")

for i in ${imageName_array[@]}
do
  declare container_name=$(echo $i | sed 's|.*/||')
  echo "image: $i"
  echo "container: $container_name"
  if [ $container_name == "centos" ]; then
    docker pull $i:7
    docker run --name $container_name -dti $i:7
  else
    docker pull $i
    docker run --name $container_name -dti $i
  fi
  docker exec -dti $container_name sleep 500000000
done

ansible-playbook site.yml -i inventory/test2.yml --ask-vault-pass

for i in ${imageName_array[@]}
do
  echo "container for image $i stopping...."
  if [ $i == "pycontribs/centos" ]; then
    docker ps -q --filter ancestor=$i:7 | xargs docker stop
  else
    docker ps -q --filter ancestor=$i | xargs docker stop
  fi
  echo "container stopped"
done