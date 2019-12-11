/** vitesse de déplacement vertical d'une raquette */
final int RACKET_SPEED  = 7;
/** distance du bord de la fenêtre pour la raquette */
final int BORDER_SPACE  = 20;


/**
 * Une raquette.
 */
class Racket {
  float x;
  float y;
  float largeur;
  float hauteur;
  color col; 
  int score;
}

Racket initRacket(float lx, float ly, color col) {  //fonction de la classe rectangle créée juste avant
  Racket racket = new Racket();
  racket.x = lx;
  racket.y = ly;
  racket.largeur = width/80;
  racket.hauteur = height/5;
  racket.col = col;
  racket.score = 0;
  return racket;
}

void dessiner(Racket r) {
  fill(r.col);
  rect(r.x, r.y, r.largeur, r.hauteur);
}

void moveRacketUp(Racket r){
  if(r.y<=0){
    r.y = 0;
  }else{
  r.y = r.y-RACKET_SPEED;
  }
}
void moveRacketDown(Racket r){
  if(r.y+r.hauteur >= height){
    r.y = height-r.hauteur;
  }
  else{
    r.y = r.y+RACKET_SPEED;
  }
}
boolean collisionHorizontale(Racket r)
{
  return (r.x > width) || (r.x < 0);  
}
