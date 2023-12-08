

# Build the Docker image
docker build -t laravel-web-app .

# Run the Docker container

container_id=$(docker run --rm -d -p 80:80 --hostname testing.com laravel-web-app)
container_name=$(docker inspect --format='{{.Name}}' ${container_id})
echo "Container name: $container_name"

# Loop for 30 seconds, checking container status every second
start_time=$(date +%s)
max_wait_time=30
app_status="UNKNOWN"

while [[ "$(($SECONDS - $start_time))" -lt "$max_wait_time" ]]; do
  container_status=$(docker container logs $container_name | grep "code=OK")
  if [[ ! -z "$container_status" ]]; then
    app_status="OK"
    break
  fi
  sleep 1
  random_number=$(( $RANDOM % 5 + 1 ))
  if [[ $random_number == 1 ]]; then
    curl http://localhost\?code=OK
  else
    echo "⏲️ not checking this time"
  fi
done

# Stop and remove container based on app status
if [[ "$app_status" == "OK" ]]; then
  echo "✅ Container is healthy!"
else
  echo "❌ Container health check failed!"
fi

docker container stop $container_name

docker image rm laravel-web-app

# Print final message
if [[ "$app_status" == "OK" ]]; then
  echo "✅ Container $container_name build, test, and image removal successful!"
else
  echo "❌ Container failed to start within allotted time!"
fi