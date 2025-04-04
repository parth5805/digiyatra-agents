# DigiYatra ACA-Py Agents

This repository helps set up **three ACA-Py agents** for the DigiYatra demo, each with its own **askar wallet**.

## 🛠 Setup & Deployment

### 1️⃣ Deploy the Agents
Run the following command to start all three agents:
```sh
./deploy.sh
```

### 2️⃣ Stop the Agents
To stop all running agents:
```sh
./stop.sh
```

### 3️⃣ Restart the Agents
To restart the agents:
```sh
./restart.sh
```

### 4️⃣ Cleanup (Remove All Data)
To delete all stored data (including wallets & databases):
```sh
./cleanup.sh
```

Each agent runs in its own **Docker network** and uses a separate **askar wallet** for secure storage.
