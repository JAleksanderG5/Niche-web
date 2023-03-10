<%@page import="java.util.HashMap"%>
<%@page import="Modelo.PedidosDAO"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.ProductoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head lang="es">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="favicon" href="https://nichegt.azurewebsites.net/assets/logoNiche.png">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Niche</title>
        <style>
            html{
                font-family: "Nunito Sans", sans-serif;
            }

            body{
                background-color: white;
                font-family: "Nunito Sans", sans-serif;
            }
        </style>
    </head>
    <body>
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
                    <a href="ni??os.jsp">Ni??os</a>
                    <a href="accesorios.jsp">Accesorios</a>
                </nav>
                <div class="menu-op">
                    <%
                        HttpSession sesion = request.getSession();
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

        <%
            if ((sesion.getAttribute("listaEstadoCarrito")) == null) {
        %>    
        <div class="contenedor-carrito-vacio">        
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 x="0px" y="0px" width="103.696px" height="103.695px" viewBox="0 0 103.696 103.695"
                 style="enable-background:new 0 0 103.696 103.695;" xml:space="preserve">
            <g>
            <path d="M23.507,51.13c-1.212-1.133-1.274-3.033-0.142-4.246c1.132-1.213,3.018-1.291,4.247-0.143
                  c3.251,3.053,6.589,0.242,6.959-0.088c1.105-0.99,2.741-1.012,3.867-0.119c0.133,0.104,0.259,0.223,0.376,0.354
                  c1.106,1.236,1.001,3.135-0.235,4.242C35.915,53.516,29.371,56.615,23.507,51.13z M80.32,46.853
                  c1.106,1.236,1.001,3.135-0.235,4.242c-2.664,2.385-9.208,5.484-15.072,0c-1.211-1.133-1.273-3.033-0.142-4.246
                  s3.019-1.291,4.247-0.143c3.251,3.053,6.589,0.242,6.959-0.088c1.105-0.99,2.741-1.012,3.867-0.119
                  C80.077,46.603,80.202,46.722,80.32,46.853z M75.834,78.15c0.658,1.521-0.041,3.287-1.562,3.945
                  c-1.521,0.66-3.285-0.041-3.943-1.563c-2.895-6.688-9.73-11.013-17.422-11.013c-7.867,0-14.746,4.32-17.523,11.007
                  c-0.479,1.151-1.596,1.85-2.771,1.85c-0.383,0-0.773-0.073-1.149-0.229c-1.53-0.637-2.255-2.393-1.62-3.922
                  c3.711-8.933,12.764-14.703,23.064-14.703C62.993,63.521,71.993,69.264,75.834,78.15z M85.465,103.695H18.23
                  C8.178,103.695,0,95.518,0,85.465V18.23C0,8.177,8.179,0,18.23,0h67.235c10.053,0,18.229,8.178,18.229,18.23v67.235
                  C103.696,95.518,95.518,103.695,85.465,103.695z M18.23,8.577c-5.322,0-9.652,4.33-9.652,9.652v67.234
                  c0,5.322,4.33,9.652,9.652,9.652h67.235c5.321,0,9.651-4.33,9.651-9.652V18.23c0-5.322-4.33-9.652-9.651-9.652L18.23,8.577
                  L18.23,8.577z" />
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            </svg>
            <h2>El carrito est?? vac??o</h2>
        </div>

        <%
        } else if ((sesion.getAttribute("listaEstadoCarrito")) == "0") {
        %>    
        <div class="contenedor-carrito-vacio">        
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 x="0px" y="0px" width="103.696px" height="103.695px" viewBox="0 0 103.696 103.695"
                 style="enable-background:new 0 0 103.696 103.695;" xml:space="preserve">
            <g>
            <path d="M23.507,51.13c-1.212-1.133-1.274-3.033-0.142-4.246c1.132-1.213,3.018-1.291,4.247-0.143
                  c3.251,3.053,6.589,0.242,6.959-0.088c1.105-0.99,2.741-1.012,3.867-0.119c0.133,0.104,0.259,0.223,0.376,0.354
                  c1.106,1.236,1.001,3.135-0.235,4.242C35.915,53.516,29.371,56.615,23.507,51.13z M80.32,46.853
                  c1.106,1.236,1.001,3.135-0.235,4.242c-2.664,2.385-9.208,5.484-15.072,0c-1.211-1.133-1.273-3.033-0.142-4.246
                  s3.019-1.291,4.247-0.143c3.251,3.053,6.589,0.242,6.959-0.088c1.105-0.99,2.741-1.012,3.867-0.119
                  C80.077,46.603,80.202,46.722,80.32,46.853z M75.834,78.15c0.658,1.521-0.041,3.287-1.562,3.945
                  c-1.521,0.66-3.285-0.041-3.943-1.563c-2.895-6.688-9.73-11.013-17.422-11.013c-7.867,0-14.746,4.32-17.523,11.007
                  c-0.479,1.151-1.596,1.85-2.771,1.85c-0.383,0-0.773-0.073-1.149-0.229c-1.53-0.637-2.255-2.393-1.62-3.922
                  c3.711-8.933,12.764-14.703,23.064-14.703C62.993,63.521,71.993,69.264,75.834,78.15z M85.465,103.695H18.23
                  C8.178,103.695,0,95.518,0,85.465V18.23C0,8.177,8.179,0,18.23,0h67.235c10.053,0,18.229,8.178,18.229,18.23v67.235
                  C103.696,95.518,95.518,103.695,85.465,103.695z M18.23,8.577c-5.322,0-9.652,4.33-9.652,9.652v67.234
                  c0,5.322,4.33,9.652,9.652,9.652h67.235c5.321,0,9.651-4.33,9.651-9.652V18.23c0-5.322-4.33-9.652-9.651-9.652L18.23,8.577
                  L18.23,8.577z" />
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            <g>
            </g>
            </svg>
            <h2>El carrito est?? vac??o</h2>
        </div>
        <%  } else if ((sesion.getAttribute("listaEstadoCarrito")) == "1") { %>           

        <section class="contenido-carrito"> 
            <div class="contenedor mt-4">
                <h1 style="font-family: 'Nunito Sans', sans-serif; text-align: center;"><b>CARRITO COMPRAS</b></h1>
                <div class="col-sm-8">
                    <table class="table table-hover" style="text-align: center">
                        <thead>
                            <tr>
                                <th>C??digo</th>
                                <th>Producto</th>
                                <th>Imagen</th>
                                <th>Detalle</th>
                                <th>Precio</th>
                                <th>Acci??n</th>
                            </tr>
                        </thead>
                        <tbody class="carrito-tabla">
                            <c:forEach var="car" items="${carrito}">                            
                                <tr>
                                    <td style="display: none;">${car.getItem()}</td>
                                    <td>${car.getId_producto()}</td>
                                    <td>${car.getNombre()}</td>
                                    <td>
                                        <img src="SrvProductoIMG?id=${car.getId_producto()}" style="width: 100px; height: 100px; object-fit: contain; background-color: var(--color-fondo);">
                                    </td>   
                                    <td>${car.getDetalle()}</td>
                                    <td>${car.getPrecio()}</td>
                                    <td>
                                        <input type="hidden" id="idp" value="${car.getId_producto()}">
                                        <a href="#" id="btn-delete"><i class="fa-solid fa-trash-can"></i></a>
                                    </td> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="col-sm-4 carrito-card">
                    <div class="cards">
                        <div class="cards-titulo" style="text-align: center">
                            <h4><b>Datos generales</b></h4>
                        </div>
                        <div class="cards-body">
                            <label>Subtotal:</label>
                            <input type="text" id="txt_subtotal" value="${totalPagar}" readonly class="form-control">                            
                            <br>
                        </div>
                        <div class="cards-footer">
                            <%
                                if ((sesion.getAttribute("correo") != null) && ((session.getAttribute("rol") == "3"))) {
                            %>
                            <a style="cursor: pointer; color: var(--color-fondo-oscuro)" data-toggle="modal" data-target="#modalCompra">Comprar</a>
                            <%
                            } else {
                            %>
                            <a href="login.jsp" class="">Iniciar Sesi??n</a>
                            <!-- <a href="controlador?accion=GenerarCompra" class="">Iniciar Sesi??n</a> -->
                            <%}%>
                        </div>

                    </div>
                </div>

            </div>

            <!-- Modal -->
            <div class="modal fade" id="modalCompra" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" style="background-color: var(--color-fondo);">
                        <div class="modal-header modal-cabecera">
                            <h5  id="staticBackdropLabel"><b>Confirmaci??n de compra </b><i style="font-size: 1.5rem; color: var(--color-secundario)" class="fa-solid fa-face-laugh-wink"></i></h5>                          
                            <span ><b>Nota: </b> Precio en Quetzales</span>
                        </div>
                        <div class="modal-body">
                            <form action="SrvProducto" method="post">
                                <label><b>Subtotal:</b></label>
                                <input style="background: white;" type="text" id="txt_subtotal" name="txt_subtotal" value="${totalPagar}" readonly class="form-control"><br>
                                <label><b>Elegir m??todo de pago</b></label>                        
                                <select id="drop_pago" name="drop_pago" class="form-control" onchange="seleccionarPago();" required>
                                    <option id="opcionNull" style="display: inline;"></option>
                                    <option value="1">Deposito / transferencia + (Q50)</option>
                                    <option value="2">Contra entrega + (Q75)</option>
                                </select><br>
                                <label><b>Total:</b></label>
                                <br>                                
                                <input style="background: white;" type="number" name="total" id="total" class="form-control" readonly required>                                
                                <input type="hidden" id="txt_idCliente" name="txt_idCliente" value="${cliente.getId_cliente()}">                                
                                <br>
                                <div class="pedido-op">
                                    <button class="button-pedido" type="submit" id="accion" name="accion" value="registrarPedido">Aceptar</button>                                    
                                    <button class="button-pedido" type="button" data-dismiss="modal">Cancelar</button>
                                </div>
                            </form>                            
                        </div>
                    </div>
                </div>
            </div>            

        </section>


        <!-- <footer class="footer">            
             <div class="desarrollador">
                 <small>Sitio desarrollado por <a href="https://www.linkedin.com/in/jorge-garcia-morales-8923bb209/" target="_blank">@JorgeGarcia</a></small>                              
             </div>
         </footer> -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script src="js/script.js" type="text/javascript"></script>

        <script>

                                    var img = document.getElementById('imagen');
                                    var nombreUrl = "SrvProductoIMG?id=";
                                    var url;



                                    var fila, id, nombre, detalle, marca, talla, color, precio, imagen, estado;

                                    $(document).on("click", ".btn-ver", function () {
                                        fila = $(this).closest("tr");
                                        id = fila.find('td:eq(0)').text();
                                        nombre = fila.find('td:eq(1)').text();
                                        detalle = fila.find('td:eq(2)').text();
                                        marca = fila.find('td:eq(3)').text();
                                        talla = fila.find('td:eq(4)').text();
                                        color = fila.find('td:eq(5)').text();
                                        precio = fila.find('td:eq(6)').text();

                                        url = nombreUrl + id;
                                        img.src = url;

                                        $("#txt_nombre").val(nombre);
                                        $("#txt_detalle").val(detalle);
                                        $("#txt_marca").val(marca);
                                        $("#txt_talla").val(talla);
                                        $("#txt_color").val(color);
                                        $("#txt_precio").val(precio);
                                        $("#modalProducto").modal('show');
                                        // alert(nombres);
                                    });




                                    function seleccionarPago() {
                                        let subtotal = document.getElementById("txt_subtotal");
                                        let subtotalValor = subtotal.value;
                                        let valor = document.getElementById("drop_pago");
                                        let valorpago = valor.value;
                                        let total;

                                        document.getElementById('opcionNull').style.display = "none";

                                        if (parseInt(valorpago) === 1) {
                                            total = 50 + parseInt(subtotalValor);
                                        }
                                        if (parseInt(valorpago) === 2) {
                                            total = 75 + parseInt(subtotalValor);
                                        }

                                        //document.getElementById("total").innerText = total;
                                        $("#total").val(total);
                                    }
        </script>
        <% }%>

    </body>
</html>
