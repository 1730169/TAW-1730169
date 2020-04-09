@extends('layouts.app')

@section('title', __('Create Gamer'))
@section('content')
    <div class="container">
        <h1>@yield('title')</h1>

        <form method="post" action="{{ route('gamers.store') }}">
            @csrf

            <div class="card">
                @include('gamers.fields')

                <div class="card-footer text-md-right border-top-0">
                    <button type="submit" name="submit" value="reload" class="btn btn-primary">{{ __('Create & Add Another') }}</button>
                    <button type="submit" name="submit" value="redirect" class="btn btn-primary">{{ __('Crear') }}</button>
                </div>
            </div>
        </form>
    </div>
@endsection
