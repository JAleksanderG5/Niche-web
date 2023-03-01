<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="favicon" href="https://nichegt.azurewebsites.net/assets/logoNiche.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
        <title>Niche</title>
        <style>
            .btn-opcion-modal{
                background-color: var(--color-fondo-oscuro);
                color: #fcbe6795;
                text-align: center;
                display: inline-block;
                font-size: 1.10rem;
                font-weight: bold;
                cursor: pointer;
                width: 160px;
                border-radius: 0.5rem;
                border: none;
                padding: 0.75rem;
                transition: all 0.1s ease-out;
                width: 150px;
            }

            .btn-opcion-modal:hover{
                text-decoration: none;
                color: var(--color-primario);
                transform: scale(1.02, 1.02)
            }

            .btn-opcion-foto{
                background-color: var(--color-fondo-oscuro);
                color: #fcbe6795;
                text-align: center;
                display: inline-block;
                font-size: 0.9rem;
                font-weight: bold;
                cursor: pointer;
                border-radius: 0.5rem;
                border: none;
                padding: 0.75rem;
                transition: all 0.1s ease-out;
                width: 115px;
                height: 50px;
            }

            .btn-opcion-foto:hover{
                text-decoration: none;
                color: var(--color-primario);
                transform: scale(1.02, 1.02)
            }


            img {
                max-width: 100%;
                height: auto;
            }

            .tarjeta{
                height: 350px;
                width: 300px;
                border-radius: 1rem;
                text-align: center;

            }

            .tarjeta-group{
                width: 100%;
                height: auto;
                display: flex;
                justify-content: space-around;
            }

            .tarjeta img{
                width: 300px;
                background-color: blanchedalmond;
                height: inherit;
                object-fit: cover;
                border-radius: 1rem;

            }

        </style>
    </head>
    <body style="font-family:'Nunito Sans', sans-serif" onLoad="asignar()">
        <%
            HttpSession sesion = request.getSession();
            if ((sesion.getAttribute("correo") != null) && ((session.getAttribute("rol") == "3"))) {
        %>  
        <header class="header">
            <section class="container-header">
                <div class="logo">
                    <a href="index.jsp">
                        <svg width="36" height="13" viewBox="0 0 36 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M8.175 12.495C7.525 11.465 6.905 10.505 6.315 9.615C5.725 8.725 5.2 7.945 4.74 7.275C4.28 6.595 3.915 6.065 3.645 5.685C3.385 5.305 3.255 5.115 3.255 5.115H3.135L3.105 10.53C3.105 10.77 3.14 10.94 3.21 11.04C3.28 11.13 3.41 11.175 3.6 11.175C3.65 11.175 3.73 11.175 3.84 11.175C3.96 11.165 4.065 11.16 4.155 11.16C4.245 11.15 4.29 11.145 4.29 11.145L4.35 11.22L4.215 12.06C4.215 12.06 4.15 12.055 4.02 12.045C3.9 12.045 3.745 12.04 3.555 12.03C3.375 12.02 3.18 12.01 2.97 12C2.77 12 2.59 12 2.43 12C2.19 12 1.94 12.01 1.68 12.03C1.43 12.05 1.22 12.07 1.05 12.09C0.88 12.11 0.795 12.12 0.795 12.12L0.885 11.25C1.185 11.21 1.41 11.12 1.56 10.98C1.71 10.84 1.79 10.615 1.8 10.305L1.98 4.11C1.98 3.79 1.895 3.565 1.725 3.435C1.555 3.305 1.22 3.215 0.72 3.165L0.645 3.06L0.765 2.325C0.765 2.325 0.85 2.33 1.02 2.34C1.19 2.35 1.395 2.365 1.635 2.385C1.875 2.395 2.095 2.4 2.295 2.4C2.495 2.4 2.69 2.395 2.88 2.385C3.07 2.375 3.225 2.365 3.345 2.355C3.475 2.345 3.54 2.34 3.54 2.34C3.98 3.04 4.415 3.72 4.845 4.38C5.275 5.04 5.68 5.655 6.06 6.225C6.44 6.795 6.775 7.295 7.065 7.725C7.365 8.145 7.595 8.475 7.755 8.715C7.925 8.955 8.01 9.075 8.01 9.075H8.13L8.115 3.885C8.105 3.655 8.06 3.49 7.98 3.39C7.91 3.29 7.79 3.24 7.62 3.24C7.5 3.24 7.385 3.245 7.275 3.255C7.165 3.255 7.095 3.255 7.065 3.255L7.035 3.165L7.155 2.34C7.155 2.34 7.215 2.345 7.335 2.355C7.455 2.355 7.605 2.36 7.785 2.37C7.965 2.38 8.15 2.39 8.34 2.4C8.53 2.4 8.7 2.4 8.85 2.4C9.08 2.4 9.32 2.395 9.57 2.385C9.83 2.365 10.05 2.35 10.23 2.34C10.41 2.32 10.5 2.31 10.5 2.31L10.425 3.165C10.095 3.205 9.85 3.3 9.69 3.45C9.54 3.6 9.46 3.82 9.45 4.11L9.24 12.285L8.175 12.495ZM11.262 12.165L11.352 11.37C11.652 11.3 11.867 11.19 11.997 11.04C12.137 10.89 12.207 10.68 12.207 10.41V6.93C12.207 6.64 12.157 6.43 12.057 6.3C11.967 6.17 11.817 6.105 11.607 6.105C11.537 6.105 11.457 6.115 11.367 6.135C11.277 6.155 11.232 6.165 11.232 6.165L11.307 5.43C11.617 5.39 11.922 5.345 12.222 5.295C12.522 5.235 12.797 5.18 13.047 5.13C13.297 5.08 13.497 5.04 13.647 5.01C13.797 4.98 13.872 4.965 13.872 4.965L13.977 5.175C13.937 5.285 13.892 5.505 13.842 5.835C13.802 6.155 13.767 6.555 13.737 7.035C13.707 7.515 13.682 8.05 13.662 8.64C13.642 9.22 13.632 9.83 13.632 10.47C13.632 10.73 13.667 10.92 13.737 11.04C13.817 11.15 13.947 11.205 14.127 11.205C14.207 11.205 14.302 11.2 14.412 11.19C14.532 11.18 14.592 11.175 14.592 11.175L14.637 11.235L14.502 12.045C14.502 12.045 14.447 12.04 14.337 12.03C14.237 12.03 14.107 12.025 13.947 12.015C13.797 12.015 13.632 12.01 13.452 12C13.282 12 13.122 12 12.972 12C12.742 12 12.492 12.015 12.222 12.045C11.962 12.075 11.737 12.1 11.547 12.12C11.357 12.15 11.262 12.165 11.262 12.165ZM12.807 3.48C12.507 3.48 12.277 3.39 12.117 3.21C11.967 3.02 11.892 2.795 11.892 2.535C11.892 2.235 11.992 1.985 12.192 1.785C12.392 1.575 12.647 1.47 12.957 1.47C13.247 1.47 13.467 1.56 13.617 1.74C13.777 1.92 13.857 2.145 13.857 2.415C13.857 2.715 13.762 2.97 13.572 3.18C13.382 3.38 13.127 3.48 12.807 3.48ZM18.7632 12.18C18.1032 12.18 17.5282 12.04 17.0382 11.76C16.5582 11.48 16.1832 11.09 15.9132 10.59C15.6532 10.08 15.5232 9.475 15.5232 8.775C15.5232 8.045 15.6782 7.395 15.9882 6.825C16.2982 6.245 16.7232 5.79 17.2632 5.46C17.8032 5.13 18.4132 4.965 19.0932 4.965C19.4532 4.965 19.7682 4.99 20.0382 5.04C20.3182 5.08 20.5382 5.125 20.6982 5.175C20.8582 5.225 20.9382 5.25 20.9382 5.25L20.9832 5.385C20.9832 5.385 20.9582 5.485 20.9082 5.685C20.8682 5.875 20.8232 6.14 20.7732 6.48C20.7232 6.82 20.6882 7.19 20.6682 7.59L19.8432 7.65V7.155C19.8432 6.805 19.7482 6.53 19.5582 6.33C19.3782 6.13 19.1232 6.03 18.7932 6.03C18.2632 6.03 17.8582 6.22 17.5782 6.6C17.2982 6.98 17.1582 7.525 17.1582 8.235C17.1582 9.075 17.3182 9.73 17.6382 10.2C17.9582 10.66 18.4082 10.89 18.9882 10.89C19.2582 10.89 19.5182 10.85 19.7682 10.77C20.0182 10.69 20.2232 10.615 20.3832 10.545C20.5432 10.465 20.6232 10.425 20.6232 10.425L20.7282 10.47L20.9382 11.115C20.9382 11.115 20.8632 11.17 20.7132 11.28C20.5732 11.38 20.3882 11.505 20.1582 11.655C19.9282 11.795 19.6882 11.915 19.4382 12.015C19.1882 12.125 18.9632 12.18 18.7632 12.18ZM21.8803 11.25C22.1603 11.22 22.3553 11.145 22.4653 11.025C22.5753 10.905 22.6303 10.71 22.6303 10.44V2.85C22.6303 2.56 22.5853 2.355 22.4953 2.235C22.4053 2.105 22.2503 2.04 22.0303 2.04H21.7003L21.6403 1.98L21.7153 1.335C21.9753 1.295 22.2703 1.25 22.6003 1.2C22.9303 1.15 23.2553 1.095 23.5753 1.035C23.8953 0.974999 24.1703 0.919999 24.4003 0.869999L24.5053 1.11C24.4553 1.19 24.4003 1.45 24.3403 1.89C24.2903 2.33 24.2453 2.92 24.2053 3.66C24.1753 4.39 24.1453 5.235 24.1153 6.195C24.2253 6.095 24.3703 5.975 24.5503 5.835C24.7403 5.695 24.9403 5.56 25.1503 5.43C25.3603 5.3 25.5603 5.19 25.7503 5.1C25.9403 5.01 26.0953 4.965 26.2153 4.965C26.9153 4.965 27.4503 5.13 27.8203 5.46C28.2003 5.79 28.3903 6.27 28.3903 6.9C28.3903 7.04 28.3753 7.265 28.3453 7.575C28.3153 7.875 28.2853 8.21 28.2553 8.58C28.2253 8.95 28.1953 9.305 28.1653 9.645C28.1353 9.975 28.1203 10.24 28.1203 10.44C28.1203 10.71 28.1553 10.905 28.2253 11.025C28.3053 11.145 28.4353 11.205 28.6153 11.205C28.6753 11.205 28.7553 11.205 28.8553 11.205C28.9553 11.195 29.0403 11.185 29.1103 11.175L29.1403 11.235L29.0053 12.045C28.8053 12.035 28.5553 12.025 28.2553 12.015C27.9553 12.005 27.7053 12 27.5053 12C27.3853 12 27.2303 12.005 27.0403 12.015C26.8603 12.025 26.6703 12.04 26.4703 12.06C26.2703 12.08 26.0753 12.11 25.8853 12.15L25.9603 11.34C26.2303 11.28 26.4203 11.18 26.5303 11.04C26.6503 10.89 26.7103 10.69 26.7103 10.44L26.7853 7.71C26.7953 7.24 26.7053 6.885 26.5153 6.645C26.3353 6.405 26.0653 6.285 25.7053 6.285C25.4953 6.285 25.2403 6.355 24.9403 6.495C24.6403 6.625 24.3603 6.79 24.1003 6.99C24.0903 7.32 24.0803 7.66 24.0703 8.01C24.0703 8.36 24.0653 8.735 24.0553 9.135C24.0553 9.535 24.0553 9.975 24.0553 10.455C24.0553 10.735 24.0953 10.93 24.1753 11.04C24.2553 11.15 24.3803 11.205 24.5503 11.205C24.6003 11.205 24.6703 11.205 24.7603 11.205C24.8503 11.195 24.9253 11.185 24.9853 11.175L25.0303 11.25L24.8803 12.045C24.6803 12.035 24.4303 12.025 24.1303 12.015C23.8303 12.005 23.5753 12 23.3653 12C23.1453 12 22.8853 12.005 22.5853 12.015C22.2853 12.025 22.0153 12.035 21.7753 12.045L21.8803 11.25ZM33.2663 12.18C32.5963 12.18 32.0163 12.04 31.5263 11.76C31.0363 11.48 30.6563 11.085 30.3863 10.575C30.1163 10.065 29.9813 9.465 29.9813 8.775C29.9813 8.255 30.0663 7.765 30.2363 7.305C30.4163 6.835 30.6663 6.425 30.9863 6.075C31.3063 5.725 31.6713 5.455 32.0813 5.265C32.5013 5.065 32.9513 4.965 33.4313 4.965C35.0313 4.965 35.8313 5.76 35.8313 7.35C35.8313 7.5 35.8213 7.65 35.8013 7.8C35.7813 7.95 35.7613 8.07 35.7413 8.16L35.5463 8.325H31.5563C31.5663 9.105 31.7313 9.715 32.0513 10.155C32.3713 10.595 32.8163 10.845 33.3862 10.905C33.9563 10.955 34.6313 10.805 35.4113 10.455L35.5163 10.5L35.7263 11.115C35.5163 11.255 35.2663 11.41 34.9763 11.58C34.6863 11.75 34.3913 11.89 34.0913 12C33.7913 12.12 33.5163 12.18 33.2663 12.18ZM31.5863 7.62L33.9113 7.5C34.0413 7.48 34.1263 7.45 34.1663 7.41C34.2163 7.36 34.2413 7.265 34.2413 7.125C34.2413 6.745 34.1463 6.46 33.9563 6.27C33.7763 6.07 33.5113 5.97 33.1613 5.97C32.7413 5.97 32.3913 6.115 32.1113 6.405C31.8313 6.685 31.6563 7.09 31.5863 7.62Z"
                            fill="url(#paint0_linear_14_3)" />
                        <defs>
                        <linearGradient id="paint0_linear_14_3" x1="18.5" y1="-3" x2="18.5" y2="17"
                                        gradientUnits="userSpaceOnUse">
                        <stop stop-color="#C04C71" />
                        <stop offset="0.265123" stop-color="#FCBE67" />
                        <stop offset="0.650788" stop-color="#C04C71" />
                        </linearGradient>
                        </defs>
                        </svg>
                    </a>
                </div>
                <nav class="menu" style="">
                    <a style="font-weight: bold" href="damas.jsp">Damas</a>
                    <a href="caballeros.jsp">Caballeros</a>
                    <a href="niños.jsp">Niños</a>
                    <a href="accesorios.jsp">Accesorios</a>
                </nav>
                <div class="menu-op">
                    <%
                        if ((sesion.getAttribute("correo") != null) && ((session.getAttribute("rol") == "1") || (session.getAttribute("rol") == "2"))) {
                    %>    
                    <a href="admin.jsp">
                        <i class="fa-solid fa-user"></i>                       
                    </a>
                    <%
                    } else if ((sesion.getAttribute("correo") != null) && ((session.getAttribute("rol") == "3"))) {
                    %> 
                    <a href="clientes.jsp">
                        <i class="fa-solid fa-user-check"></i>                        
                    </a>
                    <%
                    } else { %>
                    <a href="login.jsp">
                        <i class="fa-solid fa-user"></i>
                    </a>    
                    <%}%>

                    <%
                        if ((sesion.getAttribute("listaEstadoCarrito")) == null) {
                    %>                    
                    <a href="SrvProducto?action=Carrito">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" style="margin-top: -0.13rem;"><path d="M21 4H2v2h2.3l3.28 9a3 3 0 0 0 2.82 2H19v-2h-8.6a1 1 0 0 1-.94-.66L9 13h9.28a2 2 0 0 0 1.92-1.45L22 5.27A1 1 0 0 0 21.27 4 .84.84 0 0 0 21 4zm-2.75 7h-10L6.43 6h13.24z"></path><circle cx="10.5" cy="19.5" r="1.5"></circle><circle cx="16.5" cy="19.5" r="1.5"></circle></svg>
                    </a>
                    <%} else if ((sesion.getAttribute("listaEstadoCarrito")) == "1") {%>                      
                    <a href="SrvProducto?action=Carrito">
                        <svg width="30" height="30" viewBox="0 0 92 66" fill="none" style="margin-top:-0.13rem;" xmlns="http://www.w3.org/2000/svg">
                        <path d="M73.7563 0H11.6457H7.76382H0V7.76382H7.76382H8.9284L22.5966 45.3524C23.703 48.4113 26.6377 50.4649 29.8907 50.4649H62.1106V42.701H29.8907L27.0647 34.9372H62.1106C63.6633 34.9372 65.0686 34.0133 65.6781 32.5848L77.3238 5.41139C77.8401 4.21187 77.7159 2.83768 76.9977 1.74686C76.2757 0.656042 75.0606 0 73.7563 0Z" fill="#FCBE67"/>
                        <path d="M32.9962 65.9925C36.2121 65.9925 38.8191 63.3855 38.8191 60.1696C38.8191 56.9538 36.2121 54.3468 32.9962 54.3468C29.7803 54.3468 27.1733 56.9538 27.1733 60.1696C27.1733 63.3855 29.7803 65.9925 32.9962 65.9925Z" fill="#FCBE67"/>
                        <path d="M56.2877 65.9925C59.5036 65.9925 62.1106 63.3855 62.1106 60.1696C62.1106 56.9538 59.5036 54.3468 56.2877 54.3468C53.0719 54.3468 50.4649 56.9538 50.4649 60.1696C50.4649 63.3855 53.0719 65.9925 56.2877 65.9925Z" fill="#FCBE67"/>
                        <circle cx="71.5" cy="40.5" r="20.5" fill="#343740"/>
                        <circle cx="73" cy="40" r="14" fill="white"/>
                        <path d="M72 25C63.1776 25 56 31.9533 56 40.5C56 49.0467 63.1776 56 72 56C80.8224 56 88 49.0467 88 40.5C88 31.9533 80.8224 25 72 25ZM68.8016 47.3401L62.8608 41.5974L65.12 39.4026L68.7984 42.9598L77.2688 34.7542L79.5312 36.9458L68.8016 47.3401Z" fill="#178823"/>
                        </svg>
                    </a>
                    <%} else if ((sesion.getAttribute("listaEstadoCarrito")) == "0") { %>
                    <a href="SrvProducto?action=Carrito">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" style="margin-top: -0.13rem;"><path d="M21 4H2v2h2.3l3.28 9a3 3 0 0 0 2.82 2H19v-2h-8.6a1 1 0 0 1-.94-.66L9 13h9.28a2 2 0 0 0 1.92-1.45L22 5.27A1 1 0 0 0 21.27 4 .84.84 0 0 0 21 4zm-2.75 7h-10L6.43 6h13.24z"></path><circle cx="10.5" cy="19.5" r="1.5"></circle><circle cx="16.5" cy="19.5" r="1.5"></circle></svg>
                    </a>
                    <%}%>
                </div>
            </section>
        </header>

        <section class="contenido-carrito">
            <div class="contenedor-form-cliente">
                <h2><b>Datos Envio</b></h2>
                <section class="form-cliente-contenido box-shadow-1">
                    <form action="SrvCliente" method="post" id="form-cliente" class="form-group form-cliente" style="text-align: left;">                                                                                 
                        <input type="hidden" name="txt_id" id="txt_id" class="form-control" value="0" readonly required >                                                    
                        <label for="txt_departamento"><b>Departamento</b></label>
                        <input type="text" name="txt_departamento" id="txt_departamento" class="form-control" required>
                        <label for="txt_municipio"><b>Municipio</b></label>
                        <input type="text" name="txt_municipio" id="txt_municipio" class="form-control" required>
                        <label for="txt_dir_exacta"><b>Dirección Exacta</b></label>
                        <input type="text" name="txt_dir_exacta" id="txt_dir_exacta" class="form-control" required>                                                    
                        <label for="txt_referencia"><b>Referencia Lugar</b></label>
                        <input type="text" name="txt_referencia" id="txt_referencia" class="form-control" required>                                                    
                        <label for="txt_recibe"><b>Persona que Recibe</b></label>
                        <input type="text" name="txt_recibe" id="txt_recibe" class="form-control" required>                                                    
                        <label for="txt_telefono"><b>Teléfono</b></label>
                        <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required><br> 
                        <input type="hidden" name="txt_id_cliente" id="txt_id_cliente" class="form-control" value="0" readonly required> 
                        
                        
                        <br>
                        <%
                         if((request.getAttribute("Encontrado"))=="1"){                        
                        %>
                        <button id="btn_modificar" type="submit" name="accion" class="btn-opcion-modal" value="modificarDatosEnvio" style="display:inline-block;">Modificar</button>                                                                
                        <%
                            }else{
                        %>
                        <button id="btn_modificar" type="submit" name="accion" class="btn-opcion-modal" value="ingresarDatosEnvio" style="display:inline-block;">Ingresar</button>                                                                
                        <%
                            }
                        %>
                        <a href="clientes.jsp" style="display:inline-block;">Regresar</a>                                                                
                    </form>                        
                </section>

                <div>
                    <input type="hidden" id="id_envio" value="${datosEnvio.getId_envio()}">
                    <input type="hidden" id="departamento" value="${datosEnvio.getDepartamento()}">
                    <input type="hidden" id="municipio" value="${datosEnvio.getMunicipio()}">
                    <input type="hidden" id="direccion" value="${datosEnvio.getDireccion()}">
                    <input type="hidden" id="referencia" value="${datosEnvio.getReferencia()}">
                    <input type="hidden" id="persona" value="${datosEnvio.getPersona()}">
                    <input type="hidden" id="telefono" value="${datosEnvio.getTelefono()}">  
                    <input type="hidden" id="id_cliente" value="${cliente.getId_cliente()}">  
                </div>

            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script>

        var img = document.getElementById('imagen');
        var nombreUrl = "SrvProductoIMG?id=";
        var url;



        function asignar() {

            var id_envio = document.getElementById('id_envio').value;
            var departamento = document.getElementById('departamento').value;
            var municipio = document.getElementById('municipio').value;
            var direccion = document.getElementById('direccion').value;
            var referencia = document.getElementById('referencia').value;
            var persona = document.getElementById('persona').value;
            var telefono = document.getElementById('telefono').value;
            var id_cliente = document.getElementById('id_cliente').value;


            $("#txt_id").val(id_envio);
            $("#txt_departamento").val(departamento);
            $("#txt_municipio").val(municipio);
            $("#txt_dir_exacta").val(direccion);
            $("#txt_referencia").val(referencia);
            $("#txt_recibe").val(persona);
            $("#txt_telefono").val(telefono);
            $("#txt_id_cliente").val(id_cliente);
            
        }

        </script>

        <%            } else {
                response.sendRedirect("admin.jsp");
            }
        %> 
    </body> 

</html>
