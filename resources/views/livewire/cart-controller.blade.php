<div>
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
                    </tr>
                </thead>
                <tbody>
                    @php
                        $cart_total = 0;
                    @endphp
                    @if(!empty(count($cart_items)))
                    @foreach($cart_items as $cart_array)
                        <tr>
                            <th
                                class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                @php
                                    $banner_images = json_decode($cart_array->item_banners, true)
                                @endphp
                                <img src="{{ Voyager::image($cart_array->getThumbnail($banner_images[0], 'small')) }}" alt="" >
                            </th>
                            <td
                                class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                                {{ $cart_array->item_name }}
                            </td>
                            <td
                                class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4">
                                {{ $cart_array->quantity }}
                            </td>
                            <td
                                class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4">
                                RM {{ price_number_format($cart_array->item_price) }}
                            </td>
                        </tr>
                        @php
                            $cart_total += $cart_array->quantity*$cart_array->item_price;
                        @endphp
                    @endforeach
                    <tr>
                        <th colspan="3" class="text-right">Total</th>
                        <th
                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                            RM {{ price_number_format($cart_total) }}
                        </th>
                    </tr>
                    <tr>
                        <th colspan="3" class="text-right"></th>
                        <th
                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-no-wrap p-4 text-left">
                            <button class="bg-red-500 text-white active:bg-red-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 mb-1"
                                type="button" style="transition: all .15s ease"
                                wire:click="check_out()"
                            >
                                Check Out
                            </button>
                        </th>
                    </tr>
                    @else

                    <tr>
                        <th colspan="4">Cart Empty</th>
                    </tr>

                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
