.data 
 	#ShapeDetectionMessages
	shapeDetectionMessage: .asciiz "Enter first length of side(s): "
	shSquareMessage: .asciiz "\nthe shape is square: "
	shRectangleMessage: .asciiz "\nthe shape is rectangle: "
	shTriangleMessage: .asciiz "\nthe shape is triangle "
	shErrorMessage: .asciiz "\nError:: cannot first side be zero! "
	shNoShapeMessage: .asciiz "\nthe shape is not correct"
	shSecondInputMessage: .asciiz "Enter second side or zero if you finished: "
	shThirdInputMessage: .asciiz "Enter third side or zero if you finished: "
	
	
.text
	
	li $v0, 4 
	la $a0, shapeDetectionMessage
	syscall
	
	#get first userInput number
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4 
	la $a0, shSecondInputMessage
	syscall
	
	#get second userInput number
	li $v0, 5
	syscall
	move $t1, $v0
	
	beqz  $t1, squareShape
	
	li $v0, 4 
	la $a0, shThirdInputMessage
	syscall
	
	#get third userInput number
	li $v0, 5
	syscall
	move $t2, $v0
	
	beqz $t2, rectangeShape
	j triangleShape
	
	squareShape: 
		li $v0, 4 
		la $a0, shSquareMessage
		syscall
		j exit	
		
	rectangeShape:
		beq $t0, $t1, squareShape
		li $v0, 4 
		la $a0, shRectangleMessage
		syscall
		j exit
		
	triangleShape:
		add $t4, $t0, $t1
		slt $t5,$t4, $t2 
		beq $t5, 1, noShape
		beq $t4, $t2, noShape
		
		add $t4, $t0, $t2
		slt $t5,$t4, $t1 
		beq $t5, 1, noShape
		beq $t4, $t1, noShape
		
		add $t4, $t1, $t2
		slt $t5,$t4, $t0 
		beq $t5, 1, noShape
		beq $t4, $t0, noShape
		
		li $v0, 4 
		la $a0, shTriangleMessage
		syscall
		j exit
			
	noShape:
		li $v0, 4 
		la $a0, shNoShapeMessage
		syscall
		j exit				
			
	exit: 
	    	li $v0, 10              # terminate program run and
		syscall                      # Exit 			

	
