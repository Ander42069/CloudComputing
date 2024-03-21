using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.Services.Authentication;
using UnityEngine;
using UnityEngine.UI;

public class UILogin : MonoBehaviour
{

    [SerializeField] private Button loginButton;
    [SerializeField] private TMP_Text userIdText;
    [SerializeField] private Transform loginPanel, userPanel;
    [SerializeField] private LoginController LoginController;
    private void OnEnable()
    {
        loginButton.onClick.AddListener(LoginButtonPressed);
        LoginController.OnSignedIn += LoginContreller_OnSignedIn;

    }
    private void LoginContreller_OnSignedIn(PlayerInfo playerInfo,string playerName)
    {
        loginPanel.gameObject.SetActive(true);
        userPanel.gameObject.SetActive(false);
        userIdText.text = $"{playerInfo.Id}";
        Debug.Log(playerName);
    }
    private async void LoginButtonPressed()
    {
        await LoginController.InitSignIn();
    }
    private void OnDisable()
    {
         loginButton.onClick.RemoveListener(LoginButtonPressed);
        LoginController.OnSignedIn -= LoginContreller_OnSignedIn;
    }
}
