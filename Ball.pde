
/** vitesse de déplacement de la balle */
final int BALL_SPEED = 5;
/** couleur de la balle */
final color BALL_COLOR = BLANC; 

/**
 * Une balle.
 */
class Ball {
  int ballWidth = height/42;
  int ballHeight = height/42;
  color ballColor = color(random(255), random(255), random(255));
  /** abscisse du centre de la balle */
  int x;

  /** ordonnée du centre de la balle */
  int y;

  /** mouvement sur l'axe des abscisses */
  int mvt_x;

  /** mouvement sur l'axe des ordonnées */
  int mvt_y;
}

/**
 * Initialisation d'une balle : tous les attributs prennent des valeurs par défaut.
 */
Ball initBall() {
  Ball ball = new Ball();
  ball.x = width/2;
  ball.y = height/2;
  ball.mvt_x = BALL_SPEED;
  ball.mvt_y = BALL_SPEED;
  return ball;
}

/**
 * Affichage de la balle
 */
void showBall(Ball b)
{
  fill(BALL_COLOR);
  ellipse(b.x, b.y, b.ballWidth, b.ballHeight);
}

/**
 * Déplacement de la balle
 */
void moveBall(Ball b)
{
  // Mouvement Horizontal
  b.x += b.mvt_x;
  if (collisionHorizontale(b))
  {
    b.x -= b.mvt_x; // mouvement annulé
    b.mvt_x *= -1; // changement de direction
  }

  // Mouvement Vertical
  b.y += b.mvt_y;
  if (collisionVerticale(b))
  {
    b.y -= b.mvt_y; // mouvement annulé
    b.mvt_y *= -1; // changement de direction
  }
}

/**
 * Retourne vrai si la balle ....
 */
boolean collisionHorizontale(Ball b)
{
  boolean mur_droit = (b.x + b.ballWidth > width);//on a mis une condition dans le booléen
  boolean mur_gauche = (b.x - b.ballWidth < 0);
  boolean boolLeftRacket =  collision(leftRacket.x, leftRacket.y, leftRacket.largeur, leftRacket.hauteur, ball.x, ball.y, b.ballWidth/2, b.ballWidth/2);
  boolean boolRightRacket =  collision(rightRacket.x, rightRacket.y, rightRacket.largeur, rightRacket.hauteur, ball.x, ball.y, b.ballWidth/2, b.ballWidth/2);
  if(mur_droit) {
    leftRacket.score++;
    ball=initBall();
  }
  if(mur_gauche) {
    rightRacket.score++;
    ball=initBall();
  }
  text(leftRacket.score, width/2-50, BORDER_SPACE);                        //Score size
  text(rightRacket.score, width/2+50, BORDER_SPACE);
  return mur_droit ||  mur_gauche || boolLeftRacket || boolRightRacket ; 
}

/**
 * Retourne vrai si la balle ...
 */
boolean collisionVerticale(Ball b)
{
  return (b.y > height) || (b.y < 0);
}
