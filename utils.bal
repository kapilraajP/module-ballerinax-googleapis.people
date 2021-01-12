isolated function createError(string message, error? err = ()) returns error { 
    error googleContactsError;
    if(err is error){
        googleContactsError = GoogleContactsError(message, err);
    } else {
        googleContactsError = GoogleContactsError(message);
    }
    return googleContactsError;
}