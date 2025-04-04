#!/bin/bash

# Function to create network if not exists
create_network() {
  network_name=$1
  if ! docker network ls | grep -q "$network_name"; then
    echo "Creating network: $network_name"
    docker network create "$network_name"
  else
    echo "Network $network_name already exists."
  fi
}

# Function to start services
start_services() {
  wallet_file=$1
  agent_file=$2

  echo "Starting services with $wallet_file and $agent_file..."
  docker compose -f "$wallet_file" -f "$agent_file" up -d
}

# Step 1
create_network "agent1-net"
start_services "docker-compose-wallet1.yml" "docker-compose-agent1.yml"

# Step 2
create_network "agent2-net"
start_services "docker-compose-wallet2.yml" "docker-compose-agent2.yml"

# Step 3
create_network "agent3-net"
start_services "docker-compose-wallet3.yml" "docker-compose-agent3.yml"

echo "✅ All services are up and running!"