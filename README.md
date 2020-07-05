# reddit-stock-sentiment-tracker

## Usage (in progress)

1. Create `.env` file inside docker_airflow. This is where you will store secret keys.

TODO: Add template `.env` file

## Docker-compose

```bash
# Build both containers, and compose / run in one command
docker-compose up --build

# First two commands build the containers. Once built, just run the last command to compose / run to save time.
# in airflow_docker/
docker build --rm -f Dockerfile -t airflow_image:latest .
# in superset_docker/
docker build --rm -f airflow_superset/Dockerfile -t superset_image:latest .
docker-compose up
```
