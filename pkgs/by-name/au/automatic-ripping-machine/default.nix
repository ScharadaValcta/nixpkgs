{ stdenv, fetchFromGitHub, python3Packages, lib, ... }:

stdenv.mkDerivation rec {
  pname = "automatic-ripping-machine";
  version = "2.6.75"; # Ersetze dies mit der gewünschten Version

  src = fetchFromGitHub {
    owner = "automatic-ripping-machine";
    repo = pname;
    rev = "v${version}";
    sha256 = "0ssw1cs69xx8xxgkk1n6mq9gk5z0y2nh5bgwrbm54r7w7g8akmqz"; # Ersetze dies durch den tatsächlichen Hash-Wert
  };

  nativeBuildInputs = [ python3Packages.virtualenv ];

  buildInputs = [
    python3
    lib.libaacs
    lib.libbdplus
    lib.libbluray
    makemkv
    handbrake
    ffmpeg
    mplayer
    bash
    coreutils
    findutils
    gawk
    gnutar
    gzip
    utillinux
    perl
    mediainfo
    tesseract
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -r * $out/bin
    chmod +x $out/bin/arm_wrapper.sh
    runHook postInstall
  '';

  meta = with lib; {
    description = "Automatic Ripping Machine";
    homepage = "https://github.com/automatic-ripping-machine/automatic-ripping-machine";
    license = licenses.gpl2;
    maintainers = with maintainers; [ ];
  };
}
