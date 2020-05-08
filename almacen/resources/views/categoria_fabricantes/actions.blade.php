<div class="text-nowrap text-md-right">
    <a href="{{ route('categoria_fabricantes.show', $categoria_fabricante->id) }}" class="btn {{ !request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1' }}" title="{{ __('Show') }}">
        <i class="far fa-eye {{ !request()->ajax() ? 'fa-fw' : '' }}"></i>
    </a>

    <a href="{{ route('categoria_fabricantes.edit', $categoria_fabricante->id) }}" class="btn {{ !request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1' }}" title="{{ __('Edit') }}">
        <i class="far fa-edit {{ !request()->ajax() ? 'fa-fw' : '' }}"></i>
    </a>

    <a href="{{ route('categoria_fabricantes.destroy', $categoria_fabricante->id) }}" class="btn {{ !request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1' }}" title="{{ __('Delete') }}"
       onclick="event.preventDefault(); if (confirm('{{ __('Delete This Categoria Fabricante?') }}')) $('#delete_categoria_fabricante_{{ $categoria_fabricante->id }}_form').submit();">
        <i class="far fa-trash-alt {{ !request()->ajax() ? 'fa-fw' : '' }}"></i>
    </a>

    <form method="post" action="{{ route('categoria_fabricantes.destroy', $categoria_fabricante->id) }}" id="delete_categoria_fabricante_{{ $categoria_fabricante->id }}_form" class="d-none">
        @csrf
        @method('delete')
    </form>
</div>
