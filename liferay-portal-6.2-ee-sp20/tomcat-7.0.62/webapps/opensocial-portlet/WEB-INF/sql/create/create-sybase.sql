use master
exec sp_dboption 'lportal', 'allow nulls by default' , true
go

exec sp_dboption 'lportal', 'select into/bulkcopy/pllsort' , true
go

use lportal

create table OpenSocial_Gadget (
	uuid_ varchar(75) null,
	gadgetId decimal(20,0) not null primary key,
	companyId decimal(20,0),
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	url varchar(1000) null,
	portletCategoryNames varchar(1000) null
)
go

create table OpenSocial_OAuthConsumer (
	oAuthConsumerId decimal(20,0) not null primary key,
	companyId decimal(20,0),
	createDate datetime null,
	modifiedDate datetime null,
	gadgetKey varchar(75) null,
	serviceName varchar(75) null,
	consumerKey varchar(75) null,
	consumerSecret text null,
	keyType varchar(75) null
)
go

create table OpenSocial_OAuthToken (
	oAuthTokenId decimal(20,0) not null primary key,
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	gadgetKey varchar(75) null,
	serviceName varchar(75) null,
	moduleId decimal(20,0),
	accessToken varchar(75) null,
	tokenName varchar(75) null,
	tokenSecret varchar(75) null,
	sessionHandle varchar(75) null,
	expiration decimal(20,0)
)
go




