{ pkgs }:

let
  imgLink = "https://github.com/lautar0pp/Another-nixConf/blob/main/mountain-wallpaper.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-2Q70cgVAc2SmBU1jUowz2P6+oOpDgcYL/oFiZZcE7OM=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "sha256-miITP56s39f8/0kS10ofnxGj9/ds6MHxHEp5qhhJ8xQ=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}
