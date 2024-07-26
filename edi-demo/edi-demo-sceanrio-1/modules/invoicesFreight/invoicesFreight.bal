# Returns the string `Hello` with the input string name.
#
# + name - name as a string
# + return - "Hello, " with the input string name
public function carrierFreightDetailsJSON(string edi) returns string|error {
    X12_003030_110|error ediobj= fromEdiString(edi);
    json jsonMsg = (check ediobj).toJson();
    return jsonMsg.toString();
}

public function carrierFreightDetailsEDI(X12_003030_110 payload) returns string|error {
    string|error ediString= toEdiString(payload);
    return ediString;
}

public function generateEDI() {
    TransactionSetHeader_Type st = {ST01__TransactionSetIdentifierCode: "a", ST02__TransactionSetControlNumber: "b"};
    //X12_003030_110 x12_003030_110 ={TransactionSetHeader_Type:st}
}
