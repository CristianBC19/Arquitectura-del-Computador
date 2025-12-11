STACK SEGMENT PARA STACK
    DB 64 DUP (' ')
STACK ENDS


DATA SEGMENT PARA 'DATA'

    WINDOW_WIDTH DW 140h       ; Ancho
    WINDOW_HEIGHT DW 0C8h       ; Alto
    WINDOW_BOUNDS DW 06h       ; Margen de los bordes
    
    NET_X DW 0A0h             ; Posicion X de la red
    NET_COLOR DB 0Fh            ; Color de la red (blanco)
    
    KEY_CODE DB 00h             ; Codigo de la tecla presionada
    TIME_AUX DB 00h             ; Control de tiempo
    
    ; Variables de la pelota
    BALL_X DW 50h             ; Posicion X 
    BALL_Y DW 8Ch             ; Posicion Y 
    BALL_SIZE DW 0Bh           ; Size de la pelota (11x11 pixeles)
    BALL_VELOCITY_X DW 00h      ; Velocidad horizontal
    BALL_VELOCITY_Y DW 00h      ; Velocidad vertical
    BALL_ACTIVE DB 00h          ; Estado de la pelota (0=inactiva, 1=activa)
    
    ; Posiciones de inicio de la pelota
    BALL_SPAWN_SIDE DB 00h      ; Lado donde aparece (0=izq, 1=der)
    BALL_SPAWN_LEFT_X DW 50h    
    BALL_SPAWN_LEFT_Y DW 8Ch    
    BALL_SPAWN_RIGHT_X DW 0F0h  
    BALL_SPAWN_RIGHT_Y DW 8Ch   
    
    ; Velocidades verticales de las paletas
    PADDLE_LEFT_VY DW 00h       
    PADDLE_RIGHT_VY DW 00h     
    PADDLE_LEFT_ON_GROUND DB 01h  ; Paleta izquierda en suelo (1=si, 0=no)
    PADDLE_RIGHT_ON_GROUND DB 01h  ; Paleta derecha en suelo (1=si, 0=no)
    
    ; Fisica del juego
    GRAVITY DW 01h            ; Fuerza de gravedad
    JUMP_FORCE DW 0Ah           ; Fuerza del salto
    
    ; Dimensiones de las paletas
    PADDLE_WIDTH DW 0Eh        ; Ancho de las paletas
    PADDLE_HEIGHT DW 0Eh        ; Alto de las paletas
    
    ; Posiciones de las paletas
    PADDLE_LEFT_X DW 50h       ; Posicion X paleta izquierda
    PADDLE_LEFT_Y DW 0B0h      ; Posicion Y paleta izquierda
    PADDLE_RIGHT_X DW 0F0h      ; Posicion X paleta derecha
    PADDLE_RIGHT_Y DW 0B0h      ; Posicion Y paleta derecha
    
    ; Velocidad de movimiento horizontal de las paletas
    PADDLE_VELOCITY DW 0Fh      
    
    ; Fuerzas verticales al golpear la pelota
    HIT_FORCE_WEAK DW 0FFF7h    ; Fuerza debil -9 
    HIT_FORCE_MEDIUM DW 0FFF2h  ; Fuerza media -14 
    HIT_FORCE_STRONG DW 0FFEEh  ; Fuerza fuerte -18 
    
    ; Velocidades horizontales al golpear la pelota 
    HIT_ANGLE_X_WEAK DW 02h     ; Movimiento horizontal debil
    HIT_ANGLE_X_MEDIUM DW 06h   ; Movimiento horizontal medio
    HIT_ANGLE_X_STRONG DW 08h   ; Movimiento horizontal fuerte
    
    ; Contadores de toques
    TOUCH_COUNT_LEFT   DB 00h   
    TOUCH_COUNT_RIGHT  DB 00h   
    LAST_TOUCH_SIDE    DB 0FFh  ; Ultimo lado que toco (0=izq, 1=der, FF=ninguno)
    MAX_TOUCHES        DB 04h   ; Maximo 4 toques permitidos por lado
    BALL_LAST_SIDE     DB 0FFh  ; Lado donde estaba la pelota (0=izq, 1=der)
    
    ; Ultima tecla presionada por cada jugador
    PADDLE_LEFT_LAST_KEY DB 00h  ; Ultima tecla paleta izquierda
    PADDLE_RIGHT_LAST_KEY DB 00h ; Ultima tecla paleta derecha
      
    ; Sistema de puntuacion
    SCORE_LEFT DB 00h           
    SCORE_RIGHT DB 00h          
    WINNING_SCORE DB 0Ah        ; Puntos necesarios para ganar
    GAME_OVER DB 00h         ; Estado del juego (0=jugando, 1=terminado)
    WINNER_SIDE DB 00h         ; Lado ganador (0=izquierda, 1=derecha)
    
    ; Mensajes de victoria
    MSG_P1_WINS DB 'PLAYER 1 WINS!$'      
    MSG_P2_WINS DB 'PLAYER 2 WINS!$'      
    MSG_RESTART DB 'PRESS R TO RESTART$'  
    MSG_MENU DB 'PRESS M TO GO TO MENU$'  
    
    ; Mensajes del menu principal
    MSG_TITLE DB 'VOLLEYBALL ARCADE$'     
    MSG_PVP DB '1. PLAYER VS PLAYER$'     
    MSG_PVAI DB '2. PLAYER VS AI$'        
    MSG_SELECT DB 'SELECT OPTION (1-2)$' 
    
    ; Configuracion del modo de juego
    AI_MODE DB 00h           ; Modo de juego (0=jugador vs jugador, 1=jugador vs IA)
    AI_VELOCITY DW 08h       
    AI_JUMP_DISTANCE DW 20h  
    
    ; Sprite de la pelota 11x11 pixeles
    ; Colores: 0=negro, 7=gris, 8=gris oscuro, 15=blanco
    BALL_SPRITE_11X11 DB 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h
                      DB 00h, 00h, 08h, 07h, 07h, 0Fh, 07h, 07h, 08h, 00h, 00h
                      DB 00h, 08h, 07h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 07h, 08h, 00h
                      DB 08h, 07h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 07h, 08h
                      DB 08h, 07h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 07h, 08h
                      DB 08h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 08h
                      DB 08h, 07h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 07h, 08h
                      DB 08h, 07h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 07h, 08h
                      DB 00h, 08h, 07h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 07h, 08h, 00h
                      DB 00h, 00h, 08h, 07h, 07h, 0Fh, 07h, 07h, 08h, 00h, 00h
                      DB 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h
    
    ; Sprite del paddle izquierdo 15x15
    
    PADDLE_LEFT_SPRITE_15X15 DB 00h,00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,08h,02h,02h,02h,02h,02h,02h,08h,00h,00h,00h,00h
                              DB 00h,00h,08h,02h,02h,0Ah,0Ah,0Ah,0Ah,02h,02h,08h,00h,00h,00h
                              DB 00h,08h,02h,02h,0Ah,0Fh,0Fh,0Fh,0Ah,0Ah,02h,02h,08h,00h,00h
                              DB 00h,08h,02h,0Ah,0Fh,00h,00h,00h,0Fh,0Ah,0Ah,02h,08h,00h,00h
                              DB 08h,02h,02h,0Ah,0Fh,00h,00h,00h,0Fh,0Ah,02h,02h,02h,08h,00h
                              DB 08h,02h,02h,0Ah,0Fh,0Fh,0Fh,0Fh,0Fh,0Ah,02h,02h,02h,08h,00h
                              DB 08h,02h,02h,02h,0Ah,0Ah,02h,02h,0Ah,02h,02h,02h,02h,08h,00h
                              DB 00h,08h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,08h,00h,00h
                              DB 00h,00h,08h,02h,02h,02h,02h,02h,02h,02h,02h,08h,00h,00h,00h
                              DB 00h,00h,00h,08h,08h,02h,02h,02h,02h,02h,08h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,08h,08h,02h,02h,02h,08h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,00h,08h,08h,02h,08h,08h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,00h,00h,08h,02h,08h,00h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,00h,00h,02h,08h,02h,00h,00h,00h,00h,00h,00h
    
    ; Sprite del paddle derecho
    
    PADDLE_RIGHT_SPRITE_15X15 DB 00h,00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,08h,04h,04h,04h,04h,04h,04h,08h,00h,00h,00h,00h
                              DB 00h,00h,08h,04h,04h,0Ah,0Ah,0Ah,0Ah,04h,04h,08h,00h,00h,00h
                              DB 00h,08h,04h,04h,0Ah,0Fh,0Fh,0Fh,0Ah,0Ah,04h,04h,08h,00h,00h
                              DB 00h,08h,04h,0Ah,0Fh,00h,00h,00h,0Fh,0Ah,0Ah,04h,08h,00h,00h
                              DB 08h,04h,04h,0Ah,0Fh,00h,00h,00h,0Fh,0Ah,04h,04h,04h,08h,00h
                              DB 08h,04h,04h,0Ah,0Fh,0Fh,0Fh,0Fh,0Fh,0Ah,04h,04h,04h,08h,00h
                              DB 08h,04h,04h,04h,0Ah,0Ah,04h,04h,0Ah,04h,04h,04h,04h,08h,00h
                              DB 00h,08h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,08h,00h,00h
                              DB 00h,00h,08h,04h,04h,04h,04h,04h,04h,04h,04h,08h,00h,00h,00h
                              DB 00h,00h,00h,08h,08h,04h,04h,04h,04h,04h,08h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,08h,08h,04h,04h,04h,08h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,00h,08h,08h,04h,08h,08h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,00h,00h,08h,04h,08h,00h,00h,00h,00h,00h,00h
                              DB 00h,00h,00h,00h,00h,00h,04h,08h,04h,00h,00h,00h,00h,00h,00h
    
DATA ENDS

;--------------------------------------------------------
CODE SEGMENT PARA 'CODE'
    MAIN PROC FAR
        ASSUME CS:CODE,DS:DATA,SS:STACK
        PUSH DS        
        SUB AX,AX
        PUSH AX        
        MOV AX,DATA
        MOV DS,AX
        POP AX
        POP AX
        
        CALL CLEAR_SCREEN
        CALL SHOW_MENU
        
        RET
    MAIN ENDP
    
;---------------------------------------------------------
    DRAW_MENU PROC NEAR
        ; Titulo
        MOV AH, 02h   ; Posiciona el cursor
        MOV BH, 00h
        MOV DH, 08h   ; Fila    
        MOV DL, 0Ch   ; Columna
        INT 10h       ; Servicio de video
        
        LEA SI, MSG_TITLE  ;Carga direccion del mensaje en el registro SI
        MOV AH, 0Eh   ; escribir la letra
        MOV BL, 0Fh
        
    PRINT_TITLE:
        LODSB
        CMP AL, '$'
        JE TITLE_DONE
        INT 10h
        JMP PRINT_TITLE
        
    TITLE_DONE:
        ; Opcion 1 - Player vs Player
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 0Bh
        MOV DL, 0Ch
        INT 10h
        
        LEA SI, MSG_PVP
        MOV AH, 0Eh
        MOV BL, 0Ah
        
    PRINT_PVP:
        LODSB
        CMP AL, '$'
        JE PVP_DONE
        INT 10h
        JMP PRINT_PVP
        
    PVP_DONE:
        ; Opcion 2 - Player vs IA
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 0Dh
        MOV DL, 0Ch
        INT 10h
        
        LEA SI, MSG_PVAI
        MOV AH, 0Eh
        MOV BL, 0Ch
        
    PRINT_PVAI:
        LODSB
        CMP AL, '$'
        JE PVAI_DONE
        INT 10h
        JMP PRINT_PVAI
        
    PVAI_DONE:
        ; Mensaje de seleccion
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 0Fh
        MOV DL, 0Ch
        INT 10h
        
        LEA SI, MSG_SELECT
        MOV AH, 0Eh
        MOV BL, 0Fh
        
    PRINT_SELECT:
        LODSB
        CMP AL, '$'
        JE SELECT_DONE
        INT 10h
        JMP PRINT_SELECT
        
    SELECT_DONE:
        RET
    DRAW_MENU ENDP
    
;---------------------------------------------------------
    SHOW_MENU PROC NEAR
        CALL DRAW_MENU
        
    MENU_LOOP:
        MOV AH, 00h
        INT 16h        ;leer el teclado
        
        CMP AL, 31h    ; '1'   
        JE START_PVP
        CMP AL, 32h    ; '2'
        JE START_PVAI
        JMP MENU_LOOP
        
    START_PVP:
        CALL CLEAR_SCREEN
        CALL GAME_PVP
        CALL CLEAR_SCREEN
        CALL SHOW_MENU
        JMP MENU_LOOP
        
    START_PVAI:
        CALL CLEAR_SCREEN
        CALL GAME_PVAI
        CALL CLEAR_SCREEN
        CALL SHOW_MENU
        JMP MENU_LOOP
        
    SHOW_MENU ENDP
    
;---------------------------------------------------------
    GAME_PVP PROC NEAR
        ; Desactivar modo AI
        MOV AI_MODE, 00h
        
        ; Reiniciar variables del juego
        MOV SCORE_LEFT, 00h
        MOV SCORE_RIGHT, 00h
        MOV GAME_OVER, 00h
        MOV BALL_ACTIVE, 00h
        MOV BALL_X, 50h
        MOV BALL_Y, 8Ch
        MOV BALL_VELOCITY_X, 00h
        MOV BALL_VELOCITY_Y, 00h
        MOV BALL_SPAWN_SIDE, 00h
        
        MOV PADDLE_LEFT_LAST_KEY, 44h    ; Por defecto 'D' (derecha)
        MOV PADDLE_RIGHT_LAST_KEY, 4Ah   ; Por defecto 'J' (izquierda)
        
        CALL RESET_TOUCH_COUNTERS
        MOV BALL_LAST_SIDE, 0FFh
        
    CHECK_TIME:
        MOV AH,2Ch       ; tiempo del sistema
        INT 21h
        CMP DL,TIME_AUX
        JE CHECK_TIME
        MOV TIME_AUX,DL
        
        CMP GAME_OVER, 01h
        JE SHOW_WINNER_SCREEN
        
        CALL CLEAR_SCREEN
        CALL DRAW_NET
        CALL DRAW_SCORE
        CALL MOVE_BALL
        CALL MOVE_PADDLES
        CALL DRAW_BALL
        CALL DRAW_PADDLES
        
        JMP CHECK_TIME
        
    SHOW_WINNER_SCREEN:
        CALL CLEAR_SCREEN

        ; Mostrar mensaje de victoria
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 0Ch
        MOV DL, 0Fh
        INT 10h
        
        ; Determinar ganador
        CMP WINNER_SIDE, 00h
        JE SHOW_LEFT_WIN
        
    SHOW_RIGHT_WIN:
        LEA SI, MSG_P2_WINS    
        JMP PRINT_WINNER
        
    SHOW_LEFT_WIN:
        LEA SI, MSG_P1_WINS    
        
    PRINT_WINNER:
        MOV AH, 0Eh
        MOV BL, 0Fh
        
    PRINT_LOOP:
        LODSB
        CMP AL, '$'
        JE WINNER_DONE
        INT 10h
        JMP PRINT_LOOP
        
    WINNER_DONE:
        ; Mostrar "PRESS R TO RESTART"
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 0Eh
        MOV DL, 0Dh
        INT 10h
        
        LEA SI, MSG_RESTART    

    PRINT_RESTART:
        LODSB
        CMP AL, '$'
        JE PRINT_MENU_MSG
        MOV AH, 0Eh
        INT 10h
        JMP PRINT_RESTART
        
    PRINT_MENU_MSG:
        ; Mostrar "PRESS M TO GO TO MENU"
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 10h
        MOV DL, 0Dh
        INT 10h
        
        LEA SI, MSG_MENU
        
    PRINT_MENU:
        LODSB
        CMP AL, '$'
        JE WAIT_RESTART
        MOV AH, 0Eh
        INT 10h
        JMP PRINT_MENU
        
    WAIT_RESTART:
        MOV AH, 00h
        INT 16h
        CMP AL, 52h    ; 'R'
        JE RESTART_GAME
        CMP AL, 72h    ; 'r'
        JE RESTART_GAME
        CMP AL, 4Dh    ; 'M'
        JE RETURN_TO_MENU
        CMP AL, 6Dh    ; 'm'
        JE RETURN_TO_MENU
        JMP WAIT_RESTART
        
    RETURN_TO_MENU:
        RET
        
    RESTART_GAME:
        ; Reiniciar variables
        MOV SCORE_LEFT, 00h
        MOV SCORE_RIGHT, 00h
        MOV GAME_OVER, 00h
        MOV BALL_ACTIVE, 00h
        MOV BALL_X, 50h
        MOV BALL_Y, 8Ch
        MOV BALL_VELOCITY_X, 00h
        MOV BALL_VELOCITY_Y, 00h
        MOV BALL_SPAWN_SIDE, 00h
        
        MOV PADDLE_LEFT_LAST_KEY, 44h    ; Por defecto 'D' (derecha)
        MOV PADDLE_RIGHT_LAST_KEY, 4Ah   ; Por defecto 'J' (izquierda)
        
        CALL RESET_TOUCH_COUNTERS
        MOV BALL_LAST_SIDE, 0FFh
        
        JMP CHECK_TIME
        
        RET
    GAME_PVP ENDP
    
;---------------------------------------------------------
    GAME_PVAI PROC NEAR
        ; Activar modo IA
        MOV AI_MODE, 01h
        
        ; Reiniciar variables del juego
        MOV SCORE_LEFT, 00h
        MOV SCORE_RIGHT, 00h
        MOV GAME_OVER, 00h
        MOV BALL_ACTIVE, 00h
        MOV BALL_X, 50h
        MOV BALL_Y, 8Ch
        MOV BALL_VELOCITY_X, 00h
        MOV BALL_VELOCITY_Y, 00h
        MOV BALL_SPAWN_SIDE, 00h
        
        MOV PADDLE_LEFT_LAST_KEY, 44h    ; Por defecto 'D' (derecha)
        MOV PADDLE_RIGHT_LAST_KEY, 4Ah   ; Por defecto 'J' (izquierda)
        
        CALL RESET_TOUCH_COUNTERS
        MOV BALL_LAST_SIDE, 0FFh
        
    CHECK_TIME_AI:
        MOV AH,2Ch
        INT 21h
        CMP DL,TIME_AUX
        JE CHECK_TIME_AI
        MOV TIME_AUX,DL
        
        CMP GAME_OVER, 01h
        JE SHOW_WINNER_SCREEN_AI
        
        CALL CLEAR_SCREEN
        CALL DRAW_NET
        CALL DRAW_SCORE
        CALL MOVE_BALL
        CALL MOVE_PADDLES
        CALL DRAW_BALL
        CALL DRAW_PADDLES
        
        JMP CHECK_TIME_AI
        
    SHOW_WINNER_SCREEN_AI:
        CALL CLEAR_SCREEN

        ; Mostrar mensaje de victoria
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 0Ch
        MOV DL, 0Fh
        INT 10h
        
        ; Determinar ganador
        CMP WINNER_SIDE, 00h
        JE SHOW_LEFT_WIN_AI
        
    SHOW_RIGHT_WIN_AI:
        LEA SI, MSG_P2_WINS
        JMP PRINT_WINNER_AI
        
    SHOW_LEFT_WIN_AI:
        LEA SI, MSG_P1_WINS
        
    PRINT_WINNER_AI:
        MOV AH, 0Eh
        MOV BL, 0Fh
        
    PRINT_LOOP_AI:
        LODSB
        CMP AL, '$'
        JE WINNER_DONE_AI
        INT 10h
        JMP PRINT_LOOP_AI
        
    WINNER_DONE_AI:
        ; Mostrar "PRESS R TO RESTART"
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 0Eh
        MOV DL, 0Dh
        INT 10h
        
        LEA SI, MSG_RESTART

    PRINT_RESTART_AI:
        LODSB
        CMP AL, '$'
        JE PRINT_MENU_MSG_AI
        MOV AH, 0Eh
        INT 10h
        JMP PRINT_RESTART_AI
        
    PRINT_MENU_MSG_AI:
        ; Mostrar "PRESS M TO GO TO MENU"
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 10h
        MOV DL, 0Dh
        INT 10h
        
        LEA SI, MSG_MENU
        
    PRINT_MENU_AI:
        LODSB
        CMP AL, '$'
        JE WAIT_RESTART_AI
        MOV AH, 0Eh
        INT 10h
        JMP PRINT_MENU_AI
        
    WAIT_RESTART_AI:
        MOV AH, 00h
        INT 16h
        CMP AL, 52h    ; 'R'
        JE RESTART_GAME_AI
        CMP AL, 72h    ; 'r'
        JE RESTART_GAME_AI
        CMP AL, 4Dh    ; 'M'
        JE RETURN_TO_MENU_AI
        CMP AL, 6Dh    ; 'm'
        JE RETURN_TO_MENU_AI
        JMP WAIT_RESTART_AI
        
    RETURN_TO_MENU_AI:
        RET
        
    RESTART_GAME_AI:
        ; Reiniciar variables
        MOV SCORE_LEFT, 00h
        MOV SCORE_RIGHT, 00h
        MOV GAME_OVER, 00h
        MOV BALL_ACTIVE, 00h
        MOV BALL_X, 50h
        MOV BALL_Y, 8Ch
        MOV BALL_VELOCITY_X, 00h
        MOV BALL_VELOCITY_Y, 00h
        MOV BALL_SPAWN_SIDE, 00h
        
        MOV PADDLE_LEFT_LAST_KEY, 44h    ; Por defecto 'D' (derecha)
        MOV PADDLE_RIGHT_LAST_KEY, 4Ah   ; Por defecto 'J' (izquierda)
        
        CALL RESET_TOUCH_COUNTERS
        MOV BALL_LAST_SIDE, 0FFh
        
        JMP CHECK_TIME_AI
        
        RET
    GAME_PVAI ENDP

;----------------------------------------------------
    MOVE_BALL PROC NEAR
        ; Verificar si la bola esta inactiva
        CMP BALL_ACTIVE, 00h
        JNE BALL_IS_ACTIVE
        CALL CHECK_PADDLE_COLLISION
        RET
        
    BALL_IS_ACTIVE:
        ; Movimiento horizontal
        MOV AX, BALL_VELOCITY_X
        ADD BALL_X, AX
        
        ; Verificar limites horizontales
        MOV AX, WINDOW_BOUNDS
        CMP BALL_X, AX
        JGE CHECK_RIGHT_BOUND
        
        ; Bola toco borde izquierdo - ajustar posicion y rebotar
        MOV BALL_X, AX
        NEG BALL_VELOCITY_X
        JMP APPLY_GRAVITY
        
    CHECK_RIGHT_BOUND:
        MOV AX, WINDOW_WIDTH
        SUB AX, BALL_SIZE
        SUB AX, WINDOW_BOUNDS
        CMP BALL_X, AX
        JLE APPLY_GRAVITY
        
        ; Bola toco borde derecho - ajustar posicion y rebotar
        MOV BALL_X, AX
        NEG BALL_VELOCITY_X
        
    APPLY_GRAVITY:
        ; Aplicar gravedad
        MOV AX, GRAVITY
        ADD BALL_VELOCITY_Y, AX
        
        ; Limitar velocidad maxima en Y
        MOV AX, BALL_VELOCITY_Y
        CMP AX, 0
        JL CHECK_NEGATIVE_LIMIT    ; Si es negativa, verificar limite hacia arriba
        
        ; Limitar velocidad positiva (cayendo)
        CMP AX, 15                 ; Maximo 15 
        JLE VELOCITY_Y_OK
        MOV BALL_VELOCITY_Y, 15
        JMP VELOCITY_Y_OK
        
    CHECK_NEGATIVE_LIMIT:
        ; Limitar velocidad negativa (subiendo)
        CMP AX, 0FFF0h             ; -16 
        JGE VELOCITY_Y_OK
        MOV BALL_VELOCITY_Y, 0FFF0h ; Maximo -16 pixels
        
    VELOCITY_Y_OK:
        MOV AX, BALL_VELOCITY_Y
        ADD BALL_Y, AX
        
        ; Verificar si la bola esta activa 
        CMP BALL_ACTIVE, 01h
        JNE SKIP_NET_CROSSING_CHECK
        CALL CHECK_NET_CROSSING
    SKIP_NET_CROSSING_CHECK:

        ; Verificar limite superior
        MOV AX, WINDOW_BOUNDS 
        
    CHECK_GROUND:
        ; Verificar si toco el suelo
        MOV AX, WINDOW_HEIGHT
        SUB AX, BALL_SIZE
        SUB AX, WINDOW_BOUNDS
        CMP BALL_Y, AX
        JG BALL_HIT_GROUND
        
        ; Verificar colision con paddles
        CALL CHECK_PADDLE_COLLISION
        
        ; Verificar colision con la red
        MOV AX, BALL_Y
        ADD AX, BALL_SIZE
        CMP AX, 064h
        JL SKIP_NET_CHECK
        
        ; Verificar colision horizontal con la red
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        CMP AX, NET_X
        JL SKIP_NET_CHECK
        
        MOV AX, BALL_X
        MOV BX, NET_X
        ADD BX, 04h
        CMP AX, BX
        JG SKIP_NET_CHECK
        
        ; Hay colision con red
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JG COLLISION_FROM_LEFT
        
    COLLISION_FROM_RIGHT:
        MOV AX, NET_X
        ADD AX, 04h
        MOV BALL_X, AX
        JMP FIX_VEL
        
    COLLISION_FROM_LEFT:
        MOV AX, NET_X
        SUB AX, BALL_SIZE
        MOV BALL_X, AX
        
    FIX_VEL:
        NEG BALL_VELOCITY_X
        
    SKIP_NET_CHECK:
        RET
        
    BALL_HIT_GROUND:
        ; Detectar en que lado cayo
        MOV AX, BALL_X
        CMP AX, NET_X
        JL FELL_ON_LEFT_SIDE
        
    FELL_ON_RIGHT_SIDE:
        MOV BALL_SPAWN_SIDE, 00h
        MOV AX, BALL_SPAWN_LEFT_X
        MOV BALL_X, AX
        MOV AX, BALL_SPAWN_LEFT_Y
        MOV BALL_Y, AX
        JMP DESACTIVATE_BALL
        
    FELL_ON_LEFT_SIDE:
        MOV BALL_SPAWN_SIDE, 01h
        MOV AX, BALL_SPAWN_RIGHT_X
        MOV BALL_X, AX
        MOV AX, BALL_SPAWN_RIGHT_Y
        MOV BALL_Y, AX
        
    DESACTIVATE_BALL:
        MOV BALL_VELOCITY_X, 00h
        MOV BALL_VELOCITY_Y, 00h
        MOV BALL_ACTIVE, 00h
        
        ; Reposicionar paddle derecho (AI) cuando se reinicia el balon
        CMP AI_MODE, 01h
        JNE SKIP_AI_RESET_POSITION
        MOV PADDLE_RIGHT_X, 0F0h
        MOV PADDLE_RIGHT_Y, 0B0h
        MOV PADDLE_RIGHT_VY, 00h
        MOV PADDLE_RIGHT_ON_GROUND, 01h
    SKIP_AI_RESET_POSITION:
        
        CALL RESET_TOUCH_COUNTERS      ; Resetear contadores al anotar
        
        ; INCREMENTAR PUNTOS 
        ; Si spawn lado izquierdo = punto para DERECHA
        ; Si spawn lado derecho = punto para IZQUIERDA
        
        CMP BALL_SPAWN_SIDE, 00h
        JE POINT_FOR_LEFT
        
        
    POINT_FOR_RIGHT:
        INC SCORE_RIGHT
        CALL PLAY_SCORE_SOUND
        JMP CHECK_WINNER
        
    POINT_FOR_LEFT:
        
        INC SCORE_LEFT
        CALL PLAY_SCORE_SOUND
        
    CHECK_WINNER:
        ; Verificar si alguien llego a 15 puntos
        MOV AL, SCORE_LEFT
        CMP AL, WINNING_SCORE
        JGE LEFT_WINS
        
        MOV AL, SCORE_RIGHT
        CMP AL, WINNING_SCORE
        JGE RIGHT_WINS
        
        RET             ; Nadie gano todavia
        
    LEFT_WINS:
        MOV GAME_OVER, 01h
        MOV WINNER_SIDE, 00h
        RET
        
    RIGHT_WINS:
        MOV GAME_OVER, 01h
        MOV WINNER_SIDE, 01h
        RET
    MOVE_BALL ENDP
    
;---------------------------------------------------------
    CALCULATE_HIT_FORCE PROC NEAR
        ; INPUT
        ; BX = PADDLE_Y
        ; DX = PADDLE_HEIGHT
        ; SI = PADDLE_X
        
        ; OUTPUT
        ; AX = Fuerza vertical (Y)
        ; BX = Fuerza horizontal (X) 
        
        PUSH SI  ; Guardar SI
        
        ; CALCULAR FUERZA VERTICAL
        ; Calcular centro vertical del paddle
        MOV AX, BX
        ADD AX, DX
        SHR AX, 1
        MOV CX, AX
        
        ; Calcular centro vertical de la pelota
        MOV AX, BALL_Y
        ADD AX, BALL_SIZE
        SHR AX, 1
        
        ; Calcular distancia desde el centro
        SUB AX, CX
        
        ; Obtener valor absoluto
        CMP AX, 0
        JGE POSITIVE_DIST
        NEG AX
        
    POSITIVE_DIST:
        ; Determinar fuerza segun distancia
        CMP AX, 02h
        JLE STRONG_HIT_CALC
        CMP AX, 06h
        JLE MEDIUM_HIT_CALC
        
    WEAK_HIT_CALC:
        MOV AX, HIT_FORCE_WEAK
        MOV BX, HIT_ANGLE_X_WEAK
        JMP CALCULATE_DIRECTION
        
    MEDIUM_HIT_CALC:
        MOV AX, HIT_FORCE_MEDIUM
        MOV BX, HIT_ANGLE_X_MEDIUM
        JMP CALCULATE_DIRECTION
        
    STRONG_HIT_CALC:
        MOV AX, HIT_FORCE_STRONG
        MOV BX, HIT_ANGLE_X_STRONG
        
        ; CALCULAR DIRECCION HORIZONTAL
    CALCULATE_DIRECTION:
        PUSH AX  ; Guardar fuerza Y
        
        ; Calcular centro horizontal del paddle
        MOV DI, SI
        ADD DI, PADDLE_WIDTH                            
        SHR DI, 1
        
        ; Calcular centro horizontal de la bola
        MOV CX, BALL_X
        ADD CX, BALL_SIZE
        SHR CX, 1
        
        ; Comparar posiciones
        CMP CX, DI
        JL HIT_LEFT_SIDE
        JE HIT_CENTER
        
        ; Golpee lado DERECHO - bola va a la IZQUIERDA
    HIT_RIGHT_SIDE:
        NEG BX
        JMP DONE_DIRECTION
        
        ; Golpe lado IZQUIERDO - bola va a la DERECHA
    HIT_LEFT_SIDE:

        JMP DONE_DIRECTION
        
        ; Golpe el CENTRO
    HIT_CENTER:
        MOV BX, 02h
        CMP BALL_VELOCITY_X, 0
        JL CENTER_KEEP_LEFT
        JMP DONE_DIRECTION
        
    CENTER_KEEP_LEFT:
        NEG BX
        
    DONE_DIRECTION:
        POP AX   ; Recuperar fuerza Y
        POP SI   ; Restaura SI
        RET
    CALCULATE_HIT_FORCE ENDP
    
    ;------------------------------------------------------------------
    CHECK_PADDLE_COLLISION PROC NEAR
        ; COLISION LEFT PADDLE 
        MOV AX, BALL_Y        ; Y superior pelota
        ADD AX, BALL_SIZE     ; AX = BALL_Y + BALL_SIZE
        CMP AX, PADDLE_LEFT_Y ; Comparar con Y superior paddle
        JA LEFT_CHECK_BOTTOM  ; Si es mayor, posible colision
        JMP CHECK_RIGHT_PADDLE ; No colisiona verticalmente
    
    LEFT_CHECK_BOTTOM:
        ; Borde SUPERIOR de pelota < borde inferior de paddle?
        MOV BX, PADDLE_LEFT_Y      ; BX = Y superior paddle
        ADD BX, PADDLE_HEIGHT      ; BX = Y inferior paddle
        CMP BALL_Y, BX             ; Comparar Y superior pelota
        JB LEFT_VERTICAL_OK        ; Si es menor, colision vertical
        JMP CHECK_RIGHT_PADDLE     ; No colisiona
    
    LEFT_VERTICAL_OK:
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        CMP AX, PADDLE_LEFT_X
        JAE SKIP_CHECK_RIGHT_1
        JMP CHECK_RIGHT_PADDLE
    SKIP_CHECK_RIGHT_1:
        
        MOV BX, PADDLE_LEFT_X
        ADD BX, PADDLE_WIDTH
        CMP BALL_X, BX
        JBE SKIP_CHECK_RIGHT_2
        JMP CHECK_RIGHT_PADDLE
    SKIP_CHECK_RIGHT_2:
        
        ; COLISION DETECTADA CON PADDLE IZQUIERDO
        
        ; AJUSTAR POSICION X
        MOV AX, PADDLE_LEFT_X
        ADD AX, PADDLE_WIDTH
        MOV BALL_X, AX
        
        ; Verificar si la bola estaba inactiva
        CMP BALL_ACTIVE, 00h
        JNE LEFT_BALL_ALREADY_ACTIVE
        
        ; Activar bola
        MOV BALL_ACTIVE, 01h
        MOV BALL_VELOCITY_X, 05h
        
        ; Calcular fuerza
        MOV BX, PADDLE_LEFT_Y
        MOV DX, PADDLE_HEIGHT
        CALL CALCULATE_HIT_FORCE
        MOV BALL_VELOCITY_Y, AX
        
        ; Registrar primer toque
        MOV AL, 00h
        CALL HANDLE_TOUCH
        JNC LEFT_BONUS_CHECK        ; Si no hay violacion, continuar
        JMP LEFT_TOUCH_VIOLATION    ; Si hay violacion, saltar
        
    LEFT_BONUS_CHECK:
        ; Bonus de salto
        MOV AX, PADDLE_LEFT_VY
        CMP AX, 0
        JGE LEFT_EXIT_NEAR
        SAR AX, 1
        ADD BALL_VELOCITY_Y, AX
        
    LEFT_EXIT_NEAR:
        JMP LEFT_DONE
        
    LEFT_BALL_ALREADY_ACTIVE:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JG LEFT_ALREADY_GOING_RIGHT
        NEG BALL_VELOCITY_X
        
    LEFT_ALREADY_GOING_RIGHT:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JG LEFT_VX_OK
        NEG AX
        MOV BALL_VELOCITY_X, AX
        
    LEFT_VX_OK:
        MOV BX, PADDLE_LEFT_Y
        MOV DX, PADDLE_HEIGHT
        CALL CALCULATE_HIT_FORCE
        MOV BALL_VELOCITY_Y, AX
        
        ; Registrar toque del jugador izquierdo
        MOV AL, 00h
        CALL HANDLE_TOUCH
        JNC LEFT_DIRECTION_CHECK    ; Si no hay violacion
        JMP LEFT_TOUCH_VIOLATION    ; Si hay violacion
        
    LEFT_DIRECTION_CHECK:
        ; Aplicar direccion segun ultima tecla
        MOV AL, PADDLE_LEFT_LAST_KEY
        CMP AL, 41h
        JE LEFT_DIRECTION_LEFT
        CMP AL, 61h
        JE LEFT_DIRECTION_LEFT
        
    LEFT_DIRECTION_RIGHT:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JG LEFT_APPLY_BONUS
        NEG AX
        MOV BALL_VELOCITY_X, AX
        JMP LEFT_APPLY_BONUS
        
    LEFT_DIRECTION_LEFT:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JL LEFT_APPLY_BONUS
        NEG AX
        MOV BALL_VELOCITY_X, AX
        
    LEFT_APPLY_BONUS:
        MOV AX, PADDLE_LEFT_VY
        CMP AX, 0
        JGE LEFT_DONE
        SAR AX, 1
        ADD BALL_VELOCITY_Y, AX
        JMP LEFT_DONE
        
    LEFT_TOUCH_VIOLATION:
        ; 4 toques - punto para el oponente
        INC SCORE_RIGHT
        CALL PLAY_SCORE_SOUND
        
        ; Resetear bola en lado izquierdo (punto para derecha)
        MOV BALL_SPAWN_SIDE, 01h
        MOV AX, BALL_SPAWN_RIGHT_X
        MOV BALL_X, AX
        MOV AX, BALL_SPAWN_RIGHT_Y
        MOV BALL_Y, AX
        MOV BALL_VELOCITY_X, 00h
        MOV BALL_VELOCITY_Y, 00h
        MOV BALL_ACTIVE, 00h
        
        ; Reposicionar paddle derecho (AI) cuando se reinicia el balon
        CMP AI_MODE, 01h
        JNE SKIP_AI_RESET_POSITION_LEFT_VIOLATION
        MOV PADDLE_RIGHT_X, 0F0h
        MOV PADDLE_RIGHT_Y, 0B0h
        MOV PADDLE_RIGHT_VY, 00h
        MOV PADDLE_RIGHT_ON_GROUND, 01h
    SKIP_AI_RESET_POSITION_LEFT_VIOLATION:
        
        ; Resetear contadores
        CALL RESET_TOUCH_COUNTERS
        
        ; Verificar ganador
        MOV AL, SCORE_RIGHT
        CMP AL, WINNING_SCORE
        JGE RIGHT_WINS_VIOLATION
        RET
        
    RIGHT_WINS_VIOLATION:
        MOV GAME_OVER, 01h
        MOV WINNER_SIDE, 01h
        RET
        
    LEFT_DONE:
        RET
    
        ;COLISION RIGHT PADDLE
    CHECK_RIGHT_PADDLE:
        MOV AX, BALL_Y
        ADD AX, BALL_SIZE
        CMP AX, PADDLE_RIGHT_Y
        JA RIGHT_CHECK_BOTTOM
        JMP NO_COLLISION
        
    RIGHT_CHECK_BOTTOM:
        MOV BX, PADDLE_RIGHT_Y
        ADD BX, PADDLE_HEIGHT
        CMP BALL_Y, BX
        JB RIGHT_VERTICAL_OK
        JMP NO_COLLISION
    
    RIGHT_VERTICAL_OK:
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        CMP AX, PADDLE_RIGHT_X
        JAE RIGHT_HORIZONTAL_OK
        JMP NO_COLLISION
        
    RIGHT_HORIZONTAL_OK:
        MOV AX, PADDLE_RIGHT_X
        ADD AX, PADDLE_WIDTH
        CMP BALL_X, AX
        JBE SKIP_NO_COLLISION
        JMP NO_COLLISION
    SKIP_NO_COLLISION:
        
        ; COLISION DETECTADA CON PADDLE DERECHO
        
        ; AJUSTAR POSICION X
        MOV AX, PADDLE_RIGHT_X
        SUB AX, BALL_SIZE
        MOV BALL_X, AX
        
        ; Verificar si la bola estaba inactiva
        CMP BALL_ACTIVE, 00h
        JNE RIGHT_BALL_ALREADY_ACTIVE
        
        ; Activar bola
        MOV BALL_ACTIVE, 01h
        MOV AX, 05h
        NEG AX
        MOV BALL_VELOCITY_X, AX
        
        ; Calcular fuerza
        MOV BX, PADDLE_RIGHT_Y
        MOV DX, PADDLE_HEIGHT
        CALL CALCULATE_HIT_FORCE
        MOV BALL_VELOCITY_Y, AX
        
        ; Registrar primer toque
        MOV AL, 01h
        CALL HANDLE_TOUCH
        JNC RIGHT_BONUS_CHECK       ; Si no hay violacion
        JMP RIGHT_TOUCH_VIOLATION   ; Si hay violacion
        
    RIGHT_BONUS_CHECK:
        ; Bonus de salto
        MOV AX, PADDLE_RIGHT_VY
        CMP AX, 0
        JGE RIGHT_EXIT_NEAR
        SAR AX, 1
        ADD BALL_VELOCITY_Y, AX
        
    RIGHT_EXIT_NEAR:
        JMP RIGHT_DONE
        
    RIGHT_BALL_ALREADY_ACTIVE:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JL RIGHT_ALREADY_GOING_LEFT
        NEG BALL_VELOCITY_X
        
    RIGHT_ALREADY_GOING_LEFT:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JL RIGHT_VX_OK
        NEG AX
        MOV BALL_VELOCITY_X, AX
        
    RIGHT_VX_OK:
        MOV BX, PADDLE_RIGHT_Y
        MOV DX, PADDLE_HEIGHT
        CALL CALCULATE_HIT_FORCE
        MOV BALL_VELOCITY_Y, AX
        
        ; Registrar toque del jugador derecho
        MOV AL, 01h
        CALL HANDLE_TOUCH
        JNC RIGHT_DIRECTION_CHECK   ; Si no hay violacion
        JMP RIGHT_TOUCH_VIOLATION   ; Si hay violacion
        
    RIGHT_DIRECTION_CHECK:
        ; Aplicar direccion segun ultima tecla
        MOV AL, PADDLE_RIGHT_LAST_KEY
        CMP AL, 4Ah
        JE RIGHT_DIRECTION_LEFT
        CMP AL, 6Ah
        JE RIGHT_DIRECTION_LEFT
        
    RIGHT_DIRECTION_RIGHT:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JG RIGHT_APPLY_BONUS
        NEG AX
        MOV BALL_VELOCITY_X, AX
        JMP RIGHT_APPLY_BONUS
        
    RIGHT_DIRECTION_LEFT:
        MOV AX, BALL_VELOCITY_X
        CMP AX, 0
        JL RIGHT_APPLY_BONUS
        NEG AX
        MOV BALL_VELOCITY_X, AX
        
    RIGHT_APPLY_BONUS:
        MOV AX, PADDLE_RIGHT_VY
        CMP AX, 0
        JGE RIGHT_DONE
        SAR AX, 1
        ADD BALL_VELOCITY_Y, AX
        JMP RIGHT_DONE
        
    RIGHT_TOUCH_VIOLATION:
        ; 4 toques - punto para el oponente
        INC SCORE_LEFT
        CALL PLAY_SCORE_SOUND
        
        ; Resetear bola en lado derecho (punto para izquierda)
        MOV BALL_SPAWN_SIDE, 00h
        MOV AX, BALL_SPAWN_LEFT_X
        MOV BALL_X, AX
        MOV AX, BALL_SPAWN_LEFT_Y
        MOV BALL_Y, AX
        MOV BALL_VELOCITY_X, 00h
        MOV BALL_VELOCITY_Y, 00h
        MOV BALL_ACTIVE, 00h
        
        ; Reposicionar paddle derecho (AI) cuando se reinicia el balon
        CMP AI_MODE, 01h
        JNE SKIP_AI_RESET_POSITION_RIGHT_VIOLATION
        MOV PADDLE_RIGHT_X, 0F0h
        MOV PADDLE_RIGHT_Y, 0B0h
        MOV PADDLE_RIGHT_VY, 00h
        MOV PADDLE_RIGHT_ON_GROUND, 01h
    SKIP_AI_RESET_POSITION_RIGHT_VIOLATION:
        
        ; Resetear contadores
        CALL RESET_TOUCH_COUNTERS
        
        ; Verificar ganador
        MOV AL, SCORE_LEFT
        CMP AL, WINNING_SCORE
        JGE LEFT_WINS_VIOLATION
        RET
        
    LEFT_WINS_VIOLATION:
        MOV GAME_OVER, 01h
        MOV WINNER_SIDE, 00h
        RET
        
    RIGHT_DONE:
        RET
        
    NO_COLLISION:
        RET
    
    CHECK_PADDLE_COLLISION ENDP    
    ;---------------------------------------------------------
    
    
    ; contador de toques cuando un paddle golpea
    ; Entrada: AL = lado que toco (0=izquierdo, 1=derecho)
    ;------------------------------------------------------------------
    HANDLE_TOUCH PROC NEAR
        PUSH AX
        PUSH BX
        
        ; Verificar si es el mismo lado que la ultima vez
        CMP AL, LAST_TOUCH_SIDE
        JE SAME_SIDE_TOUCH
        
        ; OTRO lado - resetear contador del lado actual e incrementar el nuevo
    DIFFERENT_SIDE_TOUCH:
        CMP AL, 00h
        JE TOUCH_FROM_LEFT
        
        ; Toque desde derecha
    TOUCH_FROM_RIGHT:
        MOV TOUCH_COUNT_LEFT, 00h      ; Resetear contador izquierdo
        INC TOUCH_COUNT_RIGHT        ; Incrementar contador derecho
        MOV LAST_TOUCH_SIDE, 01h       ; Actualizar ultimo lado
        
        ; Verificar
        MOV BL, TOUCH_COUNT_RIGHT
        CMP BL, MAX_TOUCHES
        JGE TOUCH_VIOLATION
        JMP TOUCH_OK
        
        ; Toque desde izquierda
    TOUCH_FROM_LEFT:
        MOV TOUCH_COUNT_RIGHT, 00h     ; Resetear contador derecho
        INC TOUCH_COUNT_LEFT         ; Incrementar contador izquierdo
        MOV LAST_TOUCH_SIDE, 00h       ; Actualizar ultimo lado
        
        ; Verificar 
        MOV BL, TOUCH_COUNT_LEFT
        CMP BL, MAX_TOUCHES
        JGE TOUCH_VIOLATION
        JMP TOUCH_OK
        
        ; Mismo lado toco de nuevo
    SAME_SIDE_TOUCH:
        CMP AL, 00h
        JE INCREMENT_LEFT
        
    INCREMENT_RIGHT:
        INC TOUCH_COUNT_RIGHT
        MOV BL, TOUCH_COUNT_RIGHT
        CMP BL, MAX_TOUCHES
        JGE TOUCH_VIOLATION
        JMP TOUCH_OK
        
    INCREMENT_LEFT:
        INC TOUCH_COUNT_LEFT
        MOV BL, TOUCH_COUNT_LEFT
        CMP BL, MAX_TOUCHES
        JGE TOUCH_VIOLATION
        JMP TOUCH_OK
        
    TOUCH_VIOLATION:
        STC                            ; Set Carry Flag (violacion)
        POP BX
        POP AX
        RET
        
    TOUCH_OK:
        CLC                            ; Clear Carry Flag (OK)
        POP BX
        POP AX
        RET
    HANDLE_TOUCH ENDP
    
    
    ; Resetea contadores cuando cruza la red
    ;------------------------------------------------------------------
    RESET_TOUCH_COUNTERS PROC NEAR
        MOV TOUCH_COUNT_LEFT, 00h
        MOV TOUCH_COUNT_RIGHT, 00h
        MOV LAST_TOUCH_SIDE, 0FFh
        RET
    RESET_TOUCH_COUNTERS ENDP
    
    
    ; Verifica si la bola cruzo la red
    ;------------------------------------------------------------------
    CHECK_NET_CROSSING PROC NEAR
        PUSH AX
        PUSH BX
        
        ; Determinar en que lado esta la bola AHORA
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        SHR AX, 1              ; Centro X de la bola
        
        MOV BX, NET_X
        ADD BX, 02h            ; Centro de la red
        
        CMP AX, BX
        JL BALL_ON_LEFT_SIDE
        
        ; Bola esta en lado DERECHO
    BALL_ON_RIGHT_SIDE:
        CMP BALL_LAST_SIDE, 00h    
        JE NET_CROSSED_LEFT_TO_RIGHT
        MOV BALL_LAST_SIDE, 01h    ; Actualizar posicion
        JMP END_NET_CHECK
        
        ; Bola esta en lado IZQUIERDO
    BALL_ON_LEFT_SIDE:
        CMP BALL_LAST_SIDE, 01h    ; 
        JE NET_CROSSED_RIGHT_TO_LEFT
        MOV BALL_LAST_SIDE, 00h    ; Actualizar posicion
        JMP END_NET_CHECK
        
        ; La bola cruzo de izquierda a derecha
    NET_CROSSED_LEFT_TO_RIGHT:
        CALL RESET_TOUCH_COUNTERS
        MOV BALL_LAST_SIDE, 01h
        JMP END_NET_CHECK
        
        ; La bola cruzo de derecha a izquierda
    NET_CROSSED_RIGHT_TO_LEFT:
        CALL RESET_TOUCH_COUNTERS
        MOV BALL_LAST_SIDE, 00h
        
    END_NET_CHECK:
        POP BX
        POP AX
        RET
    CHECK_NET_CROSSING ENDP                                                          
                                                              
    
    ; Colores: 0=transparente, 7=gris, 8=gris oscuro, 15=blanco
    ;--------------------------------------------------------
    DRAW_BALL_SPRITE_11X11 PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI
        
        LEA SI, BALL_SPRITE_11X11    ; Puntero al inicio del sprite
        MOV CX, BALL_X              ; Posicion X inicial
        MOV DX, BALL_Y              ; Posicion Y inicial
        MOV BH, 00h                 ; Pagina de video
        MOV DI, 0                   ; Contador de fila (0-10)
        
    DRAW_SPRITE_ROW_11:
        PUSH CX                     ; Guardar X inicial de la fila
        MOV BX, 0                    ; Contador de columna (0-10)
        
    DRAW_SPRITE_COL_11:
        
        MOV AL, [SI]                 ; Obtener color del píxel
        
        ; Si el color no es 0 dibujar el pixel
        CMP AL, 00h
        JE SKIP_PIXEL_11
        
        ; Dibujar pixel con el color del sprite
        MOV AH, 0Ch                  ; escribir pixel
        INT 10h
        
    SKIP_PIXEL_11:
        ; Avanzar al siguiente pixel
        INC SI                      ; Siguiente byte del sprite
        INC CX                      ; Siguiente columna
        INC BX                      ; Incrementar contador de columna
        
        ; Verificar si terminamos la fila
        CMP BX, 11
        JL DRAW_SPRITE_COL_11
        
        ; Siguiente fila
        POP CX                       ; Restaurar X inicial
        INC DX                       ; Siguiente Y
        INC DI                       ; Incrementar contador de fila
        
        ; Verificar si terminamos 
        CMP DI, 11
        JL DRAW_SPRITE_ROW_11
        
        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    DRAW_BALL_SPRITE_11X11 ENDP
    
    ;--------------------------------------------------------
    DRAW_BALL PROC NEAR
        CALL DRAW_BALL_SPRITE_11X11
        RET
    DRAW_BALL ENDP
    
    
    ; Dibuja el sprite del paddle izquierdo 15x15
    ;--------------------------------------------------------
    DRAW_PADDLE_LEFT_SPRITE_15X15 PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI
        
        LEA SI, PADDLE_LEFT_SPRITE_15X15    ; Puntero al inicio del sprite
        MOV CX, PADDLE_LEFT_X             ; Posicion X inicial
        MOV DX, PADDLE_LEFT_Y             ; Posicion Y inicial
        MOV BH, 00h                       ; Pagina de video
        MOV DI, 0                         ; Contador de fila (0-14)
        
    DRAW_LEFT_SPRITE_ROW_15:
        PUSH CX                             ; Guardar X inicial de la fila
        MOV BX, 0                          ; Contador de columna (0-14)
        
    DRAW_LEFT_SPRITE_COL_15:
        ; Leer color del sprite
        MOV AL, [SI]                        ; Obtener color del pixel
        
        ; Si el color no es 0 (transparente), dibujar el pixel
        CMP AL, 00h
        JE SKIP_LEFT_PIXEL_15
        
        ; Dibujar pixel con el color del sprite
        MOV AH, 0Ch                         ; Funcion escribir pixel
        INT 10h
        
    SKIP_LEFT_PIXEL_15:
        ; Avanzar al siguiente pixel
        INC SI                              ; Siguiente byte del sprite
        INC CX                              ; Siguiente columna
        INC BX                            ; Incrementar contador de columna
        
        ; Verificar si terminamos la fila 
        CMP BX, 15
        JL DRAW_LEFT_SPRITE_COL_15
        
        ; Siguiente fila
        POP CX                              ; Restaurar X inicial
        INC DX                              ; Siguiente Y
        INC DI                              ; Incrementar contador de fila
        
        ; Verificar si terminamos 
        CMP DI, 15
        JL DRAW_LEFT_SPRITE_ROW_15
        
        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    DRAW_PADDLE_LEFT_SPRITE_15X15 ENDP
    
    ;--------------------------------------------------------
    DRAW_PADDLE_RIGHT_SPRITE_15X15 PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI
        
        LEA SI, PADDLE_RIGHT_SPRITE_15X15   ; Puntero al inicio del sprite
        MOV CX, PADDLE_RIGHT_X             ; Posicion X inicial
        MOV DX, PADDLE_RIGHT_Y             ; Posicion Y inicial
        MOV BH, 00h                       ; Página de video
        MOV DI, 0                         ; Contador de fila (0-14)
        
    DRAW_RIGHT_SPRITE_ROW_15:
        PUSH CX                             ; Guardar X inicial de la fila
        MOV BX, 0                           ; Contador de columna (0-14)
        
    DRAW_RIGHT_SPRITE_COL_15:
     
        MOV AL, [SI]                        ; Obtener color del píxel
        
        ; Si el color no es 0 dibujar el pixel
        CMP AL, 00h
        JE SKIP_RIGHT_PIXEL_15
        
        
        MOV AH, 0Ch                         ; escribir pixel
        INT 10h
        
    SKIP_RIGHT_PIXEL_15:
        ; Avanzar al siguiente pixel
        INC SI                              ; Siguiente byte del sprite
        INC CX                              ; Siguiente columna
        INC BX                              ; Incrementar contador de columna
        
        ; Verificar si terminamos la fila 
        CMP BX, 15
        JL DRAW_RIGHT_SPRITE_COL_15
        
        ; Siguiente fila
        POP CX                              ; Restaurar X inicial
        INC DX                              ; Siguiente Y
        INC DI                              ; Incrementar contador de fila
        
        ; Verificar si terminamos 
        CMP DI, 15
        JL DRAW_RIGHT_SPRITE_ROW_15
        
        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    DRAW_PADDLE_RIGHT_SPRITE_15X15 ENDP
    
    ;------------------------------------------------------
    DRAW_PADDLES PROC NEAR
        ; Dibujar paddle izquierdo
        CALL DRAW_PADDLE_LEFT_SPRITE_15X15
        
        ; Dibujar paddle derecho
        CALL DRAW_PADDLE_RIGHT_SPRITE_15X15
        
        RET
    DRAW_PADDLES ENDP
    
    ;--------------------------------------------------------
    DRAW_SCORE PROC NEAR
        ; SCORE IZQUIERDO (PLAYER 1)
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 01h
        MOV DL, 03h                ; Posicion X para decenas
        INT 10h
        
        ; Convertir y mostrar dos digitos
        MOV AL, SCORE_LEFT
        XOR AH, AH                 ; Limpiar AH
        MOV BL, 10                 ; Divisor
        DIV BL                     ; AL = cociente, AH = residuo
        
        ; Mostrar DECENAS
        PUSH AX                    ; Guardar resultado
        ADD AL, 30h                ; Convertir decenas a ASCII
        MOV BL, 02h                ; Color verde
        MOV AH, 0Eh
        INT 10h
        
        ; Mostrar UNIDADES
        POP AX                     ; Recuperar resultado
        MOV AL, AH                 ; AH tiene el residuo (unidades)
        ADD AL, 30h                ; Convertir a ASCII
        MOV AH, 0Eh
        MOV BL, 02h
        INT 10h
        
        ; SCORE DERECHO (PLAYER 2)
        MOV AH, 02h
        MOV BH, 00h
        MOV DH, 01h
        MOV DL, 21h                ; Posicion X para decenas
        INT 10h
        
        ; Convertir y mostrar dos digitos
        MOV AL, SCORE_RIGHT
        XOR AH, AH
        MOV BL, 10
        DIV BL
        
        ; Mostrar DECENAS
        PUSH AX
        ADD AL, 30h
        MOV BL, 04h                ; Color rojo
        MOV AH, 0Eh
        INT 10h
        
        ; Mostrar UNIDADES
        POP AX
        MOV AL, AH
        ADD AL, 30h
        MOV AH, 0Eh
        MOV BL, 04h
        INT 10h
        
        RET
    DRAW_SCORE ENDP
    
    ;--------------------------------------------------------
    GET_KEY PROC NEAR
        MOV AH,01h
        INT 16h
        JZ NO_KEY_PRESSED_GET
        
        MOV AH,00h
        INT 16h
        MOV [KEY_CODE], AL
        RET
        
    NO_KEY_PRESSED_GET:
        MOV [KEY_CODE], 00h
        RET
    GET_KEY ENDP
    
    
    ;---------------------------------------------------
    MOVE_AI_PADDLE PROC NEAR
        ; Verificar si la pelota esta del lado derecho
        ; Comparar directamente BALL_X con NET_X
        MOV AX, BALL_X
        MOV BX, NET_X
        ADD BX, 04h             ; NET_X + grosor de la red
        CMP AX, BX
        JGE AI_BALL_ON_RIGHT_SIDE
        JMP AI_NO_ACTION
        
    AI_BALL_ON_RIGHT_SIDE:
        ; Verificar si la pelota esta inactiva (modo saque)
        CMP BALL_ACTIVE, 00h
        JE AI_SERVE_MODE
        JMP AI_NORMAL_MODE
        
    AI_SERVE_MODE:
        ; Modo saque - moverse hacia la pelota y saltar para tocarla

        MOV AX, BALL_X
        SUB AX, PADDLE_WIDTH
        SUB AX, 01h             
        
        ; Verificar limites (no cruzar la red)
        MOV BX, NET_X
        ADD BX, 04h
        CMP AX, BX
        JGE AI_SERVE_X_OK
        MOV AX, BX              ; Limitar a la red
        
    AI_SERVE_X_OK:
        ; Mover paddle hacia la posicion objetivo X
        MOV BX, PADDLE_RIGHT_X
        CMP BX, AX
        JE AI_SERVE_CHECK_Y     ; Ya esta en posicion X
        JL AI_SERVE_MOVE_RIGHT
        JMP AI_SERVE_MOVE_LEFT
        
    AI_SERVE_MOVE_RIGHT:
        ; Mover hacia la derecha (hacia la pelota)
        MOV CX, AI_VELOCITY
        ADD PADDLE_RIGHT_X, CX
        ; Verificar limite derecho
        MOV DX, WINDOW_WIDTH
        SUB DX, PADDLE_WIDTH
        SUB DX, WINDOW_BOUNDS
        CMP PADDLE_RIGHT_X, DX
        JLE AI_SERVE_CHECK_Y
        MOV PADDLE_RIGHT_X, DX
        JMP AI_SERVE_CHECK_Y
        
    AI_SERVE_MOVE_LEFT:
        ; Mover hacia la izquierda
        MOV CX, AI_VELOCITY
        SUB PADDLE_RIGHT_X, CX
        ; Verificar limite izquierdo (red)
        MOV DX, NET_X
        ADD DX, 04h
        CMP PADDLE_RIGHT_X, DX
        JGE AI_SERVE_CHECK_Y
        MOV PADDLE_RIGHT_X, DX
        
    AI_SERVE_CHECK_Y:
        ; Verificar si esta cerca horizontalmente y saltar

        MOV AX, PADDLE_RIGHT_X
        ADD AX, PADDLE_WIDTH
        
  
        MOV BX, BALL_X
        
        ; Verificar si el paddle esta cerca 
        SUB BX, AX              ; BX = distancia entre paddle y pelota
        CMP BX, 0
        JL AI_SERVE_OVERLAP     ; Ya hay solapamiento
        CMP BX, 1Eh             ; Si distancia <= 30 pixels
        JG AI_SERVE_DONE        ; Muy lejos
        
    AI_SERVE_READY_TO_JUMP:
        ; Verificar si el paddle esta en el suelo
        CMP PADDLE_RIGHT_ON_GROUND, 01h
        JNE AI_SERVE_DONE       ; Ya esta saltando, esperar
        
        ; Si esta cerca horizontalmente, saltar inmediatamente
        
        JMP AI_SERVE_JUMP
        
    AI_SERVE_OVERLAP:
        ; saltar si esta en el suelo
        CMP PADDLE_RIGHT_ON_GROUND, 01h
        JNE AI_SERVE_DONE
        JMP AI_SERVE_JUMP
        
    AI_SERVE_JUMP:
        ; Saltar para tocar la pelota
        MOV CX, JUMP_FORCE
        NEG CX
        MOV PADDLE_RIGHT_VY, CX
        MOV PADDLE_RIGHT_ON_GROUND, 00h
        
    AI_SERVE_DONE:
        
        RET
        
    AI_NORMAL_MODE:
        
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        SHR AX, 1               ; Centro X de la bola
        MOV DX, AX              ; Guardar en DX para uso posterior
        
        ; Calcular centro del paddle derecho
        MOV CX, PADDLE_RIGHT_X
        ADD CX, PADDLE_WIDTH
        SHR CX, 1               ; Centro X del paddle
        
        ; Comparar posiciones (DX = centro bola, CX = centro paddle)
        CMP DX, CX
        JE AI_CHECK_JUMP        ; Si estan alineados, solo verificar salto
        
        ; Calcular diferencia para determinar direccion
        MOV BX, DX              ; BX = centro bola
        SUB BX, CX              ; BX = diferencia 
        
        ; Si la diferencia es (5 pixels), considerar alineado
        CMP BX, 03h
        JLE AI_CHECK_JUMP
        
        ; Si diferencia es negativa - pelota esta a la izquierda del paddle
        CMP BX, 0
        JL AI_MOVE_LEFT
        JMP AI_MOVE_RIGHT       ; Si positiva, pelota esta a la derecha
        
    AI_MOVE_LEFT:
        ; Mover paddle hacia la izquierda 
        MOV AX, NET_X
        ADD AX, 04
        CMP PADDLE_RIGHT_X, AX
        JLE AI_CHECK_JUMP       ; Ya esta en el limite
        
        MOV AX, AI_VELOCITY
        SUB PADDLE_RIGHT_X, AX
        
        ; evitar cruzar la red
        MOV BX, NET_X
        ADD BX, 04
        CMP PADDLE_RIGHT_X, BX
        JGE AI_CHECK_JUMP
        MOV PADDLE_RIGHT_X, BX
        JMP AI_CHECK_JUMP
        
    AI_MOVE_RIGHT:
        ; Mover paddle hacia la derecha 
        MOV AX, WINDOW_WIDTH
        SUB AX, PADDLE_WIDTH
        SUB AX, WINDOW_BOUNDS
        CMP PADDLE_RIGHT_X, AX
        JGE AI_CHECK_JUMP       ; Ya esta en el limite
        
        MOV AX, AI_VELOCITY
        ADD PADDLE_RIGHT_X, AX
        
        ; evitar salirse del borde
        MOV BX, WINDOW_WIDTH
        SUB BX, PADDLE_WIDTH
        SUB BX, WINDOW_BOUNDS
        CMP PADDLE_RIGHT_X, BX
        JLE AI_CHECK_JUMP
        MOV PADDLE_RIGHT_X, BX
        
    AI_CHECK_JUMP:
        ; Verificar si la pelota esta activa antes de saltar
        CMP BALL_ACTIVE, 00h
        JE AI_NO_JUMP
        
        ; Calcular distancia horizontal entre pelota y paddle

        MOV CX, PADDLE_RIGHT_X
        ADD CX, PADDLE_WIDTH
        SHR CX, 1               ; Centro X del paddle
        
        ; Calcular diferencia
        MOV AX, DX              ; DX tiene el centro de la bola guardado
        CMP AX, CX
        JL AI_DIST_LEFT
        SUB AX, CX
        JMP AI_DIST_DONE
        
    AI_DIST_LEFT:
        SUB CX, AX
        MOV AX, CX
        
    AI_DIST_DONE:
        ; Verificar si la distancia es menor 
        CMP AX, AI_JUMP_DISTANCE
        JG AI_NO_JUMP
        
        ; Verificar si la pelota esta cayendo (velocidad Y positiva)
        MOV AX, BALL_VELOCITY_Y
        CMP AX, 0
        JLE AI_NO_JUMP          ; Si no esta cayendo, no saltar
        
        ; Verificar si el paddle esta en el suelo
        CMP PADDLE_RIGHT_ON_GROUND, 01h
        JNE AI_NO_JUMP          ; Si ya esta en el aire, no saltar
        
        ; Verificar si la pelota esta cerca verticalmente
        MOV AX, BALL_Y
        ADD AX, BALL_SIZE
        MOV BX, PADDLE_RIGHT_Y
        SUB BX, 20h             ; Rango de deteccion vertical
        CMP AX, BX
        JL AI_NO_JUMP           ; Muy arriba
        
        MOV AX, BALL_Y
        MOV BX, PADDLE_RIGHT_Y
        ADD BX, PADDLE_HEIGHT
        ADD BX, 20h             ; Rango de deteccion vertical
        CMP AX, BX
        JG AI_NO_JUMP           ; Muy abajo
        
        ; Saltar
        MOV AX, JUMP_FORCE
        NEG AX
        MOV PADDLE_RIGHT_VY, AX
        MOV PADDLE_RIGHT_ON_GROUND, 00h
        JMP AI_NO_ACTION
        
    AI_NO_JUMP:
    AI_NO_ACTION:
        RET
    MOVE_AI_PADDLE ENDP
    
    ;---------------------------------------------------
    MOVE_PADDLES PROC NEAR
        ; Verificar si estamos en modo IA
        CMP AI_MODE, 01h
        JE MODE_AI_ACTIVE
        JMP MODE_PVP_ACTIVE
        
    MODE_AI_ACTIVE:
        ; IA controla paddle derecho
        CALL GET_KEY
        MOV AL, [KEY_CODE]
        CMP AL, 00h
        JNE KEY_WAS_PRESSED_AI
        
        ; No hay teclas presionadas
        JMP NO_KEY_PRESSED_MOVE
        
    KEY_WAS_PRESSED_AI:
        ; En modo IA solo procesar teclas del paddle izquierdo
        CMP AL, 41h ; 'A'
        JE JL_LEFT_LEFT
        CMP AL, 61h ; 'a'
        JE JL_LEFT_LEFT
        CMP AL, 44h ; 'D'
        JE JL_LEFT_RIGHT
        CMP AL, 64h ; 'd'
        JE JL_LEFT_RIGHT
        CMP AL, 57h ; 'W'
        JE JL_LEFT_JUMP
        CMP AL, 77h ; 'w'
        JE JL_LEFT_JUMP
        
        ; Cualquier otra tecla - ignorar 
        JMP NO_KEY_PRESSED_MOVE
        
    MODE_PVP_ACTIVE:
        CALL GET_KEY
        MOV AL, [KEY_CODE]
        CMP AL, 00h
        JNE KEY_WAS_PRESSED
        JMP NO_KEY_PRESSED_MOVE
        
    KEY_WAS_PRESSED:
        ; LEFT PADDLE
        CMP AL, 41h ; 'A'
        JE JL_LEFT_LEFT
        CMP AL, 61h ; 'a'
        JE JL_LEFT_LEFT
        CMP AL, 44h ; 'D'
        JE JL_LEFT_RIGHT
        CMP AL, 64h ; 'd'
        JE JL_LEFT_RIGHT
        CMP AL, 57h ; 'W'
        JE JL_LEFT_JUMP
        CMP AL, 77h ; 'w'
        JE JL_LEFT_JUMP
        
        ; RIGHT PADDLE
        CMP AL, 4Ah ; 'J'
        JE JL_RIGHT_LEFT
        CMP AL, 6Ah ; 'j'
        JE JL_RIGHT_LEFT
        CMP AL, 4Ch ; 'L'
        JE JL_RIGHT_RIGHT
        CMP AL, 6Ch ; 'l'
        JE JL_RIGHT_RIGHT
        CMP AL, 49h ; 'I'
        JE JL_RIGHT_JUMP
        CMP AL, 69h ; 'i'
        JE JL_RIGHT_JUMP
        
        JMP NO_KEY_PRESSED_MOVE
        
        JL_LEFT_LEFT:
            JMP LEFT_LEFT_MOVE
        JL_LEFT_RIGHT:
            JMP LEFT_RIGHT_MOVE
        JL_LEFT_JUMP:
            JMP LEFT_JUMP_MOVE
        JL_RIGHT_LEFT:
            JMP RIGHT_LEFT_MOVE
        JL_RIGHT_RIGHT:
            JMP RIGHT_RIGHT_MOVE
        JL_RIGHT_JUMP:
            JMP RIGHT_JUMP_MOVE
        
    LEFT_LEFT_MOVE:
        ; Guardar ultima tecla presionada
        MOV PADDLE_LEFT_LAST_KEY, 41h  ; 'A'
        MOV AX, WINDOW_BOUNDS
        CMP PADDLE_LEFT_X, AX
        JG LEFT_LEFT_OK
        JMP NO_KEY_PRESSED_MOVE
        
    LEFT_LEFT_OK:
        MOV AX, PADDLE_VELOCITY
        SUB PADDLE_LEFT_X, AX
        
        ; evitar que se pase del borde izquierdo
        MOV BX, WINDOW_BOUNDS
        CMP PADDLE_LEFT_X, BX
        JGE LEFT_LEFT_CLAMP_END
        MOV PADDLE_LEFT_X, BX
    LEFT_LEFT_CLAMP_END:
        JMP NO_KEY_PRESSED_MOVE
        
    LEFT_RIGHT_MOVE:
        ;Guardar ultima tecla presionada
        MOV PADDLE_LEFT_LAST_KEY, 44h  ; 'D' = 44h
    
        MOV AX, PADDLE_LEFT_X
        ADD AX, PADDLE_WIDTH
        MOV BX, NET_X
        CMP AX, BX
        JL LEFT_RIGHT_OK
        JMP NO_KEY_PRESSED_MOVE
        
    LEFT_RIGHT_OK:
        MOV AX, PADDLE_VELOCITY
        ADD PADDLE_LEFT_X, AX
        
        MOV AX, PADDLE_LEFT_X
        ADD AX, PADDLE_WIDTH
        CMP AX, NET_X
        JLE LEFT_RIGHT_DONE
        
        MOV AX, NET_X
        SUB AX, PADDLE_WIDTH
        MOV PADDLE_LEFT_X, AX
        
    LEFT_RIGHT_DONE:
        JMP NO_KEY_PRESSED_MOVE
        
    LEFT_JUMP_MOVE:
        CMP PADDLE_LEFT_ON_GROUND, 01h
        JE LEFT_JUMP_YES
        JMP NO_KEY_PRESSED_MOVE
        
    LEFT_JUMP_YES:
        MOV AX, JUMP_FORCE
        NEG AX
        MOV PADDLE_LEFT_VY, AX
        MOV PADDLE_LEFT_ON_GROUND, 00h
        JMP NO_KEY_PRESSED_MOVE
        
    RIGHT_LEFT_MOVE:  
        ; Guardar ultima tecla presionada
        MOV PADDLE_RIGHT_LAST_KEY, 4Ah  ; 'J' = 4Ah
        
        MOV AX, NET_X
        ADD AX, 04
        CMP PADDLE_RIGHT_X, AX
        JG RIGHT_LEFT_OK
        JMP NO_KEY_PRESSED_MOVE
        
    RIGHT_LEFT_OK:
        MOV AX, PADDLE_VELOCITY
        SUB PADDLE_RIGHT_X, AX
        
        ; evitar cruzar la red hacia el lado izquierdo
        MOV BX, NET_X
        ADD BX, 04
        CMP PADDLE_RIGHT_X, BX
        JGE RIGHT_LEFT_CLAMP_END
        MOV PADDLE_RIGHT_X, BX
    RIGHT_LEFT_CLAMP_END:
        JMP NO_KEY_PRESSED_MOVE
        
    RIGHT_RIGHT_MOVE: 
        ; Guardar ultima tecla presionada
        MOV PADDLE_RIGHT_LAST_KEY, 4Ch  ; 'L' = 4Ch
    
        MOV AX, WINDOW_WIDTH
        SUB AX, PADDLE_WIDTH
        SUB AX, WINDOW_BOUNDS
        CMP PADDLE_RIGHT_X, AX
        JL RIGHT_RIGHT_OK
        JMP NO_KEY_PRESSED_MOVE
        
    RIGHT_RIGHT_OK:
        MOV AX, PADDLE_VELOCITY
        ADD PADDLE_RIGHT_X, AX
        
        ; evitar que se pase del borde derecho
        MOV BX, WINDOW_WIDTH
        SUB BX, PADDLE_WIDTH
        SUB BX, WINDOW_BOUNDS
        CMP PADDLE_RIGHT_X, BX
        JLE RIGHT_RIGHT_CLAMP_END
        MOV PADDLE_RIGHT_X, BX
    RIGHT_RIGHT_CLAMP_END:
        JMP NO_KEY_PRESSED_MOVE
        
    RIGHT_JUMP_MOVE:
        CMP PADDLE_RIGHT_ON_GROUND, 01h
        JNE NO_KEY_PRESSED_MOVE
        
        MOV AX, JUMP_FORCE
        NEG AX
        MOV PADDLE_RIGHT_VY, AX
        MOV PADDLE_RIGHT_ON_GROUND, 00h
        JMP NO_KEY_PRESSED_MOVE
        
    NO_KEY_PRESSED_MOVE:
        ; Physics update 
        ; LEFT PADDLE
        MOV AX, PADDLE_LEFT_VY
        ADD AX, GRAVITY
        MOV PADDLE_LEFT_VY, AX
        MOV AX, PADDLE_LEFT_VY
        ADD PADDLE_LEFT_Y, AX
        
        MOV BX, WINDOW_HEIGHT
        SUB BX, PADDLE_HEIGHT
        SUB BX, WINDOW_BOUNDS
        CMP PADDLE_LEFT_Y, BX
        JL LEFT_IN_AIR
        
        MOV PADDLE_LEFT_Y, BX
        MOV PADDLE_LEFT_VY, 00h
        MOV PADDLE_LEFT_ON_GROUND, 01h
        JMP CHECK_RIGHT_FALL
        
    LEFT_IN_AIR:
        MOV PADDLE_LEFT_ON_GROUND, 00h
        
    CHECK_RIGHT_FALL:
        ; En modo IA, mover el paddle derecho con IA
        CMP AI_MODE, 01h
        JE MOVE_AI_BEFORE_PHYSICS
        JMP RIGHT_PADDLE_PHYSICS
        
    MOVE_AI_BEFORE_PHYSICS:
        CALL MOVE_AI_PADDLE
        
    RIGHT_PADDLE_PHYSICS:
        ; RIGHT PADDLE
        MOV AX, PADDLE_RIGHT_VY
        ADD AX, GRAVITY
        MOV PADDLE_RIGHT_VY, AX
        MOV AX, PADDLE_RIGHT_VY
        ADD PADDLE_RIGHT_Y, AX
        
        MOV BX, WINDOW_HEIGHT
        SUB BX, PADDLE_HEIGHT
        SUB BX, WINDOW_BOUNDS
        CMP PADDLE_RIGHT_Y, BX
        JL RIGHT_IN_AIR
        
        MOV PADDLE_RIGHT_Y, BX
        MOV PADDLE_RIGHT_VY, 00h
        MOV PADDLE_RIGHT_ON_GROUND, 01h
        JMP END_MOVE_PADDLES
        
    RIGHT_IN_AIR:
        MOV PADDLE_RIGHT_ON_GROUND, 00h
        
    END_MOVE_PADDLES:
        RET
    MOVE_PADDLES ENDP
    
    ;---------------------------------------------------------
    CLEAR_SCREEN PROC NEAR
        MOV AH,00h          ; Activa modo de video
        MOV AL,13h          ; Modo de video
        INT 10h
        
        MOV AH,0Bh          ; Activar color de fondo
        MOV BH,00h
        MOV BL,00h          ; Color de fondo
        INT 10h
        
        RET
    CLEAR_SCREEN ENDP
    
    ;---------------------------------------------------------
    DRAW_NET PROC NEAR
        MOV CX, NET_X
        XOR BX, BX
        
    NET_THICKNESS_LOOP:
        MOV DX, 064h
        
    NET_DRAW_LOOP:
        MOV AH, 0Ch
        MOV AL, NET_COLOR
        MOV BH, 00h
        INT 10h
        
        INC DX
        CMP DX, WINDOW_HEIGHT
        JB NET_DRAW_LOOP
        
        INC BX
        INC CX
        CMP BX, 04
        JB NET_THICKNESS_LOOP
        
        RET
    DRAW_NET ENDP
    
    ; Usa el altavoz del PC mediante el puerto 61h y el temporizador
    ;---------------------------------------------------------
    PLAY_SCORE_SOUND PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        
        ; Activar el altavoz (bit 0 y 1 del puerto 61h)
        IN AL, 61h               ; Leer estado actual del puerto
        PUSH AX                  ; Guardar estado original
        OR AL, 03h               ; Activar bits 0 y 1 (altavoz y temporizador)
        OUT 61h, AL              ; Escribir al puerto (ON)
        
        ; Configurar frecuencia del sonido 
        ; El temporizador usa 1193180 Hz como base
        ; Frecuencia = 1193180 / valor_del_contador
        MOV AX, 1193             ; Para aproximadamente 1000 Hz
        OUT 42h, AL              ; Enviar byte bajo primero
        MOV AL, AH               ; Mover byte alto a AL
        OUT 42h, AL              ; Enviar byte alto despues
        
        ; Esperar un tiempo
        MOV CX, 0FFFFh           ; Contador para delay
    SOUND_DELAY:
        LOOP SOUND_DELAY
        
        ; Desactivar el altavoz
        POP AX                   ; Restaurar estado original
        AND AL, 0FCh             ; Desactivar bits 0 y 1
        OUT 61h, AL              ; Restaurar puerto (OFF)
        
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    PLAY_SCORE_SOUND ENDP

CODE ENDS
END