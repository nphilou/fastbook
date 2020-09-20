with import <unstable> {};

(
  python38.withPackages (
    ps: with ps; [
        (callPackage ./nixpkgs/fastai.nix {})
        graphviz
        ipywidgets
        matplotlib
        pandas
        scikitlearn

        jupyter
        numpy
        ipykernel
    ]
  )
).env

# nix-shell