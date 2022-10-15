-- -----------------------------------------------------
-- Schema pf_veiculos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pf_veiculos`;
CREATE SCHEMA IF NOT EXISTS `pf_veiculos` DEFAULT CHARACTER SET utf8 ;
USE `pf_veiculos` ;

-- -----------------------------------------------------
-- Table `pf_veiculos`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`veiculo` (
  `cod_veiculo` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `preco` FLOAT NOT NULL,
  `modelo` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`cod_veiculo`)
  );

-- -----------------------------------------------------
-- Table `pf_veiculos`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`carro` (
  `id` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  `tamanho_motor` FLOAT NOT NULL,
  `veiculo_cod_veiculo` INT NOT NULL,
  CONSTRAINT `fk_CARRO_VEICULO1`
    FOREIGN KEY (`veiculo_cod_veiculo`)
    REFERENCES `pf_veiculos`.`veiculo` (`cod_veiculo`)
    
);

-- -----------------------------------------------------
-- Table `pf_veiculos`.`caminhao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`caminhao` (
  `id` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  `capacidade_peso` FLOAT NOT NULL,
  `veiculo_cod_veiculo` INT NOT NULL,
  CONSTRAINT `fk_CAMINHAO_VEICULO1`
    FOREIGN KEY (`veiculo_cod_veiculo`)
    REFERENCES `pf_veiculos`.`veiculo` (`cod_veiculo`)
);

-- -----------------------------------------------------
-- Table `pf_veiculos`.`utilitario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`utilitario` (
  `id` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  `nr_assentos` INT NOT NULL,
  `veiculo_cod_veiculo` INT NOT NULL,
  CONSTRAINT `fk_UTILITARIO_VEICULO1`
    FOREIGN KEY (`veiculo_cod_veiculo`)
    REFERENCES `pf_veiculos`.`veiculo` (`cod_veiculo`)
);

-- -----------------------------------------------------
-- Table `pf_veiculos`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`vendedor` (
  `num_vend` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`num_vend`)
);


-- -----------------------------------------------------
-- Table `pf_veiculos`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`endereco` (
  `id` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `estado` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`)
  );

-- -----------------------------------------------------
-- Table `pf_veiculos`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`cliente` (
  `cpf` VARCHAR(11) NOT NULL UNIQUE PRIMARY KEY,
  `nome` VARCHAR(45) NOT NULL,
  `endereco_id` INT NOT NULL,
  CONSTRAINT `fk_cliente_endereco1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `pf_veiculos`.`endereco` (`id`)
);

-- -----------------------------------------------------
-- Table `pf_veiculos`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf_veiculos`.`venda` (
  `data` DATE NOT NULL,
  `vendedor_num_vend` INT NOT NULL,
  `veiculo_cod_veiculo` INT NOT NULL,
  `cliente_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`vendedor_num_vend`, `veiculo_cod_veiculo`, `cliente_cpf`),
  CONSTRAINT `fk_VENDA_VENDEDOR`
    FOREIGN KEY (`vendedor_num_vend`)
    REFERENCES `pf_veiculos`.`vendedor` (`num_vend`),
  CONSTRAINT `fk_VENDA_VEICULO1`
    FOREIGN KEY (`veiculo_cod_veiculo`)
    REFERENCES `pf_veiculos`.`veiculo` (`cod_veiculo`),
  CONSTRAINT `fk_VENDA_CLIENTE1`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `pf_veiculos`.`cliente` (`cpf`)
);
