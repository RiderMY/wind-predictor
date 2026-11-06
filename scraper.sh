#!/bin/bash

set -o pipefail

if [[ $# -ne 1 ]]; then
	echo "Usage: ./scraper.sh [from_date (YYYY-MM-DD)]"
	exit 1
fi

curl -f -s "https://archive-api.open-meteo.com/v1/archive?latitude=40.4259&longitude=-86.9081&start_date=$1&end_date=2026-11-04&hourly=wind_direction_10m,wind_speed_10m,wind_gusts_10m&timezone=America%2FNew_York&wind_speed_unit=kn" | jq -r '["time", "wind_direction", "wind_speed", "wind_gusts"], ([.hourly.time, .hourly.wind_direction_10m, .hourly.wind_speed_10m, .hourly.wind_gusts_10m] | transpose | .[]) | @csv' > wind_data.csv

if [[ $? -eq 0 ]]; then
	echo "Wind data successfully retieved."
else
	echo "Wind data retieval failed!"
	exit 1
fi
