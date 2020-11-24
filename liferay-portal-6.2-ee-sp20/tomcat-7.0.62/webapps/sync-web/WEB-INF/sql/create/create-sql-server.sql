drop database lportal;
create database lportal;

go

use lportal;

create table SyncDLFileVersionDiff (
	syncDLFileVersionDiffId bigint not null primary key,
	fileEntryId bigint,
	sourceFileVersionId bigint,
	targetFileVersionId bigint,
	dataFileEntryId bigint,
	size_ bigint,
	expirationDate datetime null
);

create table SyncDLObject (
	syncDLObjectId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createTime bigint,
	modifiedTime bigint,
	repositoryId bigint,
	parentFolderId bigint,
	treePath nvarchar(2000) null,
	name nvarchar(255) null,
	extension nvarchar(75) null,
	mimeType nvarchar(75) null,
	description nvarchar(2000) null,
	changeLog nvarchar(75) null,
	extraSettings nvarchar(max) null,
	version nvarchar(75) null,
	versionId bigint,
	size_ bigint,
	checksum nvarchar(75) null,
	event nvarchar(75) null,
	lanTokenKey nvarchar(75) null,
	lastPermissionChangeDate datetime null,
	lockExpirationDate datetime null,
	lockUserId bigint,
	lockUserName nvarchar(75) null,
	type_ nvarchar(75) null,
	typePK bigint,
	typeUuid nvarchar(75) null
);

create table SyncDevice (
	uuid_ nvarchar(75) null,
	syncDeviceId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	type_ nvarchar(75) null,
	buildNumber bigint,
	featureSet int,
	hostname nvarchar(75) null,
	status int
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


