<!doctype html>
<html lang="es">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Login para Admins</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
        <%-- ======= BOX ICONS ======= --%>
        <asset:stylesheet href="boxicons.min.css"
        />
        <%-- ======= CSS BOTSTRAP 5 ======= --%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    </head>
        <asset:stylesheet href="login-admin.css"/>
    </head>

    <body>
        <div class="container w-75 bg-primary mt-5 rounded shadow">
            <div class="row align-items-stretch">
                <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">
                
                </div>
                <div class="col bg-white p-5 rounded-end">
                    <div class="tex-end">
                        <asset:image src="fylu-logo.png" width="48"  alt="Fylu"/>
                        <span class="brand__logo">Fylu</span>
                    </div>
                    <h2 class="fw-bold text-center py-5">Bienvenido</h2>
                    <%-- LOGIN --%>
                    <form action="loguearAdmin" method="POST" id="edPassForm">
                        <div class="mb-4">
                            <label for="user" class="form-label">Usuario</label>
                            <input type="text" class="form-control" id="adminUser" name="adminUser" required>
                        </div>
                        <div class="mb-4">
                            <label for="password" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="adminPass" name="adminPass" required>
                        </div>
                        <div class="mb-4 form-check">
                            <input type="checkbox" name="connected" class="form-check-input">
                            <label for="connected" class="form-check-label">Mantenerme conectado</label>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Ingresar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>

