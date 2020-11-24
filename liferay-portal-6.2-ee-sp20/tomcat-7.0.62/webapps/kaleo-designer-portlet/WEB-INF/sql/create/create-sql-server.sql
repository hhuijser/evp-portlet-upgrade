drop database lportal;
create database lportal;

go

use lportal;

create table KaleoDraftDefinition (
	kaleoDraftDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name nvarchar(75) null,
	title nvarchar(2000) null,
	content nvarchar(max) null,
	version int,
	draftVersion int
);


create index IX_4DBA0C4E on KaleoDraftDefinition (companyId);
create index IX_94487B1B on KaleoDraftDefinition (companyId, name, version);
create unique index IX_A500C06 on KaleoDraftDefinition (companyId, name, version, draftVersion);


