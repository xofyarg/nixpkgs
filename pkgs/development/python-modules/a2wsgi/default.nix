{ lib
, buildPythonPackage
, fetchPypi
, asgiref
, httpx
, pdm-backend
, pytest-asyncio
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "a2wsgi";
  version = "1.9.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cd/UGOUbnoI1nrRZx+2hTtg/j0ClD0dKbXNXpnHNPl4=";
  };

  nativeBuildInputs = [
    pdm-backend
  ];

  nativeCheckInputs = [
    asgiref
    httpx
    pytest-asyncio
    pytestCheckHook
  ];

  meta = with lib; {
    description = "Convert WSGI app to ASGI app or ASGI app to WSGI app";
    homepage = "https://github.com/abersheeran/a2wsgi";
    license = licenses.asl20;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}
