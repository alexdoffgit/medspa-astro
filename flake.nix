{
    description = "node dev env riced";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... } :
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in
        {
            devShells.${system}.default = pkgs.mkShell {
                shell = pkgs.zsh;
                
                buildInputs = with pkgs; [
                    zsh
                    starship
                    nodejs_26
                ];
            
                shellHook = ''
                    eval "$(starship init zsh)"
                    node -v
                    npm -v
                '';
            };
        };
}a