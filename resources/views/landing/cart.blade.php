@extends('common_layouts.app')

@section('content')
    <section class="pt-20 pb-1">
        <div class="container mx-auto px-4">
            <div class="flex flex-wrap justify-center text-center mb-5">
                <div class="w-full lg:w-6/12 px-4">
                    <h2 class="text-4xl font-semibold">Cart</h2>
                </div>
            </div>
        </div>
    </section>

    <section class="pb-20 bg-blue-300 mt-5">
        @livewire('cart-controller')
    </section>


@endsection
