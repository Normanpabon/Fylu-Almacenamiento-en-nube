<!doctype html>
<html lang="es">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>
            Login: Identifícate
        </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
        <%-- ======= BOX ICONS ======= --%>
        <asset:stylesheet href="boxicons.min.css"/>
        <%-- ======= CSS ======= --%>
        <asset:stylesheet href="login.css"/>
    </head>
   <body>
    <div class = "l-form" id="login">
        <div class="shape1"></div>
            <div class="shape2"></div>
            <div class="form">
               <asset:image src="authentication.svg" alt="Inicia sesion" class="form__img"/>
                <form class="form__content" action="loguearUsuario" method="POST" id="loginForm" autocomplete="off">
                    <h1 class="form__title">Inicia sesión</h1>
                    <div class= "form__description">
                        <p>No tienes una cuenta? <a href="/usuario/dirigirRegistro">Registrate</a></p>
                     </div>
                    <div class="form__div form__div-one">
                        <div class="form__icon">
                            <i class='bx bx-user-circle'></i>
                        </div>

                        <div class="form__div-input">
                            <label for="" class="form__label">Usuario</label>
                            <input type="text" name="usuario" class="form__input" id="usuario" required>
                        </div>
                    </div>

                    <div class="form__div">
                        <div class="form__icon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="form__div-input">
                            <label for="" class="form__label">Contraseña</label>
                            <input type="password" name="hashed_pass" class="form__input" id="hashed_pass" required>
                        </div>
                    </div>
                    <a href="#" class="form__forgot">¿Olvidó su contraseña?</a>

                    <input type="submit" id="submit" class="form__button" value="Iniciar sesión" />
                </form>
            </div>
    </div>
    <asset:javascript src="login.js"/>
   </body>
</html>

