
// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/config;
import ballerina/test;
import ballerina/io;

//Create an endpoint to use Gmail Connector
GoogleContactsConfiguration gContactConfig = {
    oauthClientConfig: {
        accessToken: config:getAsString("ACCESS_TOKEN"),
        refreshConfig: {
            refreshUrl: REFRESH_URL,
            refreshToken: config:getAsString("REFRESH_TOKEN"),
            clientId: config:getAsString("CLIENT_ID"),
            clientSecret: config:getAsString("CLIENT_SECRET")
        }
    }
};

Client gContactClient = new (gContactConfig);

// @test:Config {}
// function testListOtherContacts() {
//     var listContacts = gContactClient->listOtherContacts();
//     io:println(listContacts);
//     if (listContacts is json[]) {
//         test:assertTrue(true, msg = "List Other Contacts Failed");
//     } else {
//         test:assertFail(msg = listContacts.message());
//     }
// }

// @test:Config {}
// function testGetPeople() {
//     var getPeople = gContactClient->getPeople("people/103798157137551654042");
//     if (getPeople is json) {
//         test:assertTrue(true, msg = "List Other Contacts Failed");
//     } else {
//         test:assertFail(msg = getPeople.message());
//     }
// }

// @test:Config {}
// function testBatchGetPeople() {
//     var BatchGetPeople = gContactClient->batchGetPeople();
//     if (BatchGetPeople is json) {
//         test:assertTrue(true, msg = "List Other Contacts Failed");
//     } else {
//         test:assertFail(msg = BatchGetPeople.message());
//     }
// }

// @test:Config {}
// function testListDirectoryPeople() {
//     var listDirectoryPeople = gContactClient->listDirectoryPeople();
//     if (listDirectoryPeople is json) {
//         test:assertTrue(true, msg = "List Other Contacts Failed");
//     } else {
//         test:assertFail(msg = listDirectoryPeople.message());
//     }
// }

// @test:Config {}
// function testCreateContact() {
//     var createContact = gContactClient->createContact();
//     if (createContact is json) {
//         test:assertTrue(true, msg = "List Other Contacts Failed");
//     } else {
//         test:assertFail(msg = createContact.message());
//     }
// }

// @test:Config {}
// function testListPeopleConnection() {
//     var listPeopleConnection = gContactClient->listPeopleConnection("people/me");
//     if (listPeopleConnection is json) {
//         test:assertTrue(true, msg = "List Other Contacts Failed");
//     } else {
//         test:assertFail(msg = listPeopleConnection.message());
//     }
// }

string contactGroupResourceName="";

@test:Config {}
function testCreateContactGroup() {
    io:println("Running Create Contact Group Test");
    var createContactGroup = gContactClient->createContactGroup();
    if (createContactGroup is ContactGroup) {
        contactGroupResourceName = <@untainted> createContactGroup.resourceName;
        test:assertTrue(true, msg = "Creating Contact Group Failed");
    } else {
        test:assertFail(msg = createContactGroup.message());
    }
}

@test:Config {}
function testGetContactGroup() {
    io:println("Running Get Contact Group Test");
    io:println(contactGroupResourceName);
    var getContactGroup = gContactClient->getContactGroup(contactGroupResourceName);
    if (getContactGroup is ContactGroup) {
        test:assertTrue(true, msg = "Fetching Contact Group Failed");
    } else {
        test:assertFail(msg = getContactGroup.message());
    }
}

@test:Config {}
function testbatchGetContactGroup() {
    io:println("Running BatchGet Contact Group Test");
    io:println(contactGroupResourceName);
    var batchGetContactGroup = gContactClient->batchGetContactGroup(contactGroupResourceName);
    if (batchGetContactGroup is json) {
        test:assertTrue(true, msg = "BatchGet Contact Group Failed");
    } else {
        test:assertFail(msg = batchGetContactGroup.message());
    }
}

@test:Config {}
function testListContactGroup() {
    io:println("Running List Contact Group Test");
    var listContactGroup = gContactClient->listContactGroup();
    if (listContactGroup is json) {
        test:assertTrue(true, msg = "List Contact Group Failed");
    } else {
        test:assertFail(msg = listContactGroup.message());
    }
}

@test:Config {}
function testDeleteContactGroup() {
    io:println("Running Delete Contact Group Test");
    var deleteContactGroup = gContactClient->deleteContactGroup(contactGroupResourceName);
    if (deleteContactGroup is json) {
        test:assertTrue(true, msg = "Delete Contact Group Failed");
    } else {
        test:assertFail(msg = deleteContactGroup.message());
    }
}