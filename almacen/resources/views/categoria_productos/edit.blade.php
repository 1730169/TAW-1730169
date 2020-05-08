@extends('layouts.app')

@section('title', __('Edit Categoria Producto'))
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md">
                <h1>@yield('title')</h1>
            </div>
            <div class="col-md-auto mb-3 mb-md-0">
                @include('categoria_productos.actions')
            </div>
        </div>

        <form method="post" action="{{ route('categoria_productos.update', $categoria_producto->id) }}">
            @csrf
            @method('patch')

            <div class="card">
                @include('categoria_productos.fields')

                <div class="card-footer text-md-right border-top-0">
                    <button type="submit" name="submit" value="reload" class="btn btn-primary">{{ __('Update & Continue Edit') }}</button>
                    <button type="submit" name="submit" value="redirect" class="btn btn-primary">{{ __('Update') }}</button>
                </div>
            </div>
        </form>
    </div>
@endsection
