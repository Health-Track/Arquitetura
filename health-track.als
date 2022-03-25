module HealthTrack

one sig HealthTrack {
	usuarios: set Usuario,
}

sig Usuario {
	exames: set Exame
}

abstract sig Exame{
}

sig ExameHemograma, ExamePressao, ExameGlicemia, ExameFezes, ExameUrina, ExameColesterol, Pdf extends Exame {}

----Predicados

-- O usuário pertence ao Health Track
pred usuarioNoHealthTrack[u: Usuario, h: HealthTrack]{
	u in h.usuarios
}

-- O Exame pertence ao Usuário
pred exameNoUsuario[e: Exame, u: Usuario] {
	e in u.exames
}

----Fatos

-- Todo usuário está no Health Track
fact todosOsUsuariosEstaoNoHealthTrack {
	all u: Usuario | one h: HealthTrack | usuarioNoHealthTrack[u,h]
}

-- O exame pertence a apenas um usuario
fact todosOsExamesEstaoNoUsuario {
	all e: Exame | one u: Usuario | exameNoUsuario[e,u]
}

----Asserts

assert todosOsUsuariosEstaoNoHealthTrack {
	all u: Usuario | one h: HealthTrack | usuarioNoHealthTrack[u,h]
}

assert todosOsExamesEstaoNoUsuario {
	all e: Exame | one u: Usuario | exameNoUsuario[e,u]
}

pred show[]{}
run show for 3

check todosOsUsuariosEstaoNoHealthTrack for 10

check todosOsExamesEstaoNoUsuario for 10