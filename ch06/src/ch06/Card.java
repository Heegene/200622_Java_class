package ch06;

public class Card {
   int      num;
   boolean  isKwang;
   
   Card(int num, boolean isKwang) {
	   this.num     = num;
	   this.isKwang = isKwang;
   }
   public String toString() {
	    return num+" , " + (isKwang?"광":"비광");
   }
}

class SutdaDesk {
	  Card[]  cards  = new Card[20];
	  boolean isKwang = false;
	  SutdaDesk() {
		  for (int i = 0;  i < 20 ; i++ ) {
			  int num = i%10 + 1;
			  if ( i < 10  && (num == 1 || num == 3 || num == 8)) {
				isKwang = true;
			  } else isKwang = false;
			  cards[i]  = new Card(num, isKwang);		  
		  }
	  }
}
