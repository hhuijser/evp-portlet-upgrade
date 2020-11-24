drop user &1 cascade;
create user &1 identified by &2;
grant connect,resource to &1;
connect &1/&2;
set define off;

create table KaleoDraftDefinition (
	kaleoDraftDefinitionId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name VARCHAR2(75 CHAR) null,
	title varchar2(4000) null,
	content clob null,
	version number(30,0),
	draftVersion number(30,0)
);


create index IX_4DBA0C4E on KaleoDraftDefinition (companyId);
create index IX_94487B1B on KaleoDraftDefinition (companyId, name, version);
create unique index IX_A500C06 on KaleoDraftDefinition (companyId, name, version, draftVersion);



quit