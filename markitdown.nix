{
  lib,
  python3,
  fetchFromGitHub,
}:
let
  mammoth = python3.pkgs.callPackage ./mammoth.nix { };
in
python3.pkgs.buildPythonApplication rec {
  pname = "markitdown";
  version = "0.1.0a6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "markitdown";
    rev = "v${version}";
    hash = "sha256-5YafFL8OHNcGgB/qH6CmX0rTith1ZSRNIa+ktl4Ffvg=";
  };

  build-system = [
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    beautifulsoup4
    charset-normalizer
    mammoth
    markdownify
    numpy
    openai
    openpyxl
    pandas
    pathvalidate
    pdfminer-six
    puremagic
    pydub
    python-pptx
    requests
    speechrecognition
    youtube-transcript-api
  ];

  pythonImportsCheck = [
    "markitdown"
  ];

  meta = {
    description = "Python tool for converting files and office documents to Markdown";
    homepage = "https://github.com/microsoft/markitdown";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "markitdown";
  };
}
