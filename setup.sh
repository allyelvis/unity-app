#!/bin/bash

# Urban Mechanic Adventure Game Setup Script
# Automates Unity project setup, build, AI integration, and publishing to GitHub

# Configuration
PROJECT_NAME="UrbanMechanicAdventure"
UNITY_PATH="/Applications/Unity/Hub/Editor/2022.3.10f1/Unity.app/Contents/MacOS/Unity"
PROJECT_DIR="$HOME/UnityProjects/$PROJECT_NAME"
GITHUB_REPO="git@github.com:allyelvis/unity-app.git"
BUILD_DIR="$PROJECT_DIR/Builds"
BUILD_TARGET="StandaloneWindows64"
BUILD_SCRIPT="Assets/Editor/BuildScript.cs"

# Create Unity Project
if [ ! -d "$PROJECT_DIR" ]; then
  echo "Creating Unity Project: $PROJECT_NAME..."
  $UNITY_PATH -createProject "$PROJECT_DIR"
else
  echo "Project already exists. Skipping creation."
fi

# Navigate to Project Directory
cd "$PROJECT_DIR"

# Set Up Directories
echo "Setting up directories..."
mkdir -p Assets/Scripts/{Driving,Repair,Management,Missions,AI}
mkdir -p Assets/Scenes
mkdir -p Assets/Prefabs
mkdir -p Assets/Textures
mkdir -p Assets/UI
mkdir -p Assets/Audio
mkdir -p Assets/Models/Vehicles
mkdir -p Assets/Models/City
mkdir -p Packages
mkdir -p Assets/Editor

# Download and Import Asset Packages (Example URLs, Replace with Real URLs)
ASSET_URLS=(
  "https://assetstore.unity.com/path/to/vehicle-physics-package"
  "https://assetstore.unity.com/path/to/city-environment-package"
  "https://assetstore.unity.com/path/to/ui-elements-package"
  "https://assetstore.unity.com/path/to/ai-tools-package"
)

for url in "${ASSET_URLS[@]}"; do
  echo "Downloading asset from $url..."
  wget $url -P "$PROJECT_DIR/Packages"
done

# Install Unity Packages (Example)
unity_packages=(
  "com.unity.cinemachine"
  "com.unity.ads"
  "com.unity.textmeshpro"
  "com.unity.analytics"
  "com.unity.ml-agents"
)

for pkg in "${unity_packages[@]}"; do
  echo "Installing package: $pkg..."
  $UNITY_PATH -batchmode -executeMethod UnityEditor.PackageManager.Client.Add -projectPath "$PROJECT_DIR" -logFile -quit "$pkg"
done

# Create Basic Scene
cat << EOF > Assets/Scenes/MainScene.unity
// Placeholder for Main Scene
EOF

# Generate Basic C# Scripts
cat << 'EOF' > Assets/Scripts/Driving/CarController.cs
using UnityEngine;

public class CarController : MonoBehaviour {
    public WheelCollider frontLeft, frontRight, rearLeft, rearRight;
    public float maxTorque = 500f;
    public float steeringAngle = 30f;

    private void Update() {
        float steering = Input.GetAxis("Horizontal") * steeringAngle;
        frontLeft.steerAngle = steering;
        frontRight.steerAngle = steering;

        float throttle = Input.GetAxis("Vertical") * maxTorque;
        rearLeft.motorTorque = throttle;
        rearRight.motorTorque = throttle;
    }
}
EOF

cat << 'EOF' > Assets/Scripts/Repair/RepairSystem.cs
using UnityEngine;

public class RepairSystem : MonoBehaviour {
    public GameObject[] parts;

    private void OnMouseDown() {
        Debug.Log("Repairing " + gameObject.name);
    }
}
EOF

cat << 'EOF' > Assets/Scripts/AI/AIDebugger.cs
using UnityEngine;
using Unity.MLAgents;

public class AIDebugger : MonoBehaviour {
    public void RunDiagnostics() {
        Debug.Log("Running AI-driven diagnostics on game environment...");
        // Placeholder for ML debugging logic
    }
}
EOF

# Create Unity Build Script
cat << 'EOF' > $BUILD_SCRIPT
using UnityEditor;
using System.IO;

public class BuildScript {
    public static void PerformBuild() {
        string[] scenes = { "Assets/Scenes/MainScene.unity" };
        string buildPath = "Builds/UrbanMechanicAdventure.exe";
        BuildPipeline.BuildPlayer(scenes, buildPath, BuildTarget.StandaloneWindows64, BuildOptions.None);
    }
}
EOF

# Build Project
$UNITY_PATH -batchmode -buildTarget $BUILD_TARGET -projectPath "$PROJECT_DIR" -quit -nographics -executeMethod BuildScript.PerformBuild

# Publish to GitHub
if [ ! -d "$PROJECT_DIR/.git" ]; then
  echo "Initializing Git repository..."
  git init
  git remote add origin "$GITHUB_REPO"
fi

# Pull latest changes to prevent conflicts
git pull origin main

git add .
git commit -m "Initial project setup, AI integration, build, and Unity build script."
git push -u origin main

# Final Message
echo "Urban Mechanic Adventure project setup, AI integration, build, and GitHub publish complete!"
