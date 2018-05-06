-- tabela log

CREATE TABLE IF NOT EXISTS `tb_log` (
  `tabela` varchar(255) NOT NULL,
  `codigo` int(11) NOT NULL,
  `operacao` varchar(255) NOT NULL,
  `campo` varchar(255) NOT NULL,
  `valor_antigo` varchar(255) NOT NULL,
  `valor_novo` varchar(255) NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `modificado_por` int(11) NOT NULL
) ;


-- Tabela Contato
        
create table tb_contato(
	cd_contato int(11) not null,	
    cd_voucher int(11) default null, -- chave estrangeira
    cd_representante int(11) not null, -- chave estrangeira
	ativo int(1) not null,
    nm_contato varchar(100) not null,
    cd_telefone varchar(13)not null,
    cd_celular varchar(15) not null, -- realemnte necessário?
    ds_email varchar(60)not null,
    cd_crm int(5) default null,
    nm_cargo varchar(40) default null,
    ds_site_particular varchar(60) default null,
    ds_profissional varchar(300) default null,
    dt_nascimento date default null,
    cd_sexo varchar(10) default null,
    cd_rg varchar(9) default null,
    nm_clinica varchar(45) default null,
    cd_cep int(8) default null,
    nm_cidade varchar(45) default null,
    sg_estado varchar(2) default null,
    nm_bairro varchar(45) default null,
    ds_endereco varchar(45) default null,
    nm_complemento varchar(128) default null,
	data_modificado datetime default null,
	modificado_por int(11) not null default '0' -- assim?
);

	--
	-- Triggers 'tb_contato'
	--

	DELIMITER $$
	CREATE TRIGGER I_Contato AFTER INSERT ON tb_contato
		FOR EACH ROW BEGIN
			INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
			VALUES
				('tb_Contato', New.cd_contato, 'INSERT', 'ativo', '', NEW.ativo, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_nome', '', NEW.nm_contato, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_telefone', '', NEW.cd_telefone, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_celular', '', NEW.cd_celular, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_email', '', NEW.ds_email, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_crm', '', NEW.cd_crm, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_cargo', '', NEW.nm_cargo, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_site_particular', '', NEW.ds_site_particular, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_profissional', '', NEW.ds_profissional, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'dt_nascimento', '', NEW.dt_nascimento, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_sexo', '', NEW.cd_sexo, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_rg', '', NEW.cd_rg, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_clinica', '', NEW.nm_clinica, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'cd_cep', '', NEW.cd_cep, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_cidade', '', NEW.nm_cidade, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'sg_estado', '', NEW.sg_estado, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_bairro', '', NEW.nm_bairro, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'ds_endereco', '', NEW.ds_endereco, NOW(), NEW.modificado_por),
				('tb_Contato', New.cd_contato, 'INSERT', 'nm_complemento', '', NEW.nm_complemento, NOW(), NEW.modificado_por);
		END
	$$
	DELIMITER ;

	DELIMITER $$
		CREATE TRIGGER u_cONTATO AFTER UPDATE ON tb_contato
			FOR EACH ROW BEGIN
				IF(NEW.ativo <> OLD.ativo) THEN
					INSERT INTO tb_Log-- esse cd_contato/ codigo de tb_log é a chave primária da tabela contato?
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_contato <> OLD.nm_contato) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_nome', OLD.nm_contato , NEW.nm_contato, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_telefone <> OLD.cd_telefone) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_telefone', OLD.cd_telefone , NEW.cd_telefone, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_celular <> OLD.cd_celular) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_celular', OLD.cd_celular , NEW.cd_celular, NOW(), NEW.modificado_por);
				END IF; 
				IF(NEW.ds_email <> OLD.ds_email) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_email', OLD.ds_email, NEW.ds_email, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_crm <> OLD.cd_crm) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_crm', OLD.cd_crm , NEW.cd_crm, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_cargo <> OLD.nm_cargo) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_cargo', OLD.nm_cargo , NEW.nm_cargo, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.ds_site_particular <> OLD.ds_site_particular) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_site_particular', OLD.ds_site_particular , NEW.ds_site_particular, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.ds_profissional <> OLD.ds_profissional) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_profissional', OLD.ds_profissional , NEW.ds_profissional, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.dt_nascimento <> OLD.dt_nascimento) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'dt_nascimento', OLD.dt_nascimento , NEW.dt_nascimento, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_sexo <> OLD.cd_sexo) THEN 
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'cd_sexo', OLD.cd_sexo , NEW.cd_sexo, NOW(), NEW.modificado_por);
				END IF; 
				IF(NEW.cd_rg <> OLD.cd_rg) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_email', OLD.cd_rg, NEW.cd_rg, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_clinica <> OLD.nm_clinica) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_clinica', OLD.nm_clinica , NEW.nm_clinica, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.cd_cep <> OLD.cd_cep) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_cargo', OLD.cd_cep , NEW.cd_cep, NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.nm_cidade <> OLD.nm_cidade) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_cidade', OLD.nm_cidade, NEW.nm_cidade, NOW(),NEW.modificado_por);
				END IF;
				IF(NEW.sg_estado <> OLD.sg_estado) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'sg_estado', OLD.sg_estado, NEW.sg_estado, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.nm_bairro <> OLD.nm_bairro) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_bairro', OLD.nm_bairro , NEW.nm_bairro, NOW(), NEW.modificado_por);
				END IF;
				IF(NEW.ds_endereco <> OLD.ds_endereco) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'ds_endereco', OLD.ds_endereco , NEW.ds_endereco, NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.nm_complemento <> OLD.nm_complemento) THEN
					INSERT INTO tb_Log
					VALUES ('tb_Contato', OLD.cd_contato, 'UPDATE', 'nm_complemento', OLD.nm_complemento, NEW.nm_complemento, NOW(),NEW.modificado_por);
				END IF;
		END
	$$
	DELIMITER ;
    
-- Tabela de servicos 

create table tb_servico(
	cd_servico int(11) not null,
	ativo int(1) not null,
    vl_servico_uni decimal(9,2) not null,
    nm_servico varchar(40) not null,
    dt_cadastro datetime default null,
    dt_modificado datetime default null,
    modificado_por int(11) not null default '0'
);

	-- 
	-- Triggers tabela serviços
	--

	DELIMITER $$
		CREATE TRIGGER I_Servico AFTER INSERT ON tb_servico
			FOR EACH ROW BEGIN
				INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
				VALUES
					('tb_servico', NEW.cd_servico , 'INSERT' , 'ativo'      , '' , NEW.ativo      , NOW(), NEW.modificado_por),
					('tb_servico', NEW.cd_servico , 'INSERT' , 'vl_servico_uni' , '' , NEW.vl_servico_uni , NOW(), NEW.modificado_por),
					('tb_servico', NEW.cd_servico , 'INSERT' , 'nm_servico' , '' , NEW.nm_servico , NOW(), NEW.modificado_por);
			END
	$$
	DELIMITER ;
   
	DELIMITER $$
		CREATE TRIGGER U_Servico AFTER UPDATE ON tb_servico
		FOR EACH ROW BEGIN
			IF (NEW.ativo <> OLD.ativo) THEN
				INSERT INTO tb_Log
				VALUES ('tb_servico', OLD.cd_servico, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo , NOW(), NEW.modificado_por);
			END IF;
			IF( NEW.vl_servico_uni <> OLD.vl_servico_uni) THEN
				INSERT INTO tb_Log
				VALUES ('tb_servico', OLD.cd_servico, 'UPDATE', 'vl_servico_uni',OLD.vl_servico_uni , NEW.vl_servico_uni , NOW(), NEW.modificado_por);
			END IF;
			IF (NEW.nm_servico <> OLD.nm_servico) THEN
				INSERT INTO tb_Log
				VALUES ('tb_servico', NEW.cd_servico, 'UPDATE', 'nm_servico', OLD.nm_servico , NEW.nm_servico , NOW(), NEW.modificado_por);
			END IF;		
		END
	$$
	DELIMITER ;
    


-- Tabela Pacote/Serviços

create table tb_servico_pacote(
	codigo int not null,
	cd_pacote int(11) not null, -- estrangeira
    cd_servico int(11) not null, -- estrangeira
	ativo int(1) not null,
    limite_servico int(11) default null,
    dt_cadastro datetime default null,
    dt_modificado datetime default null,
    modificado_por int(11) default '0'
);
		
	-- 
	-- Triggers tabela serviço_pacote
	--

	DELIMITER $$
		CREATE TRIGGER I_Servico_pacote AFTER INSERT ON tb_servico_pacote
			FOR EACH ROW BEGIN
				INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
				VALUES
					('tb_servico_pacote', NEW.codigo, 'INSERT', 'ativo', '', NEW.ativo , NOW(), NEW.modificado_por),
					('tb_servico_pacote', NEW.codigo, 'INSERT', 'limite_servico', '', NEW.limite_servico , NOW(), NEW.modificado_por);
			END
	$$
	DELIMITER;

	DELIMITER $$
		CREATE TRIGGER U_Servico_pacote AFTER UPDATE ON tb_servico_pacote
			FOR EACH ROW BEGIN
				IF(NEW.ativo <> OLD.ativo) THEN
					INSERT INTO tb_Log
					VALUES ('tb_servico_pacote', NEW.codigo, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo , NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.limite_servico <> OLD.limite_servico) THEN
					INSERT INTO tb_Log
					VALUES ('tb_servico_pacote', NEW.codigo, 'UPDATE', 'limite_servico', OLD.limite_servico, NEW.limite_servico , NOW(), NEW.modificado_por);
				END IF;
			END
	$$
	DELIMITER ;
    
    
-- Tabela de pacotes
	
create table tb_pacote(
	cd_pacote int(11) not null,
    nm_pacote varchar(70) not null,
    vl_pacote decimal(9,2) not null,
    ativo int(1) not null,
    dt_cadastro datetime default null,
    dt_modificado datetime default null,
    modificado_por int(11) default '0'
);


	-- 
	-- Triggers tabela pacote
	--

	DELIMITER $$
		CREATE TRIGGER I_Pacote AFTER INSERT ON tb_pacote
			FOR EACH ROW BEGIN
				INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
				VALUES -- tablea pacote
					('tb_pacote', NEW.cd_pacote, 'INSERT' , 'ativo'     , '' , NEW.ativo     , NOW() , NEW.modificado_por ),
					('tb_pacote', NEW.cd_pacote, 'INSERT' , 'nm_pacote' , '' , NEW.nm_pacote , NOW() , NEW.modificado_por ),
					('tb_pacote', NEW.cd_pacote, 'INSERT' , 'vl_pacote' , '' , NEW.vl_pacote , NOW() , NEW.modificado_por );
			END
	$$
	DELIMITER ;

	DELIMITER $$
		CREATE TRIGGER U_Pacote AFTER UPDATE ON tb_pacote
			FOR EACH ROW BEGIN
				IF( NEW.ativo <> OLD.ativo) THEN
					INSERT INTO tb_Log
					VALUES ('tb_pacote', OLD.cd_pacote, 'UPDATE', 'ativo', OLD.ativo, NEW.ativo , NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.nm_pacote <> OLD.nm_pacote) THEN
					INSERT INTO tb_Log 
					VALUES ('tb_pacote', OLD.cd_pacote, 'UPDATE', 'nm_pacote', OLD.nm_pacote, NEW.nm_pacote , NOW(), NEW.modificado_por);
				END IF;
				IF (NEW.vl_pacote <> OLD.vl_pacote) THEN
					INSERT INTO tb_Log
					VALUES ('tb_pacote', OLD.cd_pacote, 'UPDATE', 'vl_pacote', OLD.vl_pacote, NEW.vl_pacote , NOW(), NEW.modificado_por);
				END IF;
			END
	$$
	DELIMITER ;

--  Tabela Representante
    
create table tb_representante(
	cd_representante int(11) not null,
    cd_telefone int(10) not null,
    cd_celular int(12) not null,
    dt_nascimento date,
    cd_sexo varchar (10),
    cd_cpf int(11),
    cd_rg varchar(9),
    cd_cep varchar(8),
    nm_cidade varchar(45),
    sg_estado char(2),
    nm_bairro varchar(30),
    ds_endereco varchar(70),
    nm_endereco varchar (30),
    dt_cadastro datetime,
	cd_ativo int(1) not null,
    dt_modificado datetime,
    modificado_por int(11)not null
);
	-- 
	-- Triggers tabela representantes
	--
    
	DELIMITER $$
	CREATE TRIGGER `I_Representante` AFTER INSERT ON `tb_representante`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_telefone', '', NEW.cd_telefone, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_celular', '', NEW.cd_celular, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_endereco', '', NEW.nm_endereco, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'dt_nascimento', '', NEW.dt_nascimento, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_sexo', '', NEW.cd_sexo, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_cpf', '', NEW.cd_cpf, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_rg', '', NEW.cd_rg, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'cd_cep', '', NEW.cd_cep, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_cidade', '', NEW.nm_cidade, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'sg_estado', '', NEW.sg_estado, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_bairro', '', NEW.nm_bairro, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'ds_endereco', '', NEW.ds_endereco, NOW(), NEW.modificado_por),
		  ('tb_representante', NEW.cd_representante, 'INSERT', 'nm_endereco', '', NEW.nm_endereco, NOW(), NEW.modificado_por);

	END
	$$
	DELIMITER ;


	DELIMITER $$
	CREATE TRIGGER `U_Representante` AFTER UPDATE ON `tb_representante`
	 FOR EACH ROW BEGIN
	  IF (NEW.cd_telefone <> OLD.cd_telefone) THEN  
		INSERT INTO tb_Log 
		  VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_telefone', OLD.cd_telefone, NEW.cd_telefone, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.cd_celular <> OLD.cd_celular) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_celular', OLD.cd_celular, NEW.cd_celular, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.nm_endereco <> OLD.nm_endereco) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_endereco', OLD.nm_endereco, NEW.nm_endereco, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.dt_nascimento <> OLD.dt_nascimento) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'dt_nascimento', OLD.dt_nascimento, NEW.dt_nascimento, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_sexo <> OLD.cd_sexo) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_sexo', OLD.cd_sexo, NEW.cd_sexo, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_cpf <> OLD.cd_cpf) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_cpf', OLD.cd_cpf, NEW.cd_cpf, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_rg <> OLD.cd_rg) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_rg', OLD.cd_rg, NEW.cd_rg, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.cd_cep <> OLD.cd_cep) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'cd_cep', OLD.cd_cep, NEW.cd_cep, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.nm_cidade <> OLD.nm_cidade) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_cidade', OLD.nm_cidade, NEW.nm_cidade, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.sg_estado <> OLD.sg_estado) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'sg_estado', OLD.sg_estado, NEW.sg_estado, NOW(), NEW.modificado_por);
	  END IF;
	   IF (NEW.nm_bairro <> OLD.nm_bairro) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_bairro', OLD.nm_bairro, NEW.nm_bairro, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.ds_endereco <> OLD.ds_endereco) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'ds_endereco', OLD.ds_endereco, NEW.ds_endereco, NOW(), NEW.modificado_por);
	  END IF;
	  IF (NEW.nm_endereco <> OLD.nm_endereco) THEN  
		  INSERT INTO tb_Log 
			VALUES ('tb_representante', OLD.cd_representante, 'UPDATE', 'nm_endereco', OLD.nm_endereco, NEW.nm_endereco, NOW(), NEW.modificado_por);
	  END IF;
	END
	$$
	DELIMITER ;

-- Tabela Solicitação de Voucher
    
create table tb_solicitacao_voucher(
	cd_solicitacao int(11) not null,
	cd_representante int(11) not null, -- estrangeira
	ds_voucher varchar(250) not null,
    dt_solicitado datetime,
    cd_ativo int(1) not null,
    confirmacao int(1) not null,
    modificado_por int(11) not null
);

    -- trigger 
    
	DELIMITER $$
	CREATE TRIGGER `I_Solicitacao_voucher` AFTER INSERT ON `tb_solicitacao_voucher`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  ('tb_solicitacao_voucher', NEW.cd_solicitacao, 'INSERT', 'ds_voucher', '', NEW.ds_voucher, NOW(), NEW.modificado_por),
		  ('tb_solicitacao_voucher', NEW.cd_solicitacao, 'INSERT', 'dt_solicitado', '', NEW.dt_solicitado, NOW(), NEW.modificado_por),
		  ('tb_solicitacao_voucher', NEW.cd_solicitacao, 'INSERT', 'confirmacao', '', NEW.confirmacao, NOW(), NEW.modificado_por);
		  
	END
	$$
	DELIMITER ;


-- Tabela Voucher
        
create table tb_voucher (
	cd_voucher int(11),
    cd_pacote int(11) not null, -- estrangeira
    cd_usuario int(11) default null, -- estrangeira
    cd_voucher_utilizavel varchar(7),
    cd_associado int(1) null,     
    dt_validade date,
    cd_limite_utilizado int(11),
    vl_comissao decimal (9,2),
    vl_voucher decimal(9,2),
    vl_insencao decimal(9,2),
    dt_carencia date,
    dt_comissao date,
    modificado_por int(11) not null
);
    
   -- trigger
	DELIMITER $$
	CREATE TRIGGER `I_Voucher` AFTER INSERT ON `tb_voucher`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'dt_solicitado', '', NEW.cd_geral, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'nm_asssociado', '', NEW.nm_associado, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'nm_contato', '', NEW.nm_contato, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'dt_validade', '', NEW.dt_validade, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'cd_limite_utilizado', '', NEW.cd_limite_utilizado, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'vl_comissao', '', NEW.vl_comissao, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'vl_voucher', '', NEW.vl_voucher, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'vl_insencao', '', NEW.vl_insencao, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'dt_carencia', '', NEW.dt_carencia, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'cd_servico', '', NEW.cd_servico, NOW(), NEW.modificado_por),
		  ('tb_voucher', NEW.cd_voucher, 'INSERT', 'dt_comissao', '', NEW.dt_comissao, NOW(), NEW.modificado_por);		  	  
	END
	$$
	DELIMITER ;


-- Tabela convertidos 
		
create table tb_convertidos(
	cd_convertidos int(11) not null,
	cd_contato int(11) not null, -- estrangeira
    dt_convertido datetime,
    cd_ativo int(1) not null,
    modificado_por int(11) not null default '0'
);


	-- trigger
	DELIMITER $$
	CREATE TRIGGER `I_Convertidos` AFTER INSERT ON `tb_convertidos`
	 FOR EACH ROW BEGIN
	  INSERT INTO tb_Log (tabela, codigo, operacao, campo, valor_antigo, valor_novo, data_modificacao, modificado_por)
	  VALUES
		  ('tb_convertidos', NEW.cd_convertidos, 'INSERT', 'dt_convertido', '', NEW.dt_convertido, NOW(), NEW.modificado_por),
		  ('tb_convertidos', NEW.cd_convertidos, 'INSERT', 'cd_ativo', '', NEW.cd_ativo, NOW(), NEW.modificado_por);		  		  
	END
	$$
	DELIMITER ;



-- Chaves primárias 
AlTER TABLE tb_contato
	ADD PRIMARY KEY (cd_contato),
    ADD KEY (cd_voucher,cd_representante);
    
ALTER TABLE tb_convertidos 
	ADD PRIMARY KEY (cd_convertidos),
    ADD KEY (cd_contato);
    
ALTER TABLE tb_pacote
	ADD PRIMARY KEY (cd_pacote);
    
ALTER TABLE tb_representante
	ADD PRIMARY KEY(cd_representante);
    
ALTER TABLE tb_servico
	ADD PRIMARY KEY (cd_servico);
    
ALTER TABLE tb_servico_pacote
	ADD PRIMARY KEY (codigo),
    ADD KEY (cd_pacote, cd_servico);
    
ALTER TABLE tb_solicitacao_voucher
	ADD PRIMARY KEY (cd_solicitacao),
    ADD KEY (cd_representante);
    
ALTER TABLE tb_voucher
	ADD PRIMARY KEY (cd_voucher),
    ADD KEY (cd_pacote, cd_usuario);

-- chaves estrangeiras

ALTER TABLE tb_contato
    ADD CONSTRAINT fk_contato_representante FOREIGN KEY (cd_representante) REFERENCES tb_representante(cd_representante);

-- será q fiz um index?????    
alter table tb_contato
	add index i_voucher (cd_voucher);

ALTER TABLE tb_convertidos
	ADD CONSTRAINT fk_convertidos_contato FOREIGN KEY (cd_contato) REFERENCES tb_contato(cd_contato);
    
ALTER TABLE tb_servico_pacote
	ADD CONSTRAINT fk_pacote FOREIGN KEY (cd_pacote) REFERENCES tb_pacote(cd_pacote),
    ADD CONSTRAINT fk_servico FOREIGN KEY (cd_servico) REFERENCES tb_servico(cd_servico);
    
ALTER TABLE tb_solicitacao_voucher
	ADD CONSTRAINT fk_solicitacao_representante FOREIGN KEY (cd_representante) REFERENCES tb_representante(cd_representante);

ALTER TABLE tb_voucher
	ADD CONSTRAINT fk_pacote_voucher FOREIGN KEY (cd_pacote) REFERENCES tb_pacote(cd_pacote),
    ADD INDEX i_usuario (cd_usuario) ;
 

-- testes
insert into tb_servico
values (1,1,0.15,'SMS',NOW(),NOW(),1);

update tb_servico set nm_servico = 'Ligações' where cd_servico = 1;

insert into tb_representante (cd_representante)
values(1);

insert into tb_contato(cd_contato, cd_voucher, cd_representante,ativo, nm_contato, cd_telefone, cd_celular,ds_email)
values(2, 45, 1, 3, 'Olívia', '34717565', '98738749','kkk@kkk.com');

update tb_contato set cd_representante = null where cd_contato =1;


