# Test dockerfile

Build:
    
    docker build -t django_docker . --build-arg INFRA_DOCKER_PORT=8000
    
Run:

    docker run -p 8000:8000 django_docker