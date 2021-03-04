// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type GoogleContactsError distinct error;

public type OtherContactList record {
    Person[] otherContacts;
};

# Define a Person.
#
# + resourceName - String of the resource name
# + etag - ETag of the resource
# + metadata - Metadata about person
# + addresses - 
# + ageRanges - 
# + biographies - 
# + birthdays - 
# + braggingRights - 
# + calendarUrls - 
# + clientData - 
# + coverPhotos - 
# + emailAddresses - 
# + events - 
# + externalIds - 
# + fileAses - 
# + genders - 
# + imClients - 
# + memberships - 
# + names - 
# + phoneNumbers - 
# + photos - 
public type Person record {
    string resourceName;
    string etag;
    PersonMetadata metadata?;
    Address[] addresses?;
    AgeRangeType[] ageRanges?;
    Biography[] biographies?;
    Birthday[] birthdays?;
    BraggingRights[] braggingRights?;
    CalendarUrl[] calendarUrls?;
    ClientData[] clientData?;
    CoverPhoto[] coverPhotos?;
    EmailAddress[] emailAddresses?;
    Event[] events?;
    ExternalId[] externalIds?;
    FileAs[] fileAses?;
    Gender[] genders?;
    ImClient[] imClients?;
    json[] memberships?;
    Name[] names?;
    PhoneNumber[] phoneNumbers?;
    Photo[] photos?;
};

# Define a Person's meta data.
#
# + sources - 
# + objectType - 
public type PersonMetadata record {
    json[] 'sources?;
    string objectType?;
};

# Define a Create Person Payload.
#
# + addresses - 
# + emailAddresses - 
# + names - 
# + phoneNumbers - 
# + photos - 
public type CreatePerson record {
    Address[] addresses?;
    EmailAddress[] emailAddresses?;
    Name[] names?;
    PhoneNumber[] phoneNumbers?;
    Photo[] photos?;
};

# Define a Address.
#
# + metadata - Metadata about Address
# + formattedValue - 
# + type - 
# + formattedType - 
# + poBox - 
# + streetAddress - 
# + extendedAddress - 
# + city - 
# + region - 
# + postalCode - 
# + country - 
# + countryCode - 
public type Address record {
    FieldMetaData metadata?;
    string formattedValue?;
    string 'type?;
    string formattedType?;
    string poBox?;
    string streetAddress?;
    string extendedAddress?;
    string city?;
    string region?;
    string postalCode?;
    string country?;
    string countryCode?;
};

# Define a PhoneNumber.
#
# + metadata - Metadata about PhoneNumber
# + value - 
# + canonicalForm - 
# + type - 
# + formattedType - 
public type PhoneNumber record {
    FieldMetaData metadata?;
    string value?;
    string canonicalForm?;
    string 'type?;
    string formattedType?;
};

# Define a Name.
#
# + metadata - Metadata about Name
# + displayName - 
# + displayNameLastFirst - 
# + unstructuredName - 
# + familyName - 
# + givenName - 
# + middleName - 
# + honorificPrefix - 
# + honorificSuffix - 
# + phoneticFullName - 
# + phoneticFamilyName - 
# + phoneticGivenName - 
# + phoneticMiddleName - 
# + phoneticHonorificPrefix - 
# + phoneticHonorificSuffix - 
public type Name record {
    FieldMetaData metadata?;
    string displayName?;
    string displayNameLastFirst?;
    string unstructuredName?;
    string familyName?;
    string givenName?;
    string middleName?;
    string honorificPrefix?;
    string honorificSuffix?;
    string phoneticFullName?;
    string phoneticFamilyName?;
    string phoneticGivenName?;
    string phoneticMiddleName?;
    string phoneticHonorificPrefix?;
    string phoneticHonorificSuffix?;
};

# Define an Email Address.
#
# + metadata - Metadata about Email Address
# + value - 
# + type - 
# + formattedType - 
# + displayName - 
public type EmailAddress record {
    FieldMetaData metadata?;
    string value?;
    string 'type?;
    string formattedType?;
    string displayName?;
};

# Define a Photo.
#
# + metadata - Metadata about Photo
# + url - 
# + default - 
public type Photo record {
    FieldMetaData metadata?;
    string url?;
    boolean 'default?;
};

# Define an Age Range.
#
# + metadata - Metadata about Age Range
# + ageRange - 
public type AgeRangeType record {
    FieldMetaData metadata?;
    AgeRange ageRange?;
};

public type Biography record {
    FieldMetaData metadata?;
    string value?;
    ContentType contentType?;
};

public type Birthday record {
    FieldMetaData metadata?;
    string text?;
    Date date?;
};

public type BraggingRights record {
    FieldMetaData metadata?;
    string value?;
};

public type CalendarUrl record {
    FieldMetaData metadata?;
    string url?;
    string 'type?;
    string formattedType?;
};

public type ClientData record {
    FieldMetaData metadata?;
    string key?;
    string value?;
};

public type CoverPhoto record {
    FieldMetaData metadata?;
    string url?;
    boolean 'default?;
};

public type Event record {
    FieldMetaData metadata?;
    Date date?;
    string 'type?;
    string formattedType?;
};

public type ExternalId record {
    FieldMetaData metadata?;
    string value?;
    string 'type?;
    string formattedType?;
};

public type FileAs record {
    FieldMetaData metadata?;
    string value?;
};

public type Gender record {
    FieldMetaData metadata?;
    string value?;
    string formattedValue?;
    string addressMeAs?;
};

public type ImClient record {
    FieldMetaData metadata?;
    string username?;
    string 'type?;
    string formattedType?;
    string protocol?;
    string formattedProtocol?;
};

public type FieldMetaData record {
    boolean primary?;
    boolean verified?;
    MetaDataSource 'source?;
};

public type MetaDataSource record {
    string 'type?;
    string id?;
};

public type ContactGroupResponse record {
    string requestedResourceName;
    json status;
    json contactGroup;
};

public type ContactGroup record {
    string resourceName;
    string etag?;
    ContactGroupMetadata metadata?;
    GroupType groupType?;
    string name?;
    string formattedName?;
    string[] memberResourceNames?;
    int memberCount?;
    GroupClientData[] clientData?;
};

public type ContactGroupMetadata record {
    string updateTime?;
    boolean deleted?;
};

public enum AgeRange {
   AGE_RANGE_UNSPECIFIED,
   LESS_THAN_EIGHTEEN,
   EIGHTEEN_TO_TWENTY,
   TWENTY_ONE_OR_OLDER
}

public enum GroupType {
   GROUP_TYPE_UNSPECIFIED,
   USER_CONTACT_GROUP,
   SYSTEM_CONTACT_GROUP
}

public enum ContentType {
   CONTENT_TYPE_UNSPECIFIED,
   TEXT_PLAIN,
   TEXT_HTML
}

public type Date record {
    int year?;
    int month?;
    int day?;
};

public type GroupClientData record {
    string key?;
    string value?;
};

public type ContactGroupList record {
    ContactGroup[] contactGroups;
    int totalItems;
    string nextSyncToken;
};

public type ContactGroupBatch record {
    ContactGroupResponse[] responses;
};

public type SearchResponse record {
    json[] results;
};

public type SearchResult record {
    Person person;
};

public type ConnectionsResponse record {
    Person[] connections;
    string nextPageToken?;
    string nextSyncToken?;
    int totalPeople?;
    int totalItems?;
};

public type OtherContactListResponse record {
    Person[] otherContacts;
    string nextPageToken?;
    string nextSyncToken?;
};

public type BatchGetResponse record {
    PersonResponse[] responses?;
};

public type PersonResponse record {
    int httpStatusCode?;
    Person person?;
    string requestedResourceName?;
    json status?;
};

public type ConnectionsStreamResponse record {
    string nextSyncToken?;
    int totalPeople?;
    int totalItems?;
    stream<Person> connections?;
};

public type ContactListOptional record {
    string? pageToken = ();
    boolean? requestSyncToken = ();
    string? syncToken = ();
};
