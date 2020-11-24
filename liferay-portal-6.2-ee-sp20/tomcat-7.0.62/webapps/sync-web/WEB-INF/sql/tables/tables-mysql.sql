create table SyncDLFileVersionDiff (
	syncDLFileVersionDiffId bigint not null primary key,
	fileEntryId bigint,
	sourceFileVersionId bigint,
	targetFileVersionId bigint,
	dataFileEntryId bigint,
	size_ bigint,
	expirationDate datetime null
) engine InnoDB;

create table SyncDLObject (
	syncDLObjectId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createTime bigint,
	modifiedTime bigint,
	repositoryId bigint,
	parentFolderId bigint,
	treePath longtext null,
	name varchar(255) null,
	extension varchar(75) null,
	mimeType varchar(75) null,
	description longtext null,
	changeLog varchar(75) null,
	extraSettings longtext null,
	version varchar(75) null,
	versionId bigint,
	size_ bigint,
	checksum varchar(75) null,
	event varchar(75) null,
	lanTokenKey varchar(75) null,
	lastPermissionChangeDate datetime null,
	lockExpirationDate datetime null,
	lockUserId bigint,
	lockUserName varchar(75) null,
	type_ varchar(75) null,
	typePK bigint,
	typeUuid varchar(75) null
) engine InnoDB;

create table SyncDevice (
	uuid_ varchar(75) null,
	syncDeviceId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	type_ varchar(75) null,
	buildNumber bigint,
	featureSet integer,
	hostname varchar(75) null,
	status integer
) engine InnoDB;
