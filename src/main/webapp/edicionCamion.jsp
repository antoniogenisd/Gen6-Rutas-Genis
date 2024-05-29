<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.genis.app.rutas.models.enums.*" %>
<%@page import="com.genis.app.rutas.models.*" %>
<%@page import="java.time.format.*"%>


<%
    Map<String, String> errores = (Map<String,String>) request.getAttribute("errores");
        Camion camion = (Camion) request.getAttribute("camion");
        Boolean estado = camion.getDisponibilidad();
        String disponible = estado == true ? "checked" : "";
        String camionModel = camion.getModelo().toString();
        int Anio = new Date().getYear()+1900;
        String camionTipo = camion.getTipoCamion().toString();

%>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Edicion Camion</title>
        <link
          href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css"
          rel="stylesheet"
        />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
      </head>
      <body>
        <header class="pb-6">
          <nav
            class="bg-white border-gray-200 dark:bg-gray-900 dark:border-gray-700"
          >
            <div
              class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4"
            >
              <a
                href="#top"
                class="flex items-center space-x-3 rtl:space-x-reverse"
              >
                <span
                  class="self-center text-blue-500 text-2xl font-semibold whitespace-nowrap dark:text-white"
                  >Rutas App</span
                >
              </a>
              <button
                data-collapse-toggle="navbar-dropdown"
                type="button"
                class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                aria-controls="navbar-dropdown"
                aria-expanded="false"
              >
                <span class="sr-only">Open main menu</span>
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 17 14"
                >
                  <path
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M1 1h15M1 7h15M1 13h15"
                  />
                </svg>
              </button>
              <div
                class="hidden w-full md:block md:w-auto"
                id="navbar-dropdown"
              >
                <ul
                  class="flex flex-col font-medium p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700"
                >
                  <li>
                    <button
                      id="dropdownNavbarLink"
                      data-dropdown-toggle="dropChoferes"
                      class="flex items-center justify-between w-full py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 md:w-auto dark:text-white md:dark:hover:text-blue-500 dark:focus:text-white dark:border-gray-700 dark:hover:bg-gray-700 md:dark:hover:bg-transparent"
                    >
                      Choferes
                      <svg
                        class="w-2.5 h-2.5 ms-2.5"
                        aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 10 6"
                      >
                        <path
                          stroke="currentColor"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="m1 1 4 4 4-4"
                        />
                      </svg>
                    </button>
                  </li>
                  <li>
                    <button
                      id="dropdownNavbarLink"
                      data-dropdown-toggle="dropCamiones"
                      class="flex items-center justify-between w-full py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 md:w-auto dark:text-white md:dark:hover:text-blue-500 dark:focus:text-white dark:border-gray-700 dark:hover:bg-gray-700 md:dark:hover:bg-transparent"
                    >
                      Camiones
                      <svg
                        class="w-2.5 h-2.5 ms-2.5"
                        aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 10 6"
                      >
                        <path
                          stroke="currentColor"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="m1 1 4 4 4-4"
                        />
                      </svg>
                    </button>
                    <div
                      id="dropCamiones"
                      class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600"
                    >
                      <ul
                        class="py-2 text-sm text-gray-700 dark:text-gray-400"
                        aria-labelledby="dropdownLargeButton"
                      >
                        <li>
                          <a
                            href="<%=request.getContextPath()%>/camiones/listar"
                            class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                            >Lista Camiones</a>
                        </li>
                        <li>
                          <a
                            href="<%=request.getContextPath()%>/camiones/alta"
                            class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                            >Alta Camiones</a>
                        </li>
                      </ul>
                    </div>
                    <div
                      id="dropChoferes"
                      class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600"
                    >
                      <ul
                        class="py-2 text-sm text-gray-700 dark:text-gray-400"
                        aria-labelledby="dropdownLargeButton"
                      >
                        <li>
                          <a
                            href="<%=request.getContextPath()%>/choferes/listar"
                            class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                            >Lista Choferes</a
                          >
                        </li>
                        <li>
                          <a
                            href="<%=request.getContextPath()%>/choferes/alta"
                            class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                            >Alta Chofer</a
                          >
                        </li>
                      </ul>
                    </div>
                    <!-- Dropdown menu -->
                    <div
                      id="dropdownNavbar"
                      class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600"
                    >
                      <ul
                        class="py-2 text-sm text-gray-700 dark:text-gray-400"
                        aria-labelledby="dropdownLargeButton"
                      >
                        <li>
                          <a
                            href="<%=request.getContextPath()%>/rutas/alta"
                            class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                            >Alta Rutas</a
                          >
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li>
                    <button
                      id="dropdownNavbarLink"
                      data-dropdown-toggle="dropdownNavbar"
                      class="flex items-center justify-between w-full py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 md:w-auto dark:text-white md:dark:hover:text-blue-500 dark:focus:text-white dark:border-gray-700 dark:hover:bg-gray-700 md:dark:hover:bg-transparent"
                    >
                      Rutas
                      <svg
                        class="w-2.5 h-2.5 ms-2.5"
                        aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 10 6"
                      >
                        <path
                          stroke="currentColor"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="m1 1 4 4 4-4"
                        />
                      </svg>
                    </button>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </header>
        <section class="px-6">
            <div class="flex text-center p-20 justify-center">
              <h2 class="text-2xl font-bold text-ceter">Formulario Edicion De Camiones</h2>
            </div>
              <div class="relative overflow-x-auto sm:rounded-lg ">
              <br>
              <% if(errores != null && errores.size()>0){ %>
                <ul class="alert alert-danger">
                  <% for(String error: errores.values()){ %>
                    <li>
                      <%=error%>
                    </li>
                    <% } %>
                </ul>
                <% } %>
                <div>
                  <form
                  action="<%=request.getContextPath()%>/camiones/alta"
                  method="post"
                  class="max-w-2xl mx-auto"
                  >

                  <input type="hidden" name="id" value="<%=camion.getId()%>">

                  <div class="grid grid-cols-3 gap-6">
                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Matricula</label>
                        <input type="text"
                        class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        name="matricula" id="matricula" value="<%=camion.getMatricula() != null? camion.getMatricula() : "" %>">
                        <% if (errores != null && errores.containsKey("matricula")){
                            out.println("<span class='text-red-400'>" + errores.get("matricula") + "</span>");
                        }
                        %>
                    </div>

                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tipo</label>
                        <select name="tipoCamion" id="tipoCamion" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            <% for(Tipos tipoCamion : Tipos.values()){
                            if(tipoCamion == camion.getTipoCamion()){ %>
                                <option selected value="<%=tipoCamion%>"><%=tipoCamion%></option>
                                <%} else {%>
                                <option  value="<%=tipoCamion%>"><%=tipoCamion%></option>
                                <%}%>
                                <% }%>
                        </select>
                        <% if (errores != null && errores.containsKey("tipo")){
                            out.println("<span class='text-red-400'>" + errores.get("tipo") + "</span>");
                        }
                        %>
                    </div>

                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Marca</label>
                        <select name="marca" id="marcas" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            <% for(Marcas marcas : Marcas.values()){
                            if(marcas == camion.getMarca()){ %>
                                <option selected value="<%=marcas%>"><%=marcas%></option>
                                <%} else {%>
                                <option value="<%=marcas%>"><%=marcas%></option>
                                <%}%>
                                <% }%>
                        </select>
                        <% if (errores != null && errores.containsKey("marca")){
                            out.println("<span class='text-red-400'>" + errores.get("marca") + "</span>");
                        }
                        %>
                    </div>

                    </div>

                    <div class="grid grid-cols-3 gap-6">
                        <div class="mb-5">
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Modelo</label>

                                <select name="modelo"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                id="modelo" >
                                        <% for(int i = Anio-20; i <= Anio+1; i++){
                                        if(i == camion.getModelo()){ %>
                                    <option selected value="<%=i%>"><%=i%></option>
                                    <%} else {%>
                                        <option value="<%=i%>"><%=i%></option>
                                        <%}%>
                                    <% }%>
                                </select>
                                <% if (errores != null && errores.containsKey("modelo")){
                                    out.println("<span class='text-red-400'>" + errores.get("modelo") + "</span>");
                                }
                                %>
                            </div>

                            <div class="mb-5">
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Capacidad</label>
                                <input type="text"
                                class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                name="capacidad" id="capacidad" value="<%=camion.getCapacidad() != null? camion.getCapacidad() : "" %>">
                                <% if (errores != null && errores.containsKey("capacidad")){
                                    out.println("<span class='text-red-400'>" + errores.get("capacidad") + "</span>");
                                }
                                %>
                            </div>
                            <div class="mb-5">
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Kilometraje</label>
                                <input type="text"
                                class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                name="kilometraje" id="kilometraje"value="<%=camion.getKilometraje() != null? camion.getKilometraje() : "" %>" >
                                <% if (errores != null && errores.containsKey("kilometraje")){
                                    out.println("<span class='text-red-400'>" + errores.get("kilometraje") + "</span>");
                                }
                                %>
                        </div>
                    </div>


                    <div class="flex items-start mb-5">
                      <div class="flex items-center h-5">
                        <input
                        id="disponiblidad"
                        type="checkbox"
                        value="${param.disponiblidad}"
                        checked
                        name="disponiblidad"
                        class="form-check-input w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800"  />
                      </div>
                      <label for="disponible" class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Disponible</label>
                    </div>
                    <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Guardar</button>
                    </form>
                  </div>
                  </div>
              </div>
          </section>

      </body>
    </html>
  </Chofer></Chofer
>
