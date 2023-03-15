<!DOCTYPE html>
<html lang="en">

<head>
    <title>CNMS Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css">

    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    	<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>

<body style="background-color: #5D6D7E;">

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

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
                            <a href="index.jsp"
                                class="bg-gray-900 text-white px-5 py-6 rounded-md text-sm font-medium">Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Mobile menu, show/hide based on menu state. -->
        <div class="hidden" id="mobile-menu">
            <div class="space-y-1 px-2 pt-2 pb-3">
                <a href="index.jsp" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium"
                    aria-current="page">Home</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->


    <!-- Login Section Start -->

    <div>
        <div class="w-full sm:w-1/2 pb-3 sm:mt-20 mx-auto border-indigo-600 bg-white rounded-md">
            <div>
                <div class="flex mx-auto">
                    <button class="text-white py-2 px-4 hover:bg-indigo-500 uppercase font-bold grow"
                        onclick="StudentLogin()" id="StudentBtn" style="background-color: darkred;;">Student
                        Login</button>
                    <button class="text-white py-2 px-4 ml-0.5 hover:bg-indigo-500 uppercase font-bold grow"
                        onclick="TeacherLogin()" id="TeacherBtn" style="background-color: #2C3E50;">Teacher
                        Login</button>
                </div>
                <!-- Student form start-->
                <div class="py-5 px-10 mx-auto" id="StudentForm">
                    <div class="pb-3">
                        <img class="h-28 mx-auto" src="img/cnms-logo.png" alt="">
                        <h2 class="text-center text-xl font-bold text-gray-400">STUDENT LOGIN</h2>
                    </div>
                    <form action="studentlogin" method="post" onsubmit="myfun()">
                        <div>
                            <div class="mb-2">
                                <label class="block text-gray-700 font-medium mb-2">Email</label>
                                <input class="border border-gray-400 p-2 rounded-md w-full outline-none" type="email"
                                   name="username" placeholder="Enter Your email" required>
                            </div>
                            <div class="mb-5">
                                <label class="block text-gray-700 font-medium mb-2">Password</label>
                                <input class="border border-gray-400 p-2 rounded-md w-full outline-none" type="text"
                                   name="password" placeholder="Enter Your Password" required>
                            </div>
                            <div>
                                <button
                                    class="bg-indigo-900 text-white w-full py-2 px-4 rounded-lg hover:bg-indigo-800 uppercase font-bold">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Student form end -->

                <!-- Teacher form start-->
                <div class="py-5 px-10 mx-auto hidden" id="TeacherForm">
                    <div class="pb-3">
                        <img class="h-28 mx-auto" src="img/cnms-logo.png" alt="">
                        <h2 class="text-center text-xl font-bold text-gray-400">TEACHER LOGIN</h2>
                    </div>
                      <form action="teacherlogin" method="post"onsubmit="myfun()">
                    
                        <div>
                            <div class="mb-2">
                                <label class="block text-gray-700 font-medium mb-2">Email</label>
                                <input class="border border-gray-400 p-2 rounded-md w-full outline-none" type="email" name="username"
                                    placeholder="Enter Your email" required>
                            </div>
                            <div class="mb-5">
                                <label class="block text-gray-700 font-medium mb-2">Password</label>
                                <input class="border border-gray-400 p-2 rounded-md w-full outline-none" type="text" name="password"
                                    placeholder="Enter Your Password" required>
                            </div>
                            <div>
                                <button
                                    class="bg-indigo-900 text-white w-full py-2 px-4 rounded-lg hover:bg-indigo-800 uppercase font-bold">Submit</button>
                            </div>
                        </div>
                        </form>
                </div>
                <!-- Teacher form end -->
            </div>
        </div>
    </div>

    <!-- Login section end -->



    <!-- Javascript -->
    <script src=" js/script.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status=="success"){
    	swal("Congrats","Login Successfully","success");
    }else if(status=="failed"){
    	swal("Failed","Something Wrong","error");
    }
    </script>
</body>

</html>