{
  description = ''xchacha20_poly1305, chacha20, poly1305'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nim_chacha20_poly1305-master.flake = false;
  inputs.src-nim_chacha20_poly1305-master.owner = "lantos-lgtm";
  inputs.src-nim_chacha20_poly1305-master.ref   = "refs/heads/master";
  inputs.src-nim_chacha20_poly1305-master.repo  = "nim_chacha20_poly1305";
  inputs.src-nim_chacha20_poly1305-master.type  = "github";
  
  inputs."stint".dir   = "nimpkgs/s/stint";
  inputs."stint".owner = "riinr";
  inputs."stint".ref   = "flake-pinning";
  inputs."stint".repo  = "flake-nimble";
  inputs."stint".type  = "github";
  inputs."stint".inputs.nixpkgs.follows = "nixpkgs";
  inputs."stint".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nim_chacha20_poly1305-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nim_chacha20_poly1305-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}