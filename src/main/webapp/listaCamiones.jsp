<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@page
import="java.util.*" %> <%@page import="com.genis.app.rutas.models.*" %> <%
//recuperamos la lista de camiones que seteamos en el request desde el servlet
List<Camion>
  camiones = (List<Camion
    >) request.getAttribute("camiones"); %>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Lista Camiones</title>
        <link
          href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css"
          rel="stylesheet"
        />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
      </head>
      <body>
        <header class="pb-6">
          <nav
            class="fixed w-full bg-white border-gray-200 z-10 shadow-md dark:bg-gray-900 dark:border-gray-700"
          >
            <div
              class="max-w-screen-xl bg-white dark:bg-gray-900 flex flex-wrap items-center justify-between mx-auto p-4"
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
                            >Lista Camiones</a
                          >
                        </li>
                        <li>
                          <a
                            href="<%=request.getContextPath()%>/camiones/alta"
                            class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                            >Alta Camiones</a
                          >
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
        <section class="px-6 py-12">
          <div class="flex text-center p-20 justify-center">
            <h2 class="text-2xl font-bold text-ceter">Listado De Camiones</h2>
          </div>
          <div>
            <button
              class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
            >
              <a href="<%=request.getContextPath()%>/camiones/alta" class="">
                Alta Camion
              </a>
            </button>
            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
              <table
                class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400"
              >
                <thead
                  class="text-xs text-gray-700 uppercase dark:text-gray-400"
                >
                  <tr class="text-center">
                    <th
                      scope="col"
                      class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                    >
                      ID
                    </th>
                    <th scope="col" class="px-6 py-3">MATRICULA</th>
                    <th
                      scope="col"
                      class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                    >
                      TIPO DE CAMION
                    </th>
                    <th
                      scope="col"
                      class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                    >
                      MODELO
                    </th>
                    <th
                      scope="col"
                      class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                    >
                      MARCA
                    </th>
                    <th
                      scope="col"
                      class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                    >
                      CAPACIDAD
                    </th>
                    <th
                    scope="col"
                    class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                  >
                    KILOMETRAJE
                  </th>
                  <th
                  scope="col"
                  class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                >
                  DETALLE DE CAMIONES
                </th>
                    <th scope="col" class="px-6 py-3">EDITAR CAMIONES</th>
                    <th
                      scope="col"
                      class="px-6 py-3 bg-gray-50 dark:bg-gray-800"
                    >
                      ELIMINAR CAMIONES
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <% for(Camion c : camiones) { %>
                  <tr
                    class="text-center border-b border-gray-200 dark:border-gray-700"
                  >
                    <td class="py-6 text-blue-500"><%=c.getId()%></td>
                    <td class="py-6"><%=c.getMatricula()%></td>
                    <td class="py-6"><%=c.getTipoCamion()%></td>
                    <td class="py-6"><%=c.getModelo()%></td>
                    <td class="py-6"><%=c.getMarca()%></td>
                    <td class="py-6"><%=c.getCapacidad()%></td>
                    <td class="py-6"><%=c.getKilometraje()%></td>
                    <td class="py-6">
                      <a
                        href="<%=request.getContextPath()%>/choferes/detalle?id=<%=c.getId()%>"
                        class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800"
                        >Detalle</a
                      >
                    </td>
                    <td class="py-6">
                      <a
                        href="<%=request.getContextPath()%>/choferes/editar?id=<%=c.getId()%>"
                        class="p-6 text-blue-500 w-[10rem] text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                        >Editar
                      </a>
                    </td>
                    <td class="py-6">
                      <a
                        href="<%=request.getContextPath()%>/choferes/eliminar?id=<%=c.getId()%>"
                        class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
                        >Eliminar
                      </a>
                    </td>
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
          </div>
        </section>
      </body>
    </html>
  </Chofer></Chofer
>
