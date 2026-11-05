// Bump VERSION on every release so clients pick up the new files.
const VERSION = 'imt-flow-v2';
const FILES = ['./', 'index.html', 'manifest.json', 'icons/icon.svg', 'icons/icon-192.png', 'icons/icon-512.png',
  'assets/stickman-tap.webm', 'assets/stickman-tap.mp4', 'assets/stickman-tap.jpg'];
// Google Fonts is cross-origin, so it is not cached here: offline the page falls back to system fonts.
self.addEventListener('install', e => {
  e.waitUntil(caches.open(VERSION).then(c => c.addAll(FILES)).then(() => self.skipWaiting()));
});
self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k !== VERSION).map(k => caches.delete(k)))).then(() => self.clients.claim()));
});
// Safari asks for video with a Range header; answer it from the cached file with a 206.
async function rangeResponse(req) {
  const cached = await caches.match(req.url, { ignoreSearch: true });
  if (!cached) return fetch(req);
  const buf = await cached.arrayBuffer();
  const m = /bytes=(\d*)-(\d*)/.exec(req.headers.get('range') || '');
  const start = m && m[1] ? +m[1] : 0, end = m && m[2] ? Math.min(+m[2], buf.byteLength - 1) : buf.byteLength - 1;
  return new Response(buf.slice(start, end + 1), { status: 206, headers: {
    'Content-Type': cached.headers.get('Content-Type') || 'application/octet-stream',
    'Content-Range': `bytes ${start}-${end}/${buf.byteLength}`, 'Content-Length': String(end - start + 1), 'Accept-Ranges': 'bytes' } });
}
// Network first for the page, cache first for the rest.
self.addEventListener('fetch', e => {
  if (e.request.method !== 'GET') return;
  if (e.request.headers.has('range')) return e.respondWith(rangeResponse(e.request));
  const isPage = e.request.mode === 'navigate';
  e.respondWith(isPage
    ? fetch(e.request).then(r => { const copy = r.clone(); caches.open(VERSION).then(c => c.put('index.html', copy)); return r; }).catch(() => caches.match('index.html'))
    : caches.match(e.request).then(r => r || fetch(e.request)));
});
