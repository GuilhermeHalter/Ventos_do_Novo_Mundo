# Ventos_do_Novo_Mundo

## Equipe
Guilherme Halter Nunes
João Vitor Bagatoli
Maria Eduarda Huida
Wedley Silva Schmoeller

## Requisitos Mínimos
**Hardware**

- Processador (CPU): Dual Core 2.0 GHz ou superior
- Memória RAM: 4 GB
- Armazenamento: 500 MB de espaço livre em disco
- Placa de vídeo: Integrada, compatível com OpenGL 2.1 ou superior
- Resolução de tela: 1280x720 (HD)

**Software**

- Sistema Operacional: Windows 7 ou superior / Linux Ubuntu 18+ / macOS
- Dependências: <br>
		- Biblioteca SDL (gerenciamento de entrada/saída)<br>
		- JSON (estruturação de dados e eventos)<br>
		- Framework de persistência simples para salvar/carregar progresso
- Engine <br>
		-Desenvolvido na Godot Engine (versão 4.x) com linguagem GDScript

## Instruções de execução

Baixe a versão mais recente do jogo no repositório oficial do GitHub: <br>
https://github.com/GuilhermeHalter/Ventos_do_Novo_Mundo

### 1) Usando GitBash <br>
- Abra o Git Bash no seu computador.<br>
- Escolha uma pasta onde deseja salvar o jogo.<br>
- Execute o comando:<br>
```bash
  git clone https://github.com/GuilhermeHalter/Ventos_do_Novo_Mundo.git
```
	
 - Abra a pasta clonada e localize o arquivo project.godot


### 2) Baixando o ZIP do repositório
- Clique no botão verde Code e depois em Download ZIP.
- Extraia o arquivo ZIP em uma pasta de sua preferência.
- Abra a pasta extraída e localize o arquivo project.godot.

### Importando para o GODOT
- Abra o GODOT
- Na tela inicial do Godot, clique em Importar.
- Localize o projeto
	- Clique em Browse (ou Procurar).
 	- Vá até a pasta onde você baixou/extraiu o jogo.
	- Selecione a pasta `Ventos_do_Novo_Mundo`
- Clique em Abrir.
- Depois, clique em Importar & Editar.
- O Godot vai carregar o projeto e abrir o editor.
- Pressione F5 ou clique no botão Rodar Projeto no topo da tela.
- O jogo será iniciado dentro do Godot.

## Controles
**Movimento do Navio**

- Seta ↑ (Cima) → Mover para frente
- Seta ↓ (Baixo) → Reduzir a velocidade / ré
- Seta ← (Esquerda) → Virar para a esquerda
- Seta → (Direita) → Virar para a direita

**Interação**
Esc → Pausar o jogo / Abrir menu

## Como finalizar o jogo

O objetivo principal do Ventos do Novo Mundo é completar as rotas de navegação do país escolhido, superando os desafios durante a jornada.

O jogo é finalizado quando o jogador segue a bússola até o local de destino de cada rota de navegação atribuída ao seu país (Portugal, Espanha, Inglaterra ou França).
Ao chegar ao último porto da rota, é exibida uma tela de conclusão.
