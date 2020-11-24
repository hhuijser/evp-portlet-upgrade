create table OAuth_OAuthApplication (
	oAuthApplicationId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name VARCHAR2(75 CHAR) null,
	description varchar2(4000) null,
	consumerKey VARCHAR2(75 CHAR) null,
	consumerSecret VARCHAR2(75 CHAR) null,
	accessLevel number(30,0),
	logoId number(30,0),
	shareableAccessToken number(1, 0),
	callbackURI varchar2(4000) null,
	websiteURL varchar2(4000) null
);

create table OAuth_OAuthUser (
	oAuthUserId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	oAuthApplicationId number(30,0),
	accessToken VARCHAR2(75 CHAR) null,
	accessSecret VARCHAR2(75 CHAR) null
);
