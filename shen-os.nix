with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "shen-os-${version}";
  version = "22.3";

  src = fetchurl {
    url = "https://github.com/Shen-Language/shen-sources/releases/download/shen-${version}/ShenOSKernel-${version}.tar.gz";
    sha256 = "16jaliga3bia0f8c8ja1y22wanbnbriv31qfqdc87a4p4dx9c77q";
  };

  buildInputs = [
  ];
  buildPhase = ''
    '';
  installPhase = ''
    mkdir -p $out
    cp . $out -R
  '';

  meta = with stdenv.lib; {
    homepage = https://shenlanguage.org;
    description = "Shen language";
    platforms = platforms.linux;
    maintainers = with maintainers; [];
  };
}
