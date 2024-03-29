# Build a weather data pipeline

## Overview
- The data pipeline will get weather information from OpenWeatherMap and air quality data from Iqair, then store it in Cassandra.
- The origin structure: https://github.com/salcaino/sfucmpt733
## APIs
The project uses the following APIs:

- OpenWeather API:  Used link: https://openweathermap.org/api to get weather data

- IQAir API:  Used to collect air quality information from https://www.iqair.com/us/ for integration into data processing workflow


## Running the Pipeline

1. Create network for Kafka and Cassandra  and set up Kafka containers 
```bash
docker network create kafka-network
docker network create cassandra-network
```

2. Set up Kafka and Cassandra containers
```bash
docker-compose -f kafka/docker-compose.yml up -d
docker-compose -f cassandra/docker-compose.yml up -d  
```

3. Access Kafka

- Open http://localhost:9000 (username: admin; password: 888888 )

4. Open WSL or Ubuntu
```bash
curl -X GET http://localhost:8083/connectors
```
Output is `["twittersink","weathersink","iqairsink"]`

5. Access to kafka-connect and run 
```bash
./start-and-wait.sh
```
6. Create containers to get data
```bash
docker-compose -f weather-producer/docker-compose.yml up -d
docker-compose -f iqair-producer/docker-compose.yml up -d
docker-compose -f consumers/docker-compose.yml up -d
```
7. Check all open databases in Cassandra
```bash
docker exec -it cassandra bash
cqlsh
desc keyspaces;
use kafkapipeline;
desc tables;
select * from weatherreport;
select * from iqairdata;
exit
exit
```

8. Create container for analysis and visualization
```bash
docker-compose -f data-vis/docker-compose.yml up -d
```
Open http://localhost:8888 

