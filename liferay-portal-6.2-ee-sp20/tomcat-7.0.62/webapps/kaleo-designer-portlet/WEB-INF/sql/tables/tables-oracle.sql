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
