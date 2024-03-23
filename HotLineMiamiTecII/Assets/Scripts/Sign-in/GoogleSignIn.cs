using System.Collections;
using UnityEngine;
using UnityEngine.Networking;
using System.Text;
using System.Collections.Generic;

public class GoogleSignIn : MonoBehaviour
{
    private string clientId = "998729360833-6mfr11pab57ncerdf4r4eet3513a693q.apps.googleusercontent.com";
    private string loginUrl = "https://accounts.google.com/o/oauth2/auth";
    private string userInfoUrl = "https://www.googleapis.com/oauth2/v1/userinfo";
    private string accessToken;

    public void SignIn()
    {
        // Construir la URL de inicio de sesi�n con Google
        string scope = "https://www.googleapis.com/auth/userinfo.email";
        string redirectUri = "http://hotlinemiamitecii.me/CloudComputing/"; // Redirige aqu� despu�s del inicio de sesi�n
        string loginUrlWithParams = $"{loginUrl}?client_id={clientId}&redirect_uri={redirectUri}&response_type=token&scope={scope}";

        // Abrir la URL de inicio de sesi�n en un navegador externo
        Application.OpenURL(loginUrlWithParams);
    }

    // Este m�todo debe ser llamado cuando el usuario ha iniciado sesi�n con Google
    public void OnSignInSuccess(string accessToken)
    {
        this.accessToken = accessToken;

        // Una vez que se obtiene el token de acceso, puedes utilizarlo para hacer solicitudes a la API de Google para obtener informaci�n del usuario, etc.
        StartCoroutine(GetUserInfo());
    }

    private IEnumerator GetUserInfo()
    {
        // Crear una solicitud GET para obtener informaci�n del usuario utilizando el token de acceso
        UnityWebRequest request = UnityWebRequest.Get(userInfoUrl);
        request.SetRequestHeader("Authorization", $"Bearer {accessToken}");

        // Enviar la solicitud y esperar la respuesta
        yield return request.SendWebRequest();

        // Manejar la respuesta
        if (request.result == UnityWebRequest.Result.Success)
        {
            if (request.responseCode == 200)
            {
                string userInfoJson = request.downloadHandler.text;
                userInfoJson = userInfoJson.Replace("\"", "'");
                Debug.Log("Informaci�n del usuario: " + userInfoJson);
            }
            else
            {
                Debug.LogError("Respuesta inesperada: " + request.responseCode);
            }
        }

        /*if (request.result == UnityWebRequest.Result.Success)
        {
            string userInfoJson = request.downloadHandler.text;
            Debug.Log("Informaci�n del usuario: " + userInfoJson);
        }
        else
        {
            Debug.LogError("Error al obtener la informaci�n del usuario: " + request.error);
        }*/
    }
}