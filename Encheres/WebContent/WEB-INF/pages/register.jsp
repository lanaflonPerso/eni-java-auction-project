<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
    

<jsp:include page="../fragments/header.jsp" >
	<jsp:param value="Mon Profil" name="title"/>
</jsp:include>

<c:if test="${erreur != null}"> 
			<div class="alert alert-danger" role="alert">
		  		${erreur}
			</div>
</c:if>
<form id="registerForm" action="Register" method="POST">
	 <div class="row">
	<div class="col-sm-12 col-xs-12 col-md-6">
	  <div class="form-group">
	    <label for="inputPrenom">Prenom</label>
	    <input required="required" type="text" pattern="[a-zA-Z0-9\s]+" class="form-control" name="inputPrenom" id="inputPrenom" placeholder="Entrez votre prenom">
	  </div>
	  <div class="form-group">
	    <label for="inputSpeudo">Speudo</label>
	    <input required="required" type="text" pattern="[a-zA-Z0-9\s]+" class="form-control" name="inputSpeudo" id="inputSpeudo" aria-describedby="emailHelp" placeholder="Entrez votre speudo">
	   </div>
	     <div class="form-group">
	    <label for="inputTelephone">Telephone</label>
	    <input required="required" type="text" class="form-control" name="inputTelephone" id="inputTelephone" placeholder="Telephone">
  	</div>
	 
	   <div class="form-group">
	    <label for="inputCodePostal">Code Postal</label>
	    <input required="required" type="text" pattern="[a-zA-Z0-9\s]+" class="form-control" id="inputCodePostal"   name="inputCodePostal" placeholder="Code Postal">
  	</div>
	  <div class="form-group">
	    <label for="inputPassword">Password</label>
	    <input required="required" type="password" class="form-control" id="inputPassword"   name="inputPassword"placeholder="Password">
	  </div>
	</div>
	
	<div class="col-sm-12 col-xs-12 col-md-6">
	

  <div class="form-group">
    <label for="inputNom">Nom</label>
    <input required="required" type="text" class="form-control" id="inputNom"  name="inputNom" placeholder="Enter Nom">
  </div>
   <div class="form-group">
	    <label for="inputEmail">Email address</label>
	    <input  required="required" type="email" class="form-control" id="inputEmail"  name="inputEmail"aria-describedby="emailHelp" placeholder="Enter email">
</div>
   <div class="form-group">
    <label for="inputRue">Rue</label>
    <input required="required" type="text" class="form-control" id="inputRue"   name="inputRue" placeholder="Rue">
  </div>
  
  <div class="form-group">
    <label for="inputVille">Ville</label>
    <input required="required" type="text" class="form-control" id="inputVille"   name="inputVille" placeholder="Ville">
  </div>


  	<div class="form-group">
	    <label for="inputConfirmationPassword">Confirmation</label>
	    <input required="required" type="password" class="form-control" id="inputConfirmationPassword"   name="inputConfirmationPassword" placeholder="Password">
	</div>
	
	</div>
	 
	
	</div>

	 <div class="row justify-content-around">
    <div class="col-4">
     <button  type="submit" class="btn btn-success center">Créer</button>                   
    </div>
    <div class="col-4">
       <button type="button" class="btn btn-danger center">Annuler</button>      
    </div>
    </div>

	
</form>
	
<script>
var password = document.getElementById("inputPassword")
, confirm_password = document.getElementById("inputConfirmPassword");

function validatePassword(){
if(password.value != confirm_password.value) {
  confirm_password.setCustomValidity("Passwords Don't Match");
} else {
  confirm_password.setCustomValidity('');
}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
</script>
<jsp:include page="../fragments/footer.jsp" ></jsp:include>