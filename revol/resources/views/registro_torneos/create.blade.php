@extends('layouts.app')

@section('title', __('Create registro_torneo'))
@section('content')
    <div class="container">
        <h1>@yield('title')</h1>

        <form method="post" action="{{ route('registro_torneos.store') }}">
            @csrf

            <div class="card">
                @include('registro_torneos.fields')

                <div class="card-footer text-md-right border-top-0">
                    <button type="submit" name="submit" value="reload" class="btn btn-primary">{{ __('Create & Add Another') }}</button>
                    <button type="submit" name="submit" value="redirect" class="btn btn-primary">{{ __('Create') }}</button>
                </div>
            </div>
        </form>
    </div>
@endsection
