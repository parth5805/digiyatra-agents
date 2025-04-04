#!/bin/bash

# Function to stop and remove services
stop_services() {
  wallet_file=$1
  agent_file=$2

  echo "Stopping and removing $wallet_file and $agent_file..."
  docker compose -f "$wallet_file" -f "$agent_file" down -v
}

# Step 1
stop_services "docker-compose-wallet1.yml" "docker-compose-agent1.yml"

# Step 2
stop_services "docker-compose-wallet2.yml" "docker-compose-agent2.yml"

# Step 3
stop_services "docker-compose-wallet3.yml" "docker-compose-agent3.yml"

# Remove all unused networks
echo "Removing unused networks..."
docker network prune -f

# Remove specific networks
echo "Removing manually created networks..."
docker network rm agent1-net agent2-net agent3-net || true

# Remove all unused images, containers, and volumes
echo "Cleaning up Docker system..."
docker system prune -a -f --volumes

echo "✅ All containers stopped, volumes removed, images deleted, and networks cleaned!"