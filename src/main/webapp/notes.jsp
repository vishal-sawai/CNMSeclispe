
<!DOCTYPE html>
<html lang="en">

<head>
    <title>CNMS Notes</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css">

    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
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
                            <a href="index.jsp"
                                class="bg-gray-900 text-white px-5 py-6 rounded-md text-sm font-medium">Home</a>
                        </div>
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


    <!-- NOtes Section Start -->

    <div id="" class="mb-4">
        <div class="container mx-auto flex flex-wrap px-8">
            <div class="dpt w-full text-center mx-auto pt-10 pb-3 sm:w-96 rounded-md text-white my-5 mx-2 grow cursor-pointer"
                style="background-color: #34495E ;">
                <h1 class="text-xl font-bold mb-1">Hello word</h1>
                <p class="mb-4">java is good language nowadays</p>
                <a class="py-3 px-10 bg-blue-600 rounded-full hover:bg-blue-700">View
                    Notes</a>
                <div class="pt-5">
                    <span class="float-left mx-3" style="color: #BDC3C7 ;">Prof Abc </span>
                    <span class="float-right mx-3" style="color: #BDC3C7 ;">14-2-2023</span>
                </div>
            </div>
            <div class="dpt w-full text-center mx-auto pt-10 pb-3 sm:w-96 rounded-md text-white my-5 mx-2 grow cursor-pointer"
                style="background-color: #34495E ;">
                <h1 class="text-xl font-bold mb-1">Hello word</h1>
                <p class="mb-4">java is good language nowadays</p>
                <a class="py-3 px-10 bg-blue-600 rounded-full hover:bg-blue-700">View
                    Notes</a>
                <div class="pt-5">
                    <span class="float-left mx-3" style="color: #BDC3C7 ;">Prof Abc </span>
                    <span class="float-right mx-3" style="color: #BDC3C7 ;">14-2-2023</span>
                </div>
            </div>
            <div class="dpt w-full text-center mx-auto pt-10 pb-3 sm:w-96 rounded-md text-white my-5 mx-2 grow cursor-pointer"
                style="background-color: #34495E ;">
                <h1 class="text-xl font-bold mb-1">Hello word</h1>
                <p class="mb-4">java is good language nowadays</p>
                <a class="py-3 px-10 bg-blue-600 rounded-full hover:bg-blue-700">View
                    Notes</a>
                <div class="pt-5">
                    <span class="float-left mx-3" style="color: #BDC3C7 ;">Prof Abc </span>
                    <span class="float-right mx-3" style="color: #BDC3C7 ;">14-2-2023</span>
                </div>
            </div>

        </div>
    </div>

    <!-- NOtes Section End -->


    <!-- Javascript -->
    <script src=" js/script.js"></script>

</body>

</html>