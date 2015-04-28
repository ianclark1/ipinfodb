<cfset geo = CreateObject("component","ipinfodb") >
<cfset geoGET = geo.get(cgi.REMOTE_ADDR,'ALL') >

<div style="float:left;">
	<cfdump var="#geoGET#">
</div>
