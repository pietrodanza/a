include "console.iol"
include "locations.iol"

interface aInterface {
RequestResponse:
  identification(string)(string)
OneWay:
}

interface bInterface {
RequestResponse: identification(string)(string)
OneWay:
}

execution{concurrent}

inputPort aIn {
Location: "socket://localhost:8001"
Protocol: sodep
Interfaces: aInterface
}

outputPort bOut {
Location: JDEP_LOCATION_a_bOut
Protocol: sodep
Interfaces: bInterface
}

main
{

  [identification(request)(response){
    request = request + " A ";
    identification@bOut(request)(response);
    println@Console( request )()
  }]
}
