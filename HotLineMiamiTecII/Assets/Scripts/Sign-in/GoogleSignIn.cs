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

                // Redirigir al usuario al sitio web de inicio de sesi�n de Google
                Application.OpenURL(authorizationUrl);

                Debug.Log("URL de autorizaci�n de Google: " + authorizationUrl);

                // Esperar un momento para que el usuario inicie sesi�n y sea redirigido de vuelta al juego
                yield return new WaitForSeconds(5f);

                // Obtener la URL actual (la que contiene el c�digo de autorizaci�n)
                string currentUrl = Application.absoluteURL;

                GetAuthorizationCodeFromUrl(currentUrl);

                Debug.Log("URL actual: " + currentUrl);
            }
            else
            {
                // Manejar el error si no se pudo obtener la URL de autorizaci�n
                Debug.LogError("Error al obtener la URL de autorizaci�n de Google: " + request.error);
            }
        }
    }

    // Este m�todo se llama cuando el juego se reanuda desde el navegador despu�s del inicio de sesi�n de Google
    /*public void OnGameResumed()
    {
        // Obtener el c�digo de autorizaci�n de la URL actual
        string authorizationCode = GetAuthorizationCodeFromUrl();

        // Enviar el c�digo de autorizaci�n al servidor para intercambiarlo por tokens de acceso y obtener la informaci�n del usuario
        StartCoroutine(SendAuthorizationCode(authorizationCode));
    }*/

    // M�todo para obtener el c�digo de autorizaci�n de la URL actual
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

    // M�todo para enviar el c�digo de autorizaci�n al servidor y obtener la informaci�n del usuario
    IEnumerator SendAuthorizationCode(string code)
    {
        string serverUrl = "http://localhost:3000/googleUsers/login/callback";
        string urlWithCode = $"{serverUrl}?code={code}";

        using (UnityWebRequest request = UnityWebRequest.Get(urlWithCode))
        {
            yield return request.SendWebRequest();

            if (request.result == UnityWebRequest.Result.Success)
            {
                Debug.Log("C�digo de autorizaci�n enviado al servidor correctamente");
                string userInfoJson = request.downloadHandler.text;
                Debug.Log("Informaci�n del usuario: " + userInfoJson);
            }
            else
            {
                Debug.LogError("Error al enviar el c�digo de autorizaci�n al servidor: " + request.error);
            }
        }
    }
}