####################################################################################################

new PlayerText: TD_NT[MAX_PLAYERS][21];

TD_NT[playerid][id_notificacao][0] = CreatePlayerTextDraw(playerid, 515.000, 116.000, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][0], 111.000, 58.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][0], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][0], 573190143);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][0], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][0], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][0], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][0], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][0], true);

TD_NT[playerid][id_notificacao][1] = CreatePlayerTextDraw(playerid, 510.000, 113.500, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][1], 13.000, 13.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][1], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][1], 573190143);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][1], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][1], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][1], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][1], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][1], true);

TD_NT[playerid][id_notificacao][2] = CreatePlayerTextDraw(playerid, 510.000, 163.500, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][2], 13.000, 13.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][2], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][2], 573190143);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][2], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][2], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][2], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][2], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][2], true);

TD_NT[playerid][id_notificacao][3] = CreatePlayerTextDraw(playerid, 620.000, 113.500, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][3], 13.000, 13.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][3], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][3], 573190143);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][3], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][3], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][3], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][3], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][3], true);

TD_NT[playerid][id_notificacao][4] = CreatePlayerTextDraw(playerid, 620.000, 163.000, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][4], 13.000, 13.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][4], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][4], 573190143);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][4], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][4], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][4], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][4], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][4], true);

TD_NT[playerid][id_notificacao][5] = CreatePlayerTextDraw(playerid, 512.000, 120.000, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][5], 119.000, 50.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][5], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][5], 573190143);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][5], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][5], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][5], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][5], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][5], true);

TD_NT[playerid][id_notificacao][6] = CreatePlayerTextDraw(playerid, 519.000, 123.000, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][6], 15.000, 11.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][6], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][6], 42661375);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][6], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][6], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][6], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][6], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][6], true);

TD_NT[playerid][id_notificacao][7] = CreatePlayerTextDraw(playerid, 526.500, 123.500, "QRR");//titulo
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][7], 0.160, 0.999);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][7], TEXT_DRAW_ALIGN_CENTER);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][7], -1);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][7], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][7], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][7], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][7], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][7], true);

TD_NT[playerid][id_notificacao][8] = CreatePlayerTextDraw(playerid, 539.500, 123.500, "Solicitacao de apoio");//descricao
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][8], 0.160, 0.999);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][8], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][8], -992945153);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][8], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][8], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][8], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][8], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][8], true);

TD_NT[playerid][id_notificacao][9] = CreatePlayerTextDraw(playerid, 530.500, 139.500, "quiksilveR (0)");//nick do jogador
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][9], 0.129, 0.799);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][9], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][9], -1448498689);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][9], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][9], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][9], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][9], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][9], true);

TD_NT[playerid][id_notificacao][10] = CreatePlayerTextDraw(playerid, 530.500, 151.500, "Downtown Los Santos");//localizacao
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][10], 0.129, 0.799);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][10], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][10], -1448498689);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][10], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][10], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][10], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][10], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][10], true);

TD_NT[playerid][id_notificacao][11] = CreatePlayerTextDraw(playerid, 608.000, 121.000, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][11], 18.000, 18.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][11], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][11], 42661375);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][11], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][11], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][11], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][11], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][11], true);

TD_NT[playerid][id_notificacao][12] = CreatePlayerTextDraw(playerid, 519.000, 143.000, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][12], 8.000, 5.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][12], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][12], 42661375);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][12], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][12], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][12], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][12], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][12], true);

TD_NT[playerid][id_notificacao][13] = CreatePlayerTextDraw(playerid, 520.500, 139.000, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][13], 5.000, 5.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][13], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][13], 42661375);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][13], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][13], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][13], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][13], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][13], true);

TD_NT[playerid][id_notificacao][14] = CreatePlayerTextDraw(playerid, 614.500, 125.000, "O");
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][14], 0.190, 0.799);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][14], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][14], -1);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][14], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][14], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][14], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][14], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][14], true);

TD_NT[playerid][id_notificacao][15] = CreatePlayerTextDraw(playerid, 614.500, 126.000, "v");
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][15], 0.260, 0.999);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][15], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][15], -1);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][15], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][15], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][15], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][15], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][15], true);

TD_NT[playerid][id_notificacao][16] = CreatePlayerTextDraw(playerid, 520.500, 151.000, "v");
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][16], 0.260, 0.999);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][16], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][16], 42661375);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][16], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][16], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][16], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][16], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][16], true);

TD_NT[playerid][id_notificacao][17] = CreatePlayerTextDraw(playerid, 520.500, 150.000, "O");
PlayerTextDrawLetterSize(playerid, TD_NT[playerid][id_notificacao][17], 0.190, 0.799);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][17], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][17], 42661375);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][17], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][17], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][17], 150);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][17], TEXT_DRAW_FONT_1);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][17], true);

TD_NT[playerid][id_notificacao][18] = CreatePlayerTextDraw(playerid, 513.000, 177.000, "PARTICLE:lamp_shad_64");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][18], 113.000, -62.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][18], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][18], 42661169);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][18], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][18], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][18], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][18], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][18], true);

TD_NT[playerid][id_notificacao][19] = CreatePlayerTextDraw(playerid, 518.000, 165.000, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][19], 107.000, 3.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][19], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][19], 1768516095);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][19], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][19], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][19], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][19], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][19], true);

TD_NT[playerid][id_notificacao][20] = CreatePlayerTextDraw(playerid, 518.000, 165.000, "LD_SPAC:white");//barra
PlayerTextDrawTextSize(playerid, TD_NT[playerid][id_notificacao][20], 96.000, 3.000);
PlayerTextDrawAlignment(playerid, TD_NT[playerid][id_notificacao][20], TEXT_DRAW_ALIGN_LEFT);
PlayerTextDrawColour(playerid, TD_NT[playerid][id_notificacao][20], 42661375);
PlayerTextDrawSetShadow(playerid, TD_NT[playerid][id_notificacao][20], 0);
PlayerTextDrawSetOutline(playerid, TD_NT[playerid][id_notificacao][20], 0);
PlayerTextDrawBackgroundColour(playerid, TD_NT[playerid][id_notificacao][20], 255);
PlayerTextDrawFont(playerid, TD_NT[playerid][id_notificacao][20], TEXT_DRAW_FONT_SPRITE_DRAW);
PlayerTextDrawSetProportional(playerid, TD_NT[playerid][id_notificacao][20], true);

