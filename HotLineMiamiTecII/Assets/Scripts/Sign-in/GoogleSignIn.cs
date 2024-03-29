using System.Collections;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

public class GoogleSignIn : MonoBehaviour
{
    public string serverUrl = "http://localhost:3000";
    private string authorizationUrl;

    public void SignInWithGoogle()
    {
        StartCoroutine(GetGoogleAuthorizationUrl());
    }

    IEnumerator GetGoogleAuthorizationUrl()
    {
        string url = $"{serverUrl}/googleUsers/login";

        using (UnityWebRequest request = UnityWebRequest.Get(url))
        {
            yield return request.SendWebRequest();

            if (request.result == UnityWebRequest.Result.Success)
            {
                authorizationUrl = request.downloadHandler.text;

                // Redirigir al usuario al sitio web de inicio de sesión de Google
                Application.OpenURL(authorizationUrl);

                Debug.Log("URL de autorización de Google: " + authorizationUrl);

                // Esperar un momento para que el usuario inicie sesión y sea redirigido de vuelta al juego
                yield return new WaitForSeconds(5f);

                // Obtener la URL actual (la que contiene el código de autorización)
                string currentUrl = Application.absoluteURL;

                GetAuthorizationCodeFromUrl(currentUrl);

                Debug.Log("URL actual: " + currentUrl);
            }
            else
            {
                // Manejar el error si no se pudo obtener la URL de autorización
                Debug.LogError("Error al obtener la URL de autorización de Google: " + request.error);
            }
        }
    }

    // Este método se llama cuando el juego se reanuda desde el navegador después del inicio de sesión de Google
    /*public void OnGameResumed()
    {
        // Obtener el código de autorización de la URL actual
        string authorizationCode = GetAuthorizationCodeFromUrl();

        // Enviar el código de autorización al servidor para intercambiarlo por tokens de acceso y obtener la información del usuario
        StartCoroutine(SendAuthorizationCode(authorizationCode));
    }*/

    // Método para obtener el código de autorización de la URL actual
    private void GetAuthorizationCodeFromUrl(string currentUrl)
    {
        string[] urlParts = currentUrl.Split('?');

        if (urlParts.Length > 1)
        {
            string[] queryParams = urlParts[1].Split('&');

            foreach (string param in queryParams)
            {
                string[] keyValue = param.Split('=');
                if (keyValue[0] == "code")
                {
                    string authorizationCode = keyValue[1];
                    Debug.Log("Authorization code: " + authorizationCode);
                    StartCoroutine(SendAuthorizationCode(authorizationCode));
                    break;
                }
            }
        }
    }

    // Método para enviar el código de autorización al servidor y obtener la información del usuario
    IEnumerator SendAuthorizationCode(string code)
    {
        string serverUrl = "http://localhost:3000/googleUsers/login/callback";
        string urlWithCode = $"{serverUrl}?code={code}";

        using (UnityWebRequest request = UnityWebRequest.Get(urlWithCode))
        {
            yield return request.SendWebRequest();

            if (request.result == UnityWebRequest.Result.Success)
            {
                Debug.Log("Código de autorización enviado al servidor correctamente");
                string userInfoJson = request.downloadHandler.text;
                Debug.Log("Información del usuario: " + userInfoJson);
            }
            else
            {
                Debug.LogError("Error al enviar el código de autorización al servidor: " + request.error);
            }
        }
    }
}