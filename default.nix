{ pkgs ? import <nixpkgs> {} }: with pkgs;
let
  mkOlderVersion = { rev, sha256 }:
    let
      olderVersion = fetchFromGitHub {
        owner = "fretlink";
        repo  = "clever-tools-nix";
        inherit rev;
        inherit sha256;
      };
    in (import olderVersion {}).latest;
in
{
  v0_9_3 = mkOlderVersion {
    rev = "a60f5f961215e9a011b4a0dfe651758001f116d8";
    sha256 = "1n831iw55di0s2izbl03xivs59792swfji2n46vhi3mkdawrsjkg";
  };

  v1_1_1 = mkOlderVersion {
    rev = "63d289fd2f02a4d45e60f61e11f8dd9d3b4963fc";
    sha256 = "14ni1iaygbxihihmjiv7a7cg1q83y15lpqdp54frfyymjb7y12nj";
  };

  # 1.3.0
  latest = callPackage ./clever-tools {};
}
