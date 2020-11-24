drop user &1 cascade;
create user &1 identified by &2;
grant connect,resource to &1;
connect &1/&2;
set define off;

create table KaleoAction (
	kaleoActionId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName VARCHAR2(200 CHAR) null,
	kaleoClassPK number(30,0),
	kaleoDefinitionId number(30,0),
	kaleoNodeName VARCHAR2(200 CHAR) null,
	name VARCHAR2(200 CHAR) null,
	description varchar2(4000) null,
	executionType VARCHAR2(20 CHAR) null,
	script clob null,
	scriptLanguage VARCHAR2(75 CHAR) null,
	scriptRequiredContexts varchar2(4000) null,
	priority number(30,0)
);

create table KaleoCondition (
	kaleoConditionId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoNodeId number(30,0),
	script clob null,
	scriptLanguage VARCHAR2(75 CHAR) null,
	scriptRequiredContexts varchar2(4000) null
);

create table KaleoDefinition (
	kaleoDefinitionId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name VARCHAR2(200 CHAR) null,
	title varchar2(4000) null,
	description varchar2(4000) null,
	content clob null,
	version number(30,0),
	active_ number(1, 0),
	startKaleoNodeId number(30,0)
);

create table KaleoInstance (
	kaleoInstanceId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoDefinitionName VARCHAR2(200 CHAR) null,
	kaleoDefinitionVersion number(30,0),
	rootKaleoInstanceTokenId number(30,0),
	className VARCHAR2(200 CHAR) null,
	classPK number(30,0),
	completed number(1, 0),
	completionDate timestamp null,
	workflowContext clob null
);

create table KaleoInstanceToken (
	kaleoInstanceTokenId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoInstanceId number(30,0),
	parentKaleoInstanceTokenId number(30,0),
	currentKaleoNodeId number(30,0),
	currentKaleoNodeName VARCHAR2(200 CHAR) null,
	className VARCHAR2(200 CHAR) null,
	classPK number(30,0),
	completed number(1, 0),
	completionDate timestamp null
);

create table KaleoLog (
	kaleoLogId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName VARCHAR2(200 CHAR) null,
	kaleoClassPK number(30,0),
	kaleoDefinitionId number(30,0),
	kaleoInstanceId number(30,0),
	kaleoInstanceTokenId number(30,0),
	kaleoTaskInstanceTokenId number(30,0),
	kaleoNodeName VARCHAR2(200 CHAR) null,
	terminalKaleoNode number(1, 0),
	kaleoActionId number(30,0),
	kaleoActionName VARCHAR2(200 CHAR) null,
	kaleoActionDescription varchar2(4000) null,
	previousKaleoNodeId number(30,0),
	previousKaleoNodeName VARCHAR2(200 CHAR) null,
	previousAssigneeClassName VARCHAR2(200 CHAR) null,
	previousAssigneeClassPK number(30,0),
	currentAssigneeClassName VARCHAR2(200 CHAR) null,
	currentAssigneeClassPK number(30,0),
	type_ VARCHAR2(50 CHAR) null,
	comment_ clob null,
	startDate timestamp null,
	endDate timestamp null,
	duration number(30,0),
	workflowContext clob null
);

create table KaleoNode (
	kaleoNodeId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	name VARCHAR2(200 CHAR) null,
	metadata varchar2(4000) null,
	description varchar2(4000) null,
	type_ VARCHAR2(20 CHAR) null,
	initial_ number(1, 0),
	terminal number(1, 0)
);

create table KaleoNotification (
	kaleoNotificationId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName VARCHAR2(200 CHAR) null,
	kaleoClassPK number(30,0),
	kaleoDefinitionId number(30,0),
	kaleoNodeName VARCHAR2(200 CHAR) null,
	name VARCHAR2(200 CHAR) null,
	description varchar2(4000) null,
	executionType VARCHAR2(20 CHAR) null,
	template clob null,
	templateLanguage VARCHAR2(75 CHAR) null,
	notificationTypes VARCHAR2(25 CHAR) null
);

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoNotificationId number(30,0),
	recipientClassName VARCHAR2(200 CHAR) null,
	recipientClassPK number(30,0),
	recipientRoleType number(30,0),
	address VARCHAR2(255 CHAR) null
);

create table KaleoTask (
	kaleoTaskId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoNodeId number(30,0),
	name VARCHAR2(200 CHAR) null,
	description varchar2(4000) null
);

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName VARCHAR2(200 CHAR) null,
	kaleoClassPK number(30,0),
	kaleoDefinitionId number(30,0),
	kaleoNodeId number(30,0),
	assigneeClassName VARCHAR2(200 CHAR) null,
	assigneeClassPK number(30,0),
	assigneeActionId VARCHAR2(75 CHAR) null,
	assigneeScript clob null,
	assigneeScriptLanguage VARCHAR2(75 CHAR) null,
	assigneeScriptRequiredContexts varchar2(4000) null
);

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoInstanceId number(30,0),
	kaleoInstanceTokenId number(30,0),
	kaleoTaskInstanceTokenId number(30,0),
	kaleoTaskId number(30,0),
	kaleoTaskName VARCHAR2(200 CHAR) null,
	assigneeClassName VARCHAR2(200 CHAR) null,
	assigneeClassPK number(30,0),
	completed number(1, 0),
	completionDate timestamp null
);

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoInstanceId number(30,0),
	kaleoInstanceTokenId number(30,0),
	kaleoTaskId number(30,0),
	kaleoTaskName VARCHAR2(200 CHAR) null,
	className VARCHAR2(200 CHAR) null,
	classPK number(30,0),
	completionUserId number(30,0),
	completed number(1, 0),
	completionDate timestamp null,
	dueDate timestamp null,
	workflowContext clob null
);

create table KaleoTimer (
	kaleoTimerId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName VARCHAR2(200 CHAR) null,
	kaleoClassPK number(30,0),
	kaleoDefinitionId number(30,0),
	name VARCHAR2(75 CHAR) null,
	blocking number(1, 0),
	description varchar2(4000) null,
	duration number(30,20),
	scale VARCHAR2(75 CHAR) null,
	recurrenceDuration number(30,20),
	recurrenceScale VARCHAR2(75 CHAR) null
);

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName VARCHAR2(200 CHAR) null,
	kaleoClassPK number(30,0),
	kaleoDefinitionId number(30,0),
	kaleoInstanceId number(30,0),
	kaleoInstanceTokenId number(30,0),
	kaleoTaskInstanceTokenId number(30,0),
	kaleoTimerId number(30,0),
	kaleoTimerName VARCHAR2(200 CHAR) null,
	blocking number(1, 0),
	completionUserId number(30,0),
	completed number(1, 0),
	completionDate timestamp null,
	workflowContext clob null
);

create table KaleoTransition (
	kaleoTransitionId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(200 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId number(30,0),
	kaleoNodeId number(30,0),
	name VARCHAR2(200 CHAR) null,
	description varchar2(4000) null,
	sourceKaleoNodeId number(30,0),
	sourceKaleoNodeName VARCHAR2(200 CHAR) null,
	targetKaleoNodeId number(30,0),
	targetKaleoNodeName VARCHAR2(200 CHAR) null,
	defaultTransition number(1, 0)
);


create index IX_50E9112C on KaleoAction (companyId);
create index IX_170EFD7A on KaleoAction (kaleoClassName, kaleoClassPK);
create index IX_4B2545E8 on KaleoAction (kaleoClassName, kaleoClassPK, executionType);
create index IX_F95A622 on KaleoAction (kaleoDefinitionId);

create index IX_FEE46067 on KaleoCondition (companyId);
create index IX_DC978A5D on KaleoCondition (kaleoDefinitionId);
create index IX_86CBD4C on KaleoCondition (kaleoNodeId);

create index IX_40B9112F on KaleoDefinition (companyId);
create index IX_408542BA on KaleoDefinition (companyId, active_);
create index IX_76C781AE on KaleoDefinition (companyId, name);
create index IX_4C23F11B on KaleoDefinition (companyId, name, active_);
create index IX_EC14F81A on KaleoDefinition (companyId, name, version);

create index IX_58D85ECB on KaleoInstance (className, classPK);
create index IX_5F2FCD2D on KaleoInstance (companyId);
create index IX_BF5839F8 on KaleoInstance (companyId, kaleoDefinitionName, kaleoDefinitionVersion, completionDate);
create index IX_C6D7A867 on KaleoInstance (companyId, userId);
create index IX_4DA4D123 on KaleoInstance (kaleoDefinitionId);
create index IX_ACF16238 on KaleoInstance (kaleoDefinitionId, completed);

create index IX_153721BE on KaleoInstanceToken (companyId);
create index IX_4A86923B on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId);
create index IX_360D34D9 on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId, completionDate);
create index IX_7BDB04B4 on KaleoInstanceToken (kaleoDefinitionId);
create index IX_F42AAFF6 on KaleoInstanceToken (kaleoInstanceId);

create index IX_73B5F4DE on KaleoLog (companyId);
create index IX_E66A153A on KaleoLog (kaleoClassName, kaleoClassPK, kaleoInstanceTokenId, type_);
create index IX_6C64B7D4 on KaleoLog (kaleoDefinitionId);
create index IX_5BC6AB16 on KaleoLog (kaleoInstanceId);
create index IX_470B9FF8 on KaleoLog (kaleoInstanceTokenId, type_);
create index IX_B0CDCA38 on KaleoLog (kaleoTaskInstanceTokenId);

create index IX_C4E9ACE0 on KaleoNode (companyId);
create index IX_F28C443E on KaleoNode (companyId, kaleoDefinitionId);
create index IX_32E94DD6 on KaleoNode (kaleoDefinitionId);

create index IX_38829497 on KaleoNotification (companyId);
create index IX_902D342F on KaleoNotification (kaleoClassName, kaleoClassPK);
create index IX_F3362E93 on KaleoNotification (kaleoClassName, kaleoClassPK, executionType);
create index IX_4B968E8D on KaleoNotification (kaleoDefinitionId);

create index IX_2C8C4AF4 on KaleoNotificationRecipient (companyId);
create index IX_AA6697EA on KaleoNotificationRecipient (kaleoDefinitionId);
create index IX_7F4FED02 on KaleoNotificationRecipient (kaleoNotificationId);

create index IX_E1F8B23D on KaleoTask (companyId);
create index IX_3FFA633 on KaleoTask (kaleoDefinitionId);
create index IX_77B3F1A2 on KaleoTask (kaleoNodeId);

create index IX_611732B0 on KaleoTaskAssignment (companyId);
create index IX_D835C576 on KaleoTaskAssignment (kaleoClassName, kaleoClassPK);
create index IX_1087068E on KaleoTaskAssignment (kaleoClassName, kaleoClassPK, assigneeClassName);
create index IX_575C03A6 on KaleoTaskAssignment (kaleoDefinitionId);

create index IX_945F4EB7 on KaleoTaskAssignmentInstance (assigneeClassName);
create index IX_3BD436FD on KaleoTaskAssignmentInstance (assigneeClassName, assigneeClassPK);
create index IX_6E3CDA1B on KaleoTaskAssignmentInstance (companyId);
create index IX_38A47B17 on KaleoTaskAssignmentInstance (groupId, assigneeClassPK);
create index IX_C851011 on KaleoTaskAssignmentInstance (kaleoDefinitionId);
create index IX_67A9EE93 on KaleoTaskAssignmentInstance (kaleoInstanceId);
create index IX_D4C2235B on KaleoTaskAssignmentInstance (kaleoTaskInstanceTokenId);

create index IX_A3271995 on KaleoTaskInstanceToken (className, classPK);
create index IX_997FE723 on KaleoTaskInstanceToken (companyId);
create index IX_608E9519 on KaleoTaskInstanceToken (kaleoDefinitionId);
create index IX_2CE1159B on KaleoTaskInstanceToken (kaleoInstanceId);
create index IX_B857A115 on KaleoTaskInstanceToken (kaleoInstanceId, kaleoTaskId);

create index IX_4DE6A889 on KaleoTimer (kaleoClassName, kaleoClassPK);
create index IX_1A479F32 on KaleoTimer (kaleoClassName, kaleoClassPK, blocking);

create index IX_DB96C55B on KaleoTimerInstanceToken (kaleoInstanceId);
create index IX_DB279423 on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed);
create index IX_9932524C on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed, blocking);
create index IX_13A5BA2C on KaleoTimerInstanceToken (kaleoInstanceTokenId, kaleoTimerId);

create index IX_41D6C6D on KaleoTransition (companyId);
create index IX_479F3063 on KaleoTransition (kaleoDefinitionId);
create index IX_A392DFD2 on KaleoTransition (kaleoNodeId);
create index IX_A38E2194 on KaleoTransition (kaleoNodeId, defaultTransition);
create index IX_85268A11 on KaleoTransition (kaleoNodeId, name);



quit