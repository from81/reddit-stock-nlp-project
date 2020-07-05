# in airflow_docker/
cd airflow_docker
docker build --rm -f Dockerfile -t airflow_image:latest .

# in superset_docker/
cd ../superset_docker
docker build --rm -f airflow_superset/Dockerfile -t superset_image:latest .

cd ../
docker-compose up
