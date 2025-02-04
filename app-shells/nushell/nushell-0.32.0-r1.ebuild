# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
addr2line-0.14.1
adler-1.0.2
adler32-1.2.0
aead-0.3.2
aes-0.6.0
aes-gcm-0.8.0
aesni-0.10.0
aes-soft-0.6.4
ahash-0.7.2
aho-corasick-0.6.10
aho-corasick-0.7.18
alloc-no-stdlib-2.0.1
alloc-stdlib-0.2.1
ansi_colours-1.0.2
ansi_term-0.11.0
ansi_term-0.12.1
anyhow-1.0.40
arboard-1.2.0
arrayref-0.3.6
arrayvec-0.4.12
arrayvec-0.5.2
arrow-4.1.0
as-slice-0.1.5
async-channel-1.6.1
async-executor-1.4.1
async-global-executor-2.0.2
async-io-1.4.1
async-lock-2.4.0
async-mutex-1.4.0
async-recursion-0.3.2
async-std-1.9.0
async-task-4.0.3
async-trait-0.1.50
atomic-waker-1.0.0
atty-0.2.14
autocfg-1.0.1
backtrace-0.3.58
base64-0.13.0
base64-0.6.0
base64-0.9.3
base-x-0.2.8
bat-0.17.1
bigdecimal-0.2.0
bincode-1.3.3
bitflags-1.2.1
bit-set-0.5.2
bit-vec-0.6.3
blake2b_simd-0.5.11
block-0.1.6
block-buffer-0.2.0
block-buffer-0.9.0
blocking-1.0.2
brotli-3.3.0
brotli-decompressor-2.3.1
bson-0.14.1
bstr-0.2.16
bumpalo-3.6.1
bytemuck-1.5.1
byteorder-1.4.3
bytes-0.4.12
bytes-0.5.6
bytes-1.0.1
byte-tools-0.2.0
byte-unit-4.0.11
bzip2-0.3.3
bzip2-sys-0.1.10+1.0.8
cache-padded-1.1.1
calamine-0.17.0
cassowary-0.3.0
cc-1.0.67
cfg_aliases-0.1.1
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
chrono-tz-0.5.3
cipher-0.2.5
clap-2.33.3
clipboard-win-4.1.0
cloudabi-0.0.3
codepage-0.1.1
codespan-reporting-0.11.1
colored-1.9.3
color_quant-1.1.0
common-path-1.0.0
concurrent-queue-1.2.2
config-0.10.1
console-0.13.0
constant_time_eq-0.1.5
const_fn-0.4.7
content_inspector-0.2.4
convert_case-0.4.0
cookie-0.14.4
core-foundation-0.9.1
core-foundation-sys-0.8.2
core-graphics-0.21.0
cpuid-bool-0.1.2
cpuid-bool-0.2.0
crc32fast-1.2.1
crossbeam-channel-0.5.1
crossbeam-deque-0.7.3
crossbeam-deque-0.8.0
crossbeam-epoch-0.8.2
crossbeam-epoch-0.9.4
crossbeam-queue-0.2.3
crossbeam-utils-0.7.2
crossbeam-utils-0.8.4
crossterm-0.18.2
crossterm-0.19.0
crossterm_winapi-0.6.2
crossterm_winapi-0.7.0
crypto-mac-0.10.0
crypto-mac-0.4.0
cssparser-0.27.2
cssparser-macros-0.6.0
cstr_core-0.2.3
csv-1.1.6
csv-core-0.1.10
ctor-0.1.20
ctr-0.6.0
ctrlc-3.1.9
cty-0.2.1
curl-0.4.36
curl-sys-0.4.42+curl-7.76.0
dashmap-4.0.2
data-encoding-2.3.2
decimal-2.1.0
deflate-0.7.20
deflate-0.8.6
derive_is_enum_variant-0.1.1
derive_more-0.99.13
derive-new-0.5.9
digest-0.6.2
digest-0.9.0
directories-3.0.2
directories-next-2.0.0
dirs-1.0.5
dirs-3.0.2
dirs-next-2.0.0
dirs-sys-0.3.6
dirs-sys-next-0.1.2
discard-1.0.4
doc-comment-0.3.3
dtoa-0.4.8
dtoa-short-0.3.3
dtparse-1.2.0
dunce-1.0.1
dyn-clone-1.0.4
either-1.6.1
eml-parser-0.1.2
encode_unicode-0.3.6
encoding-0.2.33
encoding-index-japanese-1.20141219.5
encoding-index-korean-1.20141219.5
encoding-index-simpchinese-1.20141219.5
encoding-index-singlebyte-1.20141219.5
encoding_index_tests-0.1.4
encoding-index-tradchinese-1.20141219.5
encoding_rs-0.8.28
endian-type-0.1.2
env_logger-0.7.1
env_logger-0.8.3
error-chain-0.12.4
error-code-2.2.0
event-listener-2.5.1
failure-0.1.8
failure_derive-0.1.8
fake-simd-0.1.2
fallible-iterator-0.2.0
fallible-streaming-iterator-0.1.9
fancy-regex-0.3.5
fast-float-0.2.0
fastrand-1.4.1
fd-lock-2.0.0
filesize-0.2.0
fixedbitset-0.2.0
flatbuffers-0.8.4
flate2-1.0.20
flume-0.9.2
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.1
fs_extra-1.2.0
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futf-0.1.4
futures-0.1.31
futures-0.3.14
futures-channel-0.3.14
futures_codec-0.4.1
futures-core-0.3.14
futures-cpupool-0.1.8
futures-executor-0.3.14
futures-io-0.3.14
futures-lite-1.11.3
futures-macro-0.3.14
futures-sink-0.3.14
futures-task-0.3.14
futures-timer-3.0.2
futures-util-0.3.14
fxhash-0.2.1
gcc-0.3.55
generic-array-0.12.4
generic-array-0.13.3
generic-array-0.14.4
generic-array-0.8.4
gethostname-0.2.1
getrandom-0.1.16
getrandom-0.2.2
getset-0.1.1
ghash-0.3.1
gimli-0.23.0
git2-0.13.18
gjson-0.7.5
glob-0.3.0
globset-0.4.6
gloo-timers-0.2.1
h2-0.2.7
hamcrest2-0.3.0
hash32-0.1.1
hashbrown-0.11.2
hashbrown-0.9.1
hashlink-0.7.0
heapless-0.6.1
heck-0.3.2
hermit-abi-0.1.18
hex-0.3.2
hex-0.4.3
hkdf-0.10.0
hmac-0.10.1
hmac-0.4.2
hmac-sha1-0.1.3
html5ever-0.25.1
htmlescape-0.3.1
http-0.2.4
httparse-1.4.0
http-body-0.3.1
http-client-6.3.5
httpdate-0.3.2
http-types-2.11.0
humantime-1.3.0
hyper-0.11.27
hyper-0.13.10
hyper-tls-0.4.3
ical-0.7.0
idna-0.2.3
image-0.22.5
image-0.23.14
indexmap-1.6.2
infer-0.2.3
inflate-0.4.5
Inflector-0.11.4
instant-0.1.9
integer-encoding-1.1.7
iovec-0.1.4
ipnet-2.3.0
isahc-0.9.14
itertools-0.10.0
itoa-0.4.7
jobserver-0.1.22
jpeg-decoder-0.1.22
js-sys-0.3.50
kernel32-sys-0.2.2
kv-log-macro-1.0.7
language-tags-0.2.2
lazycell-1.3.0
lazy_static-0.2.11
lazy_static-1.4.0
lexical-5.2.2
lexical-core-0.7.6
libc-0.2.94
libgit2-sys-0.12.19+1.1.0
libm-0.2.1
libnghttp2-sys-0.1.6+1.43.0
libsqlite3-sys-0.22.2
libz-sys-1.1.3
line-wrap-0.1.1
linked-hash-map-0.3.0
linked-hash-map-0.5.4
lock_api-0.3.4
lock_api-0.4.4
log-0.3.9
log-0.4.14
lz4-1.23.2
lz4-sys-1.9.2
mac-0.1.1
malloc_buf-0.0.6
markup5ever-0.10.1
matches-0.1.8
maybe-uninit-2.0.0
md5-0.3.8
md5-0.6.1
md5-0.7.0
memchr-2.4.0
memmap2-0.2.2
memoffset-0.5.6
memoffset-0.6.3
meval-0.2.0
mime-0.3.16
mime_guess-2.0.3
miniz_oxide-0.3.7
miniz_oxide-0.4.4
minus-3.3.3
mio-0.6.23
mio-0.7.11
mio-uds-0.6.8
miow-0.2.2
miow-0.3.7
multiversion-0.6.1
multiversion-macros-0.6.1
native-tls-0.2.7
neso-0.5.0
net2-0.2.37
new_debug_unreachable-1.0.4
nibble_vec-0.1.0
nipper-0.1.9
nix-0.20.0
nodrop-0.1.14
nom-1.2.4
nom-5.1.2
ntapi-0.3.6
num-0.2.1
num-0.4.0
num-bigint-0.2.6
num-bigint-0.3.2
num-bigint-0.4.0
num-complex-0.2.4
num-complex-0.4.0
num_cpus-1.13.0
num-format-0.4.0
num-integer-0.1.44
num-iter-0.1.42
num-rational-0.2.4
num-rational-0.3.2
num-rational-0.4.0
num-traits-0.1.43
num-traits-0.2.14
objc-0.2.7
objc-foundation-0.1.1
objc_id-0.1.1
object-0.23.0
once_cell-1.7.2
onig-6.1.1
onig_sys-69.6.0
opaque-debug-0.3.0
open-1.7.0
openssl-0.10.34
openssl-probe-0.1.2
openssl-sys-0.9.62
ordered-float-1.1.1
parking-2.0.0
parking_lot-0.11.1
parking_lot-0.9.0
parking_lot_core-0.6.2
parking_lot_core-0.8.3
parquet-4.1.0
parquet-format-2.6.1
parse-zoneinfo-0.3.0
path_abs-0.5.1
percent-encoding-1.0.1
percent-encoding-2.1.0
peresil-0.3.0
pest-2.1.3
petgraph-0.5.1
phf-0.8.0
phf_codegen-0.8.0
phf_generator-0.8.0
phf_macros-0.8.0
phf_shared-0.8.0
pin-project-0.4.28
pin-project-1.0.7
pin-project-internal-0.4.28
pin-project-internal-1.0.7
pin-project-lite-0.1.12
pin-project-lite-0.2.6
pin-utils-0.1.0
pkg-config-0.3.19
plist-1.1.0
png-0.15.3
png-0.16.8
polars-0.13.4
polars-arrow-0.13.4
polars-core-0.13.4
polars-io-0.13.4
polars-lazy-0.13.4
polling-2.0.3
polyval-0.4.5
ppv-lite86-0.2.10
precomputed-hash-0.1.1
pretty-0.5.2
pretty_env_logger-0.4.0
prettytable-rs-0.8.0
proc-macro2-1.0.26
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro-hack-0.5.19
proc-macro-nested-0.1.7
ptree-0.3.2
query_interface-0.3.5
quickcheck-1.0.3
quickcheck_macros-1.0.0
quick-error-1.2.3
quick-xml-0.12.4
quick-xml-0.19.0
quick-xml-0.21.0
quote-0.3.15
quote-1.0.9
radix_trie-0.2.1
rand-0.3.23
rand-0.4.6
rand-0.7.3
rand-0.8.3
rand_chacha-0.2.2
rand_chacha-0.3.0
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_core-0.6.2
rand_distr-0.3.0
rand_hc-0.2.0
rand_hc-0.3.0
rand_pcg-0.2.1
rawkey-0.1.3
rayon-1.5.0
rayon-core-1.9.0
rdrand-0.4.0
readkey-0.1.7
redox_syscall-0.1.57
redox_syscall-0.2.7
redox_users-0.3.5
redox_users-0.4.0
regex-0.2.11
regex-1.5.3
regex-automata-0.1.9
regex-syntax-0.5.6
regex-syntax-0.6.25
relay-0.1.1
remove_dir_all-0.5.3
reqwest-0.10.10
result-1.0.0
roxmltree-0.14.1
rusqlite-0.25.3
rust-argon2-0.8.3
rustc-demangle-0.1.18
rust-crypto-0.2.36
rustc-serialize-0.3.24
rustc_version-0.2.3
rust_decimal-0.10.2
rust-embed-5.9.0
rust-embed-impl-5.9.0
rust-embed-utils-5.1.0
rust-ini-0.13.0
rustversion-1.0.4
rustyline-8.1.0
ryu-1.0.5
s3handler-0.6.6
safemem-0.2.0
safemem-0.3.3
same-file-1.0.6
schannel-0.1.19
scoped-tls-0.1.2
scopeguard-1.1.0
security-framework-2.2.0
security-framework-sys-2.2.0
selectors-0.22.0
semver-0.11.0
semver-0.9.0
semver-parser-0.10.2
semver-parser-0.7.0
serde-0.8.23
serde-1.0.125
serde_bytes-0.11.5
serde_derive-1.0.125
serde-hjson-0.9.1
serde_ini-0.2.0
serde_json-1.0.64
serde_qs-0.7.2
serde_test-0.8.23
serde_test-1.0.125
serde_urlencoded-0.7.0
serde-value-0.6.0
serde_yaml-0.8.17
serial_test-0.5.1
serial_test_derive-0.5.1
servo_arc-0.1.1
sha1-0.2.0
sha1-0.6.0
sha2-0.6.0
sha2-0.9.3
shadow-rs-0.5.25
shellexpand-2.1.0
shell-words-1.0.0
signal-hook-0.1.17
signal-hook-registry-1.3.0
siphasher-0.3.5
slab-0.3.0
slab-0.4.3
sluice-0.5.4
smallvec-0.2.1
smallvec-0.6.14
smallvec-1.6.1
smart-default-0.6.0
snap-1.0.5
socket2-0.3.19
socket2-0.4.0
spinning_top-0.2.3
stable_deref_trait-1.2.0
standback-0.2.17
static_assertions-1.1.0
std_prelude-0.2.12
stdweb-0.4.20
stdweb-derive-0.5.3
stdweb-internal-macros-0.2.9
stdweb-internal-runtime-0.1.5
str-buf-2.0.0
string_cache-0.8.1
string_cache_codegen-0.5.1
strip-ansi-escapes-0.1.0
strsim-0.8.0
subtle-2.4.0
surf-2.2.0
sxd-document-0.3.2
sxd-xpath-0.4.2
syn-0.11.11
syn-1.0.71
synom-0.11.3
synstructure-0.12.4
syntect-4.5.0
sysinfo-0.16.5
sys-locale-0.1.0
take-0.1.0
tempfile-3.2.0
tendril-0.4.2
term-0.5.2
term-0.7.0
termcolor-1.1.2
terminal_size-0.1.16
term_size-0.3.2
textwrap-0.11.0
thin-slice-0.1.1
thiserror-1.0.24
thiserror-impl-1.0.24
thread_local-0.3.6
threadpool-1.8.1
thrift-0.13.0
tiff-0.6.1
time-0.1.44
time-0.2.26
time-macros-0.1.1
time-macros-impl-0.1.1
tint-1.0.1
tinyvec-1.2.0
tinyvec_macros-0.1.0
titlecase-1.1.0
tokio-0.1.22
tokio-0.2.25
tokio-codec-0.1.2
tokio-core-0.1.18
tokio-current-thread-0.1.7
tokio-executor-0.1.10
tokio-fs-0.1.7
tokio-io-0.1.13
tokio-macros-0.2.6
tokio-proto-0.1.1
tokio-reactor-0.1.12
tokio-service-0.1.0
tokio-sync-0.1.8
tokio-tcp-0.1.4
tokio-threadpool-0.1.18
tokio-timer-0.2.13
tokio-tls-0.3.1
tokio-udp-0.1.6
tokio-uds-0.2.7
tokio-util-0.3.1
toml-0.5.8
tower-service-0.3.1
tracing-0.1.26
tracing-attributes-0.1.15
tracing-core-0.1.18
tracing-futures-0.2.5
trash-1.3.0
try-lock-0.1.0
try-lock-0.2.3
tui-0.14.0
typed-arena-1.7.0
typenum-1.13.0
ucd-trie-0.1.3
ucd-util-0.1.8
umask-1.0.0
unicase-2.6.0
unicode-bidi-0.3.5
unicode-normalization-0.1.17
unicode-segmentation-1.7.1
unicode-width-0.1.8
unicode-xid-0.0.4
unicode-xid-0.2.2
universal-hash-0.4.0
unsafe_unwrap-0.1.0
url-2.2.1
user32-sys-0.2.0
users-0.11.0
utf-8-0.7.6
utf8parse-0.1.1
utf8parse-0.2.0
utf8-ranges-1.0.4
utf8-width-0.1.5
uuid-0.8.2
value-bag-1.0.0-alpha.6
vcpkg-0.2.12
vec_map-0.8.2
version_check-0.9.3
void-1.0.2
vte-0.3.3
waker-fn-1.1.0
walkdir-2.3.2
want-0.0.4
want-0.3.0
wasi-0.10.0+wasi-snapshot-preview1
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.73
wasm-bindgen-backend-0.2.73
wasm-bindgen-futures-0.4.23
wasm-bindgen-macro-0.2.73
wasm-bindgen-macro-support-0.2.73
wasm-bindgen-shared-0.2.73
webbrowser-0.5.5
web-sys-0.3.50
weezl-0.1.5
wepoll-sys-3.0.1
which-4.1.0
widestring-0.4.3
wild-2.0.4
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-wsapoll-0.1.1
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.7.0
ws2_32-sys-0.2.1
x11-2.18.2
x11rb-0.8.1
xmlparser-0.13.3
xml-rs-0.8.3
yaml-rust-0.4.5
zip-0.5.12
zstd-0.8.1+zstd.1.5.0
zstd-safe-4.1.0+zstd.1.5.0
zstd-sys-1.6.0+zstd.1.5.0
"

inherit cargo

DESCRIPTION="A new type of shell, written in Rust"
HOMEPAGE="https://www.nushell.sh"
SRC_URI="https://github.com/nushell/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0 CC0-1.0 ISC LGPL-3+ MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64"
IUSE="+extra"

DEPEND="
	>=dev-libs/libgit2-0.99:=
	dev-libs/oniguruma:=
	dev-libs/openssl:0=
	net-libs/libssh2:=
	net-libs/nghttp2:=
	net-misc/curl
	extra? (
		dev-db/sqlite:3=
		x11-libs/libX11
		x11-libs/libxcb
	)
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-util/cmake
	>=virtual/rust-1.46
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/nu.*"

src_configure() {
	# high magic to allow system-libs
	export OPENSSL_NO_VENDOR=true
	export RUSTONIG_SYSTEM_LIBONIG=1
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
	export LIBSSH2_SYS_USE_PKG_CONFIG=1
	export PKG_CONFIG_ALLOW_CROSS=1

	local myfeatures=(
		stable
		$(usev extra)
	)

	cargo_src_configure
}

src_compile() {
	cargo_src_compile --workspace
}

src_install() {
	cargo_src_install
	local DOCS=( README.md docs/. )
	einstalldocs
}
