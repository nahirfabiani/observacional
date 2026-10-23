-- OMSV Relevamiento: acceso libre sin usuario/contrasena.
-- Correr una vez en Supabase > SQL Editor.
-- Cualquiera con la app puede CARGAR y VER registros, pero nadie puede EDITARLOS ni BORRARLOS.

-- Los registros ya no estan atados a un usuario logueado
alter table public.registros alter column observador_id drop not null;

alter table public.registros enable row level security;

-- Insertar y leer: permitido para la app (rol anon)
drop policy if exists "registros_insert_libre" on public.registros;
create policy "registros_insert_libre" on public.registros
  for insert to anon, authenticated with check (true);

drop policy if exists "registros_select_libre" on public.registros;
create policy "registros_select_libre" on public.registros
  for select to anon, authenticated using (true);

-- Editar y borrar: bloqueado. Se sacan los permisos de base, asi que aunque
-- exista alguna policy vieja de update/delete, no tiene efecto.
revoke update, delete, truncate on public.registros from anon, authenticated;
