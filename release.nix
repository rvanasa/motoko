{ src ? null }:
let
  # doRelease is true when the git tag is of the right release format like `0.42`.
  doRelease = src != null && versionMatches != null;

  # versionMatch is `null` if `src.gitTag` is not of the right format like "0.42"
  # and it's a list of matches like [ "0.42" ] when it is.
  versionMatches = builtins.match "(\d+(?:\.d+)+)" src.gitTag;
  releaseVersion = if versionMatches == null then "latest" else builtins.head versionMatches;

  ci = import ./ci.nix { inherit src releaseVersion; };
in
if !doRelease then {} else {
  release.motoko = ci.release.motoko;
}