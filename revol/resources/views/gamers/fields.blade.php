<div class="list-group list-group-flush">
    <!--<x-crudify-input name="name" :value="old('name', $gamer->name ?? '')" /> -->
    <x-crudify-input name="nombre" :value="old('nombre', $gamer->nombre ?? '')" />
    <x-crudify-input name="apellidos" :value="old('apellidos', $gamer->apellidos ?? '')" />
    <x-crudify-input name="fecha_nac" type="date" :label="__('Fecha de nacimiento')" :value="old('fecha_nac', $gamer->fecha_nac ?? '')" />
    <x-crudify-select name="genero" :options="['Hombre' => 0,'Mujer' => 1,'Otro' => 2 ]" :empty="false" :label="__('Género')" :value="old('genero', $gamer->genero ?? '')" />
    <x-crudify-input name="telefono" :value="old('telefono', $gamer->telefono ?? '')" />
    <x-crudify-input name="email" type="email" :label="__('Correo eletrónico')" :value="old('email', $gamer->email ?? '')" />
    <x-crudify-input name="gamertag" :value="old('gamertag', $gamer->gamertag ?? '')" />
    <x-crudify-input name="contrasena" type="password" :label="__('Contraseña')" :value="old('contrasena', $gamer->contrasena ?? '')" />
    <x-crudify-textarea name="redes_sociales" rows="5" :label="__('Redes sociales')" :value="old('redes_sociales', $gamer->redes_sociales ?? '')" />


</div>
