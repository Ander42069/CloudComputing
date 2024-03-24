using MongoDB.Driver;
using MongoDB.Bson;
using System.Collections.Generic;
using UnityEngine;

public class MongoDBManager : MonoBehaviour
{
    private IMongoCollection<BsonDocument> usersCollection;
    private MongoClient client;

    void Start()
    {
        // Conecta a tu base de datos MongoDB Atlas
        string connectionString = "TU_CONEXION_A_MONGODB_ATLAS";
        client = new MongoClient(connectionString);

        // Obt�n una referencia a la colecci�n de usuarios en tu base de datos
        IMongoDatabase database = client.GetDatabase("NOMBRE_DE_TU_BASE_DE_DATOS");
        usersCollection = database.GetCollection<BsonDocument>("usuarios");
    }

    // M�todo para guardar la informaci�n del usuario en MongoDB
    public void SaveUserInfo(string email, string name, string profilePictureUrl)
    {
        // Crea un documento BSON con la informaci�n del usuario
        var document = new BsonDocument
        {
            { "email", email },
            { "name", name },
            { "profilePictureUrl", profilePictureUrl }
        };

        // Inserta el documento en la colecci�n de usuarios
        usersCollection.InsertOne(document);
    }
}

