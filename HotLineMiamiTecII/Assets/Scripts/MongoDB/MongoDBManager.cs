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

        // Obtén una referencia a la colección de usuarios en tu base de datos
        IMongoDatabase database = client.GetDatabase("NOMBRE_DE_TU_BASE_DE_DATOS");
        usersCollection = database.GetCollection<BsonDocument>("usuarios");
    }

    // Método para guardar la información del usuario en MongoDB
    public void SaveUserInfo(string email, string name, string profilePictureUrl)
    {
        // Crea un documento BSON con la información del usuario
        var document = new BsonDocument
        {
            { "email", email },
            { "name", name },
            { "profilePictureUrl", profilePictureUrl }
        };

        // Inserta el documento en la colección de usuarios
        usersCollection.InsertOne(document);
    }
}

