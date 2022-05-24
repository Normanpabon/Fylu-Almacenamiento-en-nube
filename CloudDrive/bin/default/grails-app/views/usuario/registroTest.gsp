<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>
            Registrate
        </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
        <%-- ======= CSS ======= --%>
        <asset:stylesheet href="bootstrap.min.css"/>
        <asset:stylesheet href="singup.css"/>
        <%-- ======= BOX ICONS ======= --%>
        <asset:stylesheet href="boxicons.min.css"/>
    </head>

    <body>
        <div class = "l-form" id="regForm">
        <div id="msg"></div>
        <!-- Mensajes de Verificación -->
        <div id="error" class="alert alert-danger ocultar" role="alert">
            Las Contraseñas no coinciden, vuelve a intentar !
        </div>
        <div id="ok" class="alert alert-success ocultar" role="alert">
            Las Contraseñas coinciden ! (Procesando formulario ... )
        <!-- Fin Mensajes de Verificación -->
        </div>
        <div class="shape1"></div>
                <div class="shape2"></div>
                <div class="form">
                    <asset:image src="singup.svg" alt="Registrate" class="form__img"/>
                    <form class="form__content" action="registrarUsuario" method="POST" id="regForm" autocomplete="off" onsubmit="verificarPasswords(); return false">
                        <h1 class="form__title">Registrate</h1>
                        <div class= "form__description">
                            <p>Ya tienes cuenta? <a href="dirigirLogin">Inicia sesión</a></p>
                        </div>
                        <div class="form__div form__div-one">
                            <div class="form__icon">
                                <i class='bx bx-user-circle'></i>
                            </div>

                            <div class="form__div-input">
                                <label for="" class="form__label">Usuario</label>
                                <input type="text" name="usuario" class="form__input" id="RegUsuario" required>
                            </div>
                        </div>

                        <div class="form__div">
                            <div class="form__icon">
                                <i class='bx bx-envelope'></i>
                            </div>

                            <div class="form__div-input">
                                <label for="" class="form__label">Correo</label>
                                <input type="email" name="correo" class="form__input" id="RegCorreo" required>
                            </div>
                        </div>

                       <div class="form__div">
                            <div class="form__icon">
                                <i class='bx bx-lock' ></i>
                            </div>

                            <div class="form__div-input">
                                <label for="" class="form__label">Contraseña</label>
                                <input type="password" name="hashed_pass" class="form__input" id="RegPass" required>
                            </div>
                        </div>

                       <div class="form__div">
                            <div class="form__icon">
                                <i class='bx bx-lock' ></i>
                            </div>

                            <div class="form__div-input">
                                <label for="" class="form__label">Re-Ingrese su contraseña</label>
                                <input type="password" class="form__input" id="RegPass2" required>
                            </div>
                        </div>                        

                        <input type="submit" id="submit" class="form__button" value="Registrate" />
                    </form>
                </div>
    <asset:javascript src="singup.js"/>
    </body>
</html>