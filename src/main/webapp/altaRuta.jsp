<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@page
import="java.util.*" %> <%@page import="com.genis.app.rutas.models.*" %> <%
//recuperamos la lista de camiones que seteamos en el request desde el servlet
List<Chofer>
  choferes = (List<Chofer
    >) request.getAttribute("choferes");

    List<Camion>
        camiones = (List<Camion
          >) request.getAttribute("camiones");
    %>
  
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Alta Choferes</title>
        <link
          href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css"
          rel="stylesheet"
        />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
            <h2 class="text-2xl font-bold text-ceter">Formulario Alta De Rutas</h2>
          </div> 
          <div class="grid grid-cols-2 gap-12">
                <form>
                    <div class="grid gap-6 mb-6 md:grid-cols-2">
                    <script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>
                    <script src="https://maps.googleapis.com/maps/api/distancematrix/json?destinations=New%20York%20City%2C%20NY&origins=Washington%2C%20DC%7CBoston&units=imperial&key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Chofer</label>
                            <select  id="chofer" name="chofer" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" >
                              <option value="">Seleccionar</option>
                                <% for(Chofer c: choferes){ %>
                                    <option value="<%=c.getId()%>">
                                        <%=c.getNombre()%>
                                        <%}%>
                                    </option>
                            </select>
                        </div>
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Origen</label>
                            <div class="flex flex-col gap-4">
                              <input type="text" id="origen" name="origen" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"  />
                              <input type="hidden" id="idOrigen" name="idOrigen" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"  />
                              <button data-modal-target="MyModal" data-modal-toggle="MyModal"  onclick="getDireccion(1)" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
                              Obtener Datos
                            </button>
                            </div>
                        </div>
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Fecha Salida</label>
                            <input type="datetime-local" onchange="instFecha(this.value)" name="FSalida" id="FSalida" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                             <%-- <div class="flex gap-6">
                              <label for="time" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select time:</label>
                                  <input type="time" id="time" class="bg-gray-50 border leading-none border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" min="09:00" max="18:00" value="00:00" required />                        
                             </div> --%>
                        </div>  
                      
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Distancia</label>
                            <input disabled type="text" name="distancia" id="distancia" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                        </div>
                    </div>   
                </form>
                <form>
                    <div class="grid gap-6 mb-6 md:grid-cols-2">
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Camion</label>
                            <select onchange="capacidadCam(event)" id="chofer" name="chofer" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" >
                              <option value="">Seleccionar</option>
                                <% for(Camion c: camiones){ %>
                                    <option value="<%=c.getId()%>" capacidad = "<%=c.getCapacidad()%>">
                                        <%=c.getMatricula()%>
                                        <%}%>
                                    </option>
                            </select>
                        </div>
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Destino</label>
                            <div class="flex flex-col gap-4">
                             <input type="text" id="destino" name="destino" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"  />
                              <input type="hidden" id="idDestino" name="idDestino" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"  />
                              <button data-modal-target="MyModal" data-modal-toggle="MyModal"  onclick="getDireccion(2)" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
                              Obtener Datos
                            </button>
                            </div>
                        </div>
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Fecha Estimada De Llegada</label>
                            <input type="datetime-local"  name="FELlegada" id="FELlegada" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                        </div>  
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Capacidad De Camion</label>
                            <input disabled  value="" type="text" name="capCamion" id="capCamion" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                        </div>
                    </div>   
                </form>
          </div>
        </section>
       
       
        <section>
            <div class="flex text-center p-20 justify-center">
                <h2 class="text-2xl font-bold text-ceter">Cargamento</h2>
              </div> 
              <div class="flex justify-center items-center gap-6">
                <div>
                    <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Descripcion</label>
                    <input type="text" name="descripcion" id="descripcion" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                </div>  
                <div class="flex gap-2 justify-between items-center">
                    <div>
                        <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Peso</label>
                        <input type="text" name="descripcion" id="descripcion" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                    </div>
                    <button name="agregarCarga" id="agregarCarga" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
                        Agregar Carga
                    </button>
                </div> 
              </div>
        </section>



        <!-- Main modal -->
        <div id="MyModal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
            <div  class=" relative p-4 w-full max-w-md max-h-full">
                <!-- Modal content -->
                <div  class=" relative bg-white rounded-lg shadow dark:bg-gray-700">
                    <!-- Modal header -->
                    <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                           Guardar Direccion
                        </h3>
                        <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="MyModal">
                            <svg class="w-3 h-3 hidden" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                            </svg>
                            <span class="sr-only">Close modal</span>
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-4 md:p-5">
                        <form class="space-y-4" action="#">
                            <div>
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Calle</label>
                                <input type="text" name="Calle" id="Calle" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"  />
                            </div>
                            <div>
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Numero</label>
                                <input type="text"  name="Numero" id="Numero" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"  />
                            </div>
                            <div>
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Colonia</label>
                                <input type="text"  name="Colonia" id="Colonia" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"  />
                            </div>
                            <div>
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Ciudad</label>
                                <input type="text"  name="Ciudad" id="Ciudad" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"  />
                            </div>
                            <div>
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Estado</label>
                                <input type="text"  name="Estado" id="Estado" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"  />
                            </div>
                            <div>
                                <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">CP</label>
                                <input type="text"  name="CP" id="CP" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"  />
                            </div>
                        </form>
                        <div class="flex justify-between pt-6">
                            <button onclick="btnGuardarDir()" class="pt-2 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Guardar Direccion</button>
                            <button id="closeModal" data-modal-hide="MyModal" class="pt-2 text-white bg-red-400 hover:bg-red-600 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-red-600" >Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <script>
          function ocultarModal (){
            $("#closeModal").click();
          }
        </script>
        
        <script>
            var origenFormatted = "";
            var destinoFormatted = "";
            function btnGuardarDir() {
            
              //recupera los valores de las cajas de texto
              var calle = $("#Calle").val();
              var numero = $("#Numero").val();
              var colonia = $("#Colonia").val();
              var ciudad = $("#Ciudad").val();
              var estado = $("#Estado").val();
              var cp = $("#CP").val();
              Swal.fire({
              title: "Cargando...",
              showConfirmButton: false,
              timer: 6000,
            });
              //hacer la peticion a mi api dandole los valores de los inputs
              $.ajax({
                type:'POST',
                url:"http://localhost:8080/Gen6-API-Genis/api/direcciones",
                data:{"calle":calle,"numero":numero,"colonia":colonia,"ciudad":ciudad,"estado":estado,"cp":cp},
                //esperar la respuesta del servidor
                success:function(resp){
                  Swal.fire({
                    icon: "success",
                    title: "Se ha agrguardado tu Direccion correctamente",
                    showConfirmButton: false,
                    timer: 2500
                  });
                  //ocultar el loading
                    ocultarModal();
                  //mostrar la respuesta
                    console.log(resp);
                    //habilitar el boton
                    if($("#txtEsOD").val() == 1){//es el origen
                      $("#idOrigen").val(resp.message);
                    }else{//es el destino
                      $("#idDestino").val(resp.message)
                    }
                }
              });
            }

            function LimpiarDatos(){
                $("#Calle").val("");
                $("#Numero").val("");
                $("#Colonia").val("");
                $("#Ciudad").val("");
                $("#Estado").val("");
                $("#CP").val("");
            }
              
            function getDireccion(fuente){
                LimpiarDatos();
                ocultarModal();
                var direccion = "";
                if(fuente == 1){
                    direccion = $("#origen").val();
                }else{
                    direccion = $("#destino").val();
                }
                $("#txtEsOD").val(fuente);
                if(direccion != ""){
                    var geocoder = new google.maps.Geocoder();
                    geocoder.geocode({ 'address':direccion}, function (results,status){
                        if(status == google.maps.GeocoderStatus.OK){
                            var numresults = results[0].address_components.length;
                            for(var indice = 0; indice < numresults; indice++){
                                var numresultstypes = results[0].address_components[indice].types.length;
                                for(var propiedad = 0; propiedad < numresultstypes; propiedad++){
                                    var Tipo = results[0].address_components[indice].types[propiedad];
                                    var Descripcion = results[0].address_components[indice].long_name;
                                    switch(Tipo){
                                        case "route": $("#Calle").val(Descripcion);
                                        break;
                                        case "street_number": $("#Numero").val(Descripcion);
                                        break;
                                        case "sublocality_level_1": $("#Colonia").val(Descripcion);
                                        break;
                                        case "locality": $("#Ciudad").val(Descripcion);
                                        break;
                                        case "administrative_area_level_1": $("#Estado").val(Descripcion);
                                        break;
                                        case "postal_code": $("#CP").val(Descripcion);
                                        break;
                                    }
                                }
                            }
                            if(results[0].address_components.length >0){
                                if(fuente == 1){
                                    $("#origen").val(results[0].formatted_address);
                                    origenFormatted = results[0].formatted_address;
                                }else{
                                    $("#destino").val(results[0].formatted_address);
                                    destinoFormatted = results[0].formatted_address;
                                } 
                            }
                        }else{
                            Swal.fire("Error de Google","Google no obtuvo datos","warning");
                        }
                    });
                }else{
                    Swal.fire({
                        title: "¿Estas seguro?",
                        text: "No se pueden obtener datos si no proporciona una direccion",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-warning",
                        confirmButtonText: "Si quiero capturar la informacion",
                        cancelButtonText: "Cancelar",
                        closeOnConfirm: true,
                        closeOnCancel: true,
                    }, function (isConfirm){
                        if(!isConfirm){
                            ocultarModal();
                        }
                    });
                }
            }
        </script>
        <script>
            function instFecha(fecha){
              console.log("fechaaaa selecionada",fecha)
              const date = new Date(fecha);


              var address1 = $("#origen").val();
              var address2 = $("#destino").val();
              if (address1 === "" && address2 === ""){
                  Swal.fire({
                  icon: "error",
                  title: "Oops...",
                  text: "Ingresa los valores de Origen y Destino",
                });
                return;
              }
            var origenA = address1;
            var destinoA = address2;
            var service = new google.maps.DistanceMatrixService();
            service.getDistanceMatrix(
              {
                origins: [origenA],
                destinations: [destinoA],
                travelMode: 'DRIVING',
              }, callback);

            function callback(response, status) {
            console.log(response)
            console.log(response.rows[0].elements[0].distance.value);
            console.log(response.rows[0].elements[0].duration.value);
            if (status == 'OK') {
              var origins = response.originAddresses;
              var destinations = response.destinationAddresses;
              for (var i = 0; i < origins.length; i++) {
                var results = response.rows[i].elements;
                for (var j = 0; j < results.length; j++) {
                  var element = results[j];
                  var distance = element.distance.text;
                  var duration = element.duration.text;
                  var from = origins[i];
                  var to = destinations[j];
                }
              }
              var units = "mtrs";
              $("#distancia").val(response.rows[0].elements[0].distance.value+units);
              var seconds = response.rows[0].elements[0].duration.value;
              date.setSeconds(date.getSeconds()+seconds);
              const offset = date.getTimezoneOffset() * 60000;
              const localDate = new Date(date.getTime()-offset)
              $("#FELlegada").val(localDate.toISOString().slice(0,19))
              console.log(localDate)
            }
          }
        }
           
         
        </script>
        <script>
          function capacidadCam(event){
            var option = event.target.selectedOptions[0];
            $("#capCamion").val(option.getAttribute("capacidad"));
          }
        </script>
      </body>
    </html>
  </Chofer></Chofer
>