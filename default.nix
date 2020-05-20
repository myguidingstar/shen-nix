with import <nixpkgs> {};

let shen-os = import ./shen-os.nix;
in
stdenv.mkDerivation rec {
  name = "shen-${version}";
  version = "3.0.3";

  src = fetchurl {
    url = "https://github.com/Shen-Language/shen-cl/releases/download/v${version}/shen-cl-v${version}-sources.tar.gz";
    sha256 = "0mc10jlrxqi337m6ngwbr547zi4qgk69g1flz5dsddjy5x41j0yz";
  };

  buildInputs = [
    shen-os sbcl
  ];
  buildPhase = ''
    ln -s ${shen-os} kernel
    make sbcl
  '';
  installPhase = ''
    mkdir -p $out
    install -m755 -D bin/sbcl/shen $out/bin/shen
  '';

  meta = with stdenv.lib; {
    homepage = https://shenlanguage.org;
    description = "Shen language";
    platforms = platforms.linux;
    maintainers = with maintainers; [];
  };
}
