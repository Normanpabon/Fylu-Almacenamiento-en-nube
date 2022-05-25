<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--=============== BOXICONS ===============-->
        <asset:stylesheet href="boxicons.min.css"/>

        <!--=============== CSS ===============-->
        <asset:stylesheet href="404.css"/>

        <title>Error 404 - Fylu</title>
    </head>
    <body>
        <!--==================== HEADER ====================-->
        <header class="header">
            <nav class="nav container">
                <a href="#" class="nav__logo">
                    Fylu
                </a>
            </nav>
        </header>

        <!--==================== MAIN ====================-->
        <main class="main">
            <!--==================== HOME ====================-->
            <section class="home">
                <div class="home__container container">
                    <div class="home__data">
                        <span class="home__subtitle">Error 404</span>
                        <h1 class="home__title">Hola amigo</h1>
                        <p class="home__description">
                            No podemos encontrar la página <br> que está buscando.
                        </p>
                        <a href="dirigirHome" class="home__button">
                            Regresar
                        </a>
                    </div>

                    <div class="home__img">
                        <asset:image src="cloudten.svg" alt="404"/>
                        <div class="home__shadow"></div>
                    </div>
                </div>

                <footer class="home__footer">
                    <span>(602) 3188000</span>
                    <span>|</span>
                    <span>info@fylu.com</span>
                </footer>
            </section>
        </main>

        <!--=============== SCROLLREVEAL ===============-->
        <script src="assets/js/scrollreveal.min.js"></script>

        <!--=============== MAIN JS ===============-->
        <script src="assets/js/main.js"></script>
    </body>
</html>