package com.phonebook.service;


public class MyProperty {


private String dbUsername;
private String dbPassword;
private String dbUrl;
private String appName;

private String androidAppLink;
private boolean s3AWSEnabled;

public String getAppName() {
	return appName;
}

public void setAppName(String appName) {
	this.appName = appName;
}

public String getDbUsername() {
	return dbUsername;
}

public void setDbUsername(String dbUsername) {
	this.dbUsername = dbUsername;
}

public String getDbPassword() {
	return dbPassword;
}

public void setDbPassword(String dbPassword) {
	this.dbPassword = dbPassword;
}

public String getDbUrl() {
	return dbUrl;
}

public void setDbUrl(String dbUrl) {
	this.dbUrl = dbUrl;
}

public String getAndroidAppLink() {
	return androidAppLink;
}

public void setAndroidAppLink(String androidAppLink) {
	this.androidAppLink = androidAppLink;
}

public boolean isS3AWSEnabled() {
	return s3AWSEnabled;
}

public void setS3AWSEnabled(boolean s3awsEnabled) {
	s3AWSEnabled = s3awsEnabled;
}

}