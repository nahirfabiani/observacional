-- Columnas del "Pasajero Extra Adelante" (auto) que faltaban en la tabla.
-- Sin estas columnas, Supabase rechaza los registros nuevos y el panel admin no carga.
-- Correr una vez en Supabase > SQL Editor.
alter table public.registros add column if not exists pea_edad text;
alter table public.registros add column if not exists pea_cin  text;
