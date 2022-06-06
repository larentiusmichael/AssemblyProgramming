TITLE LAURENTIUS MICHAEL - TP061310 - CSLLT Assignment
.model small
.stack 100h
.data
     banner1 db 42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42
     banner2 db 42,32,32,32,32,32,32,32,32,32,32,32,32,32,32,'SPARKLING CHRISTMAS',32,32,32,32,32,32,32,32,32,32,32,32,32,32,42
     banner3 db 42,32,32,32,32,32,32,32,32,32,'Celebrate this festive season',32,32,32,32,32,32,32,32,32,42
     banner4 db 42,32,32,32,32,32,32,'Organizer: APU Event Management Unit',32,32,32,32,32,42
     banner5 db 42,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,'Date: 10/06/2022',32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42
     banner6 db 42,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,'Time: 7PM - 10PM',32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42
     banner7 db 42,32,32,32,32,32,32,32,32,32,32,32,32,32,'Press 0 to Main Menu',32,32,32,32,32,32,32,32,32,32,32,32,32,32,42
     banner8 db 42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42
     menu db 32,32,32,32,32,32,32,32,'MAIN MENU',10
          db '1). Number Patterns',10
          db '2). Design Patterns',10
          db '3). Box Type Patterns',10
          db '4). Nested Loop Patterns$'
     choice db 'Enter your choice: $'
     msg db 'This is the end of program. Thank You!$'
.code
;macro to display string
ShowStr Macro Mess
     mov ah,09h               ;to display string (DOS function)
     mov dx,offset Mess       ;offset - read char one by one
     int 21h                  ;to call DOS interface
endm

;macro to display character
ShowChar Macro Mess
     mov ah,02h               ;to display character (DOS function)
     mov dl,Mess
     int 21h
endm

;macro to set background color
SetBackground Macro Value
     mov ah,00
     mov al,03
     int 10h

     mov ah,09
     mov bh,00
     mov al,20h
     mov cx,800h
     mov bl,Value
     int 10h
endm

;procedure to display banner
DisplayBanner1 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,248
     mov cx,49
     mov dh,8
     mov dl,15
     mov bp,offset banner1
     int 10h
     ret
DisplayBanner1 endp

DisplayBanner2 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,243
     mov cx,49
     mov dh,9
     mov dl,15
     mov bp,offset banner2
     int 10h
     ret
DisplayBanner2 endp

DisplayBanner3 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,245
     mov cx,49
     mov dh,10
     mov dl,15
     mov bp,offset banner3
     int 10h
     ret
DisplayBanner3 endp

DisplayBanner4 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,244
     mov cx,49
     mov dh,11
     mov dl,15
     mov bp,offset banner4
     int 10h
     ret
DisplayBanner4 endp

DisplayBanner5 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,241
     mov cx,49
     mov dh,12
     mov dl,15
     mov bp,offset banner5
     int 10h
     ret
DisplayBanner5 endp

DisplayBanner6 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,253
     mov cx,49
     mov dh,13
     mov dl,15
     mov bp,offset banner6
     int 10h
     ret
DisplayBanner6 endp

DisplayBanner7 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,240
     mov cx,49
     mov dh,14
     mov dl,15
     mov bp,offset banner7
     int 10h
     ret
DisplayBanner7 endp

DisplayBanner8 Proc
     mov ax,@data
     mov es,ax

     mov ah,13h
     mov al,0
     mov bh,0
     mov bl,248
     mov cx,49
     mov dh,15
     mov dl,15
     mov bp,offset banner8
     int 10h
     ret
DisplayBanner8 endp

;procedure to display repetitive stars
Stars Proc
     mov ah,09h
     mov al,42
     mov bh,0
     mov bl,225
     mov cx,25
     int 10h
     ret
Stars endp

;procedure to display line
DisplayLine Proc
     mov ah,02h
     mov dl,10
     int 21h
     ret
DisplayLine endp

;procedure to receive char input
CharInput Proc
     mov ah,1
     mov dl,al
     int 21h
     ret
CharInput endp

;procedure to show menu1
ShowMenu1a Proc
     call DisplayLine
     mov ah,2
     mov bl,0
     mov ch,0
m1l1a:
     mov bh,5
     inc bl
     cmp bl,bh
     jbe m1l2a
     ret
m1l2a:
     mov cl,0
     sub bh,bl
m1l3a:
     inc cl
     cmp cl,bh
     ja m1l4a

     ShowChar 32

     jmp m1l3a
m1l4a:
     inc ch
     cmp ch,bl
     ja m1l5a

     cmp ch,1
     je m1l4p1a

     cmp ch,2
     je m1l4p2a

     cmp ch,3
     je m1l4p3a

     cmp ch,4
     je m1l4p4a

     cmp ch,5
     je m1l4p5a

m1l4p1a:
     ShowChar 48
     jmp m1l4a
m1l4p2a:
     ShowChar 49
     jmp m1l4a
m1l4p3a:
     ShowChar 50
     jmp m1l4a
m1l4p4a:
     ShowChar 51
     jmp m1l4a
m1l4p5a:
     ShowChar 52
     jmp m1l4a
m1l5a:
     mov ch,bl
m1l6a:
     dec ch
     cmp ch,1
     jb m1l7a

     cmp ch,1
     je m1l6p1a

     cmp ch,2
     je m1l6p2a

     cmp ch,3
     je m1l6p3a

     cmp ch,4
     je m1l6p4a

     cmp ch,5
     je m1l6p5a
m1l6p1a:
     ShowChar 48
     jmp m1l6a
m1l6p2a:
     ShowChar 49
     jmp m1l6a
m1l6p3a:
     ShowChar 50
     jmp m1l6a
m1l6p4a:
     ShowChar 51
     jmp m1l6a
m1l6p5a:
     ShowChar 52
     jmp m1l6a
m1l7a:
     call DisplayLine
     jmp m1l1a
ShowMenu1a endp

ShowMenu1b Proc
     mov ah,2
     mov bl,5
     mov ch,0
m1l1b:
     mov bh,5
     dec bl
     cmp bl,1
     jae m1l2b
     ret
m1l2b:
     mov cl,0
     sub bh,bl
m1l3b:
     inc cl
     cmp cl,bh
     ja m1l4b

     ShowChar 32

     jmp m1l3b
m1l4b:
     inc ch
     cmp ch,bl
     ja m1l5b

     cmp ch,1
     je m1l4p1b

     cmp ch,2
     je m1l4p2b

     cmp ch,3
     je m1l4p3b

     cmp ch,4
     je m1l4p4b

     cmp ch,5
     je m1l4p5b

m1l4p1b:
     ShowChar 48
     jmp m1l4b
m1l4p2b:
     ShowChar 49
     jmp m1l4b
m1l4p3b:
     ShowChar 50
     jmp m1l4b
m1l4p4b:
     ShowChar 51
     jmp m1l4b
m1l4p5b:
     ShowChar 52
     jmp m1l4b
m1l5b:
     mov ch,bl
m1l6b:
     dec ch
     cmp ch,1
     jb m1l7b

     cmp ch,1
     je m1l6p1b

     cmp ch,2
     je m1l6p2b

     cmp ch,3
     je m1l6p3b

     cmp ch,4
     je m1l6p4b

     cmp ch,5
     je m1l6p5b
m1l6p1b:
     ShowChar 48
     jmp m1l6b
m1l6p2b:
     ShowChar 49
     jmp m1l6b
m1l6p3b:
     ShowChar 50
     jmp m1l6b
m1l6p4b:
     ShowChar 51
     jmp m1l6b
m1l6p5b:
     ShowChar 52
     jmp m1l6b
m1l7b:
     call DisplayLine
     jmp m1l1b
ShowMenu1b endp

;procedure to show menu2
ShowMenu2 Proc
     call DisplayLine
     mov ah,2
     mov bl,0
m2l1:
     inc bl
     cmp bl,5
     jbe m2l2
     ret
m2l2:
     mov ch,0
m2l3:
     inc ch
     cmp ch,17
     jbe m2l4

     call DisplayLine
     jmp m2l1
m2l4:
     mov cl,ch
     add ch,bl

     cmp ch,4
     je m2l5

     cmp ch,8
     je m2l5

     cmp ch,12
     je m2l5

     cmp ch,16
     je m2l5

     cmp ch,20
     je m2l5

     jmp m2l6
m2l5:
     ShowChar 42
     ShowChar 32

     mov ch,cl
     jmp m2l3
m2l6:
     cmp bl,2
     je m2l7

     cmp bl,4
     je m2l7

     jmp m2l8
m2l7:
     cmp ch,6
     je m2l5

     cmp ch,10
     je m2l5

     cmp ch,14
     je m2l5

     cmp ch,18
     je m2l5
m2l8:
     ShowChar 32
     ShowChar 32

     mov ch,cl
     jmp m2l3
ShowMenu2 endp


;procedure to show menu3
ShowMenu3 Proc
     call DisplayLine
     mov ah,2
     mov bl,0
     mov bh,8
     sub bh,1
m3l1:
     mov ch,0
     inc bl
     cmp bl,bh
     jbe m3l2
     ret
m3l2:
     mov cl,4
     cmp bl,4
     ja m3l7
m3l3:
     inc ch
     cmp ch,bh
     jbe m3l4

     call DisplayLine

     jmp m3l1 
m3l4:
     cmp cl,4
     je m3l4p1

     cmp cl,3
     je m3l4p2

     cmp cl,2
     je m3l4p3

     cmp cl,1
     je m3l4p4

m3l4p1:
     ShowChar 88
     ShowChar 32
     jmp m3l4b
m3l4p2:
     ShowChar 77
     ShowChar 32
     jmp m3l4b
m3l4p3:
     ShowChar 65
     ShowChar 32
     jmp m3l4b
m3l4p4:
     ShowChar 83
     ShowChar 32
     jmp m3l4b
m3l4b:
     cmp bl,ch
     jbe m3l5

     dec cl
m3l5:
     mov dh,ch
     add ch,bl

     cmp ch,8
     jb m3l6

     inc cl
m3l6:
     mov ch,dh
     jmp m3l3
m3l7:
     inc ch
     cmp ch,bh
     jbe m3l8

     call DisplayLine

     jmp m3l1
m3l8:
     cmp cl,4
     je m3l8p1

     cmp cl,3
     je m3l8p2

     cmp cl,2
     je m3l8p3

     cmp cl,1
     je m3l8p4
m3l8p1:
     ShowChar 88
     ShowChar 32
     jmp m3l8b
m3l8p2:
     ShowChar 77
     ShowChar 32
     jmp m3l8b
m3l8p3:
     ShowChar 65
     ShowChar 32
     jmp m3l8b
m3l8p4:
     ShowChar 83
     ShowChar 32
     jmp m3l8b
m3l8b:
     mov dh,ch
     add ch,bl
     cmp ch,8
     jae m3l9

     dec cl
m3l9:
     mov ch,dh
     cmp bl,ch
     ja m3l10

     inc cl
m3l10:
     jmp m3l7      
ShowMenu3 endp

;procedure to show menu4
ShowMenu4a Proc
     call DisplayLine
     mov ah,2                 ;display character function / service
     mov bl,0             
m4al1:
     mov ch,0
     inc bl

     cmp bl,5
     jbe m4al2

     ret
m4al2:
     call DisplayLine
m4al3:
     inc ch

     cmp ch,13
     jbe m4al4a

     jmp m4al1
m4al4a:
     cmp bl,1
     jne m4al4b

     cmp ch,1
     je m4al4a1

     cmp ch,13
     je m4al4a1

     ShowChar 32
     jmp m4al3
m4al4a1:
     ShowChar 49
     jmp m4al3
m4al4aa:
     jmp m4al3
m4al4b:
     cmp bl,2
     jne m4al4c

     cmp ch,1
     je m4al4b1

     cmp ch,2
     je m4al4b2

     cmp ch,12
     je m4al4b2

     cmp ch,13
     je m4al4b1

     ShowChar 32
     jmp m4al4aa
m4al4b1:
     ShowChar 49
     jmp m4al4aa
m4al4b2:
     ShowChar 50
     jmp m4al4aa
m4al4bb:
     jmp m4al4aa
m4al4c:
     cmp bl,3
     jne m4al4d

     cmp ch,1
     je m4al4c1

     cmp ch,2
     je m4al4c2

     cmp ch,3
     je m4al4c3

     cmp ch,11
     je m4al4c3

     cmp ch,12
     je m4al4c2

     cmp ch,13
     je m4al4c1

     ShowChar 32
     jmp m4al4bb
m4al4c1:
     ShowChar 49
     jmp m4al4bb
m4al4c2:
     ShowChar 50
     jmp m4al4bb
m4al4c3:
     ShowChar 51
     jmp m4al4bb
m4al4cc:
     jmp m4al4bb
m4al4d:
     cmp bl,4
     jne m4al4e

     cmp ch,1
     je m4al4d1

     cmp ch,2
     je m4al4d2

     cmp ch,3
     je m4al4d3

     cmp ch,4
     je m4al4d4

     cmp ch,10
     je m4al4d4

     cmp ch,11
     je m4al4d3

     cmp ch,12
     je m4al4d2

     cmp ch,13
     je m4al4d1

     ShowChar 32
     jmp m4al4cc
m4al4d1:
     ShowChar 49
     jmp m4al4cc
m4al4d2:
     ShowChar 50
     jmp m4al4cc
m4al4d3:
     ShowChar 51
     jmp m4al4cc
m4al4d4:
     ShowChar 52
     jmp m4al4cc
m4al4dd:
     jmp m4al4cc
m4al4e:
     cmp bl,5
     jne m4al4dd

     cmp ch,1
     je m4al4e1

     cmp ch,2
     je m4al4e2

     cmp ch,3
     je m4al4e3

     cmp ch,4
     je m4al4e4

     cmp ch,5
     je m4al4e5

     cmp ch,9
     je m4al4e5

     cmp ch,10
     je m4al4e4

     cmp ch,11
     je m4al4e3

     cmp ch,12
     je m4al4e2

     cmp ch,13
     je m4al4e1

     ShowChar 32
     jmp m4al4dd
m4al4e1:
     ShowChar 49
     jmp m4al4dd
m4al4e2:
     ShowChar 50
     jmp m4al4dd
m4al4e3:
     ShowChar 51
     jmp m4al4dd
m4al4e4:
     ShowChar 52
     jmp m4al4dd
m4al4e5:
     ShowChar 53
     jmp m4al4dd
ShowMenu4a endp

ShowMenu4b Proc
     call DisplayLine
     mov ah,2                 ;display character function / service
     mov bl,0   
m4bl1:
     mov ch,0
     inc bl

     cmp bl,5
     jbe m4bl2

     ret
m4bl2:
     call DisplayLine
m4bl3:
     inc ch

     cmp ch,13
     jbe m4bl4a

     jmp m4bl1
m4bl4a:
     cmp bl,1
     jne m4bl4b

     cmp ch,1
     je m4bl4a1

     cmp ch,2
     je m4bl4a1

     cmp ch,3
     je m4bl4a1

     cmp ch,4
     je m4bl4a1

     cmp ch,5
     je m4bl4a1

     cmp ch,9
     je m4bl4a1

     cmp ch,10
     je m4bl4a1

     cmp ch,11
     je m4bl4a1

     cmp ch,12
     je m4bl4a1

     cmp ch,13
     je m4bl4a1

     ShowChar 32
     jmp m4bl3
m4bl4a1:
     ShowChar 49
     jmp m4bl3
m4bl4aa:
     jmp m4bl3
m4bl4b:
     cmp bl,2
     jne m4bl4c

     cmp ch,1
     je m4bl4b1

     cmp ch,2
     je m4bl4b1

     cmp ch,3
     je m4bl4b1

     cmp ch,4
     je m4bl4b1

     cmp ch,10
     je m4bl4b1

     cmp ch,11
     je m4bl4b1

     cmp ch,12
     je m4bl4b1

     cmp ch,13
     je m4bl4b1

     ShowChar 32
     jmp m4bl4aa
m4bl4b1:
     ShowChar 50
     jmp m4bl4aa
m4bl4bb:
     jmp m4bl4aa
m4bl4c:
     cmp bl,3
     jne m4bl4d

     cmp ch,1
     je m4bl4c1

     cmp ch,2
     je m4bl4c1

     cmp ch,3
     je m4bl4c1

     cmp ch,11
     je m4bl4c1

     cmp ch,12
     je m4bl4c1

     cmp ch,13
     je m4bl4c1

     ShowChar 32
     jmp m4bl4bb
m4bl4c1:
     ShowChar 51
     jmp m4bl4bb
m4bl4cc:
     jmp m4bl4bb
m4bl4d:
     cmp bl,4
     jne m4bl4e

     cmp ch,1
     je m4bl4d1

     cmp ch,2
     je m4bl4d1

     cmp ch,12
     je m4bl4d1

     cmp ch,13
     je m4bl4d1

     ShowChar 32
     jmp m4bl4cc
m4bl4d1:
     ShowChar 52
     jmp m4bl4cc
m4bl4dd:
     jmp m4bl4cc
m4bl4e:
     cmp bl,5
     jne m4bl4dd

     cmp ch,1
     je m4bl4e1

     cmp ch,13
     je m4bl4e1

     ShowChar 32
     jmp m4bl4dd
m4bl4e1:
     ShowChar 53
     jmp m4bl4dd
ShowMenu4b endp

ShowMenu4d Proc
     call DisplayLine
     mov ah,2                 
     mov bl,5                
     mov cl,0              
     mov ch,5                
m4dl1:
     inc cl

     cmp cl,ch               
     jbe m4dl1b           

     call DisplayLine

     mov cl,0               
     dec ch                
     dec bl                   
     cmp bl,0            
     jne m4dl1

     ret
m4dl1b:
     cmp bl,5
     je m4dl2

     cmp bl,4
     je m4dl3

     cmp bl,3
     je m4dl4

     cmp bl,2
     je m4dl5

     cmp bl,1
     je m4dl6

     jmp m4dl1

m4dl2a:
     ShowChar 49
     jmp m4dl1
m4dl2b:
     ShowChar 50
     jmp m4dl1
m4dl2c:
     ShowChar 51
     jmp m4dl1
m4dl2d:
     ShowChar 52
     jmp m4dl1
m4dl2e:
     ShowChar 53
     jmp m4dl1

m4dl2:
     cmp cl,1
     je m4dl2a

     cmp cl,2
     je m4dl2b
      
     cmp cl,3
     je m4dl2c

     cmp cl,4
     je m4dl2d

     cmp cl,5
     je m4dl2e

m4dl3:
     cmp cl,1
     je m4dl2b

     cmp cl,2
     je m4dl2c
      
     cmp cl,3
     je m4dl2d

     cmp cl,4
     je m4dl2e

m4dl4:
     cmp cl,1
     je m4dl2c

     cmp cl,2
     je m4dl2d
      
     cmp cl,3
     je m4dl2e

m4dl5:
     cmp cl,1
     je m4dl2d

     cmp cl,2
     je m4dl2

m4dl6:
     cmp cl,1
     je m4dl2e
ShowMenu4d endp


MAIN PROC
beginning: 
     SetBackground 3fh

     call DisplayBanner1
     call DisplayBanner2
     call DisplayBanner3
     call DisplayBanner4
     call DisplayBanner5
     call DisplayBanner6
     call DisplayBanner7
     call DisplayBanner8

     call CharInput

     cmp al,'0'
     je top

     jmp beginning
top:
     SetBackground 2fh

     ;display line
     call DisplayLine         ;calling procedure to display line
     
     ;display stars
     call Stars               ;calling prcedure to display repetitive stars

     call DisplayLine        

     mov ax,@data             ;get the data segment address
     mov ds,ax                ;point DS to data segment

     ShowStr menu

     call DisplayLine
     call Stars
     call DisplayLine

     ShowStr choice

     call CharInput

     cmp al,'1'
     je menu1

     cmp al,'2'
     je menu2

     cmp al,'3'
     je menu3

     cmp al,'4'
     je menu4

     jmp top

menu1:
     SetBackground 4fh
     call ShowMenu1a
     call ShowMenu1b
     jmp bottom

menu2:
     SetBackground 5fh
     call ShowMenu2
     jmp bottom

menu3:
     SetBackground 6fh
     call ShowMenu3
     jmp bottom

menu4:
     SetBackground 7fh
     call ShowMenu4a
     call ShowMenu4b
     call DisplayLine
     call ShowMenu4d
     jmp bottom

bottom:
     call DisplayLine
     ShowStr msg

     mov ah,4ch               ;function to end program
     int 21h

MAIN endp
     end MAIN
