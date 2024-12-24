using UnityEditor;
using System.IO;

public class BuildScript {
    public static void PerformBuild() {
        string[] scenes = { "Assets/Scenes/MainScene.unity" };
        string buildPath = "Builds/UrbanMechanicAdventure.exe";
        BuildPipeline.BuildPlayer(scenes, buildPath, BuildTarget.StandaloneWindows64, BuildOptions.None);
    }
}
