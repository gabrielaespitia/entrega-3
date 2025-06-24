// Avion volando entre las Nubes

// Número de nubes

int numNubes = 13;

// variables 
float[] nubeX;
float[] nubeY;

boolean[] nubeDebajo;
float avionX;
float avionY;

void setup() {
  size(1000, 1000);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  
  // Posiciones iniciales aleatorias para las nubes y tamaños array
  nubeX = new float[numNubes];
  nubeY = new float[numNubes];
  nubeDebajo = new boolean[numNubes];
  
  // valores
  for (int i = 0; i < numNubes; i++) {
    nubeX[i] = random(width);
    nubeY[i] = random(height);
  }

  // Posición inicial del avión (abajo en el centro)
  avionX = width / 2;
  avionY = height;
}

void draw() {
  
 // Cielo, azul que oscurece gradualmente (atardecer)
  float brightness = map(frameCount, 0, 2000, 100, 20);
  brightness = constrain(brightness, 20, 100); // para evitar que cambie el color bajando más.
  background(210, 50, brightness);  // azul en HSB


  // nubes debajo
  // primeras 6 nubes, que el color cambie segun el anochecer.
  fill(300, 5, brightness); // gris/ blanco
  for (int i = 0; i < 6; i++) {
    ellipse(nubeX[i], nubeY[i], 180, 120);
    ellipse(nubeX[i] + 60, nubeY[i] + 15, 150, 105);
    ellipse(nubeX[i] - 60, nubeY[i] + 15, 150, 105); 
  }


// sombra avion

fill(0, 0, 0, 40);  // gris oscuro con transparencia
noStroke();

// cuerpo
ellipse(500 + 15, 500 + 15, 60, 330); 

// alas
triangle(280 + 15, 490 + 15, 490 + 15, 430 + 15, 480 + 15, 480 + 15);
triangle(720 + 15, 490 + 15, 510 + 15, 430 + 15, 520 + 15, 481 + 15);

// cola
triangle(423 + 15, 665 + 15, 495 + 15, 635 + 15, 492 + 15, 660 + 15);
triangle(576 + 15, 665 + 15, 505 + 15, 635 + 15, 508 + 15, 660 + 15);

// luces
rect(385 + 15, 450 + 15, 20, 20);
rect(420 + 15, 440 + 15, 20, 20);
rect(595 + 15, 450 + 15, 20, 20);
rect(560 + 15, 440 + 15, 20, 20);


  // Avion
  float brilloAvion = map(frameCount, 0, 2000, 90, 60); // con map, bajar el brillo de 90 a 60 hasta el frame 200
  brilloAvion = constrain(brilloAvion, 30, 90);
  fill(0, 0, brilloAvion); 

  // cuerpo alas y cola del avion
  noStroke();
  ellipse(500, 500, 60, 330);
  triangle(280, 490, 490, 430, 480, 480);   // izquierda
  triangle(720, 490, 510, 430, 520, 481);   // derecha
  triangle(423, 665, 495, 635, 492, 660);   // cola izquierda
  triangle(576, 665, 505, 635, 508, 660);   // cola derecha

  // motores del avion
  fill(100, 160, 90);
  rect(385, 450, 20, 20);
  rect(420, 440, 20, 20);
  rect(595, 450, 20, 20);
  rect(560, 440, 20, 20);

// sombra avion encima

float brilloProfundidad = map(frameCount, 0, 2000, 85, 35);  
brilloProfundidad = constrain(brilloProfundidad, 35, 95); // oscurecer gradualmente tambien

fill(0, 0, brilloProfundidad); 
ellipse(505, 500, 43, 330);  // mismo centro, mismo largo, mitad de alto


  //  nubes encima, iguales que las de abajo
  fill(0, 0, brightness); // blanco gradual
  for (int i = 6; i < numNubes; i++) {
    ellipse(nubeX[i], nubeY[i], 180, 120);              
    ellipse(nubeX[i] + 60, nubeY[i] + 15, 150, 105);    
    ellipse(nubeX[i] - 60, nubeY[i] + 15, 150, 105);
  }

  

  //  Movimiento de TODAS las nubes hacia abajo lentamente.
  for (int i = 0; i < numNubes; i++) {
    nubeY[i] += 0.5;
    if (nubeY[i] > height + 50) {
      nubeY[i] = -50; // si se salen de la pantalla se reubican arriba
      nubeX[i] = random(width);
    }
  }

  // ️ Movimiento del avión hacia arriba, cuando se sale, aparece abajo.
  avionY -= 0.5;
  if (avionY < -40) {
    avionY = height + 40;
  }
}
