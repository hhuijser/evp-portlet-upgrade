create table SyncDLFileVersionDiff (
	syncDLFileVersionDiffId bigint not null primary key,
	fileEntryId bigint,
	sourceFileVersionId bigint,
	targetFileVersionId bigint,
	dataFileEntryId bigint,
	size_ bigint,
	expirationDate timestamp
);

create table SyncDLObject (
	syncDLObjectId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createTime bigint,
	modifiedTime bigint,
	repositoryId bigint,
	parentFolderId bigint,
	treePath varchar(750),
	name varchar(255),
	extension varchar(75),
	mimeType varchar(75),
	description varchar(750),
	changeLog varchar(75),
	extraSettings clob,
	version varchar(75),
	versionId bigint,
	size_ bigint,
	checksum varchar(75),
	event varchar(75),
	lanTokenKey varchar(75),
	lastPermissionChangeDate timestamp,
	lockExpirationDate timestamp,
	lockUserId bigint,
	lockUserName varchar(75),
	type_ varchar(75),
	typePK bigint,
	typeUuid varchar(75)
);

create table SyncDevice (
	uuid_ varchar(75),
	syncDeviceId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	type_ varchar(75),
	buildNumber bigint,
	featureSet integer,
	hostname varchar(75),
	status integer
);
