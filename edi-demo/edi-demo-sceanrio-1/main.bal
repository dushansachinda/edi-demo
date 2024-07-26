import edi_demo_sceanrio_1.invoicesFreight;
import ballerina/http;
//import ballerina/io;
import ballerina/log;

service /freightX12_110 on new http:Listener(9090) {
    resource function post ediTojson(http:Request req) returns string|error|http:Response {
        log:printInfo("Received a request from the client");
        // get EDI message from the payload
        string ediMsg = check req.getTextPayload();
        log:printInfo("Received a request from the client", payload=ediMsg);
        //MsgType? msgType = msgTypes[msgTypeId];
        string response = check invoicesFreight:carrierFreightDetailsJSON(ediMsg);
        return response;
    }


    resource function post jsonToEdi(@http:Payload invoicesFreight:X12_003030_110 edix12) returns string|error|http:Response {
        log:printInfo("Received a request from the client");
        // get EDI message from the payload
        //string ediMsg = check req.getJsonPayload().toString();
        log:printInfo("Received a request from the client", payload=edix12);
        //MsgType? msgType = msgTypes[msgTypeId];
        string response = check invoicesFreight:carrierFreightDetailsEDI(edix12);
        return response;
    }

}
