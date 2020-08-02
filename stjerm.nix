with import <nixpkgs> {}; # bring all of Nixpkgs into scope
stdenv.mkDerivation rec {
  name    = "stjerm-${version}";
  version = "0.1";

  src = ./.;
  buildInputs = with pkgs; [ gccStdenv autoconf automake m4 pkgconfig glib gtk2 gnome2.vte ];

  configurePhase = ''
    ./autogen.sh
    ./configure
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv ./src/stjerm $out/bin/stjerm
  '';

  meta = with pkgs.lib; {
    description = "Terminal Emulator";
    license = licenses.mspl;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ];
  };
}
