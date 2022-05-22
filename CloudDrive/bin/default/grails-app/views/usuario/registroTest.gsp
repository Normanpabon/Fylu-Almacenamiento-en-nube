<!doctype html>
<html>
<head>
    <div class = "l-form" id="regForm">
    <div class="shape1"></div>
            <div class="shape2"></div>

            <div class="form">

                <form class="formcontent" action="registrarUsuario" method="POST" id="regForm" autocomplete="off">
					<h1 class="formtitle">Registrate</h1>
                    
                    <div class="formdiv formdiv-one">
                        <div class="formicon">
                            <i class='bx bx-user-circle'></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Usuario</label>
                            <input type="text" name="usuario" class="forminput" id="RegUsuario" required>
                        </div>
                    </div>

                    <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Correo</label>
                            <input type="email" name="correo" class="forminput" id="RegCorreo" required>
                        </div>
                    </div>
                     <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
							<label for="" class="formlabel">Contraseña</label>
                            <input type="password" name="hashed_pass" class="forminput" id="RegPass" required>
                        </div>
                    </div>
                    

                    <input type="submit" id="submit" class="form__button" value="Registrate" />
                </form>
            </div>
</body>
</html>