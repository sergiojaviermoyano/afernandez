INSERT INTO `afernandez`.`sismenu` (`menuName`, `menuIcon`, `menuController`, `menuView`, `menuFather`) VALUES ('Ventas_Reservas', 'fa fa-fw fa-info', 'sale', 'listado_reserva', NULL);
INSERT INTO `afernandez`.`sismenuactions` (`menuId`, `actId`) VALUES ((select menuId from sismenu where menuController='sale' and menuView='listado_reserva'), '1');
INSERT INTO `afernandez`.`sismenuactions` (`menuId`, `actId`) VALUES ((select menuId from sismenu where menuController='sale' and menuView='listado_reserva'), '2');
INSERT INTO `afernandez`.`sismenuactions` (`menuId`, `actId`) VALUES ((select menuId from sismenu where menuController='sale' and menuView='listado_reserva'), '3');
INSERT INTO `afernandez`.`sismenuactions` (`menuId`, `actId`) VALUES ((select menuId from sismenu where menuController='sale' and menuView='listado_reserva'), '4');
INSERT INTO `afernandez`.`sismenuactions` (`menuId`, `actId`) VALUES ((select menuId from sismenu where menuController='sale' and menuView='listado_reserva'), '5');