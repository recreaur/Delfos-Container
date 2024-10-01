-- Crear usuario con permisos en esta db y permitir a aplicaciondb gestionar
CREATE USER 'bibliotecaUsr'@'%' IDENTIFIED BY 'bibliotecaUsrbibliotecaUsr';
GRANT SELECT ON `biblioteca`.* TO 'bibliotecaUsr'@'%';

CREATE USER 'comercioUsr'@'%' IDENTIFIED BY 'comercioUsrcomercioUsr';
GRANT SELECT ON `comercio`.* TO 'comercioUsr'@'%';

CREATE USER 'empresaUsr'@'%' IDENTIFIED BY 'empresaUsrempresaUsr';
GRANT SELECT ON `empresa`.* TO 'empresaUsr'@'%';

CREATE USER 'universidadUsr'@'%' IDENTIFIED BY 'universidadUsruniversidadUsr';
GRANT SELECT ON `universidad`.* TO 'uniUsr'@'%';

CREATE USER 'viajesUsr'@'%' IDENTIFIED BY 'viajesUsrviajesUsr';
GRANT SELECT ON `viajes`.* TO 'viajesUsr'@'%';



GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON `biblioteca`.* TO 'aplicacionbd'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON `comercio`.* TO 'aplicacionbd'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON `empresa`.* TO 'aplicacionbd'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON `universidad`.* TO 'aplicacionbd'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON `viajes`.* TO 'aplicacionbd'@'%';

