@if ($paginator->hasPages())
<div class="py-2">
    <nav class="block">
    <ul class="flex pl-0 rounded list-none flex-wrap">
        {{-- Previous Page Link --}}
        <li>
            @if ($paginator->onFirstPage())
                <a href="#" class="first:ml-0 text-xs font-semibold flex w-8 h-8 mx-1 p-0 rounded-full items-center justify-center leading-tight relative border border-solid border-blue-200 text-white bg-blue-200">
                    <i class="fas fa-chevron-left -ml-px"></i>
                </a>
            @else
                <a href="{{ $paginator->previousPageUrl() }}" class="first:ml-0 text-xs font-semibold flex w-8 h-8 mx-1 p-0 rounded-full items-center justify-center leading-tight relative border border-solid border-blue-500 text-white bg-blue-500">
                    <i class="fas fa-chevron-left -ml-px"></i>
                </a>
            @endif
        </li>

        {{-- Pagination Elements --}}
        @foreach ($elements as $element)
            {{-- "Three Dots" Separator --}}
            @if (is_string($element))
                <li><span>{{ $element }}</span></li>
            @endif

            {{-- Array Of Links --}}
            @if (is_array($element))
                @foreach ($element as $page => $url)
                <li>
                    @if ($page == $paginator->currentPage())
                        <a href="#" class="first:ml-0 text-xs font-semibold flex w-8 h-8 mx-1 p-0 rounded-full items-center justify-center leading-tight relative border border-solid border-blue-500 text-white bg-blue-500">
                            {{ $page }}
                        </a>
                    @else
                        <a href="{{ $url }}" class="first:ml-0 text-xs font-semibold flex w-8 h-8 mx-1 p-0 rounded-full items-center justify-center leading-tight relative border border-solid border-blue-500 bg-white text-blue-500">
                            {{ $page }}
                        </a>
                    @endif
                </li>
                @endforeach
            @endif
        @endforeach

        {{-- Next Page Link --}}
        <li>
        @if ($paginator->hasMorePages())
            <a href="{{ $paginator->nextPageUrl() }}" class="first:ml-0 text-xs font-semibold flex w-8 h-8 mx-1 p-0 rounded-full items-center justify-center leading-tight relative border border-solid border-blue-500 text-white bg-blue-500">
                <i class="fas fa-chevron-right -mr-px"></i>
            </a>
        @else
            <a href="{{ $paginator->nextPageUrl() }}" class="first:ml-0 text-xs font-semibold flex w-8 h-8 mx-1 p-0 rounded-full items-center justify-center leading-tight relative border border-solid border-blue-200 text-white bg-blue-200">
                <i class="fas fa-chevron-right -mr-px"></i>
            </a>
        @endif
        </li>
    </ul>
  </nav>
</div>
@endif
