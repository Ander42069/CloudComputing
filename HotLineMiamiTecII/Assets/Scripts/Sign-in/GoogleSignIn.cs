using System.Collections;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;


public class GoogleSignIn : MonoBehaviour
{
    public string serverUrl = "http://localhost:3000";

    public void SignInWithGoogle()
    {
        // Enviar una solicitud GET al servidor para obtener la URL de autorización de Google
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
                // Parsear la respuesta JSON para obtener la URL de autorización
                string authorizationUrl = request.downloadHandler.text;
         
                // Redirigir al usuario a la URL de autorización de Google
                Application.OpenURL(authorizationUrl);
            }
            else
            {
                Debug.LogError("Error al obtener la URL de autorización de Google: " + request.error);
            }
        }
    }
}
