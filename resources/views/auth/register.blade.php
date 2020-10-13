@extends('common_layouts.auth_app')

@section('content')

<section class="absolute w-full h-full">
    <div class="absolute top-0 w-full h-full bg-gray-0"
        style="background-image: url(./assets/img/register_bg_2.png); background-size: 100%; background-repeat: no-repeat;">
    </div>
    <div class="container mx-auto px-4 h-full">
        <div class="flex content-center items-center justify-center h-full">
            <div class="w-full lg:w-4/12 px-4">
                <div
                    class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-gray-300 border-0">
                    <div class="flex-auto px-4 lg:px-10 py-10 pt-10">
                        <div class="text-gray-500 text-center mb-3 font-bold">
                            {{ __('Register') }}
                        </div>
                        <form method="POST" action="{{ route('register') }}">
                            @csrf

                            <div class="relative w-full mb-3">
                                <label class="block uppercase text-gray-700 text-xs font-bold mb-2"
                                    for="grid-password">Name</label>
                                <input id="name" type="text" class="px-3 py-3 placeholder-gray-400 text-gray-700 bg-white rounded text-sm shadow focus:outline-none focus:shadow-outline w-full @error('name') is-invalid @enderror"
                                    name="name" value="{{ old('name') }}" required autocomplete="name" autofocus
                                    placeholder="Name" style="transition: all 0.15s ease 0s;" >

                                @error('name')
                                <span class="text-red-500" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="relative w-full mb-3">
                                <label class="block uppercase text-gray-700 text-xs font-bold mb-2"
                                    for="grid-password">Email</label>
                                <input id="email" type="email" class="px-3 py-3 placeholder-gray-400 text-gray-700 bg-white rounded text-sm shadow focus:outline-none focus:shadow-outline w-full @error('email') is-invalid @enderror"
                                    name="email" value="{{ old('email') }}" required autocomplete="email" autofocus
                                    placeholder="Email"
                                    style="transition: all 0.15s ease 0s;" >

                                @error('email')
                                <span class="text-red-500" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <div class="relative w-full mb-3">
                                <label class="block uppercase text-gray-700 text-xs font-bold mb-2"
                                    for="grid-password">Password</label>
                                    <input id="password" type="password"
                                    class="px-3 py-3 placeholder-gray-400 text-gray-700 bg-white rounded text-sm shadow focus:outline-none focus:shadow-outline w-full @error('password') is-invalid @enderror"
                                    name="password" required autocomplete="current-password"
                                    placeholder="Password" style="transition: all 0.15s ease 0s;" />

                                @error('password')
                                <span class="text-red-500" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>

                            <div class="relative w-full mb-3">
                                <label class="block uppercase text-gray-700 text-xs font-bold mb-2"
                                    for="password-confirm">Confirm Password</label>
                                    <input id="password-confirm" type="password"
                                    class="px-3 py-3 placeholder-gray-400 text-gray-700 bg-white rounded text-sm shadow focus:outline-none focus:shadow-outline w-full"
                                    name="password_confirmation" required autocomplete="new-password"
                                    placeholder="Confirm Password" style="transition: all 0.15s ease 0s;" />

                                @error('password')
                                <span class="text-red-500" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>

                            <div class="text-center mt-6">
                                <button type="submit"
                                    class="bg-gray-900 text-white active:bg-gray-700 text-sm font-bold uppercase px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 w-full"
                                    style="transition: all 0.15s ease 0s;">
                                    Register
                                </button>
                                Already have an account?
                                <a class="btn btn-link text-blue-500" href="{{ route('login') }}">
                                    {{ __('Login') }}
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="flex flex-wrap mt-10">

                </div>
            </div>
        </div>
    </div>
    <footer class="absolute w-full bottom-0 bg-gray-900 pb-6">
        <div class="container mx-auto px-4">
            <hr class="mb-6 border-b-1 border-gray-700" />
            <div class="flex flex-wrap items-center md:justify-between justify-center">
                <div class="w-full md:w-4/12 px-4">
                    <div class="text-sm text-white font-semibold py-1">
                        Copyright © 2019
                        <a href="https://www.creative-tim.com"
                            class="text-white hover:text-gray-400 text-sm font-semibold py-1">Creative Tim</a>
                    </div>
                </div>
                <div class="w-full md:w-8/12 px-4">
                    <ul class="flex flex-wrap list-none md:justify-end  justify-center">
                        <li>
                            <a href="https://www.creative-tim.com"
                                class="text-white hover:text-gray-400 text-sm font-semibold block py-1 px-3">Creative
                                Tim</a>
                        </li>
                        <li>
                            <a href="https://www.creative-tim.com/presentation"
                                class="text-white hover:text-gray-400 text-sm font-semibold block py-1 px-3">About
                                Us</a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com"
                                class="text-white hover:text-gray-400 text-sm font-semibold block py-1 px-3">Blog</a>
                        </li>
                        <li>
                            <a href="https://github.com/creativetimofficial/argon-design-system/blob/master/LICENSE.md"
                                class="text-white hover:text-gray-400 text-sm font-semibold block py-1 px-3">MIT
                                License</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</section>

@endsection
