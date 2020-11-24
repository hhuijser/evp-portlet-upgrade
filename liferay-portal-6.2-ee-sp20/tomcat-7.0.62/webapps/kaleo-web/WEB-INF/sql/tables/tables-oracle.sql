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
