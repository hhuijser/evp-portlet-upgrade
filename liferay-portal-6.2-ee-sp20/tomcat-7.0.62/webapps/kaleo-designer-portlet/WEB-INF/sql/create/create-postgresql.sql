drop database lportal;
create database lportal encoding = 'UNICODE';
\c lportal;

create table KaleoDraftDefinition (
	kaleoDraftDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	title text null,
	content text null,
	version integer,
	draftVersion integer
);


create index IX_4DBA0C4E on KaleoDraftDefinition (companyId);
create index IX_94487B1B on KaleoDraftDefinition (companyId, name, version);
create unique index IX_A500C06 on KaleoDraftDefinition (companyId, name, version, draftVersion);


