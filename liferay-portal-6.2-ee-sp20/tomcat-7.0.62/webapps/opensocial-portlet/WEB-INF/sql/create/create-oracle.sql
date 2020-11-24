drop user &1 cascade;
create user &1 identified by &2;
grant connect,resource to &1;
connect &1/&2;
set define off;

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


create index IX_729869EE on OpenSocial_Gadget (companyId);
create unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);
create index IX_E1F8627A on OpenSocial_Gadget (uuid_);
create index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);

create index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);
create index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);

create index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);
create index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);



quit