# Urban Mechanic Adventure

Urban Mechanic Adventure is an immersive game that blends city driving, car repair, and business management. Players can navigate through an open-world city, complete driving missions, manage a car repair shop, and expand their garage.

## Features

### 1. City Driving
- **Open-World Environment**: Explore a bustling city with realistic traffic.
- **Diverse Missions**: Participate in passenger transport, deliveries, and races.
- **Variety of Vehicles**: Drive cars, trucks, and motorcycles.

### 2. Car Repair Simulation
- **Interactive Garage**: Diagnose and repair vehicles with interactive mini-games.
- **Customization**: Upgrade and customize vehicles with new parts and paint jobs.
- **Tool Upgrades**: Purchase better tools to perform complex repairs.

### 3. Business Management
- **Garage Expansion**: Expand the business by hiring mechanics and upgrading facilities.
- **Employee Management**: Train and manage staff.
- **Inventory Control**: Manage parts and tools.
- **Marketing**: Advertise services to attract more customers.

---

## Development

### Tech Stack
- **Game Engine**: Unity 2022.3.10f1
- **Programming Language**: C#
- **AI Integration**: Unity ML-Agents for machine learning tasks
- **Platforms**: Windows, with plans for Android and iOS

### Project Setup Automation
The project setup, AI integration, and build processes are automated with a bash script.

#### Automation Script Highlights
- **Unity Project Creation**: Automatically sets up directories and assets.
- **AI Integration**: Adds ML-Agents for AI development.
- **GitHub Deployment**: Automates GitHub repository setup and pushes code.

```bash
./setup.sh  # Run this to set up and build the project
```

---

## Installation

1. Clone the repository:
```bash
git clone git@github.com:allyelvis/unity-app.git
```
2. Run the setup script:
```bash
cd unity-app
bash setup.sh
```
3. Open the project in Unity Hub and start development.

---

## Building the Game
To build the game for Windows:
```bash
/Applications/Unity/Hub/Editor/2022.3.10f1/Unity.app/Contents/MacOS/Unity -batchmode -buildTarget StandaloneWindows64 -projectPath $HOME/UnityProjects/UrbanMechanicAdventure -executeMethod BuildScript.PerformBuild -quit
```

---

## Contributing
Feel free to fork the repository and submit pull requests. We welcome contributions for new missions, vehicles, and AI enhancements.

---

## License
This project is licensed under the MIT License. See the LICENSE file for details.

