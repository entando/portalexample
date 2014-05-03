<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/aps-core" prefix="wp" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>


<a
	href="<s:url namespace="/do/FileBrowser" action="uploadFile" >
		<s:param name="currentPath"><s:property escape="true" value="%{currentPath}"/><s:property escape="true" value="%{#file.name}"/></s:param>
	</s:url>">UPLOAD NEW FILE
</a>
<s:form action="edit" namespace="/do/FileBrowser">
	<s:hidden value="%{currentPath}" name="currentPath" />
	filename:<s:textfield name="filename" />
	<s:submit name="createByName" value="createByName" />

</s:form>


<a
	href="<s:url namespace="/do/FileBrowser" action="newFileEntry" >
		<s:param name="currentPath"><s:property escape="true" value="%{currentPath}"/></s:param>
	</s:url>">CREATE NEW FILE
</a>

<a
	href="<s:url namespace="/do/FileBrowser" action="newDirEntry" >
		<s:param name="currentPath"><s:property escape="true" value="%{currentPath}"/></s:param>
	</s:url>">CREATE NEW DIR
</a>
<br />
<br />
**WE NEED BREADCRUMBS**
<br />
<br />
currentPath -***********  <s:property escape="true" value="currentPath"/>
<br />
subpathForParent -****** <s:property escape="true" value="subpathForParent"/>
<br />
<br />
<br />
<br />









<s:iterator value="fileList" var="fileVar" status="fileStatus">
	
	<s:if test="#fileVar.directory">DIRECTORY</s:if><s:else>FILE</s:else>-<s:property value="#fileStatus.count"/>
	
	<%--
	<br />
	root:<s:property value="%{isRootResource()}"/>
	--%>
	
	<s:if test="#fileVar.directory">
	<!-- THIS IS A DIRECTORY -->
	<%--
	<s:if test="#fileStatus.count == 1 && rootResource">
		this first element is the current directory
		<a href="<s:url namespace="/do/FileBrowser" action="list" >
				<s:param name="currentPath"></s:param>
			</s:url>"><s:property escape="false" value="#fileVar.name"/></a>
	</s:if>
	<s:elseif test="#fileStatus.count == 1">
		<a href="<s:url namespace="/do/FileBrowser" action="list" >
				<s:param name="currentPath"><s:property escape="true" value="subpathForParent"/></s:param>
			</s:url>"><s:property escape="false" value="#fileVar.name"/>
		</a>
	</s:elseif>
	--%>
	<%--<s:else>--%>
	<a href="<s:url namespace="/do/FileBrowser" action="list" >
			<s:param name="currentPath"><s:property escape="true" value="currentPath"/><s:property escape="true" value="#fileVar.name"/></s:param>
		</s:url>"><s:property escape="false" value="#fileVar.name"/>
	</a>
	<%--</s:else>--%>
	<br />
	</s:if>
	
	<s:else>
	<!-- THIS IS A FILE -->
	<s:property escape="false" value="#fileVar.name"/>
	<br />
	last modify date:<s:date name="%{new java.util.Date(#fileVar.lastModified())}" format="EEEE dd/MMM/yyyy, HH:mm:ss" />
	<br />
	last modify (long):<s:property escape="false" value="#fileVar.lastModified()"/>
	<br />
	size: <s:property escape="false" value="#fileVar.length()"/>
	<br />
	</s:else>
	
	<%--
	parent: <s:property escape="false" value="#fileVar.parent"/>
	<br />
	Absolute Path: <s:property escape="false" value="#fileVar.absolutePath"/>
	<br />
	path: <s:property escape="false" value="#fileVar.path"/>
	<br />
	--%>
	
	<%--
	directory:<s:property escape="false" value="#fileVar.directory"/>
	<br />
	hidden:<s:property escape="false" value="#fileVar.hidden"/>
	<br />
	--%>
	<%--
	nomefile: <s:property escape="false" value="#fileVar.name"/>
	<br />
	--%>
	
	<s:if test="!#fileVar.directory">
	<%--download:--%>
	<a href="<wp:resourceURL/><s:property escape="false" value="currentPath"/><s:property escape="false" value="#fileVar.name"/>">DOWNLOAD<%--<s:property escape="false" value="#fileVar.name"/>--%></a>
	&nbsp;&ndash;&nbsp;
	<a href="<s:url namespace="/do/FileBrowser" action="edit" >
			<s:param name="currentPath"><s:property escape="true" value="%{currentPath}"/></s:param>
			<s:param name="filename"> <s:property escape="false" value="#fileVar.name"/></s:param>
		</s:url>">EDIT<%-- : <s:property escape="false" value="#fileVar.name"/>--%></a>
	&nbsp;&ndash;&nbsp;
	<%--
	currentPath + filename <s:property escape="true" value="%{currentPath + File.separator +  #fileVar.name}"/>
	<br />
	--%>
	</s:if>
	
	<a href="<s:url namespace="/do/FileBrowser" action="deleteEntry" >
			<s:param name="currentPath"><s:property escape="true" value="%{currentPath}"/></s:param>
			<s:param name="filename"><s:property escape="false" value="#fileVar.name"/></s:param>
		</s:url>">DELETE<%-- : <s:property escape="false" value="#fileVar.name"/>--%></a>
	<br />
	<br />

</form>
</s:iterator>
