using System.Threading.Tasks;
using UnityEngine;
using Realms;
using Realms.Sync;

public class RealmController : MonoBehaviour
{
    public static RealmController Instance;

    private Realm _realm;

    private void Awake()
    {
        if (Instance == null)
        {
            DontDestroyOnLoad(gameObject);
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private async Task<Realm> GetRealmAsync()
    {
        if (_realm == null)
        {
            var app = App.Create("application-0-zpuma");
            var user = await app.LogInAsync(Credentials.Anonymous());
            var config = new PartitionSyncConfiguration("_partition", user);
            _realm = await Realm.GetInstanceAsync(config);
        }
        return _realm;
    }

    public async Task SaveGoogleSignInProfile(string email, string name, string photoUrl)
    {
        var realm = await GetRealmAsync();
        realm.Write(() =>
        {
            var profile = realm.Add(new GoogleSignInProfile
            {
                Email = email,
                Name = name,
                PhotoUrl = photoUrl
            });
        });
    }
}
