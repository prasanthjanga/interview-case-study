<!DOCTYPE html>
<html>

<head>
    @include('common_layouts.header')
</head>

<body class="text-gray-800 antialiased">
    @include('common_layouts.header_top')
    <main>
        @yield('content')
    </main>


</body>
@include('common_layouts.footer')

</html>
