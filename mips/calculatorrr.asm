.data

# MOHAMED
	# MAX OF LIST
	array: .space 800      #array has 100 values 
	arraySizeMSG: .asciiz "Input number of elements in array with maximum 100 element \n"
	arrayElementsMSG: .asciiz "enter the array elemnets\n" 
	maximumMSG: .asciiz  "maximum = "
	max: .double 0.0
	size: .word 0

# TURKEY
	# DIVISION
	no1d: .asciiz " First Number you need to enter \n"
	no2d: .asciiz "Second Number you need to enter \n"
	resultd: .asciiz "The Division of those two numbers equals : \n"
	reminder: .asciiz "\n The Reminder of those two numbers equals : \n"
	decimal: .asciiz "\n Quotient in decimal: \n"

	# ADDITION
	no1a: .asciiz " First Number you need to enter \n"
	no2a: .asciiz "Second Number you need to enter \n"
	resulta: .asciiz "The Addition of those two numbers equals : \n"

	#SUBTRACTION
	no1s: .asciiz " First Number you need to enter \n"
	no2s: .asciiz "Second Number you need to enter \n"
	results: .asciiz "The Subtraction of those two numbers equals : \n"



#YOUSSEF
	aprompt:	.asciiz "Enter the first number"
	bprompt:	.asciiz "Enter the second number"
	


# KAREEM
	#FactorizationMessages
	factorizationMes: .asciiz "Enter number for factorization: "
	factorizNumberMes: .asciiz "\nfactors numbers is: "
	newLine: .asciiz "\n"
	
	#TempFactorization
	Li:     .word 2  # i = 2
	
	
	#CommonMessages
	switchMessage: .asciiz "\nEnter 1: for subtraction \n, 2: for division \n, 3: for addition \n, 4: for power \n, 5: max of list \n, 6: factorization. \n"			
	wrongChoise: .asciiz "the number you choose is wrong \n Please Choose another number or 0 to exit\n"
.text

	main :
		li $v0, 4
		la $a0, switchMessage
		syscall 
		
		li $v0, 5
		syscall
		
		move $t7, $v0
		
		bne $t7 ,0, Case1
		j closeProgram
		
		Case1:
			bne $t7, 1, Case2
			j subtraction

		Case2:
			bne $t7, 2, Case3
			j division
		Case3:  
			bne $t7, 3, Case4
			j addition
				
		Case4:		
			bne $t7, 4, Case5
			j power		
		Case5:
			bne $t7, 5, Case6
			j maxoflist		
		Case6:
			bne $t7, 6, default
			j factorization
		default:
			li $v0, 4
			la $a0, wrongChoise
			syscall 
			j main
			
	closeProgram:
		li $v0, 10
		syscall
						

	factorization:
		lb $t0, Li      # temp reg for i
		
		# write factorization message
		li $v0, 4 
		la $a0, factorizationMes
		syscall
		
		#get factorization number
		li $v0, 5
		syscall
		move $t1, $v0
		

		L1:     slt $t4, $t1, $t0 # check if i < userInput
			beq $t4, 1, L2    # while i < 9, compute
			div $t1, $t0      # i mod 2
			mfhi $t6           # temp for the mod
			beq $t6, 0, Lmod    # if mod == 0, jump over to Lmod and increment
			add $t0, $t0, 1   # i++t0
			j L1
				
		Lmod:   li $v0, 1
			add $a0, $zero, $t0
			syscall
			li $v0, 4 
			la $a0, newLine
			syscall
			div $t1, $t1, $t0
			j L1               # repeat the while loop


		L2:    j main				

	maxoflist:
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


			la $a0, array   #load addess of array 
			move $a1, $t3   #load the size of array
			

		maxOfList:
			li $t0, 0    #array index
			li $t1, 0   #loop counter
			ldc1 $f2, array($t0)  #load first value in array in $f2
			add $t0, $t0, 8  #point to the second element in array
		maximumLoop:   #loop to find max  
	
			beq  $t1, $t3, getMax    #condition 
	
			ldc1 $f4, array($t0)   #load second item to the $f4

			c.lt.d   $f4, $f2  #i $f4 less than $f2 
			bc1t  nochange     #then $f2 has the same vlaue 
	
			#else then move value from $f4 to $f2
			mov.d $f2, $f4
	
			nochange:
			add $t1, $t1, 1 #increment loop counter
			add $t0, $t0, 8 # invrement array address
			
			j maximumLoop
			
			getMax: 
				sdc1  $f2, max  #save the max to max variable 

				#print the maximum = 
				li $v0, 4
				la $a0, maximumMSG 
				syscall 

				#print the number
				li $v0, 3
				ldc1  $f12, max #here the value 			
				syscall

       
	
	


		j main

	power:
		#promp user to enter first number
		li $v0, 4
		la $a0, aprompt
		syscall
		
		#get first number from user
		li $v0, 5
		syscall
		
		#store the first number in t0
		move $t0, $v0	
		
		
		#promp user to enter second number
		li $v0, 4
		la $a0, bprompt
		syscall
		
		#get second number from user
		li $v0, 5
		syscall
		
		#store the second number in t0
		move $t1, $v0
		
		addi $t2, $zero, 1
		addi $t3, $zero, 1
				
		while:
			 bgt $t2, $t1 , exitwhile
			 mul $t3, $t3, $t0
			 addi $t2, $t2, 1
			 j while
		
		exitwhile:
			li $v0, 1
			move $a0, $t3
			syscall
		   
		j main
			 
	
	
	
	addition:
		#Number 1
		#This syscall is used in Printing First String of no1a
		li $v0, 4 
		#Loading address of string to print
		la $a0, no1a  
		syscall

		#This syscall is used in reading the first integer entered by the user
		li $v0, 5 
		syscall
		
		
		#moving the number entered by the user to read into $t0 Address
		move $t0, $v0  
		
		
		#Number 2
		#This syscall is used in Printing Second String of no2a
		li $v0, 4
		#Loading address of string to print
		la $a0, no2a
		syscall
		#This syscall is used in reading the second integer entered by the user
		li $v0,5        
		syscall
		move $t1,$v0

		#This syscall is used in printing out the sum of $t2
		li $v0, 4
		#Loading address of string (Result) to print
		la $a0, resulta
		syscall

		#Addition Process of $t1 and $t0
		add $a0, $t1, $t0 
		li $v0, 1
		syscall	
		
		j main	 	 
				
						
	division:
		#Number 1
        	#This syscall is used in Printing First String of No1
        	li $v0, 4 
        	#Loading address of string to print
        	la $a0, no1d  
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
    		la $a0, no2d
    		syscall
		#This syscall is used in reading the second integer entered by the user
    		li $v0,5        
    		syscall
    		move $t1,$v0

    		#This syscall is used in printing out the sum of $t2
    		li $v0, 4
    		#Loading address of string (Result) to print
    		la $a0, resultd
    		syscall

		#Division Process of $t1 and $t0
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
		#Copying from $t0 Register to $f12
		mtc1 $t0, $f12
		#Convert 32bits in $f12 to float of the same value which will get stored in $f3
		cvt.s.w $f3, $f12
		#Copying from $t1 Register to $f12
		mtc1 $t1, $f12
		#Convert 32bits in $f12 to float of the same value which will get stored in $f4
		cvt.s.w $f4, $f12
		#Dividing floats and storing value in $f12
		div.s $f12, $f3, $f4
		#This SysCall is used to print out the Decimal number with Decimal message stored in Data
		li $v0, 4
		la $a0, decimal
		syscall
		li $v0, 2
		syscall		
		j main	
			
	subtraction:
		#Number 1
        	#This syscall is used in Printing First String of no1s
        	li $v0, 4 
        	#Loading address of string to print
        	la $a0, no1s  
        	syscall

		#This syscall is used in reading the first integer entered by the user
        	li $v0, 5 
        	syscall
        
        
        	#moving the number entered by the user to read into $t0 Address
        	move $t0, $v0  
        
        
    		#Number 2
    		#This syscall is used in Printing Second String of no2s
    		li $v0, 4
    		#Loading address of string to print
    		la $a0, no2s
    		syscall
		#This syscall is used in reading the second integer entered by the user
    		li $v0,5        
    		syscall
    		move $t1,$v0

    		#This syscall is used in printing out the sum of $t2
    		li $v0, 4
    		#Loading address of string (Result) to print
    		la $a0, results
    		syscall

		#Subtraction Process of $t1 and $t0
    		sub $a0, $t0, $t1 
    		li $v0, 1
    		syscall
    		j main
    		
    		
    		
	
#-------------- M A X O F LIST	----------------------------------------								


	
		
#--------- D I V I S I O N --------------




								
#--------------- A D D I T I O N ---------------

																								        #Number 1

	
	
#---------------- S U B T R A C T I N G --------------



	
		
			
#----------- F A C T O R I Z A T I O N -------------
			