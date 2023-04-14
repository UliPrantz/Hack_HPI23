using System;
using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;

public class BallSpawner : Singleton<BallSpawner>
{
    public event Action<int> OnPlayerScoreChanged;
    
    [SerializeField] private List<GameObject> ballPrefabs;
    [SerializeField] private Transform ballSpawnTransform;

    private Ball activeBall;
    private int playerScore;

    public void OnSpawnBallButtonPress()
    {
        SpawnBall();
    }

    public void ScorePoint(int points)
    {
        playerScore += points;
        OnPlayerScoreChanged?.Invoke(playerScore);
    }

    private void SpawnBall()
    {
        if (activeBall != null) return;

        GameObject ballPrefab = ballPrefabs[Random.Range(0, ballPrefabs.Count)];
        GameObject ballGameObject = Instantiate(ballPrefab, ballSpawnTransform.position, Quaternion.identity);
        activeBall = ballGameObject.GetComponent<Ball>();
        activeBall.OnBallSelfDestroy += BallSwiper_OnBallSelfDestroy;
    }

    private void BallSwiper_OnBallSelfDestroy()
    {
        activeBall.OnBallSelfDestroy -= BallSwiper_OnBallSelfDestroy;
        activeBall = null;
    }
}
