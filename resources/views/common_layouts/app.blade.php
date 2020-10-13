<!DOCTYPE html>
<html>

<head>
    @include('common_layouts.header')
    @livewireStyles
</head>

<body class="text-gray-800 antialiased">
    @include('common_layouts.header_top')
    <main>
        @yield('content')
    </main>
	@include('common_layouts.footer_top')

    @livewireScripts
</body>
@include('common_layouts.footer')

</html>
