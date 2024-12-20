{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pandoc,
  callPackage,
}: let
  cobble = callPackage ./cobble.nix {};
in
  buildPythonPackage rec {
    pname = "mammoth";
    version = "1.8.0";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "mwilliamson";
      repo = "python-mammoth";
      rev = version;
      hash = "sha256-mIvzEyKpy1j7tZti+QTXgsbqqZAhYs7N+p5sQFsLhBg=";
    };

    nativeBuildInputs = [
      pandoc
    ];

    preBuild = ''
      make README
    '';

    build-system = [
      setuptools
    ];

    pythonImportsCheck = [
      "mammoth"
    ];

    dependencies = [
      cobble
    ];

    meta = {
      description = "Convert Word documents (.docx files) to HTML";
      homepage = "https://github.com/mwilliamson/python-mammoth";
      changelog = "https://github.com/mwilliamson/python-mammoth/blob/${src.rev}/NEWS";
      license = lib.licenses.bsd2;
      maintainers = [];
    };
  }
