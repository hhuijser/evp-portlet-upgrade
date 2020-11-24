create table KaleoDraftDefinition (
	kaleoDraftDefinitionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	title lvarchar,
	content text,
	version int,
	draftVersion int
)
extent size 16 next size 16
lock mode row;
