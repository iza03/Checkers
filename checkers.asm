
section .data

section .text
	global checkers
checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

; pun 0 peste tot in matrice
mov edi, 0            ; contorul
clear_loop:
    cmp edi, 64
    jge done_clear    ; daca s-a parcurs toata matricea se opreste parcurgerea
    mov word [ecx + edi], 0
    add edi, 1
    jmp clear_loop

done_clear:
; calculez inidicii pentru cele 4 pozitii si pun 1 daca se afla in interior
;edx linia pe care se pune 1
;edi coloana
; pozitia din matrice este 8*edx+edi
; apoi pun 1 in matrice
;calculate_up_left:
    cmp ebx, 0
    je calculate_up_right
    cmp eax, 7
    je calculate_up_right
    mov edx, eax
    inc edx

    mov edi, ebx
    dec edi

    imul edx, edx, 8
    add edx, edi
    mov word [ecx + edx], 1   
calculate_up_right:
    cmp eax, 7
    je calculate_down_left
    cmp ebx, 7
    je calculate_down_left
    mov edx, eax
    inc edx

    mov edi, ebx
    inc edi
    imul edx, edx, 8
    add edx, edi
    mov word [ecx + edx], 1 
calculate_down_left:
    cmp ebx, 0
    je calculate_down_right
    cmp eax, 0
    je calculate_down_right

    mov edx, eax
    dec edx

    mov edi, ebx
    dec edi
    imul edx, edx, 8
    add edx, edi
    mov word [ecx + edx], 1
calculate_down_right:
    cmp eax, 0
    je done
    cmp ebx, 7
    je done

    mov edx, eax
    dec edx

    mov edi, ebx
    inc edi
    imul edx, edx, 8
    add edx, edi
    mov word [ecx + edx], 1
done:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY