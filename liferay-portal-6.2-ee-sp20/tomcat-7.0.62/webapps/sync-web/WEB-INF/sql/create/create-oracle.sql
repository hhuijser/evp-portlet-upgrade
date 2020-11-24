drop user &1 cascade;
create user &1 identified by &2;
grant connect,resource to &1;
connect &1/&2;
set define off;

create table SyncDLFileVersionDiff (
	syncDLFileVersionDiffId number(30,0) not null primary key,
	fileEntryId number(30,0),
	sourceFileVersionId number(30,0),
	targetFileVersionId number(30,0),
	dataFileEntryId number(30,0),
	size_ number(30,0),
	expirationDate timestamp null
);

create table SyncDLObject (
	syncDLObjectId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createTime number(30,0),
	modifiedTime number(30,0),
	repositoryId number(30,0),
	parentFolderId number(30,0),
	treePath varchar2(4000) null,
	name VARCHAR2(255 CHAR) null,
	extension VARCHAR2(75 CHAR) null,
	mimeType VARCHAR2(75 CHAR) null,
	description varchar2(4000) null,
	changeLog VARCHAR2(75 CHAR) null,
	extraSettings clob null,
	version VARCHAR2(75 CHAR) null,
	versionId number(30,0),
	size_ number(30,0),
	checksum VARCHAR2(75 CHAR) null,
	event VARCHAR2(75 CHAR) null,
	lanTokenKey VARCHAR2(75 CHAR) null,
	lastPermissionChangeDate timestamp null,
	lockExpirationDate timestamp null,
	lockUserId number(30,0),
	lockUserName VARCHAR2(75 CHAR) null,
	type_ VARCHAR2(75 CHAR) null,
	typePK number(30,0),
	typeUuid VARCHAR2(75 CHAR) null
);

create table SyncDevice (
	uuid_ VARCHAR2(75 CHAR) null,
	syncDeviceId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	type_ VARCHAR2(75 CHAR) null,
	buildNumber number(30,0),
	featureSet number(30,0),
	hostname VARCHAR2(75 CHAR) null,
	status number(30,0)
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



quit