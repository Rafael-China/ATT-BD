-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Jun-2022 às 18:58
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `att`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_de_venda`
--

CREATE TABLE `itens_de_venda` (
  `cod_produto` int(11) NOT NULL,
  `cod_venda` int(11) NOT NULL,
  `qtd_item` int(11) NOT NULL,
  `valor_item` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens_de_venda`
--

INSERT INTO `itens_de_venda` (`cod_produto`, `cod_venda`, `qtd_item`, `valor_item`) VALUES
(10, 1001, 5, 210),
(10, 1002, 1, 210),
(10, 1003, 2, 210),
(10, 1004, 1, 210),
(10, 1007, 1, 210),
(11, 1001, 1, 990.5),
(11, 1005, 2, 1279),
(12, 1002, 1, 525.99),
(12, 1006, 1, 525.99),
(12, 1007, 2, 525.99),
(13, 1004, 1, 735.9),
(13, 1006, 1, 735.9),
(14, 1006, 1, 439.9),
(14, 1008, 1, 439.9),
(15, 1009, 2, 329.9),
(16, 1009, 1, 1049.9),
(17, 1010, 1, 279.9),
(18, 1010, 1, 1999.9),
(19, 1011, 1, 2149),
(20, 1012, 1, 1169.9),
(21, 1012, 1, 299.9);

--
-- Acionadores `itens_de_venda`
--
DELIMITER $$
CREATE TRIGGER `itens_de_venda_AFTER_DELETE` AFTER DELETE ON `itens_de_venda` FOR EACH ROW BEGIN

update produto set qtd = qtd + old.qtd_item where cod_produto = old.cod_produto;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `itens_de_venda_AFTER_INSERT` AFTER INSERT ON `itens_de_venda` FOR EACH ROW BEGIN

update produto set qtd = qtd - new.qtd_item where cod_produto = new.cod_produto;

update venda set valor_venda = valor_venda + (new.qtd_item * new.valor_item) where cod_venda = new.cod_venda;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `itens_de_venda_AFTER_UPDATE` AFTER UPDATE ON `itens_de_venda` FOR EACH ROW BEGIN

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `mostrar_func_embaralhados`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `mostrar_func_embaralhados` (
`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `qtd` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`cod_produto`, `nome_produto`, `qtd`, `valor`) VALUES
(10, 'Mouse Gamer Corsair Harpoon PRO', 15, 231),
(11, 'Microsoft Office Pro 2022', 21, 1406.9),
(12, 'HD Externo Seagate Expansion 2TB', 18, 578.589),
(13, 'Teclado Mecânico Gamer HyperX', 23, 809.49),
(14, 'Mouse sem fio Logitech MX Master 3', 3, 483.89),
(15, 'SSD Kingston A400 480GB', 292, 362.89),
(16, 'Cadeira Gamer Alpha Gamer Vega', 42, 1154.89),
(17, 'Headset Gamer HyperX Cloud Stinger', 328, 307.89),
(18, 'Monitor Gamer Ozone 27 LED 144 Hz', 42, 2199.89),
(19, 'Console Microsoft Xbox Series S, 512GB, Branco', 40, 2363.9),
(20, 'Processador AMD Ryzen 5 3600 Cache 32MB 3.6GHz', 168, 1286.89),
(21, 'Teclado Mecânico Gamer Husky Gaming Blizzard RGB', 178, 329.89),
(22, 'Memória XPG Spectrix D45G, RGB, 8GB, 3600MHz, DDR4', 210, 261.706),
(23, 'Mouse Gamer Corsair Harpoon Wireless, RGB, 6 Botões', 76, 307.89),
(24, 'Placa de Vídeo Zotac NVIDIA GeForce RTX 3060 Ti Twin Edge LHR', 208, 3959.89);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `total_vendas`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `total_vendas` (
`Total_de_venda` double
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `cod_venda` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `valor_venda` float NOT NULL,
  `id_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`cod_venda`, `data_venda`, `valor_venda`, `id_vendedor`) VALUES
(1001, '2022-06-22', 2040.5, 101),
(1002, '2022-06-30', 735.99, 102),
(1003, '2022-07-02', 420, 103),
(1004, '2022-06-28', 0, 101),
(1005, '2022-06-21', 0, 104),
(1006, '2022-06-22', 0, 105),
(1007, '2022-06-23', 0, 106),
(1008, '2022-06-24', 0, 107),
(1009, '2022-07-02', 0, 107),
(1010, '2022-07-03', 0, 108),
(1011, '2022-07-03', 0, 109),
(1012, '2022-07-04', 0, 110);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `loja` varchar(50) NOT NULL,
  `nascimento` date NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `nome`, `sexo`, `loja`, `nascimento`, `email`) VALUES
(101, 'Aldebaran Silva', 'M', 'loja Centro', '1980-02-25', 'aldebaran@gghardware.com.br'),
(102, 'Carina Dias', 'F', 'loja Santo Antônio', '1994-03-12', 'carina@gghardware.com.br'),
(103, 'Nicolle Cherry', 'F', 'loja Floresta', '1985-04-18', 'nicolle@gghardware.com.br'),
(104, 'Rafael de Carvalho', 'M', 'loja Tupinambás', '1998-05-05', 'alberto@gghardware.com.br'),
(105, 'Robson Ferreira', 'M', 'loja Olegário Marciel', '1983-06-13', 'eliane@gghardware.com.br'),
(106, 'Mateus Boas', 'M', 'loja Center Guajajáras', '1979-07-02', 'robertocarlos@gghardware.com.br'),
(107, 'Alice Xavier', 'F', 'loja Pernambucanas', '2000-08-31', 'silvaamanda@gghardware.com.br'),
(108, 'MIlton Barbosa', 'M', 'loja do Ouvidor', '1989-09-17', 'guiferreira@gghardware.com.br'),
(109, 'Mariana Pereira', 'F', 'loja da Tia Mimi', '1991-10-20', 'fanianagomes@gghardware.com.br'),
(110, 'Gustavo Felix', 'M', 'Loja Centro', '2004-04-27', 'gustavofelix@gghardware.com.br'),
(111, 'Moe Szyslak', 'M', 'Loja Santo Antônio', '1973-12-29', 'moebar_duff@gghardware.com.br');

-- --------------------------------------------------------

--
-- Estrutura para vista `mostrar_func_embaralhados`
--
DROP TABLE IF EXISTS `mostrar_func_embaralhados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mostrar_func_embaralhados`  AS SELECT `vendedor`.`nome` AS `nome` FROM `vendedor` ORDER BY rand() ASC ;

-- --------------------------------------------------------

--
-- Estrutura para vista `total_vendas`
--
DROP TABLE IF EXISTS `total_vendas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_vendas`  AS SELECT sum(`venda`.`valor_venda`) AS `Total_de_venda` FROM `venda` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `itens_de_venda`
--
ALTER TABLE `itens_de_venda`
  ADD PRIMARY KEY (`cod_produto`,`cod_venda`),
  ADD KEY `fk_produto_has_venda_venda1_idx` (`cod_venda`),
  ADD KEY `fk_produto_has_venda_produto1_idx` (`cod_produto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_produto`),
  ADD UNIQUE KEY `idproduto_UNIQUE` (`cod_produto`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`cod_venda`),
  ADD UNIQUE KEY `cod_venda_UNIQUE` (`cod_venda`),
  ADD KEY `fk_venda_vendedor1_idx` (`id_vendedor`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`),
  ADD UNIQUE KEY `id_vendedor_UNIQUE` (`id_vendedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `cod_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `cod_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itens_de_venda`
--
ALTER TABLE `itens_de_venda`
  ADD CONSTRAINT `fk_produto_has_venda_produto1` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto_has_venda_venda1` FOREIGN KEY (`cod_venda`) REFERENCES `venda` (`cod_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_vendedor1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
