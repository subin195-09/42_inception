docker rmi $(docker images -q)
docker volume prune -f
