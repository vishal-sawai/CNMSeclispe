<!doctype html>
<html>

<head>
    <title>CNMS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css">

    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">

    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/ff3c91d27a.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>

</head>

<body>
    <!-- Navbar -->
    <nav class="bg-gray-800">
        <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
            <div class="relative flex h-20 items-center justify-between">
                <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                    <!-- Mobile menu button-->
                    <button type="button" onclick="toggle()"
                        class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                        aria-controls="mobile-menu" aria-expanded="false">
                        <span class="sr-only">Open main menu</span>
                        <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                        </svg>

                        <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
                <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
                    <div class="flex flex-shrink-0 items-center">
                        <img class="block h-16 w-auto lg:hidden rounded-full" src="img/cnms-logo.png" alt="CNMS">
                        <img class="hidden h-16 w-auto lg:block rounded-full" src="img/cnms-logo.png" alt="CNMS">
                    </div>
                    <div class="hidden sm:ml-6 sm:block">
                        <div class="flex space-x-4">
                            <a href="#home"
                                class="bg-gray-900 text-white px-5 py-6 rounded-md text-sm font-medium">Home</a>

                            <a href="#course"
                                class="text-gray-300 hover:bg-gray-700 hover:text-white px-5 py-6 rounded-md text-sm font-medium">Course</a>

                            <a href="#about"
                                class="text-gray-300 hover:bg-gray-700 hover:text-white px-5 py-6 rounded-md text-sm font-medium">About
                                Us</a>

                            <a href="#Contact"
                                class="text-gray-300 hover:bg-gray-700 hover:text-white px-5 py-6 rounded-md text-sm font-medium">Contact</a>
                        </div>
                    </div>
                </div>
                <% if(session.getAttribute("studentUser")==null){
                	%>
                	   <a href="login.jsp"
                    class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-cyan-500 to-blue-500 group-hover:from-cyan-500 group-hover:to-blue-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-cyan-200 dark:focus:ring-cyan-800">
                    <span
                        class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
                        Login
                    </span>
                </a>
                	<%  
                	}else{
                  %>
                  
                   <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                    <!-- Profile dropdown -->
                    <div class="relative ml-3">
                        <div>
                            <button type="button"
                                class="flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
                                id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                                <span class="sr-only">Open user menu</span>
                                <div class="bg-white px-3 py-2 rounded-full hover:bg-gray-200" onclick="navprofile()">
                                    <i class="fa-solid fa-user text-1xl"></i>
                                </div>
                            </button>
                        </div>

                        <div id="navprofilemenu"
                            class="hidden absolute right-0 z-10 mt-2 w-60 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
                            role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">
                              <li class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1"
                                id="user-menu-item-0"> <%=session.getAttribute("studentUser")%></li>
                            <a href="logout?page=index.jsp" class="block px-4 py-2 text-sm text-gray-900 hover:text-white hover:bg-gray-900" role="menuitem" tabindex="-1"
                                id="user-menu-item-2">Logout</a>
                        </div>
                    </div>
                </div>
             <%} %>
            </div>
        </div>
      

        <!-- Mobile menu, show/hide based on menu state. -->
        
        <div class="hidden" id="mobile-menu">
            <div class="space-y-1 px-2 pt-2 pb-3">
                <a href="#home" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium"
                    aria-current="page">Home</a>

                <a href="#course"
                    class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Course</a>

                <a href="#about"
                    class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">About
                    Us</a>

                <a href="#Contact"
                    class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Contact</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->


    <!-- Home Start -->
    <div id="home" class="mb-4">



    </div>
    <!-- Home End -->

    <!-- Course Start-->
    <div id="course" class="mb-4">
        <div class="heading text-center pt-7 px-8">
            <h2 class="text-3xl uppercase pb-1 font-bold text-lime-800">Courses</h2>
            <hr class="sm:w-60 mx-auto bg-lime-600 h-1 rounded-md">
        </div>
        <div class="container mx-auto flex flex-wrap px-8">
            <div class="dpt w-full text-center mx-auto py-10 sm:w-96 rounded-md bg-sky-600 text-white my-5 mx-2 grow">
                <h1 class="text-4xl uppercase font-bold">CSE</h1><br>
                <button data-modal-target="authentication-modal" data-modal-toggle="authentication-modal"
                    class="py-3 px-10 bg-rose-900 rounded-full hover:bg-rose-700" onclick="formdata('CSE')">Select
                </button>
            </div>
            <div class="dpt w-full text-center mx-auto py-10 sm:w-96 rounded-md bg-sky-600 text-white my-5 mx-2 grow">
                <h1 class="text-4xl uppercase font-bold">MCA</h1><br>
                <button data-modal-target="authentication-modal" data-modal-toggle="authentication-modal"
                    class="py-3 px-10 bg-rose-900 rounded-full hover:bg-rose-700"
                    onclick="formdata('MCA')">Select</button>
            </div>
            <div class="dpt w-full text-center mx-auto py-10 sm:w-96 rounded-md bg-sky-600 text-white my-5 mx-2 grow">
                <h1 class="text-4xl uppercase font-bold">MBA</h1><br>
                <button data-modal-target="authentication-modal" data-modal-toggle="authentication-modal"
                    class="py-3 px-10 bg-rose-900 rounded-full hover:bg-rose-700"
                    onclick="formdata('MBA')">Select</button>
            </div>

        </div>
    </div>

    <!--  modal -->
    <div id="authentication-modal" tabindex="-1" aria-hidden="true"
        class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-modal md:h-full">
        <div class="relative w-full h-full max-w-md md:h-auto">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                <button type="button"
                    class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                    data-modal-hide="authentication-modal">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
                <div class="px-6 py-6 lg:px-8">
                    <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Select Course</h3>
                    <form class="space-y-6" action="" method="">
                        <div>
                            <label for="Course_name"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Course Name</label>
                            <input type="text" id="coursevalue"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" required disabled>
                        </div>
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select an
                                Semester</label>
                            <select id="CSESemester"
                                class="bg-gray-50 outline-none border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                style="display: none;">
                                <option selected>Select Semester</option>
                                <option value="First">First</option>
                                <option value="Second">Second</option>
                                <option value="Third">Third</option>
                                <option value="Foruth">Foruth</option>
                                <option value="Fifth">Fifth</option>
                                <option value="Sixth">Sixth</option>
                                <option value="Seventh">Seventh</option>
                                <option value="Eight">Eight</option>
                            </select>
                            <select id="MCASemester"
                                class="bg-gray-50 outline-none border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                style="display: none;">
                                <option selected>Select Semester</option>
                                <option value="First">First</option>
                                <option value="Second">Second</option>
                                <option value="Third">Third</option>
                                <option value="Foruth">Foruth</option>
                            </select>
                            <select id="MBASemester"
                                class="bg-gray-50 outline-none border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                style="display: none;">
                                <option selected>Select Semester</option>
                                <option value="First">First</option>
                                <option value="Second">Second</option>
                                <option value="Third">Third</option>
                                <option value="Foruth">Foruth</option>
                            </select>
                        </div>
                        <div>
                            <label for="" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select an
                                Courses</label>
                            <select id="selectCourse"
                                class="bg-gray-50 outline-none border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                <option selected>Select Course</option>
                                <option value="Java">Java</option>
                                <option value="Php">Php</option>
                                <option value="OS">OS</option>
                                <option value="DSA">DSA</option>
                            </select>
                        </div>
                        <button type="submit"
                            class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            SUBMIT</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Couser End -->

    <!-- About Us Start -->
    <div id="about" class="mb-4 mt-4">
        <div class="container mx-auto text-lg font-serif" style="font-family:'Josefin Sans', sans-serif;">
            <div class="mx-auto px-10 sm:px-20 flex flex-wrap place-content-center">
                <div class="abimg sm:w-96 mx-4 grow">
                    <img src="img/bg3.jpg" class="rounded-lg" alt="" srcset="">
                </div>
                <div class="abinfo sm:w-1/2 mx-4 grow">
                    <div class="heading text-center pt-7 pb-5 px-8">
                        <h2 class="text-3xl uppercase pb-1 font-bold text-lime-800">About Us</h2>
                        <hr class="sm:w-60 mx-auto bg-lime-600 h-1 rounded-md">
                    </div>
                    <p class="">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CNMS is College Notes Management
                        System
                        it
                        is an online platform
                        designed for college students and
                        teachers to share and manage notes. The website allows teachers to upload and share their notes
                        with
                        their students, making it easier for them to access and study the material.
                        This website is only accessible those teachers and students, who are registered in the system.
                        Students can then log into the website and access the notes for their specific classes. They can
                        download the notes, print them, or even annotate them directly on the website. The notes are
                        organized
                        by class, making it easy for students to find the material they need.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- About us End -->

    <!-- Contact us start -->
    <div id="Contact" class="contact mt-4" style="background-color: #2E4053;">
        <div class="heading text-center pt-7 pb-5 px-8">
            <h2 class="text-3xl uppercase pb-1 font-bold text-white">Contact Us</h2>
            <!-- <hr class="sm:w-60 mx-auto bg-white h-1 rounded-md"> -->
        </div>
        <div>
            <div class="px-5 pb-10">
                <form action="contact" method="post"
                    class="bg-white sm:p-6 sm:w-4/5 mx-auto rounded-md sm:px-20 px-5 py-10 shadow-lg shadow-indigo-500/40">
                    <div class="mb-4">
                        <label class="block text-gray-700 font-medium mb-2">Name</label>
                        <input class="border border-gray-400 p-2 rounded-md w-full" type="text"
                            placeholder="Enter your name" name="name" required>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 font-medium mb-2">Email</label>
                        <input class="border border-gray-400 p-2 rounded-md w-full" type="email"
                            placeholder="Enter your email" name="email"  required>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 font-medium mb-2">Phone</label>
                        <input class="border border-gray-400 p-2 rounded-md w-full" type="tel"
                            placeholder="Enter your phone number" name="phone"  required>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 font-medium mb-2">Message</label>
                        <textarea class="border border-gray-400 p-2 rounded-md w-full h-32"
                            placeholder="Enter your message" name="msg"  required></textarea>
                    </div>
                    <div>
                        <button
                            class="bg-indigo-600 text-white w-full py-2 px-4 rounded-lg hover:bg-indigo-500 uppercase font-bold">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Contact us end -->

    <!-- Footer start -->
    <footer class="text-center py-3 text-white" style="background-color: #212F3D;">
        Copyright - CNMS | All Right Reserved
    </footer>
    <!-- Footer End -->


    <!-- Javascript -->
    <script src=" js/script.js"></script>

    <!-- flowbite -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.js"></script>
</body>

</html>