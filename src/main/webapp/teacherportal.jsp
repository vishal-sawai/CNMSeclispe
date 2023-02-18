<%
if(session.getAttribute("TeacherUser")==null){
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>CNMS Teacher Portal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="style.css">

    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">

    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/ff3c91d27a.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>

    <!-- Flowbite -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.css" rel="stylesheet" />
</head>

<body>

    <!-- Navbar -->
    <nav class="bg-gray-800">
        <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
            <div class="relative flex h-20 items-center justify-between">
                <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                    <!-- Mobile menu button-->
                    <button type="button"
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
                            <a href="index.jsp" class="bg-gray-900 text-white px-5 py-6 rounded-md text-sm font-medium"
                                aria-current="page">Home</a>
                        </div>
                    </div>
                </div>
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
                                id="user-menu-item-0"> <%=session.getAttribute("TeacherUser")%></li>
                            <a href="logout?page=login.jsp" class="block px-4 py-2 text-sm text-gray-900 hover:text-white hover:bg-gray-900" role="menuitem" tabindex="-1"
                                id="user-menu-item-2">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <div class="sm:hidden" id="mobile-menu">
            <div class="space-y-1 px-2 pt-2 pb-3">
                <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                <a href="index.jsp" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium"
                    aria-current="page">Home</a>
            </div>
        </div>
    </nav>

    <!-- Navbar End -->


    <!-- Notes Section Start -->

    <div class="relative overflow-x-auto shadow-md" id="Section1">
        <div class="w-full flex px-3 py-2 bg-gray-900">
            <span class="text-white p-2 ">Add Notes</span>
            <i class="fa-solid fa-plus bg-white p-3 rounded-md cursor-pointer" data-modal-target="addnotesModal"
                data-modal-toggle="addnotesModal"></i>
        </div>
        <table class="w-full text-sm text-left text-blue-100 dark:text-blue-100">
            <thead class="text-xs text-white uppercase bg-blue-600 border-b border-blue-400 dark:text-white">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        SR.NO
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Title
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Description
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Action
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="bg-blue-600 border-b border-blue-400">
                    <td class="px-6 py-4">
                        1
                    </td>
                    <th scope="row"
                        class="px-6 py-4 font-medium bg-blue-500 text-blue-50 whitespace-nowrap dark:text-blue-100">
                        File Heading
                    </th>
                    <td class="px-6 py-4">
                        how are You
                    </td>
                    <td class="px-6 py-4 bg-blue-500">
                        <a href="#" class="font-medium text-white hover:underline">View Notes</a>
                    </td>
                    <td class="px-6 py-4">
                        <a href="#" class="font-medium text-white hover:underline">Delete</a>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <!-- Main modal -->
    <div id="addnotesModal" tabindex="-1" aria-hidden="true"
        class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-modal md:h-full">
        <div class="relative w-full h-full max-w-5xl md:h-auto">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700 p-5">
                <!-- Modal header -->
                <div class="flex items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                        Add Students
                    </h3>
                    <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                        data-modal-hide="addnotesModal">
                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                clip-rule="evenodd"></path>
                        </svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                </div>
                <!-- Modal body -->

                <form class="p-5" action="notes" method="post" enctype="multipart/form-data">
                    <div class="grid gap-6 mb-6 md:grid-cols-2">
                        <div>
                            <label for="title"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Title</label>
                            <input type="text" id="title"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" name="title" required>
                        </div>
                        <div>
                            <label for="description"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
                            <input type="text" id="description"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" name="description" required>
                        </div>
                    </div>
                    <div class="mb-6">
                         <div class="grid gap-6 mb-6 md:grid-cols-2">
                        <div>
                        <label for="subject"
                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Subject</label>
                        <input type="text" id="subject"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="" name="subject" required>
                            </div>
                            <div>
                          <label for="Select_semester"
                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">semester</label>
                        <input type="number" id="sem"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="" name="sem" required>
                         </div>
                        </div>
                       </div>
            
                    <div class="mb-6">
                        <label for="Select Notes File"
                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select Notes
                            File</label>
                        <input
                            class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                            id="file_input" name="filename" type="file">
                    </div>
                 <%@page import="sqlcode.DatabaseConnection"%>
                 <%@page import="java.sql.DriverManager"%>
                 <%@page import="java.sql.ResultSet"%>
                 <%@page import="java.sql.Statement"%>
                 <%@page import="java.sql.Connection"%>
                 <%@page import="sqlcode.DatabaseConnection" %>

                    
                <%

                  Connection con = DatabaseConnection.initializeDatabase();

                                 try{ 
            	Statement statementStrudent=con.createStatement();
                String sqlTeacher ="SELECT * FROM teacher";

                ResultSet resultSetTeacher = statementStrudent.executeQuery(sqlTeacher);

                        while(resultSetTeacher.next()){
                 %>
                 
                   <% 
                    }

                    }catch (Exception e){
                    e.printStackTrace();
                    }
                 %>
                    
                    <div>
                        <button type="submit"
                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-10 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Notes Section End -->


    <!-- Javascript -->
    <script src="js/script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.js"></script>

</body>

</html>