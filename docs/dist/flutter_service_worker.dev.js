'use strict';

var MANIFEST = 'flutter-app-manifest';
var TEMP = 'flutter-temp-cache';
var CACHE_NAME = 'flutter-app-cache';
var RESOURCES = {
  "dist/style.css": "23474bbb7040cfa1d7c770099f6e72b7",
  "style.scss": "aaba72e46e1f31169b64e320ec9f40b9",
  "assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
  "assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
  "assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
  "assets/NOTICES": "aeb20a81002cac125999964e1540f15c",
  "assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
  "index.html": "aaaf40880757ab8e21437d1d01999daf",
  "/": "aaaf40880757ab8e21437d1d01999daf",
  "version.json": "7d23ccd388104d55445d227978d31898",
  "icons/Icon-maskable-192.png": "789597dca113b372557ae2257cbcbb84",
  "icons/Icon-maskable-512.png": "789597dca113b372557ae2257cbcbb84",
  "icons/Icon-512.png": "789597dca113b372557ae2257cbcbb84",
  "icons/Icon-192.png": "789597dca113b372557ae2257cbcbb84",
  "main.dart.js": "2713aef15938871fc3337853865198a7",
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
  "app_icon.ico": "920d1e076fa607d3968870a9fd7d057c",
  "manifest.json": "2422203563e5f9fb3afa418d91ed6375",
  "canvaskit/profiling/canvaskit.js": "411ee45f5abb57975ee5243310c6953e",
  "canvaskit/profiling/canvaskit.wasm": "c6681b1a749ad902eefcba11fed1cb3f",
  "canvaskit/canvaskit.js": "f00de1f742223b7cf4cec1c2a0cd9764",
  "canvaskit/canvaskit.wasm": "efe4a5da0205bb8d8c5aca7dad981abd"
}; // The application shell files that are downloaded before a service worker can
// start.

var CORE = [// "/",
"main.dart.js", "index.html", "assets/NOTICES", "assets/AssetManifest.json", "assets/FontManifest.json"]; // During install, the TEMP cache is populated with the application shell files.

self.addEventListener("install", function (event) {
  self.skipWaiting();
  return event.waitUntil(caches.open(TEMP).then(function (cache) {
    return cache.addAll(CORE.map(function (value) {
      return new Request(value, {
        'cache': 'reload'
      });
    }));
  }));
}); // During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.

self.addEventListener("activate", function (event) {
  return event.waitUntil(function _callee() {
    var contentCache, tempCache, manifestCache, manifest, _iteratorNormalCompletion, _didIteratorError, _iteratorError, _iterator, _step, request, response, oldManifest, origin, _iteratorNormalCompletion2, _didIteratorError2, _iteratorError2, _iterator2, _step2, key, _iteratorNormalCompletion3, _didIteratorError3, _iteratorError3, _iterator3, _step3;

    return regeneratorRuntime.async(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.prev = 0;
            _context.next = 3;
            return regeneratorRuntime.awrap(caches.open(CACHE_NAME));

          case 3:
            contentCache = _context.sent;
            _context.next = 6;
            return regeneratorRuntime.awrap(caches.open(TEMP));

          case 6:
            tempCache = _context.sent;
            _context.next = 9;
            return regeneratorRuntime.awrap(caches.open(MANIFEST));

          case 9:
            manifestCache = _context.sent;
            _context.next = 12;
            return regeneratorRuntime.awrap(manifestCache.match('manifest'));

          case 12:
            manifest = _context.sent;

            if (manifest) {
              _context.next = 56;
              break;
            }

            _context.next = 16;
            return regeneratorRuntime.awrap(caches["delete"](CACHE_NAME));

          case 16:
            _context.next = 18;
            return regeneratorRuntime.awrap(caches.open(CACHE_NAME));

          case 18:
            contentCache = _context.sent;
            _iteratorNormalCompletion = true;
            _didIteratorError = false;
            _iteratorError = undefined;
            _context.prev = 22;
            _context.next = 25;
            return regeneratorRuntime.awrap(tempCache.keys());

          case 25:
            _context.t0 = Symbol.iterator;
            _iterator = _context.sent[_context.t0]();

          case 27:
            if (_iteratorNormalCompletion = (_step = _iterator.next()).done) {
              _context.next = 37;
              break;
            }

            request = _step.value;
            _context.next = 31;
            return regeneratorRuntime.awrap(tempCache.match(request));

          case 31:
            response = _context.sent;
            _context.next = 34;
            return regeneratorRuntime.awrap(contentCache.put(request, response));

          case 34:
            _iteratorNormalCompletion = true;
            _context.next = 27;
            break;

          case 37:
            _context.next = 43;
            break;

          case 39:
            _context.prev = 39;
            _context.t1 = _context["catch"](22);
            _didIteratorError = true;
            _iteratorError = _context.t1;

          case 43:
            _context.prev = 43;
            _context.prev = 44;

            if (!_iteratorNormalCompletion && _iterator["return"] != null) {
              _iterator["return"]();
            }

          case 46:
            _context.prev = 46;

            if (!_didIteratorError) {
              _context.next = 49;
              break;
            }

            throw _iteratorError;

          case 49:
            return _context.finish(46);

          case 50:
            return _context.finish(43);

          case 51:
            _context.next = 53;
            return regeneratorRuntime.awrap(caches["delete"](TEMP));

          case 53:
            _context.next = 55;
            return regeneratorRuntime.awrap(manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES))));

          case 55:
            return _context.abrupt("return");

          case 56:
            _context.next = 58;
            return regeneratorRuntime.awrap(manifest.json());

          case 58:
            oldManifest = _context.sent;
            origin = self.location.origin;
            _iteratorNormalCompletion2 = true;
            _didIteratorError2 = false;
            _iteratorError2 = undefined;
            _context.prev = 63;
            _context.next = 66;
            return regeneratorRuntime.awrap(contentCache.keys());

          case 66:
            _context.t2 = Symbol.iterator;
            _iterator2 = _context.sent[_context.t2]();

          case 68:
            if (_iteratorNormalCompletion2 = (_step2 = _iterator2.next()).done) {
              _context.next = 78;
              break;
            }

            request = _step2.value;
            key = request.url.substring(origin.length + 1);

            if (key == "") {
              key = "/";
            } // If a resource from the old manifest is not in the new cache, or if
            // the MD5 sum has changed, delete it. Otherwise the resource is left
            // in the cache and can be reused by the new service worker.


            if (!(!RESOURCES[key] || RESOURCES[key] != oldManifest[key])) {
              _context.next = 75;
              break;
            }

            _context.next = 75;
            return regeneratorRuntime.awrap(contentCache["delete"](request));

          case 75:
            _iteratorNormalCompletion2 = true;
            _context.next = 68;
            break;

          case 78:
            _context.next = 84;
            break;

          case 80:
            _context.prev = 80;
            _context.t3 = _context["catch"](63);
            _didIteratorError2 = true;
            _iteratorError2 = _context.t3;

          case 84:
            _context.prev = 84;
            _context.prev = 85;

            if (!_iteratorNormalCompletion2 && _iterator2["return"] != null) {
              _iterator2["return"]();
            }

          case 87:
            _context.prev = 87;

            if (!_didIteratorError2) {
              _context.next = 90;
              break;
            }

            throw _iteratorError2;

          case 90:
            return _context.finish(87);

          case 91:
            return _context.finish(84);

          case 92:
            // Populate the cache with the app shell TEMP files, potentially overwriting
            // cache files preserved above.
            _iteratorNormalCompletion3 = true;
            _didIteratorError3 = false;
            _iteratorError3 = undefined;
            _context.prev = 95;
            _context.next = 98;
            return regeneratorRuntime.awrap(tempCache.keys());

          case 98:
            _context.t4 = Symbol.iterator;
            _iterator3 = _context.sent[_context.t4]();

          case 100:
            if (_iteratorNormalCompletion3 = (_step3 = _iterator3.next()).done) {
              _context.next = 110;
              break;
            }

            request = _step3.value;
            _context.next = 104;
            return regeneratorRuntime.awrap(tempCache.match(request));

          case 104:
            response = _context.sent;
            _context.next = 107;
            return regeneratorRuntime.awrap(contentCache.put(request, response));

          case 107:
            _iteratorNormalCompletion3 = true;
            _context.next = 100;
            break;

          case 110:
            _context.next = 116;
            break;

          case 112:
            _context.prev = 112;
            _context.t5 = _context["catch"](95);
            _didIteratorError3 = true;
            _iteratorError3 = _context.t5;

          case 116:
            _context.prev = 116;
            _context.prev = 117;

            if (!_iteratorNormalCompletion3 && _iterator3["return"] != null) {
              _iterator3["return"]();
            }

          case 119:
            _context.prev = 119;

            if (!_didIteratorError3) {
              _context.next = 122;
              break;
            }

            throw _iteratorError3;

          case 122:
            return _context.finish(119);

          case 123:
            return _context.finish(116);

          case 124:
            _context.next = 126;
            return regeneratorRuntime.awrap(caches["delete"](TEMP));

          case 126:
            _context.next = 128;
            return regeneratorRuntime.awrap(manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES))));

          case 128:
            return _context.abrupt("return");

          case 131:
            _context.prev = 131;
            _context.t6 = _context["catch"](0);
            // On an unhandled exception the state of the cache cannot be guaranteed.
            console.error('Failed to upgrade service worker: ' + _context.t6);
            _context.next = 136;
            return regeneratorRuntime.awrap(caches["delete"](CACHE_NAME));

          case 136:
            _context.next = 138;
            return regeneratorRuntime.awrap(caches["delete"](TEMP));

          case 138:
            _context.next = 140;
            return regeneratorRuntime.awrap(caches["delete"](MANIFEST));

          case 140:
          case "end":
            return _context.stop();
        }
      }
    }, null, null, [[0, 131], [22, 39, 43, 51], [44,, 46, 50], [63, 80, 84, 92], [85,, 87, 91], [95, 112, 116, 124], [117,, 119, 123]]);
  }());
}); // The fetch handler redirects requests for RESOURCE files to the service
// worker cache.

self.addEventListener("fetch", function (event) {
  if (event.request.method !== 'GET') {
    return;
  }

  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1); // Redirect URLs to the index.html

  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }

  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  } // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.


  if (!RESOURCES[key]) {
    return;
  } // If the URL is the index.html, perform an online-first request.


  if (key == '/') {
    return onlineFirst(event);
  }

  event.respondWith(caches.open(CACHE_NAME).then(function (cache) {
    return cache.match(event.request).then(function (response) {
      // Either respond with the cached resource, or perform a fetch and
      // lazily populate the cache.
      return response || fetch(event.request).then(function (response) {
        cache.put(event.request, response.clone());
        return response;
      });
    });
  }));
});
self.addEventListener('message', function (event) {
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
}); // Download offline will check the RESOURCES for all files not in the cache
// and populate them.

function downloadOffline() {
  var resources, contentCache, currentContent, _iteratorNormalCompletion4, _didIteratorError4, _iteratorError4, _iterator4, _step4, request, key, _i, _Object$keys, resourceKey;

  return regeneratorRuntime.async(function downloadOffline$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          resources = [];
          _context2.next = 3;
          return regeneratorRuntime.awrap(caches.open(CACHE_NAME));

        case 3:
          contentCache = _context2.sent;
          currentContent = {};
          _iteratorNormalCompletion4 = true;
          _didIteratorError4 = false;
          _iteratorError4 = undefined;
          _context2.prev = 8;
          _context2.next = 11;
          return regeneratorRuntime.awrap(contentCache.keys());

        case 11:
          _context2.t0 = Symbol.iterator;
          _iterator4 = _context2.sent[_context2.t0]();

        case 13:
          if (_iteratorNormalCompletion4 = (_step4 = _iterator4.next()).done) {
            _context2.next = 21;
            break;
          }

          request = _step4.value;
          key = request.url.substring(origin.length + 1);

          if (key == "") {
            key = "/";
          }

          currentContent[key] = true;

        case 18:
          _iteratorNormalCompletion4 = true;
          _context2.next = 13;
          break;

        case 21:
          _context2.next = 27;
          break;

        case 23:
          _context2.prev = 23;
          _context2.t1 = _context2["catch"](8);
          _didIteratorError4 = true;
          _iteratorError4 = _context2.t1;

        case 27:
          _context2.prev = 27;
          _context2.prev = 28;

          if (!_iteratorNormalCompletion4 && _iterator4["return"] != null) {
            _iterator4["return"]();
          }

        case 30:
          _context2.prev = 30;

          if (!_didIteratorError4) {
            _context2.next = 33;
            break;
          }

          throw _iteratorError4;

        case 33:
          return _context2.finish(30);

        case 34:
          return _context2.finish(27);

        case 35:
          for (_i = 0, _Object$keys = Object.keys(RESOURCES); _i < _Object$keys.length; _i++) {
            resourceKey = _Object$keys[_i];

            if (!currentContent[resourceKey]) {
              resources.push(resourceKey);
            }
          }

          return _context2.abrupt("return", contentCache.addAll(resources));

        case 37:
        case "end":
          return _context2.stop();
      }
    }
  }, null, null, [[8, 23, 27, 35], [28,, 30, 34]]);
} // Attempt to download the resource online before falling back to
// the offline cache.


function onlineFirst(event) {
  return event.respondWith(fetch(event.request).then(function (response) {
    return caches.open(CACHE_NAME).then(function (cache) {
      cache.put(event.request, response.clone());
      return response;
    });
  })["catch"](function (error) {
    return caches.open(CACHE_NAME).then(function (cache) {
      return cache.match(event.request).then(function (response) {
        if (response != null) {
          return response;
        }

        throw error;
      });
    });
  }));
}