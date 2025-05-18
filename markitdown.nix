{
  lib,
  beautifulsoup4,
  buildPythonApplication,
  charset-normalizer,
  exiftool,
  fetchFromGitHub,
  ffmpeg,
  hatchling,
  magika,
  mammoth,
  markdownify,
  numpy,
  openai,
  openpyxl,
  pandas,
  pathvalidate,
  pdfminer-six,
  puremagic,
  pydub,
  python-pptx,
  requests,
  speechrecognition,
  youtube-transcript-api,
}:
buildPythonApplication rec {
  pname = "markitdown";
  version = "0.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "markitdown";
    rev = "v${version}";
    hash = "sha256-siXam2a+ryyLBbciQgjd9k6zC8r46LbzjPMoc1dG0wk=";
  };

  sourceRoot = "${src.name}/packages/markitdown";

  makeWrapperArgs = [
    "--prefix PATH : ${
      lib.makeBinPath [
        exiftool
        ffmpeg
      ]
    }"
  ];

  build-system = [
    hatchling
  ];

  dependencies = [
    beautifulsoup4
    charset-normalizer
    magika
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
