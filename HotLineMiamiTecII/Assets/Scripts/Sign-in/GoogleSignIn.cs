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
        // Construir la URL de inicio de sesión con Google
        string scope = "https://www.googleapis.com/auth/userinfo.email";
        string redirectUri = "http://hotlinemiamitecii.me/CloudComputing/"; // Redirige aquí después del inicio de sesión
        string loginUrlWithParams = $"{loginUrl}?client_id={clientId}&redirect_uri={redirectUri}&response_type=token&scope={scope}";

        // Abrir la URL de inicio de sesión en un navegador externo
        Application.OpenURL(loginUrlWithParams);
    }

    // Este método debe ser llamado cuando el usuario ha iniciado sesión con Google
    public void OnSignInSuccess(string accessToken)
    {
        this.accessToken = accessToken;

        // Una vez que se obtiene el token de acceso, puedes utilizarlo para hacer solicitudes a la API de Google para obtener información del usuario, etc.
        StartCoroutine(GetUserInfo());
    }

    private IEnumerator GetUserInfo()
    {
        // Crear una solicitud GET para obtener información del usuario utilizando el token de acceso
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
                Debug.Log("Información del usuario: " + userInfoJson);
            }
            else
            {
                Debug.LogError("Respuesta inesperada: " + request.responseCode);
            }
        }

        /*if (request.result == UnityWebRequest.Result.Success)
        {
            string userInfoJson = request.downloadHandler.text;
            Debug.Log("Información del usuario: " + userInfoJson);
        }
        else
        {
            Debug.LogError("Error al obtener la información del usuario: " + request.error);
        }*/
    }
}