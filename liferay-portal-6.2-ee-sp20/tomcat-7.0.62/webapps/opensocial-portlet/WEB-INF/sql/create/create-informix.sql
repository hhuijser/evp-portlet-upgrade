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


create table OpenSocial_Gadget (
	uuid_ varchar(75),
	gadgetId int8 not null primary key,
	companyId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	url lvarchar,
	portletCategoryNames lvarchar
)
extent size 16 next size 16
lock mode row;

create table OpenSocial_OAuthConsumer (
	oAuthConsumerId int8 not null primary key,
	companyId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	gadgetKey varchar(75),
	serviceName varchar(75),
	consumerKey varchar(75),
	consumerSecret text,
	keyType varchar(75)
)
extent size 16 next size 16
lock mode row;

create table OpenSocial_OAuthToken (
	oAuthTokenId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	gadgetKey varchar(75),
	serviceName varchar(75),
	moduleId int8,
	accessToken varchar(75),
	tokenName varchar(75),
	tokenSecret varchar(75),
	sessionHandle varchar(75),
	expiration int8
)
extent size 16 next size 16
lock mode row;


create index IX_729869EE on OpenSocial_Gadget (companyId);
create unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);
create index IX_E1F8627A on OpenSocial_Gadget (uuid_);
create index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);

create index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);
create index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);

create index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);
create index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);


