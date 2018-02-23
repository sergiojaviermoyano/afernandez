ALTER TABLE `configuracion`
DROP COLUMN `utilizaordendecompra`,
ADD COLUMN `cotizacionDolar`  decimal(10,2) NULL DEFAULT 1 AFTER `title2`;