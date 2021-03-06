<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setBundle basename="fr.eni.ecole.messages.accueil" var="r"/>

<fmt:message key="msg.title" bundle="${r}" var="title"/>
<c:set var="title" scope="request" value="${ title }"/>
<jsp:include page="../fragments/header.jsp"></jsp:include>

<div class="container">
<h2>${ title }</h2>
<hr>
	<h3><fmt:message key="msg.filters_title" bundle="${r}"></fmt:message></h3>
	<form id="filterForm" action="/Encheres/webapi/enchere/" method="post">
		<div class="form-row accueil">
			<div class="col-md-8">
				<div class="form-group row">
					<label for="inputPassword" class="col-md-4 col-form-label">
						<fmt:message key="msg.filters_searchByName" bundle="${r}"></fmt:message>
					</label>		
					<fmt:message key="msg.filters_searchByName_placeholder" bundle="${r}" var="placeholder_search"/>	
					<fmt:message key="msg.filters_searchByName_title" bundle="${r}" var="title_search"/>	
					<input 
						type="search"
						name="nameFilter" 
						class="form-control col-md-8" 
						placeholder="${placeholder_search }" 
						pattern="^(\w(\w|\s)*\w)|(\w)$"
						title="${title_search }" 
					>
				</div>
				<div class="form-group row">
					<label for="SelectCategorie" class="col-md-4 col-form-label">
						<fmt:message key="msg.filters_category" bundle="${r}"></fmt:message>
					</label>
				    <select 
				    	class="form-control col-md-8" 
				    	id="SelectCategorie"
				    	name="categorie" 
				    >
						<option value="-1">
							<fmt:message key="msg.filters_categoryAll" bundle="${r}"></fmt:message>
						</option>
						<c:forEach var="cat" items="${ listeCategories}">
							<option value="${ cat.getNoCategorie() }">${ cat.getLibelle() }</option>
						</c:forEach>
				    </select>
				</div>
				<c:if test = "${ sessionScope['no_utilisateur'] != null }" >
					<fieldset class="form-group">
						<div class="row">
							<div class="col-md-6">
								<div class="custom-control custom-radio custom-control-inline">
									<input 
										type="radio" 
										id="achatsRadio"
										name="radioButtons" 
										value="mesAchats"
										class="custom-control-input"
										checked
									> 
										<label class="custom-control-label" for="achatsRadio">
											<fmt:message key="msg.filters_purchases" bundle="${r}"></fmt:message>
										</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="custom-control custom-radio custom-control-inline col-md-6">
									<input 
										type="radio" 
										id="ventesRadio"
										name="radioButtons" 
										value="mesVentes"
										class="custom-control-input"
									> 
										<label class="custom-control-label" for="ventesRadio">
											<fmt:message key="msg.filters_mySales" bundle="${r}"></fmt:message>
										</label>
								</div>
							</div>
						</div>
					</fieldset>
					<div class="form-group row">
						<div class="col-md-6" id="mesEncheresCheckboxGroup">
							<div class="form-check">
							  <input 
							  		class="form-check-input" 
							  		type="checkbox" 
							  		name="encheresOuvertes" 
							  		id="encheresOuvertes"
						  		>
							  <label class="form-check-label" for="encheresOuvertes">
							    <fmt:message key="msg.filters_open_auctions" bundle="${r}"></fmt:message>
							  </label>
							</div>
							<div class="form-check">
							  <input 
							  		class="form-check-input" 
							  		type="checkbox" 
							  		name="encheresEnCours" 
							  		id="encheresEnCours"
					  			>
							  <label class="form-check-label" for="encheresEnCours">
							    <fmt:message key="msg.filters_my_current_auctions" bundle="${r}"></fmt:message>
							  </label>
							</div>
							<div class="form-check">
							  <input 
							  		class="form-check-input" 
							  		type="checkbox" 
							  		name="encheresRemportees" 
							  		id="encheresRemportees"
					  			>
							  <label class="form-check-label" for="encheresRemportees">
							    <fmt:message key="msg.filters_my_won_auctions" bundle="${r}"></fmt:message>
							  </label>
							</div>
						</div>
						<div class="col-md-6" id="mesVentesCheckboxGroup">
							<div class="form-check">
							  <input 
						  			class="form-check-input" 
					  				type="checkbox" 
					  				name="ventesEnCours" 
					  				id="ventesEnCours"
					  				disabled
				  				>
							  <label class="form-check-label" for="ventesEnCours">
							    <fmt:message key="msg.filters_my_current_sales" bundle="${r}"></fmt:message>
							  </label>
							</div>
							<div class="form-check">
							  <input 
							  		class="form-check-input" 
							  		type="checkbox" 
							  		name="ventesNonDebutees" 
							  		id="ventesNonDebutees"
							  		disabled
						  		>
							  <label class="form-check-label" for="ventesNonDebutees">
							    <fmt:message key="msg.filters_sales_not_started" bundle="${r}"></fmt:message>
							  </label>
							</div>
							<div class="form-check">
							  <input 
						  			class="form-check-input" 
					  				type="checkbox" 
					  				name="ventesTerminees" 
					  				id="ventesTerminees"
					  				disabled
				  				>
							  <label class="form-check-label" for="ventesTerminees">
							    <fmt:message key="msg.filters_sales_completed" bundle="${r}"></fmt:message>
							  </label>
							</div>
						</div>			
					</div>
				</c:if>	
			</div>
			<div class="col-md-4">
				<button type="submit" class="btn btn-light">
					<fmt:message key="msg.filters_search_button" bundle="${r}"></fmt:message>
				</button>
			</div>
		</div>
	</form>
	<hr>
	<div id="dashboard" class="justify-content-center">
		
	</div>
	<div id="echec" class="alert alert-danger" role="alert" hidden="true">
		
	</div>
	
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/accueil.js"></script>
<jsp:include page="../fragments/footer.jsp"></jsp:include>