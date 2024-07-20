'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "8dc82d604b4bb2ecfba98f785407d787",
"version.json": "5743dabfcd9ee5f9a8db7437251e633c",
"index.html": "f8de530b3fa0652cdafda843c73d764f",
"/": "f8de530b3fa0652cdafda843c73d764f",
"main.dart.js": "fa0d8bb0c7d128ce81071e0a0e667401",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "a78064347452ae36ab84a377a2a8691f",
".git/objects/9e/7f1ea782fa1473180eb3a8e4a5088b198e882f": "3cfefc08757920ec8092f3bd9458261c",
".git/objects/6a/aec3eebf997a4f3c96a7e3505a50c6c0911dd4": "2f539d5c2b450665bf7cdc7fe9d9b7aa",
".git/objects/3c/e77f8e42c276e6bfcaadfa8dc9185e95a81af9": "3607b17bde441618d0a2c337205b6115",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/9d/2c0c68b12b7d83000dc9116c9b1fdd2dcc59c2": "a145e02f7ce25f11202b98b09f56d49d",
".git/objects/ac/0f908b9c9c73da558b45d65cc5c6094874d3e8": "36f70284c45d845ee774c46e7288afe5",
".git/objects/bb/15bcdb5c998ea4c7150ef0cfc22e35695c8ee9": "fdeea1adaaab24760dd3d9ccd7a47ae7",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/b4/a3ecb9428e2a4b8aff40c099e1c27d64a928f0": "6e4bc29289eb6be950713f1b329eaf0d",
".git/objects/d1/cfbf6c2190704ac249486b50991081b21ac8f7": "f267018f5230f95aced7fed28e966500",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/c0/ca5dedad17ad51d7af8502d0a1b254852ba3e4": "5fcde369d6ae8b84e247bcfe1ebd435c",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/f7e77fe37670c46f241d37d13e04f44e7dd935": "ebcf0095260eb267cd86171ecf860d74",
".git/objects/ca/2750b4f1b442dd36e7030544cc157457447abe": "eb6415a6596efbbbaa50f285f1194aa1",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/4b/a084394b61ce095d59755c59b62b32cd3d9a45": "a63a470be564315e247d9288ffab6532",
".git/objects/11/9a89effc48c848ffde13f4649f68d110a2d449": "c0b99ed6b2a419fda32155c721bd8107",
".git/objects/7c/205a07312f6abd384e742c7fe156724d6ed49c": "8c7350033060a3c1f2acc194c1c53fee",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/87/e72561ea375d551c2ab5242189b52a7ea62ea6": "74e562b7a6bd8c25a0288cbed12bc149",
".git/objects/10/2bf852f0b0af9b208f6d5f0e5ccbae9784d3c9": "453e12330e82043f07e8d45bfd3edc90",
".git/objects/21/4fde032ea07347d3ac24d3c93c10f8ccef126b": "ed6c9b5a7765a0c38346622ee67f4015",
".git/objects/86/2bb6f9ec07b91a27f37de1f37bf48dc4e9a4fe": "e351b962ab3a1dc8958e6b8adc0a09df",
".git/objects/72/391a81dfb4f1c1837b28a1a57536b2687ce28f": "7aeee6a145716c84d5b7dfac7fe27d30",
".git/objects/43/da14d84ecb949ca5f5e8ecca3a514aa7fe1c7d": "d970b955bbe605c4f81533fde279992d",
".git/objects/07/31c63d83481c87f2167a00ab0b72ff8f238ac5": "6954ccf9712327ff7fc115a338e8735a",
".git/objects/09/4bb6ae24f0cd847d40cb4cc4a2434f2ec9b83b": "b9e6d850322c11db635bcf0a45b762ff",
".git/objects/54/dbc4dad1124ac75c58b86afb5c0b6dc7d979de": "4e6bd298810be47d9f8c7389b41ea93b",
".git/objects/5e/95a9d007576bdf07e436b916d8f04058a7c738": "2bea0a4085da726a622700e452e516b7",
".git/objects/06/dbe85565cfb90ad069730c4b0f71a3dbd58976": "6e040a9ff0a5a524c1bbe70c4e1eb485",
".git/objects/90/b30e45d96d5ba018e32253feb2d58b770d16aa": "42fda22b624f2b7ddb1b8a5d15766eec",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/dd/34e7a115819a879d5a2890d1bdb0068ad1d082": "0a0b559926b24ce307e80ea3a8376aba",
".git/objects/dd/f4bfacb396e97546364ccfeeb9c31dfaea4c25": "049d11285bcbd30a249b4dff756126a0",
".git/objects/aa/ffd63f7ef1b9ab833e20de3bd2ebdb9d4969ad": "1d35a43fb1b0379e37b982496f72cbd7",
".git/objects/f9/788a71a7d9e0c6877718ecf1b80bced905b808": "731de2b2558ea97d3da58a7bbe7474c3",
".git/objects/e7/307e72c5e7bced5d36c776d0986bf71b605f15": "e493f8bfd12abe75c70dc4782e5beae0",
".git/objects/f8/0b1c07a5fae20bcba252a611fbf612d57ce1a0": "82a29e9bbae001d3d07f2615e576b2ee",
".git/objects/ce/85ef438c8586da72df4af8346c95b37e3bd613": "282e51d15128d17af0d4955e4fddd167",
".git/objects/e0/7a742f64def70fc9d2499eb8c935e11f2d195a": "7f81cd8bc52511e7bdf886c9d418d213",
".git/objects/2d/986c3821280928df60eaffaa790003c7f2053d": "0d8d6afd068fe53ae1dfcbb5d6023fd4",
".git/objects/77/d9f0d0648f6629f1fbbcf58f8326c1c794dec7": "6284796818d6ec92ac2e8226463022af",
".git/objects/23/aa85bd6d5551e3a90abc24c44bbf1e484c1945": "ea81c8ba06aee727f1bc4efd9e6eca98",
".git/objects/8c/421c16c248eac20660566537b5efb0e3f5c824": "f0743c38e74c93a42931eb998add0b1a",
".git/objects/85/9eb40dc146578633ec6a85806f4c327daae475": "b09f7a9eb9c43e52f681328262b0efdf",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/8b/f49c623cb109f6af133b0f4320035906705b72": "53bcc1eaec3aee15ec367cd3a746b40f",
".git/objects/8e/7265f9b6b1a35063b3a447f923df330c942ab1": "bc43805451fe169189d1d6a3a6b0e8a9",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
"assets/AssetManifest.json": "d05492b6b780cb774aab4d9fca424727",
"assets/NOTICES": "02154549683f0bd868018f008e1be8f0",
"assets/FontManifest.json": "9fa2d8dc34b8522f8499ba79d2243f31",
"assets/AssetManifest.bin.json": "d875b06e8952d6ca22719167fb5c18dd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4fc5dd9947dd545c4ce1ed2e5d5991c6",
"assets/fonts/MaterialIcons-Regular.otf": "0e6b016990cf441cfe619c31ae763c16",
"assets/assets/svg/search.svg": "f18bce29fe4c412748d0f1a7085a9f43",
"assets/assets/svg/chart.svg": "3c630df6c68dba0586f2b96ca44f7652",
"assets/assets/svg/User.svg": "6528485d396f008dc7744a4c96d9ebdd",
"assets/assets/svg/Bag%2520Check.svg": "78744bed6493f2c084a8275d553eeaf9",
"assets/assets/svg/bag%2520blue.svg": "1d460811c5de1cb4916c4c337cc2c77d",
"assets/assets/svg/bell.svg": "4debe1f27519681b7ec74322c4625217",
"assets/assets/svg/Qr%2520blue.svg": "af446283390a04ed91bf4afa8492006c",
"assets/assets/svg/double%2520profile.svg": "a523f4247ae3e63e170496495ba6efaf",
"assets/assets/svg/QR%2520Code.svg": "927cfce36deb91a64186427b4ee14ac9",
"assets/assets/svg/User%2520Tag.svg": "0f0d2fd18cf02fdeab0858b24fe81095",
"assets/assets/png/logo.png": "5d98448c94848a18b879020a234e3e97",
"assets/assets/fonts/Roboto-Medium.ttf": "68ea4734cf86bd544650aee05137d7bb",
"assets/assets/fonts/Roboto-Light.ttf": "881e150ab929e26d1f812c4342c15a7c",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/fonts/SF-Pro-Text-Light.otf": "977c68dd46805e557d0fa97185635dcd",
"assets/assets/fonts/SF-Pro-Text-Regular.otf": "6813cc6a25559c99aaf79c7d67669820",
"assets/assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/assets/fonts/SF-Pro-Text-Semibold.otf": "c2b0433c5c149993ee7bf0ca4ae2d198",
"assets/assets/fonts/SF-Pro-Text-Medium.otf": "15c8da0fc4723f7f455c6bf618bc52aa",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
