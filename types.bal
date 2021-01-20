public type GoogleContactsError distinct error;

public type OtherContact record {|
   string resourceName;
   string etag;
   Name[] names?;
   EmailAddress[] emailAddresses?;
|};

public type Name record {|
   OtherContactNameMetaData metadata;
   string value;
|};

public type EmailAddress record {|
   OtherContactEmailMetaData metadata;
   string value;
|};

public type OtherContactEmailMetaData record {|
   boolean primary;
   OtherContactMetaDataSource 'source;
|};

public type OtherContactNameMetaData record {|
   boolean primary;
   OtherContactMetaDataSource 'source;
   string displayName;
   string familyName;
   string givenName;
   string middleName;
   string displayNameLastFirst;
   string unstructuredName;
|};

public type OtherContactMetaDataSource record {|
   string 'type;
   string id;
|};

// public type Person record {|
//   string resourceName?;
//   string etag?;
//   PersonMetadata metadata?;
//   Address[] addresses?;
//   AgeRangeType[] ageRanges?;
//   AgeRangeType[] ageRanges?;
//   Biography biographies?;
//   Birthday birthdays?;
//   BraggingRights braggingRights?;
//   CalendarUrl calendarUrls?;
//   ClientData clientData?;
//   CoverPhoto coverPhotos?;
//   EmailAddress emailAddresses?;
//   Event events?;
//   ExternalId externalIds?;
//   FileAs fileAses?;
//   Gender genders?;
//   ImClient imClients?;
//   Interest interests?;
//   Locale locales?;
//   Location locations?;
//   Membership memberships?;
//   MiscKeyword miscKeywords?;
//   Name names?;
//   Nickname nicknames?;
//   Occupation occupations?;
//   Organization organizations?;
//   PhoneNumber phoneNumbers?;
//   Photo photos?;
//   Relation relations?;
//   RelationshipInterest relationshipInterests?;
//   RelationshipStatus relationshipStatuses?;
//   Residence residences?;
//   SipAddress sipAddresses?;
//   Skill skills?;
//   Tagline taglines?;
//   Url[] urls?;
//   userDefined[] userDefined?;
// |};

public type ContactGroupResponse record {|
   string requestedResourceName?;
   json status?;
   ContactGroup contactGroup?;
|};

public type ContactGroup record {|
   string resourceName;
   string etag;
   ContactGroupMetadata metadata;
   GroupType groupType?;
   string name?;
   string formattedName?;
   string[] memberResourceNames?;
   int memberCount?;
|};

public type ContactGroupMetadata record {|
   string updateTime?;
   boolean deleted?;
|};

public enum GroupType {
   GROUP_TYPE_UNSPECIFIED,
   USER_CONTACT_GROUP,
   SYSTEM_CONTACT_GROUP
}

public type ListContactGroup record {|
    ContactGroup[] contactGroupList = [];
|};