// Definers
#define             MAX_NOTIFICACOES        (4)

// Forward
forward             RetirarNotificacao(playerid, id_notificacao);
forward             AtualizarBarNotificacao(playerid, id_notificacao);
forward             RepositionarNotificacoes(playerid);
forward             AnimacaoFinalizada(playerid, animator, tipo);

// Includes
#include            <YSI_Coding\y_hooks>
#include            <YSI_Data\y_iterate>
#include            "pawn-easing-functions.inc" // Incluindo a biblioteca de animações

static PlayerText:TD_NT[MAX_PLAYERS][MAX_NOTIFICACOES][6];

static 
    //
    SegundosNotificacao[MAX_PLAYERS][MAX_NOTIFICACOES],
    TimeBarNotificacao[MAX_PLAYERS][MAX_NOTIFICACOES],
    BarNotificacao[MAX_PLAYERS][MAX_NOTIFICACOES],
    //
    Iterator:NotificacaoIter[MAX_PLAYERS]<MAX_NOTIFICACOES>;

// Armazenar títulos e mensagens para recriar notificações quando repositionadas
static 
    NotificacaoTitulo[MAX_PLAYERS][MAX_NOTIFICACOES][32],
    NotificacaoMensagem[MAX_PLAYERS][MAX_NOTIFICACOES][256];

// Novos arrays para armazenar os IDs dos animadores
static
    AnimadorEntrada[MAX_PLAYERS][MAX_NOTIFICACOES][6],
    AnimadorSaida[MAX_PLAYERS][MAX_NOTIFICACOES][6],
    bool:NotificaoEmSaida[MAX_PLAYERS][MAX_NOTIFICACOES];

hook OnPlayerConnect(playerid) {
    // Inicializar todas as textdraws como inválidas
    for(new i = 0; i < MAX_NOTIFICACOES; i++) {
        for(new j = 0; j < sizeof(TD_NT[][]); j++) {
            TD_NT[playerid][i][j] = PlayerText:INVALID_TEXT_DRAW;
        }
    }
    return true;
}

hook OnPlayerDisconnect(playerid, reason) {
    foreach(new i: NotificacaoIter[playerid])
        RetirarNotificacao(playerid, i);
    return true;
}

/*
                    ooooooooo.   ooooo     ooo oooooooooo.  ooooo        ooooo   .oooooo.   
                    `888   `Y88. `888'     `8' `888'   `Y8b `888'        `888'  d8P'  `Y8b  
                    888   .d88'  888       8   888     888  888          888  888          
                    888ooo88P'   888       8   888oooo888'  888          888  888          
                    888          888       8   888    `88b  888          888  888          
                    888          `88.    .8'   888    .88P  888       o  888  `88b    ooo  
                    o888o           `YbodP'    o888bood8P'  o888ooooood8 o888o  `Y8bood8P'  
*/

public AtualizarBarNotificacao(playerid, id_notificacao) {
    if(NotificaoEmSaida[playerid][id_notificacao])
        return 1; // Não atualiza se já estiver em animação de saída
        
    if (SegundosNotificacao[playerid][id_notificacao] >= BarNotificacao[playerid][id_notificacao])
        return IniciarAnimacaoSaida(playerid, id_notificacao);
    
    SegundosNotificacao[playerid][id_notificacao]++;
    
    // Atualizar tamanho da barra
    PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][2], 97.000 - (97.000 / BarNotificacao[playerid][id_notificacao]) * SegundosNotificacao[playerid][id_notificacao], 5.0);
    PlayerTextDrawShow(playerid, TD_NT[playerid][id_notificacao][2]);
    return true;
}

/*
                    .oooooo..o ooooooooooooo   .oooooo.     .oooooo.   oooo    oooo o8o  .oooooo..o 
                    d8P'    `Y8 8'   888   `8  d8P'  `Y8b   d8P'  `Y8b  `888   .8P'  `YP d8P'    `Y8 
                    Y88bo.           888      888      888 888           888  d8'     '  Y88bo.      
                    `"Y8888o.       888      888      888 888           88888[           `"Y8888o.  
                        `"Y88b      888      888      888 888           888`88b.             `"Y88b 
                    oo     .d8P      888      `88b    d88' `88b    ooo   888  `88b.      oo     .d8P 
                    8""88888P'      o888o      `Y8bood8P'   `Y8bood8P'  o888o  o888o     8""88888P'  
*/

stock NT_ADD(playerid, const titulo[], const mensagem[], tempo) { // Criar notificacao
    if(playerid == INVALID_PLAYER_ID || playerid < 0) 
        return true;  
    
    if(!IsPlayerConnected(playerid)) 
        return true;                 
   
    new id_notificacao = Iter_Free(NotificacaoIter[playerid]);
    
    if(id_notificacao == ITER_NONE) {
        // Se não houver slot livre, forçar a remoção da notificação mais antiga
        foreach(new i: NotificacaoIter[playerid]) {
            RetirarNotificacao(playerid, i);
            break; // Remover apenas a primeira (mais antiga)
        }
        
        // Tentar novamente após remover uma
        id_notificacao = Iter_Free(NotificacaoIter[playerid]);
        if(id_notificacao == ITER_NONE)
            return true; // Desistir se ainda não houver espaço
    }

    Iter_Add(NotificacaoIter[playerid], id_notificacao);

    // Salvar o título e mensagem para uso futuro (reposicionamento)
    format(NotificacaoTitulo[playerid][id_notificacao], sizeof(NotificacaoTitulo[][]), "%s", titulo);
    format(NotificacaoMensagem[playerid][id_notificacao], sizeof(NotificacaoMensagem[][]), "%s", mensagem);

    // Resetar valores importantes
    NotificaoEmSaida[playerid][id_notificacao] = false;
    SegundosNotificacao[playerid][id_notificacao] = 0;
    
            // Resetar IDs de animações para evitar conflitos
    for(new i = 0; i < 6; i++) {
        AnimadorEntrada[playerid][id_notificacao][i] = 0;
        AnimadorSaida[playerid][id_notificacao][i] = 0;
    }

    // Criar o layout da notificacao com animação
    CriarNotificacao(playerid, id_notificacao, titulo, mensagem);
    
    // Iniciar animação de entrada
    IniciarAnimacaoEntrada(playerid, id_notificacao);
    
    // Criar Progress Bar
    BarNotificacao[playerid][id_notificacao] = (tempo / 100);
    TimeBarNotificacao[playerid][id_notificacao] = SetTimerEx("AtualizarBarNotificacao", BarNotificacao[playerid][id_notificacao], true, "ii", playerid, id_notificacao);
    return true;
}

stock IniciarAnimacaoEntrada(playerid, id_notificacao) {
    // Posições originais das TextDraws - importante: calcular novamente para garantir consistência
    new Float:posX = 540.000;
    new Float:posY = 147.000 + Calculos_Colunas(id_notificacao);
    
    // Definir os offsets para cada elemento
    new Float:offsetX[6], Float:offsetY[6];
    
    // Definir os offsets corretos para cada elemento com base na posição base
    offsetX[0] = 0.0;         offsetY[0] = 0.0;          // Fundo principal
    offsetX[1] = 0.0;         offsetY[1] = 36.6;         // Fundo da barra
    offsetX[2] = 0.0;         offsetY[2] = 36.6;         // Barra de progresso
    offsetX[3] = 0.0;         offsetY[3] = -14.8;        // Cabeçalho
    offsetX[4] = 48.799;      offsetY[4] = -13.2;        // Texto do título
    offsetX[5] = 49.400;      offsetY[5] = 2.7;          // Texto da mensagem
    
    // Animar cada elemento da TextDraw
    for (new i = 0; i < sizeof(TD_NT[][]); i++) {
        // Definir posição correta fora da tela
        PlayerTextDrawSetPos(playerid, TD_NT[playerid][id_notificacao][i], posX + offsetX[i] + 120.0, posY + offsetY[i]);
        PlayerTextDrawShow(playerid, TD_NT[playerid][id_notificacao][i]);
        
        // Animar para a posição correta
        AnimadorEntrada[playerid][id_notificacao][i] = PlayerText_MoveTo(playerid, TD_NT[playerid][id_notificacao][i], posX + offsetX[i], posY + offsetY[i], 800, EASE_OUT_BACK);
    }
    
    // Fade in de cor
    PlayerText_InterpolateColor(playerid, TD_NT[playerid][id_notificacao][4], 0xFFFFFFFF, 500, EASE_OUT_SINE);
    PlayerText_InterpolateColor(playerid, TD_NT[playerid][id_notificacao][5], 0xFFFFFFFF, 500, EASE_OUT_SINE);
    
    return 1;
}


stock IniciarAnimacaoSaida(playerid, id_notificacao) {
    // Evitar que a animação de saída seja iniciada mais de uma vez
    if(NotificaoEmSaida[playerid][id_notificacao])
        return 0;
        
    NotificaoEmSaida[playerid][id_notificacao] = true;
    
    // Pausar a atualização da barra de progresso
    KillTimer(TimeBarNotificacao[playerid][id_notificacao]);
    
    // Posições originais das TextDraws
    new Float:posX, Float:posY;
    
    // Animar cada elemento da TextDraw para a direita (saindo da tela)
    for (new i = 0; i < sizeof(TD_NT[][]); i++) {
        PlayerTextDrawGetPos(playerid, TD_NT[playerid][id_notificacao][i], posX, posY);
        AnimadorSaida[playerid][id_notificacao][i] = PlayerText_MoveTo(playerid, TD_NT[playerid][id_notificacao][i], posX + 120.0, posY, 500, EASE_IN_BACK);
    }
    
    // Fade out de cor (mais visível para mais transparente)
    PlayerText_InterpolateColor(playerid, TD_NT[playerid][id_notificacao][4], 0x00FFFFFF, 300, EASE_IN_SINE);
    PlayerText_InterpolateColor(playerid, TD_NT[playerid][id_notificacao][5], 0x00FFFFFF, 300, EASE_IN_SINE);
    
    // Definir um timer para remover completamente a notificação após a animação
    SetTimerEx("RetirarNotificacao", 600, false, "ii", playerid, id_notificacao);
    
    return 1;
}

public AnimacaoFinalizada(playerid, animator, tipo) {
    // Esta função é chamada quando uma animação é concluída
    // Pode ser usada para controlar o fluxo de animações sequenciais
    return 1;
}

public RetirarNotificacao(playerid, id_notificacao) {
    // Parar qualquer timer ainda ativo
    if(TimeBarNotificacao[playerid][id_notificacao])
        KillTimer(TimeBarNotificacao[playerid][id_notificacao]);
        
    SegundosNotificacao[playerid][id_notificacao] = 0;
    BarNotificacao[playerid][id_notificacao] = 0;
    NotificaoEmSaida[playerid][id_notificacao] = false;

    // Resetar os animadores para evitar conflitos
    for(new i = 0; i < 6; i++) {
        AnimadorEntrada[playerid][id_notificacao][i] = 0;
        AnimadorSaida[playerid][id_notificacao][i] = 0;
    }

    // Destruir a notificacao da tela
    OcultarNotificacao(playerid, id_notificacao);

    // Remover do iterator
    Iter_Remove(NotificacaoIter[playerid], id_notificacao);
    
    // Limpar textos
    NotificacaoTitulo[playerid][id_notificacao][0] = 0;
    NotificacaoMensagem[playerid][id_notificacao][0] = 0;
    
    // Chamar o repositionamento após remover a notificação
    SetTimerEx("RepositionarNotificacoes", 50, false, "i", playerid);
    
    return true;
}

/*
                       .oooooo.                      o8o                     
                      d8P'  `Y8b                     `"'                     
                     888      888 oooo    ooo      oooo  oooo d8b  .oooo.   
                     888      888  `88.  .8'       `888  `888""8P `P  )88b  
                     888      888   `88..8'         888   888      .oP"888  
                     `88b    d88'    `888'          888   888     d8(  888  
                      `Y8bood8P'      `8'          o888o d888b    `Y888""8o 
*/

// Nova função para reorganizar as notificações
public RepositionarNotificacoes(playerid) {
    // Array para armazenar temporariamente os dados de notificações ativas
    new 
        activeNotifs[MAX_NOTIFICACOES],
        activeNotifsCount = 0,
        activeSegs[MAX_NOTIFICACOES],
        activeBar[MAX_NOTIFICACOES],
        activeTimes[MAX_NOTIFICACOES],
        activeTitulos[MAX_NOTIFICACOES][32],
        activeMensagens[MAX_NOTIFICACOES][256];
    
    // Coletar todas as notificações ativas
    foreach(new i: NotificacaoIter[playerid]) {
        activeNotifs[activeNotifsCount] = i;
        activeSegs[activeNotifsCount] = SegundosNotificacao[playerid][i];
        activeBar[activeNotifsCount] = BarNotificacao[playerid][i];
        activeTimes[activeNotifsCount] = TimeBarNotificacao[playerid][i];
        
        format(activeTitulos[activeNotifsCount], sizeof(activeTitulos[]), "%s", NotificacaoTitulo[playerid][i]);
        format(activeMensagens[activeNotifsCount], sizeof(activeMensagens[]), "%s", NotificacaoMensagem[playerid][i]);
        
        // Remover a notificação existente sem chamar o repositionamento novamente
        KillTimer(TimeBarNotificacao[playerid][i]);
        
        // Resetar IDs de animação
        for(new j = 0; j < 6; j++) {
            AnimadorEntrada[playerid][i][j] = 0;
            AnimadorSaida[playerid][i][j] = 0;
        }
        
        OcultarNotificacao(playerid, i);
        Iter_Remove(NotificacaoIter[playerid], i);
        
        activeNotifsCount++;
    }
    
    // Esperar um pequeno delay para garantir que todas as animações foram devidamente paradas
    // Este é um trick importante para evitar conflitos entre animações
    for(new i = 0; i < MAX_NOTIFICACOES; i++) {
        for(new j = 0; j < 6; j++) {
            AnimadorEntrada[playerid][i][j] = 0;
            AnimadorSaida[playerid][i][j] = 0;
        }
        NotificaoEmSaida[playerid][i] = false;
    }
    
    // Aguardar um pequeno delay para garantir que as textdraws antigas foram devidamente removidas
    SetTimerEx("FinalizarRepositionamento", 100, false, "iiii", playerid, activeNotifsCount, 
        _:activeSegs[0], _:activeBar[0]); // Passamos alguns dados para evitar problemas com limite de parâmetros
    
    // Armazenar os dados para uso no timer
    for(new i = 0; i < activeNotifsCount; i++) {
        new varname[40];
        format(varname, sizeof(varname), "Repo_Titulo_%d_%d", playerid, i);
        SetPVarString(playerid, varname, activeTitulos[i]);
        
        format(varname, sizeof(varname), "Repo_Mensagem_%d_%d", playerid, i);
        SetPVarString(playerid, varname, activeMensagens[i]);
        
        format(varname, sizeof(varname), "Repo_Segs_%d_%d", playerid, i);
        SetPVarInt(playerid, varname, activeSegs[i]);
        
        format(varname, sizeof(varname), "Repo_Bar_%d_%d", playerid, i);
        SetPVarInt(playerid, varname, activeBar[i]);
    }
    
    return true;
}

forward FinalizarRepositionamento(playerid, activeCount, dummy1, dummy2);
public FinalizarRepositionamento(playerid, activeCount, dummy1, dummy2) {
    // Recriar todas as notificações em ordem
    for(new i = 0; i < activeCount; i++) {
        // Usar o índice correto para posicionar as notificações em ordem
        new id_notificacao = i;
        
        // Recuperar dados salvos
        new titulo[32], mensagem[256];
        new varname[40];
        
        format(varname, sizeof(varname), "Repo_Titulo_%d_%d", playerid, i);
        GetPVarString(playerid, varname, titulo, sizeof(titulo));
        DeletePVar(playerid, varname);
        
        format(varname, sizeof(varname), "Repo_Mensagem_%d_%d", playerid, i);
        GetPVarString(playerid, varname, mensagem, sizeof(mensagem));
        DeletePVar(playerid, varname);
        
        format(varname, sizeof(varname), "Repo_Segs_%d_%d", playerid, i);
        new segs = GetPVarInt(playerid, varname);
        DeletePVar(playerid, varname);
        
        format(varname, sizeof(varname), "Repo_Bar_%d_%d", playerid, i);
        new bar = GetPVarInt(playerid, varname);
        DeletePVar(playerid, varname);
        
        // Adicionar ao iterator
        Iter_Add(NotificacaoIter[playerid], id_notificacao);
        
        // Restaurar os dados da notificação
        format(NotificacaoTitulo[playerid][id_notificacao], sizeof(NotificacaoTitulo[][]), "%s", titulo);
        format(NotificacaoMensagem[playerid][id_notificacao], sizeof(NotificacaoMensagem[][]), "%s", mensagem);
        SegundosNotificacao[playerid][id_notificacao] = segs;
        BarNotificacao[playerid][id_notificacao] = bar;
        NotificaoEmSaida[playerid][id_notificacao] = false;
        
        // Criar a notificação visualmente usando o novo índice
        CriarNotificacao(playerid, id_notificacao, titulo, mensagem);
        
        // Restaurar o progresso da barra
        if(BarNotificacao[playerid][id_notificacao] > 0) {
            PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][2], 
                97.000 - (97.000 / BarNotificacao[playerid][id_notificacao]) * SegundosNotificacao[playerid][id_notificacao], 5.0);
            PlayerTextDrawShow(playerid, TD_NT[playerid][id_notificacao][2]);
            
            // Recriar o timer
            TimeBarNotificacao[playerid][id_notificacao] = SetTimerEx("AtualizarBarNotificacao", 
                BarNotificacao[playerid][id_notificacao], true, "ii", playerid, id_notificacao);
        }
        
        // Aplicar efeito de deslize suave para a nova posição após um pequeno delay
        // Este delay incremental evita que todas as notificações animem ao mesmo tempo
        SetTimerEx("AnimarRepositionada", 50 * (i + 1), false, "ii", playerid, id_notificacao);
    }
    
    return true;
}

forward AnimarRepositionada(playerid, id_notificacao);
public AnimarRepositionada(playerid, id_notificacao) {
    if(!Iter_Contains(NotificacaoIter[playerid], id_notificacao))
        return 0;
        
    IniciarAnimacaoEntrada(playerid, id_notificacao);
    return 1;
}

/*
                       ooooo              .o.       oooooo   oooo   .oooooo.   ooooo     ooo ooooooooooooo 
                       `888'             .888.       `888.   .8'   d8P'  `Y8b  `888'     `8' 8'   888   `8 
                        888             .8"888.       `888. .8'   888      888  888       8       888      
                        888            .8' `888.       `888.8'    888      888  888       8       888      
                        888           .88ooo8888.       `888'     888      888  888       8       888      
                        888       o  .8'     `888.       888      `88b    d88'  `88.    .8'       888      
                       o888ooooood8 o88o     o8888o     o888o      `Y8bood8P'     `YbodP'        o888o     
*/

static stock Calculos_Colunas(calculos)
    return ((calculos > 0 ? (61) : (0)) * calculos);

static stock CriarNotificacao(playerid, id_notificacao, const titulo[], const mensagem[]) 
{
    // Posição inicial das notificações - centralizada e baseada no id
    new Float:posX = 540.000;
    new Float:posY = 147.000 + Calculos_Colunas(id_notificacao);
    
    // Aprimoramento visual: cores mais atraentes
    new bgColor = 0x1A2C38FF; // Um azul escuro mais agradável
    new headerColor = 0x2980B9FF; // Azul mais vibrante para o cabeçalho
    new barBgColor = 0x34495EFF; // Cor de fundo da barra de progresso
    new barColor = 0x3498DBFF; // Cor da barra de progresso
    
    // Garantir que qualquer TextDraw existente seja destruída antes de criar uma nova
    if(TD_NT[playerid][id_notificacao][0] != PlayerText:INVALID_TEXT_DRAW) {
        OcultarNotificacao(playerid, id_notificacao);
    }
    
    TD_NT[playerid][id_notificacao][0] = CreatePlayerTextDraw(playerid, posX, posY, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][0], 97.000, 35.000);
    PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][0], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][0], bgColor);
    PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][0], 0);
    PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][0], 0);
    PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][0], 255);
    PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][0], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][0], true);

    TD_NT[playerid][id_notificacao][1] = CreatePlayerTextDraw(playerid, posX, posY + 36.6, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][1], 97.000, 5.000);
    PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][1], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][1], barBgColor);
    PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][1], 0);
    PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][1], 0);
    PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][1], 255);
    PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][1], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][1], true);

    TD_NT[playerid][id_notificacao][2] = CreatePlayerTextDraw(playerid, posX, posY + 36.6, "LD_SPAC:white");//bar
    PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][2], 97.000, 5.000);
    PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][2], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][2], barColor);
    PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][2], 0);
    PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][2], 0);
    PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][2], 255);
    PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][2], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][2], true);

    TD_NT[playerid][id_notificacao][3] = CreatePlayerTextDraw(playerid, posX, posY - 14.8, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][3], 97.000, 12.000);
    PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][3], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][3], headerColor);
    PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][3], 0);
    PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][3], 0);
    PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][3], 255);
    PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][3], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][3], true);

    TD_NT[playerid][id_notificacao][4] = CreatePlayerTextDraw(playerid, posX + 48.799, posY - 13.2, titulo);
    PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][4], 0.200, 1.000);
    PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][4], TEXT_DRAW_ALIGN_CENTER);
    PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][4], 0xFFFFFFFF);
    PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][4], 0);
    PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][4], 1);
    PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][4], 255);
    PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][4], TEXT_DRAW_FONT_2);
    PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][4], true);

    TD_NT[playerid][id_notificacao][5] = CreatePlayerTextDraw(playerid, posX + 49.400, posY + 2.7, mensagem);
    PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][5], 0.160, 0.950);
    PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][5], TEXT_DRAW_ALIGN_CENTER);
    PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][5], 0xFFFFFFFF);
    PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][5], 0);
    PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][5], 0);
    PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][5], 255);
    PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][5], TEXT_DRAW_FONT_1);
    PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][5], true);

    // Não mostramos imediatamente as TextDraws, pois vamos animar sua entrada
}

static stock OcultarNotificacao(playerid, id_notificacao) {
    for(new i = 0; i < sizeof TD_NT[][]; i++) {
        PlayerTextDrawDestroy(playerid, TD_NT[playerid][id_notificacao][i]);
        TD_NT[playerid][id_notificacao][i] = PlayerText:INVALID_TEXT_DRAW;
    }
}

// Hook para capturar quando a animação termina
hook Animator_OnFinish(playerid, animator, type) {
    // Podemos usar este callback para encadear animações se necessário
    return 1;
}

CMD:testen(playerid, const params[]) {
    static 
        titulo[32],
        mensagem[255],
        tempo;

    if (sscanf(params, "s[32]s[255]i", titulo, mensagem, tempo))
        return SendClientMessage(playerid, -1, "Digite /testen [titulo] [mensagem] [tempo]");

    NT_ADD(playerid, titulo, mensagem, tempo);
    return true;
}

// Comando extra para testar múltiplas notificações
CMD:testens(playerid, const params[]) {
    static 
        quantidade,
        tempo;

    if (sscanf(params, "ii", quantidade, tempo))
        return SendClientMessage(playerid, -1, "Digite /testens [quantidade] [tempo]");
    
    if(quantidade > MAX_NOTIFICACOES)
        quantidade = MAX_NOTIFICACOES;
    
    for(new i = 0; i < quantidade; i++) {
        new titulo[32], mensagem[128];
        format(titulo, sizeof(titulo), "Notif %d", i+1);
        format(mensagem, sizeof(mensagem), "Esta é a notificação de teste número %d", i+1);
        NT_ADD(playerid, titulo, mensagem, tempo);
        // Pequeno delay entre as notificações para um efeito cascata
        SetTimerEx("DelayedNotification", 200 * i, false, "i", playerid);
    }
    
    return true;
}

forward DelayedNotification(playerid);
public DelayedNotification(playerid) {
    // Este é apenas um timer vazio para criar um delay entre as notificações
    return 1;
}
