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
min_caml_print_byte:
    sw  %x01 x0 $-1
	jalr x0 %ra $0
min_caml_print_int:
	addi	%x05 %ra $0
	addi	%x02 %x01 $0
	addi	%x01 x0 $10
	blt	%x02 %x01 $print_9
	addi	%x01 x0 $100
	blt	%x02 %x01 $print_99
	addi	%x01 x0 $47
	addi	%x03 x0 $100
	jal %x04 $inner_div
	jal %ra $min_caml_print_byte
print_99:
	addi	%x01 x0 $47
	addi	%x03 x0 $10
	jal %x04 $inner_div
	jal %ra $min_caml_print_byte
print_9:
	addi	%x01 %x02 $48
	addi	%ra %x05 $0
	jal	x0 $min_caml_print_byte
inner_div:
	sub	%x02 %x02 %x03
	addi	%x01 %x01 $1
	bge	%x02 x0 $inner_div
	add	%x02 %x02 %x03
	jalr x0 %x04 $0
min_caml_read_int:
	lw	%x01 x0 $-1
	jalr	x0 %ra $0
min_caml_read_float:
	flw	%f00 x0 $-1
	jalr	x0 %ra $0
min_caml_abs_float:
	fsub	%f01 %f01 %f01
	fle	%f01 %f00 $abs_float_exit
	fsgnjn	%f00 %f00 %f00
abs_float_exit:
	jalr	x0 %ra $0
min_caml_float_of_int:
	fcvt.s.w	%f00 %x01
	jalr	x0 %ra $0
min_caml_int_of_float:
	fcvt.w.s	%x01 %f00
	jalr	x0 %ra $0
fdiv_loop:
	fmul	%f04 %f00 %f01
	fmul	%f04 %f04 %f03
	fle	%tmp %f04 %f03
	fsub	%f04 %f03 %f04
	bne	%tmp x0 $fdiv_loop_cont
	fsgnjn	%f04 %f04 %f04
fdiv_loop_cont:
	fle %tmp %f02 %f04
	bne %tmp x0 $fdiv_loop_then
	fmul	%f00 %f00 %f03
	jalr x0 %ra $0
fdiv_loop_then:
	flw	%f04 x0 $div.l3
	fmul	%f05 %f00 %f01
	fsub	%f05 %f04 %f05
	fmul	%f00 %f00 %f05
	jal	x0 $fdiv_loop
min_caml_fdiv:
	flw	 %f02 x0 $div.l2
	fmul %f02 %f00 %f02
	flw	 %f03 x0 $div.l1
	fmul %f03 %f01 %f03
	fle %tmp %f02 %f03
	bne %tmp x0 $fdiv_cont
	fsgnj %f02 %f03 %f03
fdiv_cont:
	fsgnj %f03 %f00 %f00
	finv %f00 %f01
	jal x0 $fdiv_loop
div.l1:	# 2^(-126)
	.data	8388608
div.l2:	# 2^(-20)
	.data	897581056
div.l3:	# 2.000000
	.data	1073741824