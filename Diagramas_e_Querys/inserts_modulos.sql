-- Módulo
INSERT INTO `tb_modulo` (`codigo`, `data_cadastro`, `ativo`, `nome`)  VALUES
(11,'2018-05-04 10:58:45 ',1 ,'Voucher'),
(12,'2018-05-04 10:58:45 ',1 ,'Representante'),
(13, '2018-05-04 11:39:25',1, 'Serviços'), 
(14, '2018-05-04 11:39:45', 1, 'Pacotes'),
(15, '2018-05-04 11:41:23', 1, 'Contato');


-- Permissão_Usuário
INSERT INTO `tb_permissaousuario` (`usuario`, `modulo`, `permissao`, `ativo`) VALUES
(1, 11, 1, 1),
(1, 11, 2, 0),
(1, 11, 3, 1),
(1, 11, 4, 1),
(1, 12, 1, 1),
(1, 12, 2, 1),
(1, 12, 3, 1),
(1, 12, 4, 1),
(1, 13, 1, 1),
(1, 13, 2, 1),
(1, 13, 3, 1),
(1, 13, 4, 1),
(1, 14, 1, 1),
(1, 14, 2, 1),
(1, 14, 3, 1),
(1, 14, 4, 1),
(1, 15, 1, 0),
(1, 15, 2, 0),
(1, 15, 3, 1),
(1, 15, 4, 0),

(2, 11, 1, 0),
(2, 11, 2 ,0),
(2, 11, 3, 0),
(2, 11, 4, 0),
(2, 12, 1, 0),
(2, 12, 2, 0),
(2, 12, 3, 0),
(2, 12, 4, 0),
(2, 13, 1, 0),
(2, 13, 2, 0),
(2, 13, 3, 0),
(2, 13, 4, 0),
(2, 14, 1, 0),
(2, 14, 2, 0),
(2, 14 ,3, 0),
(2, 14 ,4 ,0),
(2, 15, 1, 0),
(2, 15, 2, 0),
(2, 15 ,3, 0),
(2, 15 ,4 ,0);

-- Perfil
INSERT INTO `tb_perfil` (`codigo`, `data_cadastro`, `ativo`, `nome`) VALUES
(6, '2018-05-04 11:03:23', 1, ‘Representante’);

-- Menu
INSERT INTO `tb_menu` (`codigo`, `modulo`, `data_cadastro`, `ativo`, `nome`, `posicionamento`) VALUES
(15, 11, '2018-05-04 11:15:03' ,1 , 'Índice' , 10),
(16, 12, '2018-05-04 11:15:03' ,1, 'Índice' , 11),
(15, 13, '2018-05-04 11:48:03', 1, 'Índice' , 12 ),
(16, 14, '2018-05-04 11:48:03', 1, 'Índice' , 13 ),
(16, 15, '2018-05-04 11:48:03', 1, 'Índice' , 14 );
 
