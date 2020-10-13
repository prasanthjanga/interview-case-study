@extends('common_layouts.app')

@section('content')
    <section class="pt-20 pb-1">
        <div class="container mx-auto px-4">
            <div class="flex flex-wrap justify-center text-center mb-5">
                <div class="w-full lg:w-6/12 px-4">
                    <h2 class="text-4xl font-semibold">My Orders</h2>
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
                                    Order Date
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Order #
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Order Total
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Order Status
                                </th>
                                <th
                                    class="px-6 bg-gray-100 text-gray-600 align-middle border border-solid border-gray-200 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-no-wrap font-semibold text-left">
                                    Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $order_total = 0;
                            @endphp
                            @if(!empty(count($orders_list)))
                            @foreach($orders_list as $order_array)
                                <tr>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                        {{ date_ui($order_array->created_at) }}
                                    </td>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                        {{ $order_array->order_historie_id }}
                                    </td>
                                    <th
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                        RM {{ price_number_format($order_array->order_total) }}
                                    </th>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                        {{ get_drop_down_list(40)[$order_array->item_order_status] }}
                                    </td>
                                    <td
                                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4">
                                        <a href="{{ route('my_order_details',['order_id'=>$order_array->order_historie_id]) }}"
                                            class="bg-green-500 text-white active:bg-green-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 mb-1"
                                        ><i class="fa fa-eye"></i> View<a>
                                    </td>
                                </tr>
                            @endforeach
                            @else

                            <tr>
                                <th colspan="4">No Orders to Display</th>
                            </tr>

                            @endif
                        </tbody>
                    </table>
                    {{ $orders_list->links('pagination::template_pagination') }}
                </div>
            </div>
        </div>
    </section>


@endsection
