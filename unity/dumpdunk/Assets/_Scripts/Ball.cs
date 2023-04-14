using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ball : MonoBehaviour
{
    public event Action OnBallSelfDestroy;
    
    private Vector2 startPos, endPos, direction;
    private float touchTimeStart, touchTimeFinished, timeInterval;

    [SerializeField] private float throwForceInXandY = 1f;
    [SerializeField] private float throwForceInZ = 50f;
    public Category trashCategory;

    private Rigidbody rb;
    private bool isBallThrown;
    
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        if (isBallThrown) return;
        
        OnTouchDown();
        OnTouchUp();
    }

    private void OnTouchUp()
    {
        if (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Ended)
        {
            touchTimeFinished = Time.time;
            timeInterval = touchTimeFinished - touchTimeStart;
            endPos = Input.GetTouch(0).position;
            direction = endPos - startPos;
            rb.isKinematic = false;
            rb.AddForce(direction.x * throwForceInXandY, direction.y * throwForceInXandY,
                throwForceInZ / Mathf.Sqrt(timeInterval));
            rb.AddTorque(direction.y, 0, direction.x);

            isBallThrown = true;
            Destroy(gameObject, 3f);
        }
    }

    private void OnTouchDown()
    {
        if (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began)
        {
            touchTimeStart = Time.time;
            startPos = Input.GetTouch(0).position;
        }
    }

    private void OnDisable()
    {
        OnBallSelfDestroy?.Invoke();
    }
}
