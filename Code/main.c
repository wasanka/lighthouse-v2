#include "stm8s.h"

char HIGH = 'H';
char LOW = 'L';

void myDelay(int);
void portC(int);
void portD(int);
void toggle(char, short, char);
 
void myDelay(int speed)
{
       int i,j;
       for(i=0;i<speed;i++)
       {
            for(j=0;j<speed;j++);
        }
}

void toggle(char port, short pin, char state){
	
	if(state == 'H'){
		if(port == 'C'){
			GPIOC->ODR |=1<<pin;
		} else if(port == 'D'){
			GPIOD->ODR |=1<<pin;
		}
	} else {
		if(port == 'C'){
			GPIOC->ODR &=~(1<<pin);
		} else if(port == 'D'){
			GPIOD->ODR &=~(1<<pin);
		}
	}
}

void portC(int address){
	GPIOC->DDR |=address;// PB.5 as Output
	GPIOC->CR1 |=address;// PB.5 as Push Pull Type Output  
}

void portD(int address){
	GPIOD->DDR |=address;// PB.5 as Output
	GPIOD->CR1 |=address;// PB.5 as Push Pull Type Output  
}
 
main()
{
        //GPIOC->DDR |=0x80;// PB.5 as Output
        //GPIOC->CR1 |=0x80;// PB.5 as Push Pull Type Output 
				portC(0x80);
				portC(0x40);
				portC(0x20);
				portC(0x10);
				portC(0x8);
				
				portD(0x2);
				portD(0x4);
				portD(0x8);
				portD(0x10);
				portD(0x20);
				portD(0x40);
				
        while(1)
         {
					 int i;
					 int j;
					 
					 for(i = 3; i < 8; i = i + 1)
					 {
						 toggle('C', i, LOW);
						 myDelay(150);
						 toggle('C', i, HIGH);
						 //myDelay(200);
					 }
					 
					 for(j = 1; j < 7; j = j + 1)
					 {
						 toggle('D', j, LOW);
						 myDelay(150);
						 toggle('D', j, HIGH);
						 //myDelay(200);
					 }
         }
}