using UnityEditor;
using System.IO;

public class BuildScript {
    public static void PerformBuild() {
        string[] scenes = { "Assets/Scenes/MainScene.unity" };
        BuildPipeline.BuildPlayer(scenes, "Builds/Windows/UrbanMechanicAdventure.exe", BuildTarget.StandaloneWindows64, BuildOptions.None);
        BuildPipeline.BuildPlayer(scenes, "Builds/Android/UrbanMechanicAdventure.apk", BuildTarget.Android, BuildOptions.None);
        BuildPipeline.BuildPlayer(scenes, "Builds/iOS/UrbanMechanicAdventure", BuildTarget.iOS, BuildOptions.None);
        BuildPipeline.BuildPlayer(scenes, "Builds/MacOS/UrbanMechanicAdventure.app", BuildTarget.StandaloneOSX, BuildOptions.None);
        BuildPipeline.BuildPlayer(scenes, "Builds/tvOS/UrbanMechanicAdventure", BuildTarget.tvOS, BuildOptions.None);
        BuildPipeline.BuildPlayer(scenes, "Builds/ChromeOS/UrbanMechanicAdventure.apk", BuildTarget.Android, BuildOptions.None);
    }
}
