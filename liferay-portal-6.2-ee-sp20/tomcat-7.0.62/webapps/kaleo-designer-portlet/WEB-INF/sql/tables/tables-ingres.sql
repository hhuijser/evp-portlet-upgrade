create table KaleoDraftDefinition (
	kaleoDraftDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	title varchar(1000) null,
	content long varchar null,
	version integer,
	draftVersion integer
);
