self: super:

{
  codedisaster = super.callPackage (builtins.fetchGit {
    url = "https://github.com/MatthewCroughan/codedisaster.git";
    rev = "master"; # ou un commit spécifique
  }) {};
}
