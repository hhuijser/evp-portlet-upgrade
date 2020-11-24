create table KaleoDraftDefinition (
	kaleoDraftDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	name varchar(75) null,
	title long varchar null,
	content long varchar null,
	version integer,
	draftVersion integer
);
