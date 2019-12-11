// Constantes - Couleurs //<>//

final color NOIR = color(0);
final color BLANC = color(255);
final color ROUGE = color(255, 0, 0);
final color VERT = color(0, 255, 0);
final color BLEU = color(0, 0, 255);

// Etat du jeu

/** Gestion de la pause */
boolean enPause = false;          //le jeu est mode play de base 

/** La balle */
Ball ball;
Racket leftRacket;
Racket rightRacket;               //déclaration des entités

/**
 * Fonction d'initialisation Processing.
 */
void setup()
{
  size(1280, 800);
  start();
  // on initialise nos objets
  ball = initBall();
  leftRacket = initRacket(BORDER_SPACE, (height/2)-(height/5)/2, BLEU);                       //position de la raquette droite
  rightRacket = initRacket(width-((width/200)+BORDER_SPACE), (height/2)-(height/5)/2, VERT);  //position de la raquette gauche
}

/**
 * Fonction de rafraichissement Processing.
 */
void draw()
{
  background(NOIR);
  showBall(ball); 
  moveBall(ball);
  dessiner(leftRacket);
  dessiner(rightRacket);
  
  if(keyPressed){
                                            //player1 controls : z>up & s>down
    if(key == 'z' || key == 'Z'){
      moveRacketUp(leftRacket);
    }
    else if(key == 's' || key == 'S'){
      moveRacketDown(leftRacket);
    }
                                            //player2 controls : p/8>up & m/5>down
    else if(key == 'p' || key == 'P' || key == '8'){
      moveRacketUp(rightRacket);
    }
    else if(key == 'm' || key == 'M' || key == '5'){
      moveRacketDown(rightRacket);
    }
  }
}

void keyPressed(){                        //pressing space allows to enter and exit pause mode
  if(key == ' '){
    enPause = !enPause;
  }
  if(enPause == true){
    noLoop();
  }
  else{
    loop();
  }
}
void start(){
  noLoop();                               //Pauses the game at the start so we can play it when we're ready
  line(width/2, 0, width/2, height);      //Draws a vertical line in the middle of the screen
}
