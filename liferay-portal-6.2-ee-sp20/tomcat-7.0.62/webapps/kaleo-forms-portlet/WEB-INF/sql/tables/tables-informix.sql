create table KaleoProcess (
	kaleoProcessId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	DDLRecordSetId int8,
	DDMTemplateId int8,
	workflowDefinitionName varchar(75),
	workflowDefinitionVersion int
)
extent size 16 next size 16
lock mode row;

create table KaleoProcessLink (
	kaleoProcessLinkId int8 not null primary key,
	kaleoProcessId int8,
	workflowTaskName varchar(75),
	DDMTemplateId int8
)
extent size 16 next size 16
lock mode row;
