using UnityEngine;

public class RepairSystem : MonoBehaviour {
    public GameObject[] parts;

    private void OnMouseDown() {
        Debug.Log("Repairing " + gameObject.name);
    }
}
