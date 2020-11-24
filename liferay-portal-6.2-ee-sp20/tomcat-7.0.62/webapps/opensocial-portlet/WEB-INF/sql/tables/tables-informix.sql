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
