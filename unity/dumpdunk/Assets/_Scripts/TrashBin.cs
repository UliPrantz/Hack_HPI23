using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrashBin : MonoBehaviour
{
    [SerializeField] private Category binCategory;
    
    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent(out Ball ball))
        {
            //OnBallThrownInTrashBin?.Invoke();
            if (binCategory == Category.Black)
            {
                BallSpawner.Instance.ScorePoint(2);
            }
            else if (ball.trashCategory == binCategory)
            {
                BallSpawner.Instance.ScorePoint(3);
            }
            else
            {
                BallSpawner.Instance.ScorePoint(1);
            }
            Destroy(ball.gameObject);
        }
    }
}

public enum Category
{
    Blue,
    Yellow,
    Brown,
    Black
}
