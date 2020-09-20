{ stdenv, fetchPypi, fetchFromGitHub, buildPythonPackage, pythonOlder
, beautifulsoup4
, bottleneck
, matplotlib
, numexpr
, numpy
, packaging
, pandas
, pillow
, pytorchWithCuda
, pyyaml
, requests
, scikitimage
, scikitlearn
, scipy
, six
, spacy
, dataclasses
, which }:

let
  fastcore = buildPythonPackage rec {
    pname = "fastcore";
    version = "1.0.13";

    src = fetchFromGitHub {
      owner = "fastai";
      repo = pname;
      rev = "v${version}";
      sha256 = "0c2vbc687z7kjw2y2flk44kwx99a8shjfrrh0lw4v4m167kl80v7";
    };

    propagatedBuildInputs = [
      packaging
    ];

    checkInputs = [
      numpy
      matplotlib
    ];
  };

  fastprogress = buildPythonPackage rec {
    pname = "fastprogress";
    version = "1.0.0";

    src = fetchFromGitHub {
      owner = "fastai";
      repo = pname;
      rev = "0408102297037bf67bb976020de84cbe1efac202";
      sha256 = "1wiczwsrkc8yzq53f07hq43qxdp8nc83jpbjap15y6vyvsvnawf3";
    };

    propagatedBuildInputs = [
      packaging
    ];

    doCheck = false;
  };

  nvidia-ml-py3 = buildPythonPackage rec {
    pname = "nvidia-ml-py3";
    version = "7.352.0";

    src = fetchPypi {
      inherit pname version;
      sha256 = "0xqjypqj0cv7aszklyaad7x3fsqs0q0k3iwq7bk3zmz9ks8h43rr";
    };
  };

  torchvision = buildPythonPackage rec {
    pname   = "torchvision";
    version = "0.8.0";
    nativeBuildInputs = [ which ];

    src = fetchFromGitHub {
      owner = "pytorch";
      repo = "vision";
      rev = "2801a76dd91a8b5c0f63e74e47b3697084f3af28";
      sha256 = "0r0crx8ddmdmsqy8p9d3manl3zh01jk0mk3zqa77a5s42327jffs";
    };
    doCheck = false;

    propagatedBuildInputs = [ six numpy pillow pytorchWithCuda ];
  };


in
buildPythonPackage rec {
  pname = "fastai";
  version = "2.0.13";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0zbx9aymxaahp3h7v998mn62a3j0yzkmr1ks3a2dy84hf5p5k5i4";
  };

  propagatedBuildInputs = [
    beautifulsoup4
    bottleneck
    fastcore
    fastprogress
    matplotlib
    numexpr
    numpy
    nvidia-ml-py3
    pandas
    packaging
    pillow
    pyyaml
    pytorchWithCuda
    requests
    scipy
    scikitimage
    scikitlearn
    spacy
    torchvision
  ];

  doCheck = false;
}