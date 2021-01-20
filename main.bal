
// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/io;
import ballerina/oauth2;

# Object for GoogleContacts configuration.
#
# + oauthClientConfig - OAuth client configuration.
# + secureSocketConfig - HTTP client configuration.
public type GoogleContactsConfiguration record {
    oauth2:DirectTokenConfig oauthClientConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Google Contacts Client.
#
# + gContactClient - The HTTP Client
public client class Client{
    http:Client gContactClient;

    public function init(GoogleContactsConfiguration gContactConfig) {
        // Create OAuth2 provider.
        oauth2:OutboundOAuth2Provider oauth2Provider = new (gContactConfig.oauthClientConfig);
        // Create bearer auth handler using created provider.
        http:BearerAuthHandler bearerHandler = new (oauth2Provider);
        http:ClientSecureSocket? result = gContactConfig?.secureSocketConfig;

        // Create google contact http client.
        if (result is http:ClientSecureSocket) {
            self.gContactClient = new (BASE_URL, {
                auth: {
                    authHandler: bearerHandler
                },
                secureSocket: result
            });
        } else {
            self.gContactClient = new (BASE_URL, {
                auth: {
                    authHandler: bearerHandler
                }
            });
        }
    }

    remote function listOtherContacts() returns @tainted json[] | error {
        var path = "/v1/otherContacts?readMask=names,emailAddresses,phoneNumbers";
        http:Request request = new;
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error listOtherContactsResponse = httpResponse.getJsonPayload();
            if(listOtherContactsResponse is json){
                io:println(statusCode);
                json[] listOtherContacts = <json[]> listOtherContactsResponse.otherContacts;
                io:println(listOtherContacts);
                io:println("");
                foreach var listOtherContact in listOtherContacts {
                    //OtherContact otherContact = check <@untainted> listOtherContact.cloneWithType(OtherContact);
                    io:println("listOtherContact");
                    //io:println(otherContact);
                    io:println(listOtherContact);
                    io:println("");
                }
                return listOtherContacts;
            }
            else{
                io:println(statusCode);
                return createError("Error in listing other contacts");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function getPeople(string resourceName) returns @tainted json | error {
        var path = "/v1/"+resourceName+"?personFields=names";
        http:Request request = new;
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            if(getPeopleResponse is json){
                io:println(statusCode);
                io:println(getPeopleResponse);
                return getPeopleResponse;
            }
            else{
                io:println(statusCode);
                return createError("Error in getting people");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function batchGetPeople() returns @tainted json | error {
        var path = "/v1/people:batchGet?resourceNames=people/me";
        http:Request request = new;
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            if(getPeopleResponse is json){
                io:println(statusCode);
                io:println(<json[]>getPeopleResponse.responses);
                return getPeopleResponse;
            }
            else{
                io:println(statusCode);
                return createError("Error in getting people");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function listDirectoryPeople() returns @tainted json | error {
        var path = "/v1/people:listDirectoryPeople?readMask=names&sources=DIRECTORY_SOURCE_TYPE_DOMAIN_CONTACT";
        http:Request request = new;
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            io:println(getPeopleResponse);
            if(getPeopleResponse is json){
                io:println(statusCode);
                return getPeopleResponse;
            }
            else{
                io:println(statusCode);
                return createError("Error in getting people");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function createContact() returns @tainted json | error {
        var path = "/v1/people:createContact?personFields=names,emailAddresses,phoneNumbers&sources=READ_SOURCE_TYPE_PROFILE";
        http:Request request = new;
        json createContactJsonPayload = {};
        request.setJsonPayload(createContactJsonPayload);
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            io:println(getPeopleResponse);
            if(getPeopleResponse is json){
                io:println(statusCode);
                return getPeopleResponse;
            }
            else{
                io:println(statusCode);
                return createError("Error in getting people");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function listPeopleConnection(string resourceName) returns @tainted json | error {
        var path = "/v1/"+resourceName+"/connections?personFields=names,emailAddresses,phoneNumbers,photos";
        http:Request request = new;
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            //io:println(getPeopleResponse);
            if(getPeopleResponse is json){
                io:println(statusCode);
                json listContacts = <json> getPeopleResponse.connections;
                io:println(listContacts);
                io:println("listContact1");
                ListContactGroup listContactGroup = check <@untainted> listContacts.cloneWithType(ListContactGroup);
                io:println("listContact2");
                io:println(listContactGroup);
                foreach var listContact in listContactGroup {
                    io:println("listContact3");
                    io:println(listContact);
                    io:println("");
                }
                return listContacts;
            }
            else{
                io:println(statusCode);
                return createError("Error in getting people");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function createContactGroup() returns @tainted ContactGroup | error {
        var path = "/v1/contactGroups";
        http:Request request = new;

        json createContactJsonPayload = { "contactGroup": {"name":"TestContactGroup1"}};
        request.setJsonPayload(createContactJsonPayload);
        var httpResponse = self.gContactClient->post(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error createContactGroup = httpResponse.getJsonPayload();
            if(createContactGroup is json){
                io:println(createContactGroup);
                ContactGroup | error contactGroup = <@untainted> createContactGroup.cloneWithType(ContactGroup);
                if(contactGroup is ContactGroup){
                    return contactGroup;
                }
                else{
                    return createError(<string>createContactGroup.'error.message);
                }
            }
            else{
                return createError("Error in creating Contact Group");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function batchGetContactGroup(string resourceName) returns @tainted json | error {
        var path = "/v1/contactGroups:batchGet?resourceNames="+resourceName;
        http:Request request = new;
        // ContactGroup cg = {};
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            io:println(getPeopleResponse);
            if(getPeopleResponse is json){
                json[] listContacts = <json[]> getPeopleResponse.responses;
                ContactGroupResponse c = check <@untainted> listContacts[0].cloneWithType(ContactGroupResponse);
                io:println(c);
                // json[] listContacts = <json[]> getPeopleResponse.connections;
                // foreach var listContact in listContacts {
                //     io:println("listContact");
                //     //io:println(otherContact);
                //     io:println(<json>listContact);
                //     ContactGroup contactGroup = check <@untainted> listContact.cloneWithType(ContactGroup);
                //     io:println("");
                // }
                // return listContacts;
                return getPeopleResponse;
            }
            else{
                io:println(statusCode);
                return createError("Error in Batch getting Contact Group");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function listContactGroup() returns @tainted json | error {
        var path = "/v1/contactGroups";
        http:Request request = new;
        // ContactGroup cg = {};
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            if(getPeopleResponse is json){
                json[] listContacts = <json[]> getPeopleResponse.contactGroups;
                foreach var listContact in listContacts {
                    io:println(<json>listContact);
                    //ContactGroup contactGroup = check <@untainted> listContact.cloneWithType(ContactGroup);
                }
                // return listContacts;
                return getPeopleResponse;
            }
            else{
                io:println(statusCode);
                return createError("Error in listing Contact Group");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function getContactGroup(string resourceName) returns @tainted ContactGroup | error {
        var path = "/v1/"+resourceName;
        http:Request request = new;
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getContactGroup = httpResponse.getJsonPayload();
            if(getContactGroup is json){
                ContactGroup contactGroup = check <@untainted> getContactGroup.cloneWithType(ContactGroup);
                io:println(contactGroup);
                return contactGroup;
            }
            else{
                io:println(statusCode);
                return createError("Error in fetching Contact Group");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

    remote function deleteContactGroup(string resourceName) returns @tainted json | error {
        var path = "/v1/"+resourceName;
        http:Request request = new;
        var httpResponse = self.gContactClient->delete(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            json|error getPeopleResponse = httpResponse.getJsonPayload();
            if(getPeopleResponse is json){
                io:println(statusCode);
                io:println(getPeopleResponse);
                return getPeopleResponse;
            }
            else{
                io:println(statusCode);
                return createError("Error in deleting Contact Group");
            }
        } else {
            return createError("Not an Http Response");
        }  
    }

}