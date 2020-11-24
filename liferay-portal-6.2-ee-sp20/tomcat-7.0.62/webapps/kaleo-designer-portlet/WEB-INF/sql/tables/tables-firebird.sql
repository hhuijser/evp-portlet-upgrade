create table KaleoDraftDefinition (
	kaleoDraftDefinitionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	title varchar(4000),
	content blob,
	version integer,
	draftVersion integer
);
