## GroupID-12 (15116002_15116025) - AALIND SHARMA & 
## Date: November 4, 2016
## product.asm - This program gives the product of N(taken from user) consecutive integers starting from 1 as output.
## Registers used: 
## $t0: used to store address of string1.
## $t1: used to store address of string2.
## $t3: used to store address of string3.
## $a0: argument register, used to hold the values for immediate use.
## $v0: used to call codes for different commands, such as printing int, reading int, printing string or system call for exit to be executed on variables stored in $a0.
## $sp: Stack Pointer register, used to store input into stack.
## $s0: used to store return value of main.
## $ra: counter register, used for jump to parent call.
.globl main
.data
  string1: .word string1_data
  string2: .word string2_data
  string3: .word string3_data
  err: .word err_data

  string1_data: .asciiz "Positive integer,N: "
  string2_data: .asciiz "The value of product of "
  string3_data: .asciiz " consecutive integers starting from 1 is "
  err_data: .asciiz "Error: N is non-positive" 
.text
main:
  #printf("Positive integer,N: ");
  la      $t0, string1    
  lw      $a0, 0($t0)      
  li      $v0, 4            
  syscall                   

  # scanf("%d", &N);
  li      $v0, 5            
  syscall                  
  move    $t0, $v0         
#Check if N<=0 -> go to exit else go to prepare
bgt $t0, 0, prepare #if N>0, go to "prepare"
ble $t1, 0, exit #if N<=0, go to "exit"

.text
prepare:
  move    $a0, $t0          
  addi    $sp, $sp, -12    
  sw      $t0, 0($sp)      
  sw      $ra, 8($sp)      
  jal     prod         # call prod

  lw      $s0, 4($sp)       
  # printf("The value of 'product(%d)' is:  %d\n",
  la      $t1, string2      
  lw      $a0, 0($t1)       
  li      $v0, 4            
  syscall                   

  lw      $a0, 0($sp)       
  li      $v0, 1            
  syscall                   

  la      $t2, string3      
  lw      $a0, 0($t2)       
  li      $v0, 4            
  syscall                   

  move    $a0, $s0          
  li      $v0, 1            
  syscall                   

  addi    $sp, $sp, 12      

  # return 0;
  li      $v0, 10           
  syscall                   



.text
prod:
  lw      $t0, 0($sp)       # load input from top of stack into register $t0
  #if (x == 1)
  beq     $t0, 1, returnOne 
  addi    $t0, $t0, -1      

  # recursive case
  addi    $sp, $sp, -12    
  sw      $t0, 0($sp)      
  sw      $ra, 8($sp)      
  jal     prod         # recursive call


  lw      $ra, 8($sp)       
  lw      $t1, 4($sp)       
  lw      $t2, 12($sp)      

# return x * prod(x-1); (not the return statement, but the multiplication)
  mul     $t3, $t1, $t2     
  sw      $t3, 16($sp)      
  addi    $sp, $sp, 12      
  jr      $ra               

.text
#return 1;
returnOne:
  li      $t0, 1            
  sw      $t0, 4($sp)       
  jr      $ra               
.text
exit:
#print error
	la      $t0, err      
	lw      $a0, 0($t0)       
	li      $v0, 4 
syscall
#exit
li $v0, 10 #code to exit
syscall