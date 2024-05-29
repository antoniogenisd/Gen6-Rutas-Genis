<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.genis.app.rutas.models.*" %>
<%@page import="java.time.format.*"%>


<%
    Map<String, String> errores = (Map<String,String>) request.getAttribute("errores");
        Chofer chofer = (Chofer) request.getAttribute("chofer");
        String fecha = chofer.getFechaNacimiento() != null ? chofer.getFechaNacimiento().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) : "";
        Boolean estado = chofer.getDisponibilidad();
        String disponible = estado == true ? "checked" : "";
%>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Edicion Choferes</title>
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
            <h2 class="text-2xl font-bold text-ceter">Formulario Edicion De Choferes</h2>
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
                action="<%=request.getContextPath()%>/choferes/editar"
                method="post"
                class="max-w-2xl mx-auto"
                >
                <input type="hidden" name="id" value="<%=chofer.getId()%>">

                <div class="grid grid-cols-3 gap-6">
                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nombre</label>
                        <input type="text" name="nombre" id="nombre" value="<%=chofer.getNombre() != null? chofer.getNombre() : "" %>" class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <% if (errores != null && errores.containsKey("nombre")){
                            out.println("<span class='text-red'>" + errores.get("nombre") + "</span>");
                           }
                           %>
                    </div>
                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Apellido Paterno</label>
                        <input type="text"
                        class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        name="apPaterno" id="apPaterno" value="<%=chofer.getApPaterno() != null? chofer.getApPaterno() : "" %>">
                        <% if (errores != null && errores.containsKey("apPaterno")){
                            out.println("<span class='text-red'>" + errores.get("apPaterno") + "</span>");
                           }
                           %>
                    </div>
                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Apellido Materno</label>
                        <input type="text"
                        class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        name="apMaterno" id="apMaterno" value="<%=chofer.getApMaterno() != null? chofer.getApMaterno() : "" %>">
                        <% if (errores != null && errores.containsKey("apMaterno")){
                            out.println("<span class='text-red'>" + errores.get("apMaterno") + "</span>");
                           }
                           %>
                    </div>

                  </div>

                  <div class="grid grid-cols-2 gap-6">
                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Licencia</label>
                        <input type="text"
                        class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        name="licencia" id="licencia" value="<%=chofer.getLicencia() != null? chofer.getLicencia() : "" %>">
                        <% if (errores != null && errores.containsKey("licencia")){
                            out.println("<span class='text-red'>" + errores.get("licencia") + "</span>");
                           }
                           %>
                    </div>
                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Telefono</label>
                        <input type="text"
                        class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        name="telefono" id="telefono" value="<%=chofer.getTelefono() != null? chofer.getTelefono() : "" %>">
                        <% if (errores != null && errores.containsKey("telefono")){
                            out.println("<span class='text-red'>" + errores.get("telefono") + "</span>");
                           }
                           %>
                    </div>
                    <div class="mb-5">
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Fecha de Nacimiento</label>
                        <input type="date" name="fechaNacimiento" id="fechaNacimiento" value="<%=fecha%>" class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <% if (errores != null && errores.containsKey("fechaNacimiento")){
                            out.println("<span class='text-red'>" + errores.get("fechaNacimiento") + "</span>");
                           }
                           %>
                    </div>
                  </div>


                  <div class="flex items-start mb-5">
                    <div class="flex items-center h-5">
                      <input
                      name="disponiblidad"
                      class="form-check-input w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800"
                      id="disponiblidad"
                      type="checkbox"
                      value="1"
                      <%=disponible%>  />
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
