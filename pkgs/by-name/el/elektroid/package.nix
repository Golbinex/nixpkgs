{
  alsa-lib,
  autoreconfHook,
  fetchFromGitHub,
  gtk3,
  json-glib,
  lib,
  libpulseaudio,
  libsamplerate,
  libsndfile,
  libzip,
  pkg-config,
  stdenv,
  zlib,
}:

let
  version = "3.2";
in
stdenv.mkDerivation {
  inherit version;

  pname = "elektroid";

  src = fetchFromGitHub {
    owner = "dagargo";
    repo = "elektroid";
    rev = version;
    hash = "sha256-8tKs0i1dkoLlk1a33n7+6eIXqjNu3PHUTznrEC/HPIM=";
  };

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    alsa-lib
    gtk3
    json-glib
    libpulseaudio
    libsamplerate
    libsndfile
    libzip
    zlib
  ];

  meta = with lib; {
    description = "Sample and MIDI device manager";
    homepage = "https://github.com/dagargo/elektroid";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ camelpunch ];
  };
}
