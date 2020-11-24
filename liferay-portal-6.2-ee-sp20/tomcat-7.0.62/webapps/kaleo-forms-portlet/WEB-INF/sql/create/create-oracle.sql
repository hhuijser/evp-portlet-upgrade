drop user &1 cascade;
create user &1 identified by &2;
grant connect,resource to &1;
connect &1/&2;
set define off;

create table KaleoProcess (
	kaleoProcessId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	DDLRecordSetId number(30,0),
	DDMTemplateId number(30,0),
	workflowDefinitionName VARCHAR2(75 CHAR) null,
	workflowDefinitionVersion number(30,0)
);

create table KaleoProcessLink (
	kaleoProcessLinkId number(30,0) not null primary key,
	kaleoProcessId number(30,0),
	workflowTaskName VARCHAR2(75 CHAR) null,
	DDMTemplateId number(30,0)
);


create index IX_65CA6CC9 on KaleoProcess (DDLRecordSetId);
create index IX_A29A06D5 on KaleoProcess (groupId);

create index IX_3F378B4D on KaleoProcessLink (kaleoProcessId);
create unique index IX_10E0E9D0 on KaleoProcessLink (kaleoProcessId, workflowTaskName);



quit