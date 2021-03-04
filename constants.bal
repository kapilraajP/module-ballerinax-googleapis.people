// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

const string BASE_URL = "https://people.googleapis.com/v1";
public const string REFRESH_URL = "https://www.googleapis.com/oauth2/v4/token";
# Constant `EMPTY_STRING`.
const string EMPTY_STRING = "";
# Constant `SPACE`.
const string SPACE = " ";
# Constant `SLASH`.
const string SLASH = "/";

# Constant for paths.
const string CONTACT_GROUP_PATH = "/contactGroups";
const string LIST_PEOPLE_PATH = "/people/me/connections?personFields=";
const string PERSON_FIELDS = "?personFields=";
const string CREATE_CONTACT_PATH = "/people:createContact";
const string QUERY_PATH = "&query=";
const string UPDATE_PHOTO_PATH = ":updateContactPhoto";
const string DELETE_PHOTO_PATH = ":deleteContactPhoto";
const string UPDATE_CONTACT_PATH = ":updateContact";
const string DELETE_CONTACT_PATH = ":deleteContact";
const string BATCH_CONTACTGROUP_PATH = ":batchGet?resourceNames=";
const string LIST_DIRECTORY_PEOPLE_PATH ="/people:listDirectoryPeople";
const string READ_MASK_PATH = "?readMask=names,emailAddresses,phoneNumbers";
const string SOURCE_PATH = "&sources=DIRECTORY_SOURCE_TYPE_DOMAIN_CONTACT";
const string BATCH_CONTACT_PATH = "/people:batchGet";
const string BATCH_RESOURCE_PATH = "?resourceNames=people/me";
const string PERSON_FIELDS_PATH = "&personFields=names,emailAddresses,phoneNumbers";
const string SEARCH_CONTACT_PATH = "/people:searchContacts";
const string SEARCH_OTHERCONTACT_PATH = "/otherContacts:search";
const string COPY_CONTACT_PATH = ":copyOtherContactToMyContactsGroup";
const string LIST_OTHERCONTACT_PATH = "/otherContacts?readMask=";
