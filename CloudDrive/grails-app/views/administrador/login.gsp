<!doctype html>
<html>
<head>
  	<center><h1>Panel de administracion</h1>
   	

  <div class = "l-form" id="adminLogin">
    <div class="shape1"></div>
            <div class="shape2"></div>

            <div class="form">
               
                <form class="formcontent" action="loguearAdmin" method="POST" id="edPassForm" autocomplete="off">
					<h3 class="formtitle">Ingresa Credenciales</h3>
                    
                    <div class="formdiv formdiv-one">
                        <div class="formicon">
                            <i class='bx bx-user-circle'></i>
                        </div>
                        
                    </div>

                    <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Usuario</label>
                            <input type="text" name="viejaContra" class="forminput" id="adminUser" required>
                        </div>
                    </div>
                     <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
							<label for="" class="formlabel">Clave</label>
                            <input type="password" name="nuevaContra" class="forminput" id="adminPass" required>
                        </div>
                    </div>
                    

                    <input type="submit" id="submit" class="form__button" value="Ingresar" />
                </form>
            </div>
            
            </div>
           
            </center>
</body>
</html>