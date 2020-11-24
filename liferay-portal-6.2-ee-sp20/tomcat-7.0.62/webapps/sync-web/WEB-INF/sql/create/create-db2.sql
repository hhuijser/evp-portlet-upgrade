drop database lportal;
create database lportal pagesize 8192;
connect to lportal;
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


create index IX_A9B43C55 on SyncDLFileVersionDiff (expirationDate);
create unique index IX_AC4C7667 on SyncDLFileVersionDiff (fileEntryId, sourceFileVersionId, targetFileVersionId);

create index IX_8D4FDC9F on SyncDLObject (modifiedTime, repositoryId, event);
create index IX_38C38A09 on SyncDLObject (repositoryId, event);
create index IX_3BE7BB8D on SyncDLObject (repositoryId, parentFolderId, type_);
create index IX_57F62914 on SyncDLObject (repositoryId, type_);
create unique index IX_E3F57BD6 on SyncDLObject (type_, typePK);
create index IX_1CCA3B5 on SyncDLObject (version, type_);

create index IX_176DF87B on SyncDevice (companyId, userName);
create index IX_A18EDDB1 on SyncDevice (userId);
create index IX_AE38DEAB on SyncDevice (uuid_, companyId);


