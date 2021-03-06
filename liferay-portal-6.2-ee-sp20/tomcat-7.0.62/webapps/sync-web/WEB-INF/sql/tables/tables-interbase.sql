create table SyncDLFileVersionDiff (
	syncDLFileVersionDiffId int64 not null primary key,
	fileEntryId int64,
	sourceFileVersionId int64,
	targetFileVersionId int64,
	dataFileEntryId int64,
	size_ int64,
	expirationDate timestamp
);

create table SyncDLObject (
	syncDLObjectId int64 not null primary key,
	companyId int64,
	userId int64,
	userName varchar(75),
	createTime int64,
	modifiedTime int64,
	repositoryId int64,
	parentFolderId int64,
	treePath varchar(4000),
	name varchar(255),
	extension varchar(75),
	mimeType varchar(75),
	description varchar(4000),
	changeLog varchar(75),
	extraSettings blob,
	version varchar(75),
	versionId int64,
	size_ int64,
	checksum varchar(75),
	event varchar(75),
	lanTokenKey varchar(75),
	lastPermissionChangeDate timestamp,
	lockExpirationDate timestamp,
	lockUserId int64,
	lockUserName varchar(75),
	type_ varchar(75),
	typePK int64,
	typeUuid varchar(75)
);

create table SyncDevice (
	uuid_ varchar(75),
	syncDeviceId int64 not null primary key,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	type_ varchar(75),
	buildNumber int64,
	featureSet integer,
	hostname varchar(75),
	status integer
);
