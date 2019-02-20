.data 
num0: .word 1 
num1: .word 63 


.text 
main:
  #inicializa constantes
  
  lw $t1, 0($zero) # lw $r9, 0($r0)
  lw $t0, 4($zero) # lw $r8, 4($r0)
  and $t2, $zero, $zero # reset de contador
  bit1:
      sw $t1, 8($zero)	# crea la mascara inicialmente en 0x01
	  and $t1, $t1, $t0 	# mascara de datos 
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  beq $t1,$zero, bit2
	  nop
	  nop	#riesgo de control por el beq
	  add $t2, $t2, $t1	# incrementa el contador
  bit2:  
	  lw $t1, 8($zero)	#carga la mascara	  
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t1, $t1, $t1 	#crea la mascara de la iteracion	  
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  sw $t1, 8($zero)	#almacena la mascara actual
	  and $t1, $t0, $t1 	# enmascara datos
	  nop
	  nop	#riesgo de dependencia de datos en t1 
	  beq $t1,$zero, bit3 
	  nop
	  nop	#riesgo de control por el beq
	  lw $t1, 0($zero) 	# carga valor 1
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t2, $t2, $t1	# incrementa el contador
  bit3:  
	  lw $t1, 8($zero)	#carga la mascara
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t1, $t1, $t1 	#crea la mascara de la iteracion
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  sw $t1, 8($zero)	#almacena la mascara actual
	  and $t1, $t0, $t1 	# enmascara datos 
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  beq $t1,$zero, bit4 
	  nop
	  nop	#riesgo de control por el beq
	  lw $t1, 0($zero) 	# carga valor 1
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t2, $t2, $t1	# incrementa el contador
  bit4:  
	  lw $t1, 8($zero)	#carga la mascara
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t1, $t1, $t1 	#crea la mascara de la iteracion
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  sw $t1, 8($zero)	#almacena la mascara actual
	  and $t1, $t0, $t1 	# enmascara datos 
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  beq $t1,$zero, bit5
	  nop
	  nop	#riesgo de control por el beq
	  lw $t1, 0($zero) 	# carga valor 1
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t2, $t2, $t1	# incrementa el contador
  bit5:  
	  lw $t1, 8($zero)	#carga la mascara
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t1, $t1, $t1 	#crea la mascara de la iteracion
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  sw $t1, 8($zero)	#almacena la mascara actual
	  and $t1, $t0, $t1 	# enmascara datos 
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  beq $t1,$zero, bit6 
	  nop
	  nop	#riesgo de control por el beq
	  lw $t1, 0($zero) 	# carga valor 1
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t2, $t2, $t1	# incrementa el contador
  bit6:  
	  lw $t1, 8($zero)	#carga la mascara
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t1, $t1, $t1 	#crea la mascara de la iteracion
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  sw $t1, 8($zero)	#almacena la mascara actual
	  and $t1, $t0, $t1 	# enmascara datos 
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  beq $t1,$zero, bit7 
	  nop
	  nop	#riesgo de control por el beq
	  lw $t1, 0($zero) 	# carga valor 1
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t2, $t2, $t1	# incrementa el contador
  bit7:  
	  lw $t1, 8($zero)	#carga la mascara
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t1, $t1, $t1 	#crea la mascara de la iteracion
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  sw $t1, 8($zero)	#almacena la mascara actual
	  and $t1, $t0, $t1 	# enmascara datos 
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  beq $t1,$zero, bit8 
	  nop
	  nop	#riesgo de control por el beq
	  lw $t1, 0($zero) 	# carga valor 1
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t2, $t2, $t1	# incrementa el contador
  bit8:  
	  lw $t1, 8($zero)	#carga la mascara
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t1, $t1, $t1 	#crea la mascara de la iteracion
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  and $t1, $t0, $t1 	# enmascara datos 
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  beq $t1,$zero, end 
	  nop
	  nop	#riesgo de control por el beq
	  lw $t1, 0($zero) 	# carga valor 1
	  nop
	  nop	#riesgo de dependencia de datos en t1
	  add $t2, $t2, $t1	# incrementa el contador	  
	  nop
	  nop	#riesgo de dependencia de datos en t1
 end: 
	  sw $t2, 8($zero)