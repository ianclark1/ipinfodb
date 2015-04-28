<!---
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
--->
<cfcomponent displayname="ipinfodb" output="no">
	<cffunction name="init" access="public" returntype="any">
		<cfreturn this>
	</cffunction>
    
    <cffunction name="getbyip" access="package" returntype="struct">
        <cfargument name="ip" default="#cgi.REMOTE_ADDR#" >
		<cfset var results = structNew() >            
            <cfhttp url="http://www.ipinfodb.com/ip_query.php?ip=#arguments.ip#" method="post">
                <cfhttpparam type="formField" name="timezone" value="true">
            </cfhttp>

              <cfset strXML=cfhttp.fileContent>
              <cfset XMLData = XmlParse(strXML)>
              <cfset XMLHead = XMLData.Response>
            
             <cfif XMLHead.Status.xmltext eq 'OK'>           
                <cfset results.ip = XMLHead.Ip.xmltext>
                <cfset results.CountryCode = XMLHead.CountryCode.xmltext>
                <cfset results.CountryName = XMLHead.CountryName.xmltext> 
                <cfset results.RegionCode = XMLHead.RegionCode.xmltext> 
                <cfset results.RegionName = XMLHead.RegionName.xmltext>       
                <cfset results.City = XMLHead.City.xmltext>
                <cfset results.ZipPostalCode = XMLHead.ZipPostalCode.xmltext>
                <cfset results.Latitude = XMLHead.Latitude.xmltext>
                <cfset results.Longitude = XMLHead.Longitude.xmltext>
        
                <cfset results.Timezone = XMLHead.Timezone.xmltext>
                <cfset results.Gmtoffset = XMLHead.Gmtoffset.xmltext>
            </cfif>   
		<cfreturn results>             
    </cffunction>
    
    <cffunction name="get" access="public" returntype="any">
        <cfargument name="ip" default="#cgi.REMOTE_ADDR#" >
        <cfargument name="type" default="ALL" >
        <!--- Types:
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
		--->
        
        <cfset var results = getbyip(arguments.ip)>
		        
        <cfswitch expression="#arguments.type#" >
        	<cfcase value="ALL">
            	<cfreturn results>
            </cfcase>
            <cfcase value="COUNTRY_CODE">
            	<cfreturn results.CountryCode>
            </cfcase>
            <cfcase value="COUNTRY_NAME">
            	<cfreturn results.CountryName>
            </cfcase>
            <cfcase value="REGION_CODE">
            	<cfreturn results.RegionCode>
            </cfcase>
            <cfcase value="REGION_NAME">
            	<cfreturn results.RegionName>
            </cfcase>
            <cfcase value="CITY">
            	<cfreturn results.City>
            </cfcase>
            <cfcase value="POSTAL">
            	<cfreturn results.ZipPostalCode>
            </cfcase>
            <cfcase value="LAT">
            	<cfreturn results.Latitude>
            </cfcase>
            <cfcase value="LONG">
            	<cfreturn results.Longitude>
            </cfcase>
            <cfcase value="TIMEZONE">
            	<cfreturn results.Timezone>
            </cfcase>
            <cfcase value="GMT_OFFSET">
            	<cfreturn results.Gmtoffset>
            </cfcase>
        </cfswitch>
    	
    </cffunction>
</cfcomponent>