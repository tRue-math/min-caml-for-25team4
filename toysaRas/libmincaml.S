min_caml_create_array:
    slli    %x03 %x01 $2
    add	%rhp %rhp %x03
    addi	%x01 %rhp %x03
create_array_loop:
    beq	%x03 x0 $create_array_exit
    addi	%x03 %x03 $-4
    addi    %x01 %x01 $-4
    sw	%x02 %x01 $0
    jal	x0 $create_array_loop
create_array_exit:
    jalr	x0 %ra $0
min_caml_create_float_array:
    slli    %x02 %x01 $2
    add	%rhp %rhp %x02
    addi	%x01 %rhp $0
create_float_array_loop:
    beq	%x02 x0 $create_float_array_exit
    addi	%x02 %x02 $-4
    addi    %x01 %x01 $-4
    fsw	%f00 %x01 $0
    jal	x0 $create_float_array_loop
create_float_array_exit:
    jalr	x0 %ra $0