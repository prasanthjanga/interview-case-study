
<nav class="top-0 absolute z-50 w-full flex flex-wrap items-center justify-between px-2 py-3 navbar-expand-lg">
    <div class="container px-4 mx-auto flex flex-wrap items-center justify-between">
        <div class="w-full relative flex justify-between lg:w-auto lg:static lg:block lg:justify-start">
            <a class="text-sm font-bold leading-relaxed inline-block mr-4 py-2 whitespace-no-wrap uppercase text-white"
                href="{{ url('/') }}">
                <img src="{{ url('/') }}/assets/sc_logo.png" width="150px">
            </a>
            <button
                class="cursor-pointer text-xl leading-none px-3 py-1 border border-solid border-transparent rounded bg-transparent block lg:hidden outline-none focus:outline-none"
                type="button" onclick="toggleNavbar('example-collapse-navbar')">
                <i class="text-blude fas fa-bars"></i>
            </button>
        </div>
        <div class="lg:flex flex-grow items-center bg-white lg:bg-transparent lg:shadow-none hidden"
            id="example-collapse-navbar">
            @guest
            <ul class="flex flex-col lg:flex-row list-none lg:ml-auto mr-5">
                <li class="flex items-center">
                    <a class="bg-white text-gray-800 active:bg-gray-100 text-xs font-bold uppercase px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none lg:mr-1 lg:mb-0 ml-3 mb-3"
                        href="{{ url('login') }}"><i class=""></i> Login</a>
                </li>
                <li class="flex items-center">
                    <a class="bg-white text-gray-800 active:bg-gray-100 text-xs font-bold uppercase px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none lg:mr-1 lg:mb-0 ml-3 mb-3"
                        href="{{ url('register') }}">Register</a>
                </li>
            </ul>
            @else
            <ul class="flex flex-col lg:flex-row list-none lg:ml-auto mr-5">
                <li class="flex items-center">
                    <a class="bg-white text-gray-800 active:bg-gray-100 text-xs font-bold uppercase px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none lg:mr-1 lg:mb-0 ml-3 mb-3"
                        href="{{ url('/') }}"><i class="fa fa-home"></i> Home</a>
                </li>
                <li class="flex items-center">
                    <a class="bg-white text-gray-800 active:bg-gray-100 text-xs font-bold uppercase px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none lg:mr-1 lg:mb-0 ml-3 mb-3"
                        href="{{ route('cart') }}"><i class="fa fa-shopping-cart"></i> Cart</a>
                </li>
            </ul>
            <ul class="flex-col md:flex-row list-none items-center md:flex">
                <a class="text-gray-600 block" href="javascript:void(0)" onclick="openDropdown(event,'user-dropdown')">
                  <div class="items-center flex">
                    <span class="w-12 h-12 text-sm text-white bg-gray-300 inline-flex items-center justify-center rounded-full mr-2">
                        <img alt="..." class="w-full rounded-full align-middle border-none shadow-lg"
                        src="{{ url('/storage/'.Auth::user()->avatar) }}">
                    </span> {{ Auth::user()->name }}
                  </div>
                </a>
                <div class="hidden bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg mt-1" style="min-width: 12rem;" id="user-dropdown">
                    <a class="text-sm py-2 px-4 font-normal block w-full whitespace-no-wrap bg-transparent text-gray-800"
                       href="{{ url('my_orders') }}">
                        <i class="fa fa-file"></i> My Orders
                    </a>
                    <a href="#" class="text-sm py-2 px-4 font-normal block w-full whitespace-no-wrap bg-transparent text-gray-800">
                        <i class="fa fa-user"></i> Profile</a>
                  <div class="h-0 my-2 border border-solid border-gray-200"></div>
                  <a
                    class="text-sm py-2 px-4 font-normal block w-full whitespace-no-wrap bg-transparent text-gray-800"
                    href="{{ route('logout') }}"onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">
                        <i class="fa fa-power-off mr-1"></i> {{ __('Logout') }}
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </div>
            </ul>
            @endguest
        </div>
    </div>
</nav>

