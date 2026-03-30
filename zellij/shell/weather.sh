#!/bin/sh

# Get current location (latitude and longitude)
loc=$(curl -s ipinfo.io | jq -r '.loc')
lat=$(echo "$loc" | cut -d',' -f1)
long=$(echo "$loc" | cut -d',' -f2)

# Fetch current weather in Celsius
weather=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current=temperature,weathercode&temperature_unit=celsius")

# Extract temperature and weather code
tem=$(echo "$weather" | jq '.current.temperature')
wea=$(echo "$weather" | jq '.current.weathercode')

# Define weather code groups
clear="0 1"
cloudy="2 3"
fog="45 48"
drizzle="51 53 55 56 57"
rain="61 63 65 66 67"
snow="71 73 75 77 85 86"
showers="80 81 82"
thunderstorm="95 96 99"

# Match weather code to emoji
match() { echo "$1" | grep -qw "$wea"; }

if match "$clear"; then
  curwea=""
elif match "$cloudy"; then
  curwea=""
elif match "$fog"; then
  curwea=""
elif match "$drizzle"; then
  curwea=""
elif match "$rain"; then
  curwea=""
elif match "$snow"; then
  curwea="󰼶"
elif match "$showers"; then
  curwea=""
elif match "$thunderstorm"; then
  curwea=""
else
  curwea="?"
fi

# Output: icon and temperature (Celsius)
echo "$curwea ${tem}C"
