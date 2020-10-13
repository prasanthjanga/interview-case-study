<div>
<div class="container mx-auto mt-10">
    {!! displayAlert() !!}
    <div class="flex flex-wrap">
        @if(!$items_list->isEmpty())

        @foreach($items_list as $item_array)
        <div class="w-full md:w-4/12 px-4 text-center">
        <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-8 shadow-lg rounded-lg">
            <div class="px-4 py-5 flex-auto">
                @php
                    $banner_images = json_decode($item_array->item_banners, true);
                @endphp

                <img src="{{ Voyager::image($item_array->getThumbnail($banner_images[0], 'cropped')) }}"
                class="w-full align-middle rounded-t-lg"/>

                <h6 class="text-xl text-left font-semibold">{{ $item_array->item_name }}</h6>
                <p class="mt-2 mb-4 text-gray-600 text-right">
                    <span class="text-xs font-semibold inline-block py-1 px-2 uppercase rounded text-green-600 bg-green-200 uppercase last:mr-0 mr-1">
                        RM {{ $item_array->item_price }}
                    </span>
                    <button class="bg-red-500 text-white w-8 h-8 rounded-full outline-none focus:outline-none mr-1 mb-1"><i class="fa fa-heart"></i></button>
                    <button wire:click="addToCart('{{ $item_array->id }}')" class="bg-blue-600 text-white w-8 h-8 rounded-full outline-none focus:outline-none mr-1 mb-1"><i class="fa fa-shopping-cart"></i></button>
                </p>
            </div>
        </div>
        </div>
        @endforeach
        @else
        <h1 class="text-center">.. No Items found ..</h1>
        @endif
    </div>
    {{ $items_list->links('pagination::template_pagination') }}

</div>
</div>
