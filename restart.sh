# #!/bin/bash

# # Function to stop, remove services, and rebuild images
# restart_services() {
#   wallet_file=$1
#   agent_file=$2

#   echo "Rebuilding images and restarting $wallet_file and $agent_file..."

#   # Stop and remove containers and volumes (but keep images)
#   docker compose -f "$wallet_file" -f "$agent_file" down -v

#   # Rebuild the images
#   docker compose -f "$wallet_file" -f "$agent_file" build --no-cache
  
#   # Restart the containers
#   docker compose -f "$wallet_file" -f "$agent_file" up -d
# }

# # Step 1
# restart_services "docker-compose-wallet1.yml" "docker-compose-agent1.yml"

# # Step 2
# restart_services "docker-compose-wallet2.yml" "docker-compose-agent2.yml"

# # Step 3
# restart_services "docker-compose-wallet3.yml" "docker-compose-agent3.yml"

# echo "✅ All services restarted with rebuilt images!"

#!/bin/bash

# Function to stop, remove services, and rebuild images
restart_services() {
  wallet_file=$1
  agent_file=$2

  echo "Rebuilding images and restarting $wallet_file and $agent_file..."

  # Stop and remove containers (without removing volumes)
  docker compose -f "$wallet_file" -f "$agent_file" down

  # Rebuild the images
  docker compose -f "$wallet_file" -f "$agent_file" build --no-cache
  
  # Restart the containers
  docker compose -f "$wallet_file" -f "$agent_file" up -d
}

# Step 1
restart_services "docker-compose-wallet1.yml" "docker-compose-agent1.yml"

# Step 2
restart_services "docker-compose-wallet2.yml" "docker-compose-agent2.yml"

# Step 3
restart_services "docker-compose-wallet3.yml" "docker-compose-agent3.yml"

echo "✅ All services restarted with rebuilt images!"