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
