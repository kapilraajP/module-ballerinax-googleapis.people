
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

# Google Cpntacts Client.
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

    remote function listOtherContacts() returns @tainted json | error {
        var path = "/v1/otherContacts?readMask=names,emailAddresses,phoneNumbers";
                http:Request request = new;
        var httpResponse = self.gContactClient->get(<@untainted>path, request);
        if (httpResponse is http:Response) {
            string statusCode = httpResponse.statusCode.toString();
            string reason = httpResponse.getJsonPayload().toString();
            io:println(statusCode);
            io:println( reason);
        } else {
            return createError("Not an Http Response");
        }
        
    }
}


