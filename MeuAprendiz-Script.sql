create database MeuAprendiz

create table provedores (
	id_provedor serial primary key,
	nome varchar(255) not null,
	cnpj char(14) not null unique
);

create table endereco(
	id_endereco serial primary key,
	nome varchar(255) not null,
	cep char(8) not null unique,
	cidade varchar(255) not null,
	uf char(2) not null
);

create table vagas (
	id_vagas serial primary key,
	nome varchar(255) not null,
	descricao text not null,
	jornada varchar(255) not null,
	salario numeric(5, 2) not null,
	id_provedor int references provedores(id_provedor),
	id_endereco int references endereco(id_endereco)
);

create table curso (
	id_curso serial primary key,
	nome varchar(255) not null,
	duracao_horas float not null,
	avaliacao float not null,
	descricao text not null,
	preco numeric(5, 2) not null,
	nivel varchar(255) not null,
	id_endereco int references endereco(id_endereco)
);

create table usuario (
	id_usuario serial primary key,
	nome varchar(255) not null,
	email varchar(255) not null,
	cpf char(11) not null unique,
	telefone char(13) not null unique,
	escolaridade text,
	interesses text,
	experiencias text,
	id_endereco int,
	foreign key (id_endereco) references endereco(id_endereco)
);

