 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<spring:url value="/resources_static/theme1" var="resources_static" />
<div class='font_size_small'>

<div class=''>


<h1>ΠΡΟΣΘΕΣTΕ ΚΑΙΝΟΥΡΙΟ ALBUM</h1>

		<table>
			<tr>
				<td><input type='text' ng-model='newalbum.name' placeholder='Ο τίτλος του νέου album εδω..'/> </td>
	        <td> <button class='button_flat background_green' ng-click = "addAlbum(newalbum)">Προσθήκη</button></td>
			</tr>

		</table>
<h2 ng-show='albums.length'>ΥΠΑΡΧΟΝΤΑ ALBUMS</h2>{{waiting}}
<div class='admin_album table_stylish1' ng-repeat='album in albums| orderBy:"-date"' >

		<table >
			<tr>
				<td><input type='text' ng-model='album.name' placeholder='Ο τίτλος του album εδω..'/> </td>
	        <td> <button class='button_flat background_dark_yellow' ng-click = "editAlbum(album)">Αποθήκευση</button></td>
	        <td> <button class='button_flat background_red' ng-click = "deleteAlbum(album)">Διαγραφή</button></td>
			</tr>

		</table>
		<table>
				<tr>
				<th>EIKONΕΣ</th>
			<!-- 	<th>ΕΠΙΛΟΓΗ</th> -->
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr>
				<!-- <td><input type = "file" ng-file-model = "newimages" multiple accept="image/*"/></td> -->
				<td>
				        <input type="file" id="file1" name="file" multiple
            				ng-files="getTheFiles($files)" multiple accept="image/*"/>

<!--        				 <input type="button" ng-click="uploadFiles(album)" value="Upload" />
 -->				</td>
				
	        <td> <button class='button_flat background_dark_yellow'  ng-click="uploadFiles(album)">Upload</button></td>
			</tr>

		</table>
		    <p ng-repeat="file in newimages">
      {{file.name}}
    </p>
    
    {{result}}
 <span ng-repeat='image in album.images'  > <img ng-click='deleteImage(image)' ng-src="${resources_static}{{image.thumburl}}"></span>

</div>


</div>
