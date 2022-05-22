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
        <%-- ======= BOX ICONS ======= --%>
        <asset:stylesheet href="boxicons.min.css"/>
        <%-- ======= CSS ======= --%>
        <asset:stylesheet href="singup.css"/>
    </head>

    <body>
        <div class = "l-form" id="regForm">
        <div class="shape1"></div>
                <div class="shape2"></div>
                <div class="form">
                    <asset:image src="singup.svg" alt="Registrate" class="form__img"/>
                    <form class="form__content" action="registrarUsuario" method="POST" id="regForm" autocomplete="off">
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

                        <input type="submit" id="submit" class="form__button" value="Registrate" />
                    </form>
                </div>
    <asset:javascript src="login.js"/>
    </body>
</html>