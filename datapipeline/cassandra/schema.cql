USE kafkapipeline;


CREATE TABLE weatherreport (
  forecastdate TIMESTAMP,
  location TEXT,
  description TEXT,
  temp FLOAT,
  feels_like FLOAT,
  temp_min FLOAT,
  temp_max FLOAT,
  pressure FLOAT,
  humidity FLOAT,
  wind FLOAT,
  sunrise BIGINT,
  sunset BIGINT,
  PRIMARY KEY (location, forecastdate)
);

CREATE TABLE twitterdata (
  tweet_date TIMESTAMP,
  location TEXT,
  tweet TEXT,
  classification TEXT,
  PRIMARY KEY (location, tweet_date)
);


CREATE TABLE iqairdata (
  city TEXT,
  state TEXT,
  country TEXT,
  latitude DOUBLE,
  longitude DOUBLE,
  current_ts TIMESTAMP,
  current_pollution_aqius INT,
  current_pollution_mainus TEXT,
  current_pollution_aqicn INT,
  current_pollution_maincn TEXT,
  current_weather_tp INT,
  current_weather_pr INT,
  current_weather_hu INT,
  current_weather_ws DOUBLE,
  current_weather_wd INT,
  current_weather_ic TEXT,
  PRIMARY KEY (city, current_ts)
);