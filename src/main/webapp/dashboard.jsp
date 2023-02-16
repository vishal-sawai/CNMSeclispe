<%@page import="sqlcode.DatabaseConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sqlcode.DatabaseConnection" %>
<%
if(session.getAttribute("user")==null){
	response.sendRedirect("admin_login.jsp");
}
Connection con = DatabaseConnection.initializeDatabase();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>CNMS Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../css/style.css">

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
                            <a onclick="show('maindash');"
                                class="cursor-pointer bg-gray-900 text-white px-5 py-6 rounded-md text-sm font-medium"
                                aria-current="page">Dashboard</a>

                            <a onclick="show('Section1');"
                                class="cursor-pointer text-gray-300 hover:bg-gray-700 hover:text-white px-5 py-6 rounded-md text-sm font-medium">Students</a>

                            <a onclick="show('Section2');"
                                class="cursor-pointer text-gray-300 hover:bg-gray-700 hover:text-white px-5 py-6 rounded-md text-sm font-medium">Teachers</a>

                            <a onclick="show('Section3');"
                                class="cursor-pointer text-gray-300 hover:bg-gray-700 hover:text-white px-5 py-6 rounded-md text-sm font-medium">Contact
                                Us</a>
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
                            <!-- Active: "bg-gray-100", Not Active: "" -->
                            <li class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1"
                                id="user-menu-item-0"> <%=session.getAttribute("user")%></li>
                            <a href="logout" class="block px-4 py-2 text-sm text-gray-900 hover:text-white hover:bg-gray-900" role="menuitem" tabindex="-1"
                                id="user-menu-item-2">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <div class="hidden" id="mobile-menu">
            <div class="space-y-1 px-2 pt-2 pb-3">
                <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                <a onclick="show('maindash');"
                    class="cursor-pointer bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium"
                    aria-current="page">Dashboard</a>

                <a onclick="show('Section1');"
                    class="cursor-pointer text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Students</a>

                <a onclick="show('Section2');"
                    class="cursor-pointer text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Teachers</a>

                <a onclick="show('Section3');"
                    class="cursor-pointer text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Contact
                    Us</a>
            </div>
        </div>
    </nav>

    <!-- Navbar End -->


    <!-- Dashboard Start -->

    <div>
        <div id="maindash" class="">
            <div class="container mx-auto flex flex-wrap px-8">
                <div class="dpt w-full text-center mx-auto pt-6 pb-10 sm:w-96 rounded-md text-white my-5 mx-2 grow cursor-pointer"
                    style="background-color: #34495E ;">
                    <h1 class="text-xl font-bold mb-3">Students</h1>
                    <h1 class="text-6xl font-bold">1</h1>
                </div>
                <div class="dpt w-full text-center mx-auto pt-6 pb-10 sm:w-96 rounded-md text-white my-5 mx-2 grow cursor-pointer"
                    style="background-color: #8E44AD;">
                    <h1 class="text-xl font-bold mb-3">Teachers</h1>
                    <h1 class="text-6xl font-bold">4</h1>
                </div>
                <div class="dpt w-full text-center mx-auto pt-6 pb-10 sm:w-96 rounded-md text-white my-5 mx-2 grow cursor-pointer"
                    style="background-color: #34495E ;">
                    <h1 class="text-xl font-bold mb-3">Notes</h1>
                    <h1 class="text-6xl font-bold">5</h1>
                </div>

            </div>
        </div>
    </div>

    <!-- Dashboard End -->


    <!-- Student Section start -->

    <div class="relative overflow-x-auto shadow-md hidden" id="Section1">
        <div class="w-full flex px-3 py-2 bg-gray-900">
            <span class="text-white p-2 ">Add Students</span>
            <i class="fa-solid fa-plus bg-white p-3 rounded-md cursor-pointer" data-modal-target="addStudentModal"
                data-modal-toggle="addStudentModal"></i>
        </div>
        <table class="w-full text-sm text-left text-blue-100 dark:text-blue-100">
            <thead class="text-xs text-white uppercase bg-blue-600 border-b border-blue-400 dark:text-white">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        SR.NO
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Student Name
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Department
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Email
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
            <%
            try{ 
            	Statement statementStrudent=con.createStatement();
                String sqlStrudent ="SELECT * FROM student";

                ResultSet resultSetStrudent = statementStrudent.executeQuery(sqlStrudent);
                int data=1;
                 while(resultSetStrudent.next()){
                 %>
                <tr class="bg-blue-600 border-b border-blue-400">
                    <td class="px-6 py-4">
                        <span><%= data %></span>
                        <% data++; %>
                    </td>
                    
                    <th scope="row"
                        class="px-6 py-4 font-medium bg-blue-500 text-blue-50 whitespace-nowrap dark:text-blue-100">
                       <%=resultSetStrudent.getString("fname")+" "+ resultSetStrudent.getString("lname") %>
                    </th>
                    <td class="px-6 py-4">
                        <%=resultSetStrudent.getString("dept") %>
                    </td>
                    <td class="px-6 py-4 bg-blue-500">
                        <%=resultSetStrudent.getString("email") %>
                    </td>
                    <td class="px-6 py-4">
                        <a href="delete.jsp?id=<%=resultSetStrudent.getString("id") %>&table=student" class="font-medium text-white hover:underline">Delete</a>
                    </td>
                </tr>
                  <% 
                    }

                    }catch (Exception e){
                    e.printStackTrace();
                    }
                 %>
            </tbody>
        </table>
    </div>

    <!-- Add Student Modal-->

    <!-- Main modal -->
    <div id="addStudentModal" tabindex="-1" aria-hidden="true"
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
                        data-modal-hide="addStudentModal">
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

                <form action="addstudent" method="post" class="p-5" >
                    <div class="grid gap-6 mb-6 md:grid-cols-2">
                        <div>
                            <label for="first_name"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First
                                name</label>
                            <input type="text" id="first_name"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" name="fname" required>
                        </div>
                        <div>
                            <label for="last_name"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last
                                name</label>
                            <input type="text" id="last_name"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" name="lname" required>
                        </div>
                        <div>
                            <label for="phone"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone
                                number</label>
                            <input type="tel" id="phone"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" name="phone" required>
                        </div>
                        <div>
                            <label for="roll_no"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Roll
                                number</label>
                            <input type="number" id="r_no"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" name="rollno" required>
                        </div>
                    </div>
                    <div class="mb-6">
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email
                            address</label>
                        <input type="email" id="email"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="" name="email" required>
                    </div>
                    <label for="dept" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select
                        an option</label>
                    <select id="departmentSelect" name="depart"
                        class="mb-6 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option selected>Department</option>
                        <option value="CSE">CSE</option>
                        <option value="MCA">MCA</option>
                        <option value="MBA">MBA</option>
                    </select>
                    <div>
                        <button type="submit"
                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-10 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- End Student Modal -->

    <!-- Student Section end -->

    <!-- Teachers Section start -->

    <div class="relative overflow-x-auto shadow-md hidden" id="Section2">
        <div class="w-full flex px-3 py-2 bg-gray-900">
            <span class="text-white p-2 ">Add Teachers</span>
            <i class="fa-solid fa-plus bg-white p-3 rounded-md cursor-pointer" data-modal-target="addteacherModal"
                data-modal-toggle="addteacherModal"></i>
        </div>
        <table class="w-full text-sm text-left text-blue-100 dark:text-blue-100">
            <thead class="text-xs text-white uppercase bg-blue-600 border-b border-blue-400 dark:text-white">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        SR.NO
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Teacher Name
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Department
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Email
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        Action
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
            <%
             try{ 
            	Statement statementteacher=con.createStatement();
                String sqlteacher ="SELECT * FROM teacher";

                 ResultSet resultSetteacher = statementteacher.executeQuery(sqlteacher);
                 int data1=1;  
                 while(resultSetteacher.next()){
                 %>
                <tr class="bg-blue-600 border-b border-blue-400">
                  <td class="px-6 py-4">
                        <span><%= data1 %></span>
                        <% data1++; %>
                    </td>
                    <th scope="row"
                        class="px-6 py-4 font-medium bg-blue-500 text-blue-50 whitespace-nowrap dark:text-blue-100">
                       <%=resultSetteacher.getString("fname")+" "+ resultSetteacher.getString("lname") %>
                    </th>
                    <td class="px-6 py-4">
                      <%=resultSetteacher.getString("dept") %>

                    </td>
                    <td class="px-6 py-4 bg-blue-500">
                     <%=resultSetteacher.getString("Email") %>
                        
                    </td>
                    <td class="px-6 py-4">
                        <a href="#" class="font-medium text-white hover:underline">View Notes</a>
                    </td>
                    <td class="px-6 py-4 bg-blue-500">
                       <a href="delete.jsp?id=<%=resultSetteacher.getString("id") %>&table=teacher" class="font-medium text-white hover:underline">Delete</a>
                    </td>
                </tr>
                  <% 
                 }

                 } catch (Exception e) {
                 e.printStackTrace();
                 }
                 %>
            </tbody>
        </table>
    </div>

    <!-- Add Teacher Modal-->

    <!-- Main modal -->
    <div id="addteacherModal" tabindex="-1" aria-hidden="true"
        class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-modal md:h-full">
        <div class="relative w-full h-full max-w-5xl md:h-auto">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700 p-5">
                <!-- Modal header -->
                <div class="flex items-start justify-between p-4 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                        Add Teachers
                    </h3>
                    <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                        data-modal-hide="addteacherModal">
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

                <form action="addteacher" method="post" class="p-5">
                    <div class="grid gap-6 mb-6 md:grid-cols-2">
                        <div>
                            <label for="first_name1"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First
                                name</label>
                            <input type="text" id="first_name1"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="" name="tfname" required>
                        </div>
                        <div>
                            <label for="last_name1"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last
                                name</label>
                            <input type="text" id="last_name1"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder=""name="tlname" required>
                        </div>
                    </div>
                    <div class="mb-6">
                        <label for="email1" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email
                            address</label>
                        <input type="email" id="email1"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="" name="temail" required>
                    </div>
                    <label for="countries1" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select
                        an Department</label>
                    <select id="departmentSelect1" name="tdepart"
                        class="mb-6 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option selected>Department</option>
                        <option value="CSE">CSE</option>
                        <option value="MCA">MCA</option>
                        <option value="MBA">MBA</option>
                    </select>
                    <div>
                        <button type="submit"
                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-10 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- End Teachers Modal -->

    <!-- Teachers Section end -->


    <!-- Contact section start -->

    <div class="relative overflow-x-auto shadow-md hidden" id="Section3">
        <table class="w-full text-sm text-left text-blue-100 dark:text-blue-100">
            <thead class="text-xs text-white uppercase bg-blue-600 border-b border-blue-400 dark:text-white">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        SR.NO
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Name
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Email
                    </th>
                    <th scope="col" class="px-6 py-3 bg-blue-500">
                        Message
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
            <%
             try{ 
            	Statement statementcontatct=con.createStatement();
                String sqlcontatct ="SELECT * FROM contact";

                 ResultSet resultSetcontatct = statementcontatct.executeQuery(sqlcontatct);
                 int data2=1;  
                 while(resultSetcontatct.next()){
                 %>
                <tr class="bg-blue-600 border-b border-blue-400">
                      <td class="px-6 py-4">
                        <span><%= data2 %></span>
                        <% data2++; %>
                    </td>
                    <th scope="row"
                        class="px-6 py-4 font-medium bg-blue-500 text-blue-50 whitespace-nowrap dark:text-blue-100">
                      <%=resultSetcontatct.getString("name") %>
                    </th>
                    <td class="px-6 py-4">
                   <%=resultSetcontatct.getString("phone") %>
                    </td>
                    <td class="px-6 py-4 bg-blue-500">
                    <%=resultSetcontatct.getString("msg") %>
                    </td>
                    <td class="px-6 py-4">
                        <a href="delete.jsp?id=<%=resultSetcontatct.getString("id") %>&table=contact" class="font-medium text-white hover:underline">Delete</a>
                    </td>
                </tr>
                 <% 
                 }

                 } catch (Exception e) {
                 e.printStackTrace();
                 }
                 %>
            </tbody>
        </table>
    </div>

    <!-- Contact Section end -->

    <!-- Javascript -->
    <script src="js/script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.js"></script>
</body>

</html>