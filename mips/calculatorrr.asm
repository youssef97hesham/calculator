.data
	# MAX OF LIST
	array: .space 800      #array has 100 values 
	arraySizeMSG: .asciiz "Input number of elements in array with maximum 100 element \n"
	arrayElementsMSG: .asciiz "enter the array elemnets\n" 
	maximumMSG: .asciiz  "maximum = "
	max: .double 0.0
	size: .word 0

	# DIVISION
	no1: .asciiz " First Number you need to enter \n"
	no2: .asciiz "Second Number you need to enter \n"
	result: .asciiz "The Division of those two numbers equals : \n"
	reminder: .asciiz "\n The Reminder of those two numbers equals : \n"

	# ADDITION
	no1: .asciiz " First Number you need to enter \n"
	no2: .asciiz "Second Number you need to enter \n"
	result: .asciiz "The Addition of those two numbers equals : \n"

	#SUBTRACTION
	no1: .asciiz " First Number you need to enter \n"
	no2: .asciiz "Second Number you need to enter \n"
	result: .asciiz "The Subtraction of those two numbers equals : \n"


	aprompt:	.asciiz "Enter the first number"
	bprompt:	.asciiz "Enter the second number"
.text
#---------- M A X    O F   L I S T-----------
	main :
	#number of element 
	li $v0, 4
	la $a0, arraySizeMSG
	syscall 

	#read number of element 
	li $v0, 5
	syscall

	#save number of elements to size variable 
	sw $v0, size 
	lw $t3, size

	#enter the array element message 
	li $v0, 4
	la $a0, arrayElementsMSG 
	syscall

	addi $t0,$t0, 0   #array index 
	addi $t1, $t1, 0  #loop counter 

	inputLoop:  #loop to take input
	li $v0, 7  #read double value 
	syscall 
	s.d  $f0, array($t0)  #save value from $f0 to the array 
	addi $t0, $t0, 8  #increment array index 
	addi $t1, $t1, 1 #increment loop counter 
	blt   $t1, $t3, inputLoop


	# pass arrgument to the function call
	la $a0, array   #load addess of array 
	move $a1, $t3   #load the size of array


	jal maxOfList #call the function 

	#print the maximum = 
	li $v0, 4
	la $a0, maximumMSG 
	syscall 

	#print the number
	li $v0, 3
	ldc1  $f12, max #here the value 
	syscall 


	#end of main 
	li $v0, 10
	syscall

	maxOfList:

	li $t0, 0    #array index
	li $t1, 0   #loop counter


	ldc1 $f2, array($t0)  #load first value in array in $f2
	add $t0, $t0, 8  #point to the second element in array
	 
	 
	maximumLoop:   #loop to find max  
		
		beq  $t1, $t3, exit    #condition 
		
		ldc1 $f4, array($t0)   #load second item to the $f4

		c.lt.d   $f4, $f2  #i $f4 less than $f2 
		bc1t  nochange     #then $f2 has the same vlaue 
		
		#else then move value from $f4 to $f2
		mov.d $f2, $f4
		
		nochange:
		add $t1, $t1, 1 #increment loop counter
		add $t0, $t0, 8 # invrement array address
		   
		
		j maximumLoop
		
	exit: 
	sdc1  $f2, max  #save the max to max variable 

	jr $ra #return 
	

	
		
#--------- D I V I S I O N --------------

			#Number 1
			#This syscall is used in Printing First String of No1
			li $v0, 4 
			#Loading address of string to print
			la $a0, no1  
			syscall

		#This syscall is used in reading the first integer entered by the user
			li $v0, 5 
			syscall
			
			
			#moving the number entered by the user to read into $t0 Address
			move $t0, $v0  
			
			
		#Number 2
		#This syscall is used in Printing Second String of No2
		li $v0, 4
		#Loading address of string to print
		la $a0, no2
		syscall
	#This syscall is used in reading the second integer entered by the user
		li $v0,5        
		syscall
		move $t1,$v0

		#This syscall is used in printing out the sum of $t2
		li $v0, 4
		#Loading address of string (Result) to print
		la $a0, result
		syscall

	#Addition Process of $t1 and $t0
	div $t0 , $t1
	mflo $s0 #result

	li $v0, 1
	add $a0, $zero, $s0
	syscall

	#This syscall is used in printing out the sum of $t2
		li $v0, 4
	#Loading address of string (Reminder) to print
		la $a0, reminder
		syscall
		

	mfhi $s1 # Reminder

	li $v0, 1

	add $a0, $zero, $s1

	syscall


								
#--------------- A D D I T I O N ---------------

																								        #Number 1
        #This syscall is used in Printing First String of No1
        li $v0, 4 
        #Loading address of string to print
        la $a0, no1  
        syscall

	#This syscall is used in reading the first integer entered by the user
        li $v0, 5 
        syscall
        
        
        #moving the number entered by the user to read into $t0 Address
        move $t0, $v0  
        
        
    #Number 2
    #This syscall is used in Printing Second String of No2
    li $v0, 4
    #Loading address of string to print
    la $a0, no2
    syscall
#This syscall is used in reading the second integer entered by the user
    li $v0,5        
    syscall
    move $t1,$v0

    #This syscall is used in printing out the sum of $t2
    li $v0, 4
    #Loading address of string (Result) to print
    la $a0, result
    syscall

#Addition Process of $t1 and $t0
    add $a0, $t1, $t0 
    li $v0, 1
    syscall																								
	
	
	
	
#---------------- S U B T R A C T I N G --------------

        #Number 1
        #This syscall is used in Printing First String of No1
        li $v0, 4 
        #Loading address of string to print
        la $a0, no1  
        syscall

	#This syscall is used in reading the first integer entered by the user
        li $v0, 5 
        syscall
        
        
        #moving the number entered by the user to read into $t0 Address
        move $t0, $v0  
        
        
    #Number 2
    #This syscall is used in Printing Second String of No2
    li $v0, 4
    #Loading address of string to print
    la $a0, no2
    syscall
#This syscall is used in reading the second integer entered by the user
    li $v0,5        
    syscall
    move $t1,$v0

    #This syscall is used in printing out the sum of $t2
    li $v0, 4
    #Loading address of string (Result) to print
    la $a0, result
    syscall

#Subtraction Process of $t1 and $t0
    sub $a0, $t0, $t1 
    li $v0, 1
    syscall

	