using System;
using System.Collections.Generic;
using Realms;
using Realms.Sync;
using MongoDB.Bson;

public partial class GoogleSignInProfile : IRealmObject
{
    [MapTo("_id")]
    [PrimaryKey]
    public string Id { get; set; }

    [MapTo("_partition")]
    public string Partition { get; set; }

    [MapTo("email")]
    public string Email { get; set; }

    [MapTo("name")]
    public string Name { get; set; }

    [MapTo("photo_url")]
    public string PhotoUrl { get; set; }

    public GoogleSignInProfile() { }

    public GoogleSignInProfile(string id, string partition, string email, string name, string photoUrl)
    {
        Id = id;
        Partition = partition;
        Email = email;
        Name = name;
        PhotoUrl = photoUrl;
    }
}
