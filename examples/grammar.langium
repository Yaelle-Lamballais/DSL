grammar UBlock

entry Game: "Red:" redPlayer=STRING "Green:" greenPlayer=STRING (actions+=Action)+;

// une seule action : placer une pièce
// simplification pour commencer : 1 type de tuile (1x1)
// amélioration : sous classes pour types de tuiles
Action: tuile=Tuile 'at' dest=Case;

// simplification pour commencer : le plateau avec un taille définie : 8x8
// amélioration : variabilité de la taille du plateau
terminal Case: /[a-h][1-8]/; 

Tuile returns string: Tuile_HORIZONTAL | Tuile_VERTICAL;
Tuile_HORIZONTAL returns string: 'H' | 'horizontal';
Tuile_VERTICAL returns string: 'V' | 'vertical';

// contraintes : ne pas poser une tuile sur une case déjà pleine

// fin de parties : un joueur est bloqué OU plateau rempli

// properties : la taille du tableau impact la longueur de la partie

hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal STRING: /"[^"]*"/;

hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
