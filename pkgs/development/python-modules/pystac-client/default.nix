{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  pythonOlder,

  pystac,
  pytest-benchmark,
  pytest-console-scripts,
  pytest-mock,
  pytest-recording,
  python-dateutil,
  requests,
  requests-mock,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pystac-client";
  version = "0.8.5";
  pyproject = true;
  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "stac-utils";
    repo = "pystac-client";
    tag = "v${version}";
    hash = "sha256-bryJCg0JqjxQi5tAvd5Y2f/hXmHoIGEFiHuSPCjqfYk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pystac
    python-dateutil
    requests
  ];

  nativeCheckInputs = [
    pytest-benchmark
    pytestCheckHook
    pytest-console-scripts
    pytest-mock
    pytest-recording
    requests-mock
  ];

  pytestFlagsArray = [
    # Tests accessing Internet
    "-m 'not vcr'"
  ];

  pythonImportsCheck = [ "pystac_client" ];

  meta = {
    description = "A Python client for working with STAC Catalogs and APIs";
    homepage = "https://github.com/stac-utils/pystac-client";
    license = lib.licenses.asl20;
    maintainers = lib.teams.geospatial.members;
  };
}
