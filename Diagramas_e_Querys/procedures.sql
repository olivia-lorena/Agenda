DELIMITER $$

-- serviços

DROP PROCEDURE IF EXISTS `p_I_Servico` $$
	CREATE DEFINER=root@`localhost` 
	PROCEDURE p_I_Servico(IN _ativo INT, IN _vl_servico_uni DECIMAL(9,2), IN _nm_servico VARCHAR(40), IN _dt_cadastro DATETIME, IN _dt_modificado DATETIME, IN _modificado_por INT)
BEGIN
    INSERT INTO tb_servico (cd_servico,ativo,vl_servico_uni,nm_servico,dt_cadastro,dt_modificado,modificado_por)  
		VALUES 
		(NULL, _ativo, _vl_servico_uni ,  _nm_servico,  _dt_cadastro ,  _dt_modificado ,  _modificado_por );
    
    SELECT LAST_INSERT_ID() AS cd_servico;
	
END$$

DROP PROCEDURE IF EXISTS `p_S_Servicos`$$
	CREATE DEFINER=root@`localhost` PROCEDURE p_S_Servicos()
BEGIN
  SELECT
    nm_servico,
    vl_servico_uni    
  FROM
    tb_servico
  WHERE
    ativo = 1; 
END$$ 

DROP PROCEDURE IF EXISTS `p_D_Servico`$$
	CREATE DEFINER=root@`localhost` PROCEDURE p_D_Servico(IN _cd_servico INT)
BEGIN
	UPDATE tb_servico 
    SET ativo = 0 
    WHERE cd_servico = _cd_servico;
END$$

DROP PROCEDURE IF EXISTS `p_U_Servico`$$
	CREATE DEFINER=root@`localhost` 
    PROCEDURE p_U_Servico(IN _cd_servico INT, IN _vl_servico DECIMAL(9,2),IN _nm_servico VARCHAR(40))
BEGIN
  
  UPDATE tb_servico 
  SET vl_servico=_vl_servico, nm_servico =_nm_servico 
  WHERE cd_servico = _cd_servico;

END$$

-- contatos
DROP PROCEDURE IF EXISTS `p_I_Contato` $$
	CREATE DEFINER=root@`localhost` 
	PROCEDURE p_I_Contato(IN _cd_voucher INT,IN _cd_representante INT,IN _ativo INT,IN _nm_contato VARCHAR(100),IN _cd_telefone VARCHAR(13),IN _cd_celular VARCHAR(15),IN _ds_email VARCHAR(60),IN _cd_crm INT,IN _nm_cargo Varchar(40),IN _ds_site_particular VARCHAR(60),IN _ds_profissional VARCHAR(300),IN _dt_nascimento DATE,IN _cd_sexo VARCHAR(10),IN _cd_rg VARCHAR(9),IN _nm_clinica VARCHAR(45),IN _cd_cep INT,IN _nm_cidade VARCHAR(45),IN _sg_estado VARCHAR(2),IN _nm_bairro VARCHAR(45),IN _ds_endereco VARCHAR(45),IN _nm_complemento VARCHAR(128),IN _data_modificado DATETIME,IN _modificado_por INT)
BEGIN
    INSERT INTO tb_contato (cd_contato,cd_voucher,cd_representante,ativo,nm_contato,cd_telefone,cd_celular, ds_email,cd_crm,nm_cargo,ds_site_particular,  ds_profissional, dt_nascimento, cd_sexo,cd_rg, nm_clinica, cd_cep, nm_cidade, sg_estado,nm_bairro, ds_endereco,nm_complemento, data_modificado, modificado_por)  
		VALUES 
		(NULL, _cd_voucher , _cd_representante , _ativo , _nm_contato , _cd_telefone, _cd_celular , _ds_email , _cd_crm , _nm_cargo , _ds_site_particular , _ds_profissional , _dt_nascimento , _cd_sexo , _cd_rg , _nm_clinica , _cd_cep , _nm_cidade , _sg_estado , _nm_bairro ,_ds_endereco , _nm_complemento , _data_modificado , _modificado_por );
    SELECT LAST_INSERT_ID() AS cd_contato;
	
END$$

DROP PROCEDURE IF EXISTS `p_S_Contato_R`$$
	CREATE DEFINER=root@`localhost` PROCEDURE p_S_Contato_R(IN _usuario INT)
BEGIN
	  SELECT
		nm_contato,cd_telefone,cd_celular, ds_email,cd_crm,nm_cargo,
        ds_site_particular,  ds_profissional, dt_nascimento, cd_sexo,
        cd_rg, nm_clinica, cd_cep, nm_cidade, sg_estado,nm_bairro, ds_endereco,nm_complemento,
        tb_representante.nm_representante as representante
	  FROM
		tb_contato
	  INNER JOIN
		tb_representante on tb_contato.cd_representante = tb_representante.cd_representante
	  WHERE
		cd_representante = _usuario
        AND ativo = 1;
END$$ 


DROP PROCEDURE IF EXISTS `p_D_Contato`$$
	CREATE DEFINER=root@`localhost` PROCEDURE p_D_Contato(IN _cd_contato INT)
BEGIN
	UPDATE tb_contato 
    SET ativo = 0 
    WHERE cd_contato = _cd_contato;
END$$

DROP PROCEDURE IF EXISTS `p_U_Contato`$$
	CREATE DEFINER=root@`localhost` 
    PROCEDURE p_U_Contato(IN _cd_contato INT,IN _nm_contato VARCHAR(100),IN _cd_telefone VARCHAR(13),IN _cd_celular VARCHAR(15),IN _cd_crm INT,IN _nm_cargo Varchar(40),IN _ds_site_particular VARCHAR(60),IN _ds_profissional VARCHAR(300),IN _dt_nascimento DATE,IN _cd_sexo VARCHAR(10),IN _cd_rg VARCHAR(9),IN _nm_clinica VARCHAR(45),IN _cd_cep INT,IN _nm_cidade VARCHAR(45),IN _sg_estado VARCHAR(2),IN _nm_bairro VARCHAR(45),IN _ds_endereco VARCHAR(45),IN _nm_complemento VARCHAR(128))
BEGIN
  UPDATE tb_contato 
  SET 
	nm_contato = _nm_contato,
    cd_telefone = _cd_telefone,
    cd_celular = _cd_celular, 
    cd_crm = _cd_crm,
    nm_cargo = _nm_cargo,
    ds_site_particular = _ds_site_particular,  
    ds_profissional = _ds_profissional, 
    dt_nascimento = _dt_nascimento, 
    cd_sexo = _cd_sexo,
    cd_rg = _cd_rg_, 
    nm_clinica = _nm_clinica, 
    cd_cep = _cd_cep, 
    nm_cidade = _nm_cidade, 
    sg_estado = _sg_estado,
    nm_bairro = nm_bairro, 
    ds_endereco = _ds_endereço,
    nm_complemento = _nm_complemento
    
  WHERE cd_contato = _cd_contato;
END$$


-- guilherme

DROP PROCEDURE IF EXISTS `p_I_Pacote`$$
CREATE DEFINER=root@`localhost` PROCEDURE p_I_Pacote(IN _nm_pacote VARCHAR(70), IN _vl_pacote DECIMAL(9,2), IN _ativo INT, IN _dt_nascimento DATETIME, IN _dt_modificado DATETIME, IN modificado_por INT)
BEGIN
  
  INSERT INTO tb_pacote (cd_pacote, nm_pacote, vl_pacote, ativo, dt_cadastro, dt_modificado, modificado_por)
  VALUES
	(NULL, _nm_pacote, _vl_pacote, _ativo, _dt_cadastro, _dt_modificado, _modificado_por );
    
  SELECT LAST_INSERT_ID() AS cd_pacote;
	
END$$



DROP PROCEDURE IF EXISTS `p_S_Pacote`$$
CREATE DEFINER=root@`localhost` PROCEDURE p_S_Pacote(/*IN nm_pacote VARCHAR(70), vl_pacote DECIMAL(9,2)*/)
BEGIN
  SELECT
	nm_pacote
    vl_pacote
    
  FROM
    tb_pacote

  WHERE
    ativo = 1;

END$$


DROP PROCEDURE IF EXISTS `p_U_Pacote`$$
CREATE DEFINER=root@`localhost` PROCEDURE p_U_Pacote(IN _cd_pacote INT, IN _nm_pacote VARCHAR(70), IN _vl_pacote decimal(9,2) , IN _modificado_por INT)
BEGIN
  UPDATE
    tb_pacote
  SET
    nm_pacote = _nm_pacote,
    vl_pacote = _data_modificacao,
    modificado_por = _modificado_por
  WHERE
    cd_pacote = _cd_pacote;
END$$

DROP PROCEDURE IF EXISTS `p_D_Pacote`$$
CREATE DEFINER=root@`localhost` PROCEDURE p_D_Pacote(IN _cd_pacote INT, IN ativo INT)
BEGIN
  UPDATE
    tb_pacote
  SET
    ativo = 0
  WHERE
    cd_pacote = _cd_pacote;
END$$


DROP PROCEDURE IF EXISTS `p_I_Voucher`$$
CREATE DEFINER=root@`localhost` PROCEDURE p_I_Voucher(IN _cd_voucher_utilizavel VARCHAR(7), IN _cd_associado INT(1), IN _dt_validade DATE, IN _cd_limite_utilizado INT(11) , IN _vl_comissao decimal(9,2), In _vl_voucher decimal(9,2), In _vl_insencao decimal(9,2),
In _dt_carencia DATE, In dt_comissao DATE, In modificado_por int(11))
BEGIN
  
  INSERT INTO tb_voucher (cd_voucher, cd_voucher_utilizavel, cd_associado ,dt_validade,cd_limite_utilizado ,vl_comissao, vl_voucher, vl_insencao, dt_carencia  ,  dt_comissao, modificado_por)
  VALUES
	(NULL, cd_voucher_utilizavel, cd_associado ,dt_validade,cd_limite_utilizado ,vl_comissao, vl_voucher, vl_insencao, dt_carencia  ,  dt_comissao, modificado_por);
    
	 SELECT LAST_INSERT_ID() AS cd_voucher;
	
END$$

DROP PROCEDURE IF EXISTS `p_S_Voucher`$$
CREATE DEFINER=root@`localhost` PROCEDURE p_S_Voucher()
BEGIN
  SELECT
	cd_voucher_utilizavel,
	dt_validade,
    cd_limite_utilizado,
    vl_comissao,
    vl_voucher,
    vl_insencao,
    dt_carencia,
    dt_comissao,
	tb_pacote.nm_pacote as pacote, 
    tb_usuario.nm_usuario as usuario

  FROM
    tb_voucher
  INNER JOIN
    tb_pacote ON tb_voucher.cd_pacote = tb_pacote.cd_pacote
  INNER JOIN
    tb_usuario ON tb_voucher.cd_usuario = tb_usuario.cd_usuario;
    
	
END$$

DROP PROCEDURE IF EXISTS `p_D_Voucher`$$
CREATE DEFINER=root@`localhost` PROCEDURE p_D_Voucher(IN _cd_voucher INT, IN ativo INT)
BEGIN
  UPDATE
    tb_voucher
  SET
    ativo = 0
  WHERE
    cd_voucher = _cd_voucher;
END$$




DELIMITER ;
-- serviços de um pacote
	select 
		tb_servico.nm_servico,tb_servico.vl_servico_uni, limite_servico
	from 
		tb_servico_pacote
	inner join 
		tb_pacote on tb_servico_pacote.cd_pacote = tb_pacote.cd_pacote
	inner join
		tb_servico on tb_servico_pacote.cd_servico = tb_servico.cd_servico
	where
		tb_pacote.cd_pacote = 1;
        
-- voucher de representante
select
		cd_voucher_utilizavel, vl_insencao , dt_carencia, tb_pacote.nm_pacote, tb_usuario.nome
	from
		tb_voucher
	inner join
		tb_pacote on tb_voucher.cd_pacote = tb_pacote.cd_pacote
	inner join
		tb_usuario on tb_voucher.cd_usuario = tb_usuario.codigo
	where
		cd_voucher_utilizavel ='123';