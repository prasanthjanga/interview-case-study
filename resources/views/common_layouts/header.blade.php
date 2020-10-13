<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <link rel="shortcut icon" href="{{ url('/') }}/assets/img/favicon.ico" />
    <link rel="apple-touch-icon" sizes="76x76" href="{{ url('/') }}/assets/img/apple-icon.png" />
    <link rel="stylesheet" href="{{ url('/') }}/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/creativetimofficial/tailwind-starter-kit/compiled-tailwind.min.css" />
    <title>{{ !empty($thisTitle)?$thisTitle:env('APP_NAME') }}</title>
