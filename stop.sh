#!/bin/bash

# Function to stop the containers
stop_services() {
  wallet_file=$1
  agent_file=$2

  echo "Stopping containers for $wallet_file and $agent_file..."

  # Stop the containers without removing volumes, networks, or images
  docker compose -f "$wallet_file" -f "$agent_file" stop

  echo "✅ Containers stopped for $wallet_file and $agent_file!"
}

# Step 1
stop_services "docker-compose-wallet1.yml" "docker-compose-agent1.yml"

# Step 2
stop_services "docker-compose-wallet2.yml" "docker-compose-agent2.yml"

# Step 3
stop_services "docker-compose-wallet3.yml" "docker-compose-agent3.yml"

echo "✅ All containers stopped!"