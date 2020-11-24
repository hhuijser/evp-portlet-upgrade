database sysmaster;
drop database lportal;
create database lportal WITH LOG;

create procedure 'lportal'.isnull(test_string varchar)
returning boolean;
IF test_string IS NULL THEN
	RETURN 't';
ELSE
	RETURN 'f';
END IF
end procedure;


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


create index IX_65CA6CC9 on KaleoProcess (DDLRecordSetId);
create index IX_A29A06D5 on KaleoProcess (groupId);

create index IX_3F378B4D on KaleoProcessLink (kaleoProcessId);
create unique index IX_10E0E9D0 on KaleoProcessLink (kaleoProcessId, workflowTaskName);


