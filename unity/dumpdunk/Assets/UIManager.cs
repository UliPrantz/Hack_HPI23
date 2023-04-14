using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class UIManager : Singleton<UIManager>
{
    [SerializeField] private TextMeshProUGUI scoreText;

    private void Start()
    {
        BallSpawner.Instance.OnPlayerScoreChanged += BallSpawner_OnPlayerScoreChanged;
    }

    private void BallSpawner_OnPlayerScoreChanged(int newScore)
    {
        scoreText.text = newScore.ToString();
    }
}
