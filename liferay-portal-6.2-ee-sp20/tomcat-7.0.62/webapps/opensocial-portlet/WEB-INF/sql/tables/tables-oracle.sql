create table OpenSocial_Gadget (
	uuid_ VARCHAR2(75 CHAR) null,
	gadgetId number(30,0) not null primary key,
	companyId number(30,0),
	createDate timestamp null,
	modifiedDate timestamp null,
	name VARCHAR2(75 CHAR) null,
	url varchar2(4000) null,
	portletCategoryNames varchar2(4000) null
);

create table OpenSocial_OAuthConsumer (
	oAuthConsumerId number(30,0) not null primary key,
	companyId number(30,0),
	createDate timestamp null,
	modifiedDate timestamp null,
	gadgetKey VARCHAR2(75 CHAR) null,
	serviceName VARCHAR2(75 CHAR) null,
	consumerKey VARCHAR2(75 CHAR) null,
	consumerSecret clob null,
	keyType VARCHAR2(75 CHAR) null
);

create table OpenSocial_OAuthToken (
	oAuthTokenId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	gadgetKey VARCHAR2(75 CHAR) null,
	serviceName VARCHAR2(75 CHAR) null,
	moduleId number(30,0),
	accessToken VARCHAR2(75 CHAR) null,
	tokenName VARCHAR2(75 CHAR) null,
	tokenSecret VARCHAR2(75 CHAR) null,
	sessionHandle VARCHAR2(75 CHAR) null,
	expiration number(30,0)
);
