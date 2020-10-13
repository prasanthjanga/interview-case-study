@extends('common_layouts.app')

@section('content')
    <section class="pt-20 pb-1">
        <div class="container mx-auto px-4">
            <div class="flex flex-wrap justify-center text-center mb-5">
                <div class="w-full lg:w-8/12 px-4">
                    <h2 class="text-4xl font-semibold">Order No: {{ (!empty($order_details))?$order_details[0]->order_historie_id:null }}</h2>
                </div>
            </div>
        </div>
    </section>

    <section class="pb-20 bg-blue-300 mt-5">
        <div class="w-full xl:w-12/12 mb-12 xl:mb-0 px-4">
            <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded">
                {!! displayAlert() !!}
                <div class="block w-full overflow-x-auto">
                    <!-- Projects table -->
                    <table class="items-center w-full bg-transparent border-collapse">
                        <thead>
                            <tr>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Item Image
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Item Name
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Quantity
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Item Price
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Order Status
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $order_total = 0;
                            @endphp
                            @if(!empty(count($order_details)))
                            @foreach($order_details as $order_array)
                                <tr>
                                    <th
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                        @php
                                            $banner_images = json_decode($order_array->item_banners, true)
                                        @endphp
                                        <img src="{{ Voyager::image($order_array->getThumbnail($banner_images[0], 'small')) }}" alt="" >
                                    </th>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                        {{ $order_array->item_name }}
                                    </td>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4">
                                        {{ $order_array->quantity }}
                                    </td>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4">
                                        RM {{ price_number_format($order_array->item_price) }}
                                    </td>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4">
                                        {{ get_drop_down_list(40)[$order_array->item_order_status] }}
                                    </td>
                                </tr>
                                @php
                                    $order_total += $order_array->quantity*$order_array->item_price;
                                @endphp
                            @endforeach
                            <tr>
                                <th colspan="3" class="text-right">Order Total</th>
                                <th
                                class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                    RM {{ price_number_format($order_total) }}
                                </th>
                            </tr>
                            @else

                            <tr>
                                <th colspan="4">Order Not Found!</th>
                            </tr>

                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
            <a href="{{ route('my_orders') }}"
            class="bg-red-500 text-white active:bg-red-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 mb-1"
            ><i class="fa fa-reply"></i> Back</a>
        </div>
    </section>


@endsection
