	Author: somethingJava, LLC  ( Marco G. Williams ) / marco@somethingjava.com
	License: GPL (GNU General Public License)

	NAME: ipinfodb.cfc
	DESC: GEO Location Services,  This component works with ipinfodb.com services to pull geo location information per ip address.
	They do offer other services like fraud prevention for Credit Card processing.  I will be updating this component to support these
	features when i have time, however i don't right now and this is all you get.	
	
	Support:  I will provide limited support if something does not work.  Use at your own risk.  
	This component has not yet been fully tested in any production environment or under any LOAD.
	
	SUGGESTED IMPROVEMENTS:  
	Please email marco@somethingjava.com with your suggested improvements.
	
	IMPORTANT NOTE:
	IpInfoDb.com provides this service as a FREE service, however they need your support as they are a donation only company.
	If you are going to use this script and use thier services please make a donation so that they can continue to provide 
	this service. 
	
	http://ipinfodb.com/donate.php
	
	
	
	USAGE:
		<cfset geo = CreateObject("component","ipinfodb") >
		<cfset geoGET = geo.get([IPADDRESS],'[OPTION]') >	
		
	OPTIONS:
			ALL: Returns the entire structure of results.
			COUNTRY_CODE: Returns Country Code
			COUNTRY_NAME: Returns Country Name
			REGION_CODE:  Returns Region Code 
			REGION_NAME:  Returns Region Name
			CITY:         Returns City Name
			POSTAL:       Returns Zip Or Postal Code
			LAT:          Returns Latitude
			LONG:         Returns Longitude
			TIMEZONE:     Returns TimeZone
			GMT_OFFSET:   Returns GMT OFFSET			


			
		