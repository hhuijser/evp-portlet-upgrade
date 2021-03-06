create table KaleoDraftDefinition (
	kaleoDraftDefinitionId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	title varchar(1000) null,
	content text null,
	version int,
	draftVersion int
)
go
