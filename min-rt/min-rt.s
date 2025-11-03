.data
.balign	8
l.4579:	# 128.000000
	.long	0x0
	.long	0x40600000
l.4577:	# 40000.000000
	.long	0x0
	.long	0x40e38800
l.4567:	# -2.000000
	.long	0x0
	.long	0xc0000000
l.4565:	# 0.100000
	.long	0x9999999a
	.long	0x3fb99999
l.4562:	# 0.200000
	.long	0x9999999a
	.long	0x3fc99999
l.4549:	# 20.000000
	.long	0x0
	.long	0x40340000
l.4547:	# 0.050000
	.long	0x9999999a
	.long	0x3fa99999
l.4542:	# 0.250000
	.long	0x0
	.long	0x3fd00000
l.4538:	# 255.000000
	.long	0x0
	.long	0x406fe000
l.4536:	# 3.141593
	.long	0x5a7ed197
	.long	0x400921fb
l.4534:	# 10.000000
	.long	0x0
	.long	0x40240000
l.4531:	# 850.000000
	.long	0x0
	.long	0x408a9000
l.4527:	# 0.500000
	.long	0x0
	.long	0x3fe00000
l.4525:	# 0.150000
	.long	0x33333333
	.long	0x3fc33333
l.4520:	# 9.549296
	.long	0x62316387
	.long	0x4023193d
l.4518:	# 15.000000
	.long	0x0
	.long	0x402e0000
l.4516:	# 0.000100
	.long	0xeb1c432d
	.long	0x3f1a36e2
l.4508:	# 100000000.000000
	.long	0x0
	.long	0x4197d784
l.4505:	# 1000000000.000000
	.long	0x0
	.long	0x41cdcd65
l.4501:	# -0.100000
	.long	0x9999999a
	.long	0xbfb99999
l.4499:	# 0.010000
	.long	0x47ae147b
	.long	0x3f847ae1
l.4497:	# -0.200000
	.long	0x9999999a
	.long	0xbfc99999
l.4490:	# 4.000000
	.long	0x0
	.long	0x40100000
l.4450:	# -200.000000
	.long	0x0
	.long	0xc0690000
l.4448:	# 0.017453
	.long	0xaa91ed06
	.long	0x3f91df46
l.4446:	# -1.000000
	.long	0x0
	.long	0xbff00000
l.4444:	# 1.000000
	.long	0x0
	.long	0x3ff00000
l.4442:	# 0.000000
	.long	0x0
	.long	0x0
l.4440:	# 2.000000
	.long	0x0
	.long	0x40000000
.text
xor.1977:                       # 14
	cmpl	$0, %eax                  # 14
	jne	je_else.5336               # 14
	movl	%ebx, %eax                # 14
	ret                            # 14
je_else.5336:                   # 14
	cmpl	$0, %ebx                  # 14
	jne	je_else.5337               # 14
	movl	$1, %eax                  # 14
	ret                            # 14
je_else.5337:                   # 14
	movl	$0, %eax                  # 14
	ret                            # 14
fsqr.1980:                      # 17
	mulsd	%xmm0, %xmm0             # 17
	ret                            # 17
fhalf.1982:                     # 20
	movl	$l.4440, %eax             # 20
	movsd	0(%eax), %xmm1           # 20
	divsd	%xmm1, %xmm0             # 20
	ret                            # 20
o_texturetype.1984:             # 28
	movl	0(%eax), %eax             # 28
	ret                            # 33
o_form.1986:                    # 38
	movl	4(%eax), %eax             # 38
	ret                            # 43
o_reflectiontype.1988:          # 48
	movl	8(%eax), %eax             # 48
	ret                            # 53
o_isinvert.1990:                # 58
	movl	24(%eax), %eax            # 58
	ret                            # 62
o_isrot.1992:                   # 67
	movl	12(%eax), %eax            # 67
	ret                            # 71
o_param_a.1994:                 # 76
	movl	16(%eax), %eax            # 76
	movsd	0(%eax), %xmm0           # 81
	ret                            # 81
o_param_b.1996:                 # 86
	movl	16(%eax), %eax            # 86
	movsd	8(%eax), %xmm0           # 91
	ret                            # 91
o_param_c.1998:                 # 96
	movl	16(%eax), %eax            # 96
	movsd	16(%eax), %xmm0          # 101
	ret                            # 101
o_param_x.2000:                 # 106
	movl	20(%eax), %eax            # 106
	movsd	0(%eax), %xmm0           # 111
	ret                            # 111
o_param_y.2002:                 # 116
	movl	20(%eax), %eax            # 116
	movsd	8(%eax), %xmm0           # 121
	ret                            # 121
o_param_z.2004:                 # 126
	movl	20(%eax), %eax            # 126
	movsd	16(%eax), %xmm0          # 131
	ret                            # 131
o_diffuse.2006:                 # 136
	movl	28(%eax), %eax            # 136
	movsd	0(%eax), %xmm0           # 141
	ret                            # 141
o_hilight.2008:                 # 146
	movl	28(%eax), %eax            # 146
	movsd	8(%eax), %xmm0           # 151
	ret                            # 151
o_color_red.2010:               # 156
	movl	32(%eax), %eax            # 156
	movsd	0(%eax), %xmm0           # 161
	ret                            # 161
o_color_green.2012:             # 166
	movl	32(%eax), %eax            # 166
	movsd	8(%eax), %xmm0           # 171
	ret                            # 171
o_color_blue.2014:              # 176
	movl	32(%eax), %eax            # 176
	movsd	16(%eax), %xmm0          # 181
	ret                            # 181
o_param_r1.2016:                # 186
	movl	36(%eax), %eax            # 186
	movsd	0(%eax), %xmm0           # 191
	ret                            # 191
o_param_r2.2018:                # 196
	movl	36(%eax), %eax            # 196
	movsd	8(%eax), %xmm0           # 201
	ret                            # 201
o_param_r3.2020:                # 206
	movl	36(%eax), %eax            # 206
	movsd	16(%eax), %xmm0          # 211
	ret                            # 211
normalize_vector.2022:          # 216
	movsd	0(%eax), %xmm0           # 216
	movl	%ebx, 0(%ebp)             # 216
	movl	%eax, 4(%ebp)             # 216
	addl	$8, %ebp                  # 216
	call	fsqr.1980                 # 216
	subl	$8, %ebp                  # 216
	movl	4(%ebp), %eax             # 216
	movsd	8(%eax), %xmm1           # 216
	movsd	%xmm0, 8(%ebp)           # 216
	movsd	%xmm1, %xmm0             # 216
	addl	$16, %ebp                 # 216
	call	fsqr.1980                 # 216
	subl	$16, %ebp                 # 216
	movsd	8(%ebp), %xmm1           # 216
	addsd	%xmm0, %xmm1             # 216
	movl	4(%ebp), %eax             # 216
	movsd	16(%eax), %xmm0          # 216
	movsd	%xmm1, 16(%ebp)          # 216
	addl	$24, %ebp                 # 216
	call	fsqr.1980                 # 216
	subl	$24, %ebp                 # 216
	movsd	16(%ebp), %xmm1          # 216
	addsd	%xmm1, %xmm0             # 216
	addl	$24, %ebp                 # 216
	call	min_caml_sqrt             # 216
	subl	$24, %ebp                 # 216
	movl	0(%ebp), %eax             # 217
	cmpl	$0, %eax                  # 217
	jne	je_else.5338               # 217
	jmp	je_cont.5339               # 217
je_else.5338:                   # 217
	xorpd	min_caml_fnegd, %xmm0    # 217
je_cont.5339:                   # 217
	movl	4(%ebp), %eax             # 218
	movsd	0(%eax), %xmm1           # 218
	divsd	%xmm0, %xmm1             # 218
	movsd	%xmm1, 0(%eax)           # 218
	movsd	8(%eax), %xmm1           # 219
	divsd	%xmm0, %xmm1             # 219
	movsd	%xmm1, 8(%eax)           # 219
	movsd	16(%eax), %xmm1          # 220
	divsd	%xmm0, %xmm1             # 220
	movsd	%xmm1, 16(%eax)          # 220
	ret                            # 220
sgn.2025:                       # 225
	movl	$l.4442, %eax             # 225
	movsd	0(%eax), %xmm1           # 225
	comisd	%xmm1, %xmm0            # 225
	ja	jbe_else.5341               # 225
	movl	$l.4446, %eax             # 226
	movsd	0(%eax), %xmm0           # 226
	ret                            # 226
jbe_else.5341:                  # 225
	movl	$l.4444, %eax             # 225
	movsd	0(%eax), %xmm0           # 225
	ret                            # 225
rad.2027:                       # 232
	movl	$l.4448, %eax             # 232
	movsd	0(%eax), %xmm1           # 232
	mulsd	%xmm1, %xmm0             # 232
	ret                            # 232
read_environ.2029:              # 241
	movl	$min_caml_screen, %eax    # 241
	movl	%eax, 0(%ebp)             # 241
	addl	$8, %ebp                  # 241
	call	min_caml_read_float       # 241
	subl	$8, %ebp                  # 241
	movl	0(%ebp), %eax             # 241
	movsd	%xmm0, 0(%eax)           # 241
	movl	$min_caml_screen, %eax    # 242
	movl	%eax, 4(%ebp)             # 242
	addl	$8, %ebp                  # 242
	call	min_caml_read_float       # 242
	subl	$8, %ebp                  # 242
	movl	4(%ebp), %eax             # 242
	movsd	%xmm0, 8(%eax)           # 242
	movl	$min_caml_screen, %eax    # 243
	movl	%eax, 8(%ebp)             # 243
	addl	$16, %ebp                 # 243
	call	min_caml_read_float       # 243
	subl	$16, %ebp                 # 243
	movl	8(%ebp), %eax             # 243
	movsd	%xmm0, 16(%eax)          # 243
	addl	$16, %ebp                 # 245
	call	min_caml_read_float       # 245
	subl	$16, %ebp                 # 245
	addl	$16, %ebp                 # 245
	call	rad.2027                  # 245
	subl	$16, %ebp                 # 245
	movl	$min_caml_cos_v, %eax     # 246
	movsd	%xmm0, 16(%ebp)          # 246
	movl	%eax, 24(%ebp)            # 246
	addl	$32, %ebp                 # 246
	call	min_caml_cos              # 246
	subl	$32, %ebp                 # 246
	movl	24(%ebp), %eax            # 246
	movsd	%xmm0, 0(%eax)           # 246
	movl	$min_caml_sin_v, %eax     # 247
	movsd	16(%ebp), %xmm0          # 247
	movl	%eax, 28(%ebp)            # 247
	addl	$32, %ebp                 # 247
	call	min_caml_sin              # 247
	subl	$32, %ebp                 # 247
	movl	28(%ebp), %eax            # 247
	movsd	%xmm0, 0(%eax)           # 247
	addl	$32, %ebp                 # 248
	call	min_caml_read_float       # 248
	subl	$32, %ebp                 # 248
	addl	$32, %ebp                 # 248
	call	rad.2027                  # 248
	subl	$32, %ebp                 # 248
	movl	$min_caml_cos_v, %eax     # 249
	movsd	%xmm0, 32(%ebp)          # 249
	movl	%eax, 40(%ebp)            # 249
	addl	$48, %ebp                 # 249
	call	min_caml_cos              # 249
	subl	$48, %ebp                 # 249
	movl	40(%ebp), %eax            # 249
	movsd	%xmm0, 8(%eax)           # 249
	movl	$min_caml_sin_v, %eax     # 250
	movsd	32(%ebp), %xmm0          # 250
	movl	%eax, 44(%ebp)            # 250
	addl	$48, %ebp                 # 250
	call	min_caml_sin              # 250
	subl	$48, %ebp                 # 250
	movl	44(%ebp), %eax            # 250
	movsd	%xmm0, 8(%eax)           # 250
	addl	$48, %ebp                 # 252
	call	min_caml_read_float       # 252
	subl	$48, %ebp                 # 252
	addl	$48, %ebp                 # 255
	call	min_caml_read_float       # 255
	subl	$48, %ebp                 # 255
	addl	$48, %ebp                 # 255
	call	rad.2027                  # 255
	subl	$48, %ebp                 # 255
	movsd	%xmm0, 48(%ebp)          # 256
	addl	$56, %ebp                 # 256
	call	min_caml_sin              # 256
	subl	$56, %ebp                 # 256
	movl	$min_caml_light, %eax     # 257
	xorpd	min_caml_fnegd, %xmm0    # 257
	movsd	%xmm0, 8(%eax)           # 257
	addl	$56, %ebp                 # 258
	call	min_caml_read_float       # 258
	subl	$56, %ebp                 # 258
	addl	$56, %ebp                 # 258
	call	rad.2027                  # 258
	subl	$56, %ebp                 # 258
	movsd	48(%ebp), %xmm1          # 259
	movsd	%xmm0, 56(%ebp)          # 259
	movsd	%xmm1, %xmm0             # 259
	addl	$64, %ebp                 # 259
	call	min_caml_cos              # 259
	subl	$64, %ebp                 # 259
	movsd	56(%ebp), %xmm1          # 260
	movsd	%xmm0, 64(%ebp)          # 260
	movsd	%xmm1, %xmm0             # 260
	addl	$72, %ebp                 # 260
	call	min_caml_sin              # 260
	subl	$72, %ebp                 # 260
	movl	$min_caml_light, %eax     # 261
	movsd	64(%ebp), %xmm1          # 261
	mulsd	%xmm1, %xmm0             # 261
	movsd	%xmm0, 0(%eax)           # 261
	movsd	56(%ebp), %xmm0          # 262
	addl	$72, %ebp                 # 262
	call	min_caml_cos              # 262
	subl	$72, %ebp                 # 262
	movl	$min_caml_light, %eax     # 263
	movsd	64(%ebp), %xmm1          # 263
	mulsd	%xmm0, %xmm1             # 263
	movsd	%xmm1, 16(%eax)          # 263
	movl	$min_caml_beam, %eax      # 264
	movl	%eax, 72(%ebp)            # 264
	addl	$80, %ebp                 # 264
	call	min_caml_read_float       # 264
	subl	$80, %ebp                 # 264
	movl	72(%ebp), %eax            # 264
	movsd	%xmm0, 0(%eax)           # 264
	movl	$min_caml_vp, %eax        # 267
	movl	$min_caml_cos_v, %ebx     # 267
	movsd	0(%ebx), %xmm0           # 267
	movl	$min_caml_sin_v, %ebx     # 267
	movsd	8(%ebx), %xmm1           # 267
	mulsd	%xmm1, %xmm0             # 267
	movl	$l.4450, %ebx             # 267
	movsd	0(%ebx), %xmm1           # 267
	mulsd	%xmm1, %xmm0             # 267
	movsd	%xmm0, 0(%eax)           # 267
	movl	$min_caml_vp, %eax        # 268
	movl	$min_caml_sin_v, %ebx     # 268
	movsd	0(%ebx), %xmm0           # 268
	xorpd	min_caml_fnegd, %xmm0    # 268
	movl	$l.4450, %ebx             # 268
	movsd	0(%ebx), %xmm1           # 268
	mulsd	%xmm1, %xmm0             # 268
	movsd	%xmm0, 8(%eax)           # 268
	movl	$min_caml_vp, %eax        # 269
	movl	$min_caml_cos_v, %ebx     # 269
	movsd	0(%ebx), %xmm0           # 269
	movl	$min_caml_cos_v, %ebx     # 269
	movsd	8(%ebx), %xmm1           # 269
	mulsd	%xmm1, %xmm0             # 269
	movl	$l.4450, %ebx             # 269
	movsd	0(%ebx), %xmm1           # 269
	mulsd	%xmm1, %xmm0             # 269
	movsd	%xmm0, 16(%eax)          # 269
	movl	$min_caml_view, %eax      # 272
	movl	$min_caml_vp, %ebx        # 272
	movsd	0(%ebx), %xmm0           # 272
	movl	$min_caml_screen, %ebx    # 272
	movsd	0(%ebx), %xmm1           # 272
	addsd	%xmm1, %xmm0             # 272
	movsd	%xmm0, 0(%eax)           # 272
	movl	$min_caml_view, %eax      # 273
	movl	$min_caml_vp, %ebx        # 273
	movsd	8(%ebx), %xmm0           # 273
	movl	$min_caml_screen, %ebx    # 273
	movsd	8(%ebx), %xmm1           # 273
	addsd	%xmm1, %xmm0             # 273
	movsd	%xmm0, 8(%eax)           # 273
	movl	$min_caml_view, %eax      # 274
	movl	$min_caml_vp, %ebx        # 274
	movsd	16(%ebx), %xmm0          # 274
	movl	$min_caml_screen, %ebx    # 274
	movsd	16(%ebx), %xmm1          # 274
	addsd	%xmm1, %xmm0             # 274
	movsd	%xmm0, 16(%eax)          # 274
	ret                            # 274
read_nth_object.2031:           # 283
	movl	%eax, 0(%ebp)             # 283
	addl	$8, %ebp                  # 283
	call	min_caml_read_int         # 283
	subl	$8, %ebp                  # 283
	cmpl	$-1, %eax                 # 284
	jne	je_else.5344               # 284
	movl	$0, %eax                  # 403
	ret                            # 403
je_else.5344:                   # 284
	movl	%eax, 4(%ebp)             # 286
	addl	$8, %ebp                  # 286
	call	min_caml_read_int         # 286
	subl	$8, %ebp                  # 286
	movl	%eax, 8(%ebp)             # 287
	addl	$16, %ebp                 # 287
	call	min_caml_read_int         # 287
	subl	$16, %ebp                 # 287
	movl	%eax, 12(%ebp)            # 288
	addl	$16, %ebp                 # 288
	call	min_caml_read_int         # 288
	subl	$16, %ebp                 # 288
	movl	$3, %ebx                  # 290
	movl	$l.4442, %ecx             # 290
	movsd	0(%ecx), %xmm0           # 290
	movl	%eax, 16(%ebp)            # 290
	movl	%ebx, %eax                # 290
	addl	$24, %ebp                 # 290
	call	min_caml_create_float_array	# 290
	subl	$24, %ebp                 # 290
	movl	%eax, 20(%ebp)            # 292
	addl	$24, %ebp                 # 292
	call	min_caml_read_float       # 292
	subl	$24, %ebp                 # 292
	movl	20(%ebp), %eax            # 292
	movsd	%xmm0, 0(%eax)           # 292
	addl	$24, %ebp                 # 293
	call	min_caml_read_float       # 293
	subl	$24, %ebp                 # 293
	movl	20(%ebp), %eax            # 293
	movsd	%xmm0, 8(%eax)           # 293
	addl	$24, %ebp                 # 294
	call	min_caml_read_float       # 294
	subl	$24, %ebp                 # 294
	movl	20(%ebp), %eax            # 294
	movsd	%xmm0, 16(%eax)          # 294
	movl	$3, %ebx                  # 296
	movl	$l.4442, %ecx             # 296
	movsd	0(%ecx), %xmm0           # 296
	movl	%ebx, %eax                # 296
	addl	$24, %ebp                 # 296
	call	min_caml_create_float_array	# 296
	subl	$24, %ebp                 # 296
	movl	%eax, 24(%ebp)            # 298
	addl	$32, %ebp                 # 298
	call	min_caml_read_float       # 298
	subl	$32, %ebp                 # 298
	movl	24(%ebp), %eax            # 298
	movsd	%xmm0, 0(%eax)           # 298
	addl	$32, %ebp                 # 299
	call	min_caml_read_float       # 299
	subl	$32, %ebp                 # 299
	movl	24(%ebp), %eax            # 299
	movsd	%xmm0, 8(%eax)           # 299
	addl	$32, %ebp                 # 300
	call	min_caml_read_float       # 300
	subl	$32, %ebp                 # 300
	movl	24(%ebp), %eax            # 300
	movsd	%xmm0, 16(%eax)          # 300
	movl	$l.4442, %ebx             # 302
	movsd	0(%ebx), %xmm0           # 302
	movsd	%xmm0, 32(%ebp)          # 302
	addl	$40, %ebp                 # 302
	call	min_caml_read_float       # 302
	subl	$40, %ebp                 # 302
	movsd	32(%ebp), %xmm1          # 302
	comisd	%xmm0, %xmm1            # 302
	ja	jbe_else.5346               # 302
	movl	$0, %eax                  # 302
	jmp	jbe_cont.5347              # 302
jbe_else.5346:                  # 302
	movl	$1, %eax                  # 302
jbe_cont.5347:                  # 302
	movl	$2, %ebx                  # 304
	movl	$l.4442, %ecx             # 304
	movsd	0(%ecx), %xmm0           # 304
	movl	%eax, 40(%ebp)            # 304
	movl	%ebx, %eax                # 304
	addl	$48, %ebp                 # 304
	call	min_caml_create_float_array	# 304
	subl	$48, %ebp                 # 304
	movl	%eax, 44(%ebp)            # 306
	addl	$48, %ebp                 # 306
	call	min_caml_read_float       # 306
	subl	$48, %ebp                 # 306
	movl	44(%ebp), %eax            # 306
	movsd	%xmm0, 0(%eax)           # 306
	addl	$48, %ebp                 # 307
	call	min_caml_read_float       # 307
	subl	$48, %ebp                 # 307
	movl	44(%ebp), %eax            # 307
	movsd	%xmm0, 8(%eax)           # 307
	movl	$3, %ebx                  # 309
	movl	$l.4442, %ecx             # 309
	movsd	0(%ecx), %xmm0           # 309
	movl	%ebx, %eax                # 309
	addl	$48, %ebp                 # 309
	call	min_caml_create_float_array	# 309
	subl	$48, %ebp                 # 309
	movl	%eax, 48(%ebp)            # 311
	addl	$56, %ebp                 # 311
	call	min_caml_read_float       # 311
	subl	$56, %ebp                 # 311
	movl	48(%ebp), %eax            # 311
	movsd	%xmm0, 0(%eax)           # 311
	addl	$56, %ebp                 # 312
	call	min_caml_read_float       # 312
	subl	$56, %ebp                 # 312
	movl	48(%ebp), %eax            # 312
	movsd	%xmm0, 8(%eax)           # 312
	addl	$56, %ebp                 # 313
	call	min_caml_read_float       # 313
	subl	$56, %ebp                 # 313
	movl	48(%ebp), %eax            # 313
	movsd	%xmm0, 16(%eax)          # 313
	movl	$3, %ebx                  # 315
	movl	$l.4442, %ecx             # 315
	movsd	0(%ecx), %xmm0           # 315
	movl	%ebx, %eax                # 315
	addl	$56, %ebp                 # 315
	call	min_caml_create_float_array	# 315
	subl	$56, %ebp                 # 315
	movl	16(%ebp), %ebx            # 316
	cmpl	$0, %ebx                  # 316
	jne	je_else.5348               # 316
	jmp	je_cont.5349               # 316
je_else.5348:                   # 316
	movl	%eax, 52(%ebp)            # 318
	addl	$56, %ebp                 # 318
	call	min_caml_read_float       # 318
	subl	$56, %ebp                 # 318
	addl	$56, %ebp                 # 318
	call	rad.2027                  # 318
	subl	$56, %ebp                 # 318
	movl	52(%ebp), %eax            # 318
	movsd	%xmm0, 0(%eax)           # 318
	addl	$56, %ebp                 # 319
	call	min_caml_read_float       # 319
	subl	$56, %ebp                 # 319
	addl	$56, %ebp                 # 319
	call	rad.2027                  # 319
	subl	$56, %ebp                 # 319
	movl	52(%ebp), %eax            # 319
	movsd	%xmm0, 8(%eax)           # 319
	addl	$56, %ebp                 # 320
	call	min_caml_read_float       # 320
	subl	$56, %ebp                 # 320
	addl	$56, %ebp                 # 320
	call	rad.2027                  # 320
	subl	$56, %ebp                 # 320
	movl	52(%ebp), %eax            # 320
	movsd	%xmm0, 16(%eax)          # 320
je_cont.5349:                   # 316
	movl	8(%ebp), %ebx             # 327
	cmpl	$2, %ebx                  # 327
	jne	je_else.5350               # 327
	movl	$1, %ecx                  # 327
	jmp	je_cont.5351               # 327
je_else.5350:                   # 327
	movl	40(%ebp), %ecx            # 327
je_cont.5351:                   # 327
	movl	min_caml_hp, %edx         # 330
	addl	$40, min_caml_hp          # 330
	movl	%eax, 36(%edx)            # 330
	movl	48(%ebp), %esi            # 330
	movl	%esi, 32(%edx)            # 330
	movl	44(%ebp), %esi            # 330
	movl	%esi, 28(%edx)            # 330
	movl	%ecx, 24(%edx)            # 330
	movl	24(%ebp), %ecx            # 330
	movl	%ecx, 20(%edx)            # 330
	movl	20(%ebp), %ecx            # 330
	movl	%ecx, 16(%edx)            # 330
	movl	16(%ebp), %esi            # 330
	movl	%esi, 12(%edx)            # 330
	movl	12(%ebp), %edi            # 330
	movl	%edi, 8(%edx)             # 330
	movl	%ebx, 4(%edx)             # 330
	movl	4(%ebp), %edi             # 330
	movl	%edi, 0(%edx)             # 330
	movl	$min_caml_objects, %edi   # 338
	movl	%eax, 52(%ebp)            # 338
	movl	0(%ebp), %eax             # 338
	movl	%edx, (%edi,%eax,4)       # 338
	cmpl	$3, %ebx                  # 340
	jne	je_else.5352               # 340
	movsd	0(%ecx), %xmm0           # 343
	movl	$l.4442, %eax             # 344
	movsd	0(%eax), %xmm1           # 344
	comisd	%xmm0, %xmm1            # 344
	jne	je_else.5354               # 344
	movl	$l.4442, %eax             # 344
	movsd	0(%eax), %xmm1           # 344
	jmp	je_cont.5355               # 344
je_else.5354:                   # 344
	movsd	%xmm0, 56(%ebp)          # 344
	addl	$64, %ebp                 # 344
	call	sgn.2025                  # 344
	subl	$64, %ebp                 # 344
	movsd	56(%ebp), %xmm1          # 344
	movsd	%xmm0, 64(%ebp)          # 344
	movsd	%xmm1, %xmm0             # 344
	addl	$72, %ebp                 # 344
	call	fsqr.1980                 # 344
	subl	$72, %ebp                 # 344
	movsd	64(%ebp), %xmm1          # 344
	divsd	%xmm0, %xmm1             # 344
je_cont.5355:                   # 344
	movl	20(%ebp), %eax            # 344
	movsd	%xmm1, 0(%eax)           # 344
	movsd	8(%eax), %xmm0           # 345
	movl	$l.4442, %ebx             # 346
	movsd	0(%ebx), %xmm1           # 346
	comisd	%xmm0, %xmm1            # 346
	jne	je_else.5356               # 346
	movl	$l.4442, %ebx             # 346
	movsd	0(%ebx), %xmm1           # 346
	jmp	je_cont.5357               # 346
je_else.5356:                   # 346
	movsd	%xmm0, 72(%ebp)          # 346
	addl	$80, %ebp                 # 346
	call	sgn.2025                  # 346
	subl	$80, %ebp                 # 346
	movsd	72(%ebp), %xmm1          # 346
	movsd	%xmm0, 80(%ebp)          # 346
	movsd	%xmm1, %xmm0             # 346
	addl	$88, %ebp                 # 346
	call	fsqr.1980                 # 346
	subl	$88, %ebp                 # 346
	movsd	80(%ebp), %xmm1          # 346
	divsd	%xmm0, %xmm1             # 346
je_cont.5357:                   # 346
	movl	20(%ebp), %eax            # 346
	movsd	%xmm1, 8(%eax)           # 346
	movsd	16(%eax), %xmm0          # 347
	movl	$l.4442, %ebx             # 348
	movsd	0(%ebx), %xmm1           # 348
	comisd	%xmm0, %xmm1            # 348
	jne	je_else.5358               # 348
	movl	$l.4442, %ebx             # 348
	movsd	0(%ebx), %xmm1           # 348
	jmp	je_cont.5359               # 348
je_else.5358:                   # 348
	movsd	%xmm0, 88(%ebp)          # 348
	addl	$96, %ebp                 # 348
	call	sgn.2025                  # 348
	subl	$96, %ebp                 # 348
	movsd	88(%ebp), %xmm1          # 348
	movsd	%xmm0, 96(%ebp)          # 348
	movsd	%xmm1, %xmm0             # 348
	addl	$104, %ebp                # 348
	call	fsqr.1980                 # 348
	subl	$104, %ebp                # 348
	movsd	96(%ebp), %xmm1          # 348
	divsd	%xmm0, %xmm1             # 348
je_cont.5359:                   # 348
	movl	20(%ebp), %eax            # 348
	movsd	%xmm1, 16(%eax)          # 348
	jmp	je_cont.5353               # 340
je_else.5352:                   # 340
	cmpl	$2, %ebx                  # 350
	jne	je_else.5360               # 350
	movl	40(%ebp), %eax            # 352
	cmpl	$0, %eax                  # 352
	jne	je_else.5362               # 352
	movl	$1, %ebx                  # 352
	jmp	je_cont.5363               # 352
je_else.5362:                   # 352
	movl	$0, %ebx                  # 352
je_cont.5363:                   # 352
	movl	%ecx, %eax                # 352
	addl	$104, %ebp                # 352
	call	normalize_vector.2022     # 352
	subl	$104, %ebp                # 352
	jmp	je_cont.5361               # 350
je_else.5360:                   # 350
je_cont.5361:                   # 350
je_cont.5353:                   # 340
	movl	16(%ebp), %eax            # 356
	cmpl	$0, %eax                  # 356
	jne	je_else.5364               # 356
	jmp	je_cont.5365               # 356
je_else.5364:                   # 356
	movl	$min_caml_cs_temp, %eax   # 358
	movl	52(%ebp), %ebx            # 358
	movsd	0(%ebx), %xmm0           # 358
	movl	%eax, 104(%ebp)           # 358
	addl	$112, %ebp                # 358
	call	min_caml_cos              # 358
	subl	$112, %ebp                # 358
	movl	104(%ebp), %eax           # 358
	movsd	%xmm0, 80(%eax)          # 358
	movl	$min_caml_cs_temp, %eax   # 359
	movl	52(%ebp), %ebx            # 359
	movsd	0(%ebx), %xmm0           # 359
	movl	%eax, 108(%ebp)           # 359
	addl	$112, %ebp                # 359
	call	min_caml_sin              # 359
	subl	$112, %ebp                # 359
	movl	108(%ebp), %eax           # 359
	movsd	%xmm0, 88(%eax)          # 359
	movl	$min_caml_cs_temp, %eax   # 360
	movl	52(%ebp), %ebx            # 360
	movsd	8(%ebx), %xmm0           # 360
	movl	%eax, 112(%ebp)           # 360
	addl	$120, %ebp                # 360
	call	min_caml_cos              # 360
	subl	$120, %ebp                # 360
	movl	112(%ebp), %eax           # 360
	movsd	%xmm0, 96(%eax)          # 360
	movl	$min_caml_cs_temp, %eax   # 361
	movl	52(%ebp), %ebx            # 361
	movsd	8(%ebx), %xmm0           # 361
	movl	%eax, 116(%ebp)           # 361
	addl	$120, %ebp                # 361
	call	min_caml_sin              # 361
	subl	$120, %ebp                # 361
	movl	116(%ebp), %eax           # 361
	movsd	%xmm0, 104(%eax)         # 361
	movl	$min_caml_cs_temp, %eax   # 362
	movl	52(%ebp), %ebx            # 362
	movsd	16(%ebx), %xmm0          # 362
	movl	%eax, 120(%ebp)           # 362
	addl	$128, %ebp                # 362
	call	min_caml_cos              # 362
	subl	$128, %ebp                # 362
	movl	120(%ebp), %eax           # 362
	movsd	%xmm0, 112(%eax)         # 362
	movl	$min_caml_cs_temp, %eax   # 363
	movl	52(%ebp), %ebx            # 363
	movsd	16(%ebx), %xmm0          # 363
	movl	%eax, 124(%ebp)           # 363
	addl	$128, %ebp                # 363
	call	min_caml_sin              # 363
	subl	$128, %ebp                # 363
	movl	124(%ebp), %eax           # 363
	movsd	%xmm0, 120(%eax)         # 363
	movl	$min_caml_cs_temp, %eax   # 364
	movl	$min_caml_cs_temp, %ebx   # 364
	movsd	96(%ebx), %xmm0          # 364
	movl	$min_caml_cs_temp, %ebx   # 364
	movsd	112(%ebx), %xmm1         # 364
	mulsd	%xmm1, %xmm0             # 364
	movsd	%xmm0, 0(%eax)           # 364
	movl	$min_caml_cs_temp, %eax   # 365
	movl	$min_caml_cs_temp, %ebx   # 365
	movsd	88(%ebx), %xmm0          # 365
	movl	$min_caml_cs_temp, %ebx   # 365
	movsd	104(%ebx), %xmm1         # 365
	mulsd	%xmm1, %xmm0             # 365
	movl	$min_caml_cs_temp, %ebx   # 365
	movsd	112(%ebx), %xmm1         # 365
	mulsd	%xmm1, %xmm0             # 365
	movl	$min_caml_cs_temp, %ebx   # 365
	movsd	80(%ebx), %xmm1          # 365
	movl	$min_caml_cs_temp, %ebx   # 365
	movsd	120(%ebx), %xmm2         # 365
	mulsd	%xmm2, %xmm1             # 365
	subsd	%xmm1, %xmm0             # 365
	movsd	%xmm0, 8(%eax)           # 365
	movl	$min_caml_cs_temp, %eax   # 367
	movl	$min_caml_cs_temp, %ebx   # 367
	movsd	80(%ebx), %xmm0          # 367
	movl	$min_caml_cs_temp, %ebx   # 367
	movsd	104(%ebx), %xmm1         # 367
	mulsd	%xmm1, %xmm0             # 367
	movl	$min_caml_cs_temp, %ebx   # 367
	movsd	112(%ebx), %xmm1         # 367
	mulsd	%xmm1, %xmm0             # 367
	movl	$min_caml_cs_temp, %ebx   # 367
	movsd	88(%ebx), %xmm1          # 367
	movl	$min_caml_cs_temp, %ebx   # 367
	movsd	120(%ebx), %xmm2         # 367
	mulsd	%xmm2, %xmm1             # 367
	addsd	%xmm1, %xmm0             # 367
	movsd	%xmm0, 16(%eax)          # 367
	movl	$min_caml_cs_temp, %eax   # 369
	movl	$min_caml_cs_temp, %ebx   # 369
	movsd	96(%ebx), %xmm0          # 369
	movl	$min_caml_cs_temp, %ebx   # 369
	movsd	120(%ebx), %xmm1         # 369
	mulsd	%xmm1, %xmm0             # 369
	movsd	%xmm0, 24(%eax)          # 369
	movl	$min_caml_cs_temp, %eax   # 370
	movl	$min_caml_cs_temp, %ebx   # 370
	movsd	88(%ebx), %xmm0          # 370
	movl	$min_caml_cs_temp, %ebx   # 370
	movsd	104(%ebx), %xmm1         # 370
	mulsd	%xmm1, %xmm0             # 370
	movl	$min_caml_cs_temp, %ebx   # 370
	movsd	120(%ebx), %xmm1         # 370
	mulsd	%xmm1, %xmm0             # 370
	movl	$min_caml_cs_temp, %ebx   # 370
	movsd	80(%ebx), %xmm1          # 370
	movl	$min_caml_cs_temp, %ebx   # 370
	movsd	112(%ebx), %xmm2         # 370
	mulsd	%xmm2, %xmm1             # 370
	addsd	%xmm1, %xmm0             # 370
	movsd	%xmm0, 32(%eax)          # 370
	movl	$min_caml_cs_temp, %eax   # 372
	movl	$min_caml_cs_temp, %ebx   # 372
	movsd	80(%ebx), %xmm0          # 372
	movl	$min_caml_cs_temp, %ebx   # 372
	movsd	104(%ebx), %xmm1         # 372
	mulsd	%xmm1, %xmm0             # 372
	movl	$min_caml_cs_temp, %ebx   # 372
	movsd	120(%ebx), %xmm1         # 372
	mulsd	%xmm1, %xmm0             # 372
	movl	$min_caml_cs_temp, %ebx   # 372
	movsd	88(%ebx), %xmm1          # 372
	movl	$min_caml_cs_temp, %ebx   # 372
	movsd	112(%ebx), %xmm2         # 372
	mulsd	%xmm2, %xmm1             # 372
	subsd	%xmm1, %xmm0             # 372
	movsd	%xmm0, 40(%eax)          # 372
	movl	$min_caml_cs_temp, %eax   # 374
	movl	$min_caml_cs_temp, %ebx   # 374
	movsd	104(%ebx), %xmm0         # 374
	xorpd	min_caml_fnegd, %xmm0    # 374
	movsd	%xmm0, 48(%eax)          # 374
	movl	$min_caml_cs_temp, %eax   # 375
	movl	$min_caml_cs_temp, %ebx   # 375
	movsd	88(%ebx), %xmm0          # 375
	movl	$min_caml_cs_temp, %ebx   # 375
	movsd	96(%ebx), %xmm1          # 375
	mulsd	%xmm1, %xmm0             # 375
	movsd	%xmm0, 56(%eax)          # 375
	movl	$min_caml_cs_temp, %eax   # 376
	movl	$min_caml_cs_temp, %ebx   # 376
	movsd	80(%ebx), %xmm0          # 376
	movl	$min_caml_cs_temp, %ebx   # 376
	movsd	96(%ebx), %xmm1          # 376
	mulsd	%xmm1, %xmm0             # 376
	movsd	%xmm0, 64(%eax)          # 376
	movl	20(%ebp), %eax            # 377
	movsd	0(%eax), %xmm0           # 377
	movsd	8(%eax), %xmm1           # 378
	movsd	16(%eax), %xmm2          # 379
	movl	$min_caml_cs_temp, %ebx   # 380
	movsd	0(%ebx), %xmm3           # 380
	movsd	%xmm2, 128(%ebp)         # 380
	movsd	%xmm1, 136(%ebp)         # 380
	movsd	%xmm0, 144(%ebp)         # 380
	movsd	%xmm3, %xmm0             # 380
	addl	$152, %ebp                # 380
	call	fsqr.1980                 # 380
	subl	$152, %ebp                # 380
	movsd	144(%ebp), %xmm1         # 380
	mulsd	%xmm1, %xmm0             # 380
	movl	$min_caml_cs_temp, %eax   # 380
	movsd	24(%eax), %xmm2          # 380
	movsd	%xmm0, 152(%ebp)         # 380
	movsd	%xmm2, %xmm0             # 380
	addl	$160, %ebp                # 380
	call	fsqr.1980                 # 380
	subl	$160, %ebp                # 380
	movsd	136(%ebp), %xmm1         # 380
	mulsd	%xmm1, %xmm0             # 380
	movsd	152(%ebp), %xmm2         # 380
	addsd	%xmm0, %xmm2             # 380
	movl	$min_caml_cs_temp, %eax   # 380
	movsd	48(%eax), %xmm0          # 380
	movsd	%xmm2, 160(%ebp)         # 380
	addl	$168, %ebp                # 380
	call	fsqr.1980                 # 380
	subl	$168, %ebp                # 380
	movsd	128(%ebp), %xmm1         # 380
	mulsd	%xmm1, %xmm0             # 380
	movsd	160(%ebp), %xmm2         # 380
	addsd	%xmm0, %xmm2             # 380
	movl	20(%ebp), %eax            # 380
	movsd	%xmm2, 0(%eax)           # 380
	movl	$min_caml_cs_temp, %ebx   # 381
	movsd	8(%ebx), %xmm0           # 381
	addl	$168, %ebp                # 381
	call	fsqr.1980                 # 381
	subl	$168, %ebp                # 381
	movsd	144(%ebp), %xmm1         # 381
	mulsd	%xmm1, %xmm0             # 381
	movl	$min_caml_cs_temp, %eax   # 381
	movsd	32(%eax), %xmm2          # 381
	movsd	%xmm0, 168(%ebp)         # 381
	movsd	%xmm2, %xmm0             # 381
	addl	$176, %ebp                # 381
	call	fsqr.1980                 # 381
	subl	$176, %ebp                # 381
	movsd	136(%ebp), %xmm1         # 381
	mulsd	%xmm1, %xmm0             # 381
	movsd	168(%ebp), %xmm2         # 381
	addsd	%xmm0, %xmm2             # 381
	movl	$min_caml_cs_temp, %eax   # 381
	movsd	56(%eax), %xmm0          # 381
	movsd	%xmm2, 176(%ebp)         # 381
	addl	$184, %ebp                # 381
	call	fsqr.1980                 # 381
	subl	$184, %ebp                # 381
	movsd	128(%ebp), %xmm1         # 381
	mulsd	%xmm1, %xmm0             # 381
	movsd	176(%ebp), %xmm2         # 381
	addsd	%xmm0, %xmm2             # 381
	movl	20(%ebp), %eax            # 381
	movsd	%xmm2, 8(%eax)           # 381
	movl	$min_caml_cs_temp, %ebx   # 382
	movsd	16(%ebx), %xmm0          # 382
	addl	$184, %ebp                # 382
	call	fsqr.1980                 # 382
	subl	$184, %ebp                # 382
	movsd	144(%ebp), %xmm1         # 382
	mulsd	%xmm1, %xmm0             # 382
	movl	$min_caml_cs_temp, %eax   # 382
	movsd	40(%eax), %xmm2          # 382
	movsd	%xmm0, 184(%ebp)         # 382
	movsd	%xmm2, %xmm0             # 382
	addl	$192, %ebp                # 382
	call	fsqr.1980                 # 382
	subl	$192, %ebp                # 382
	movsd	136(%ebp), %xmm1         # 382
	mulsd	%xmm1, %xmm0             # 382
	movsd	184(%ebp), %xmm2         # 382
	addsd	%xmm0, %xmm2             # 382
	movl	$min_caml_cs_temp, %eax   # 382
	movsd	64(%eax), %xmm0          # 382
	movsd	%xmm2, 192(%ebp)         # 382
	addl	$200, %ebp                # 382
	call	fsqr.1980                 # 382
	subl	$200, %ebp                # 382
	movsd	128(%ebp), %xmm1         # 382
	mulsd	%xmm1, %xmm0             # 382
	movsd	192(%ebp), %xmm2         # 382
	addsd	%xmm0, %xmm2             # 382
	movl	20(%ebp), %eax            # 382
	movsd	%xmm2, 16(%eax)          # 382
	movl	$l.4440, %eax             # 383
	movsd	0(%eax), %xmm0           # 383
	movl	$min_caml_cs_temp, %eax   # 383
	movsd	8(%eax), %xmm2           # 383
	movsd	144(%ebp), %xmm3         # 383
	mulsd	%xmm3, %xmm2             # 383
	movl	$min_caml_cs_temp, %eax   # 383
	movsd	16(%eax), %xmm4          # 383
	mulsd	%xmm4, %xmm2             # 383
	movl	$min_caml_cs_temp, %eax   # 383
	movsd	32(%eax), %xmm4          # 383
	movsd	136(%ebp), %xmm5         # 383
	mulsd	%xmm5, %xmm4             # 383
	movl	$min_caml_cs_temp, %eax   # 383
	movsd	40(%eax), %xmm6          # 383
	mulsd	%xmm6, %xmm4             # 383
	addsd	%xmm4, %xmm2             # 383
	movl	$min_caml_cs_temp, %eax   # 383
	movsd	56(%eax), %xmm4          # 383
	mulsd	%xmm1, %xmm4             # 383
	movl	$min_caml_cs_temp, %eax   # 383
	movsd	64(%eax), %xmm6          # 383
	mulsd	%xmm6, %xmm4             # 383
	addsd	%xmm4, %xmm2             # 383
	mulsd	%xmm2, %xmm0             # 383
	movl	52(%ebp), %eax            # 383
	movsd	%xmm0, 0(%eax)           # 383
	movl	$l.4440, %ebx             # 386
	movsd	0(%ebx), %xmm0           # 386
	movl	$min_caml_cs_temp, %ebx   # 386
	movsd	0(%ebx), %xmm2           # 386
	mulsd	%xmm3, %xmm2             # 386
	movl	$min_caml_cs_temp, %ebx   # 386
	movsd	16(%ebx), %xmm4          # 386
	mulsd	%xmm4, %xmm2             # 386
	movl	$min_caml_cs_temp, %ebx   # 386
	movsd	24(%ebx), %xmm4          # 386
	mulsd	%xmm5, %xmm4             # 386
	movl	$min_caml_cs_temp, %ebx   # 386
	movsd	40(%ebx), %xmm6          # 386
	mulsd	%xmm6, %xmm4             # 386
	addsd	%xmm4, %xmm2             # 386
	movl	$min_caml_cs_temp, %ebx   # 386
	movsd	48(%ebx), %xmm4          # 386
	mulsd	%xmm1, %xmm4             # 386
	movl	$min_caml_cs_temp, %ebx   # 386
	movsd	64(%ebx), %xmm6          # 386
	mulsd	%xmm6, %xmm4             # 386
	addsd	%xmm4, %xmm2             # 386
	mulsd	%xmm2, %xmm0             # 386
	movsd	%xmm0, 8(%eax)           # 386
	movl	$l.4440, %ebx             # 389
	movsd	0(%ebx), %xmm0           # 389
	movl	$min_caml_cs_temp, %ebx   # 389
	movsd	0(%ebx), %xmm2           # 389
	mulsd	%xmm2, %xmm3             # 389
	movl	$min_caml_cs_temp, %ebx   # 389
	movsd	8(%ebx), %xmm2           # 389
	mulsd	%xmm2, %xmm3             # 389
	movl	$min_caml_cs_temp, %ebx   # 389
	movsd	24(%ebx), %xmm2          # 389
	mulsd	%xmm2, %xmm5             # 389
	movl	$min_caml_cs_temp, %ebx   # 389
	movsd	32(%ebx), %xmm2          # 389
	mulsd	%xmm2, %xmm5             # 389
	addsd	%xmm5, %xmm3             # 389
	movl	$min_caml_cs_temp, %ebx   # 389
	movsd	48(%ebx), %xmm2          # 389
	mulsd	%xmm2, %xmm1             # 389
	movl	$min_caml_cs_temp, %ebx   # 389
	movsd	56(%ebx), %xmm2          # 389
	mulsd	%xmm2, %xmm1             # 389
	addsd	%xmm1, %xmm3             # 389
	mulsd	%xmm3, %xmm0             # 389
	movsd	%xmm0, 16(%eax)          # 389
je_cont.5365:                   # 356
	movl	$1, %eax                  # 400
	ret                            # 400
read_object.2033:               # 409
	cmpl	$61, %eax                 # 409
	jl	jge_else.5366               # 409
	ret                            # 413
jge_else.5366:                  # 409
	movl	%eax, 0(%ebp)             # 410
	addl	$8, %ebp                  # 410
	call	read_nth_object.2031      # 410
	subl	$8, %ebp                  # 410
	cmpl	$0, %eax                  # 410
	jne	je_else.5368               # 410
	ret                            # 412
je_else.5368:                   # 410
	movl	0(%ebp), %eax             # 411
	addl	$1, %eax                  # 411
	jmp	read_object.2033           # 411
read_all_object.2035:           # 418
	movl	$0, %eax                  # 418
	jmp	read_object.2033           # 418
read_net_item.2037:             # 426
	movl	%eax, 0(%ebp)             # 426
	addl	$8, %ebp                  # 426
	call	min_caml_read_int         # 426
	subl	$8, %ebp                  # 426
	cmpl	$-1, %eax                 # 427
	jne	je_else.5370               # 427
	movl	0(%ebp), %eax             # 427
	addl	$1, %eax                  # 427
	movl	$-1, %ebx                 # 427
	jmp	min_caml_create_array      # 427
je_else.5370:                   # 427
	movl	0(%ebp), %ebx             # 429
	movl	%ebx, %ecx                # 429
	addl	$1, %ecx                  # 429
	movl	%eax, 4(%ebp)             # 429
	movl	%ecx, %eax                # 429
	addl	$8, %ebp                  # 429
	call	read_net_item.2037        # 429
	subl	$8, %ebp                  # 429
	movl	0(%ebp), %ebx             # 430
	movl	4(%ebp), %ecx             # 430
	movl	%ecx, (%eax,%ebx,4)       # 430
	ret                            # 430
read_or_network.2039:           # 435
	movl	$0, %ebx                  # 435
	movl	%eax, 0(%ebp)             # 435
	movl	%ebx, %eax                # 435
	addl	$8, %ebp                  # 435
	call	read_net_item.2037        # 435
	subl	$8, %ebp                  # 435
	movl	%eax, %ebx                # 435
	movl	0(%ebx), %eax             # 436
	cmpl	$-1, %eax                 # 436
	jne	je_else.5371               # 436
	movl	0(%ebp), %eax             # 437
	addl	$1, %eax                  # 437
	jmp	min_caml_create_array      # 437
je_else.5371:                   # 436
	movl	0(%ebp), %eax             # 439
	movl	%eax, %ecx                # 439
	addl	$1, %ecx                  # 439
	movl	%ebx, 4(%ebp)             # 439
	movl	%ecx, %eax                # 439
	addl	$8, %ebp                  # 439
	call	read_or_network.2039      # 439
	subl	$8, %ebp                  # 439
	movl	0(%ebp), %ebx             # 440
	movl	4(%ebp), %ecx             # 440
	movl	%ecx, (%eax,%ebx,4)       # 440
	ret                            # 440
read_and_network.2041:          # 445
	movl	$0, %ebx                  # 445
	movl	%eax, 0(%ebp)             # 445
	movl	%ebx, %eax                # 445
	addl	$8, %ebp                  # 445
	call	read_net_item.2037        # 445
	subl	$8, %ebp                  # 445
	movl	0(%eax), %ebx             # 446
	cmpl	$-1, %ebx                 # 446
	jne	je_else.5372               # 446
	ret                            # 446
je_else.5372:                   # 446
	movl	$min_caml_and_net, %ebx   # 448
	movl	0(%ebp), %ecx             # 448
	movl	%eax, (%ebx,%ecx,4)       # 448
	movl	%ecx, %eax                # 449
	addl	$1, %eax                  # 449
	jmp	read_and_network.2041      # 449
read_parameter.2043:            # 456
	call	read_environ.2029         # 456
	call	read_all_object.2035      # 457
	movl	$0, %eax                  # 458
	call	read_and_network.2041     # 458
	movl	$min_caml_or_net, %eax    # 459
	movl	$0, %ebx                  # 459
	movl	%eax, 0(%ebp)             # 459
	movl	%ebx, %eax                # 459
	addl	$8, %ebp                  # 459
	call	read_or_network.2039      # 459
	subl	$8, %ebp                  # 459
	movl	0(%ebp), %ebx             # 459
	movl	%eax, 0(%ebx)             # 459
	ret                            # 459
solver_rect.2045:               # 479
	movl	$l.4442, %ecx             # 479
	movsd	0(%ecx), %xmm0           # 479
	movsd	0(%ebx), %xmm1           # 479
	movl	%eax, 0(%ebp)             # 479
	movl	%ebx, 4(%ebp)             # 479
	comisd	%xmm1, %xmm0            # 479
	jne	je_else.5375               # 479
	movl	$0, %eax                  # 480
	jmp	je_cont.5376               # 479
je_else.5375:                   # 479
	addl	$8, %ebp                  # 481
	call	o_isinvert.1990           # 481
	subl	$8, %ebp                  # 481
	movl	$l.4442, %ebx             # 481
	movsd	0(%ebx), %xmm0           # 481
	movl	4(%ebp), %ebx             # 481
	movsd	0(%ebx), %xmm1           # 481
	comisd	%xmm1, %xmm0            # 481
	ja	jbe_else.5377               # 481
	movl	$0, %ecx                  # 482
	jmp	jbe_cont.5378              # 481
jbe_else.5377:                  # 481
	movl	$1, %ecx                  # 482
jbe_cont.5378:                  # 481
	movl	%ecx, %ebx                # 481
	addl	$8, %ebp                  # 481
	call	xor.1977                  # 481
	subl	$8, %ebp                  # 481
	cmpl	$0, %eax                  # 481
	jne	je_else.5379               # 481
	movl	0(%ebp), %eax             # 482
	addl	$8, %ebp                  # 482
	call	o_param_a.1994            # 482
	subl	$8, %ebp                  # 482
	xorpd	min_caml_fnegd, %xmm0    # 482
	jmp	je_cont.5380               # 481
je_else.5379:                   # 481
	movl	0(%ebp), %eax             # 482
	addl	$8, %ebp                  # 482
	call	o_param_a.1994            # 482
	subl	$8, %ebp                  # 482
je_cont.5380:                   # 481
	movl	$min_caml_solver_w_vec, %eax	# 484
	movsd	0(%eax), %xmm1           # 484
	subsd	%xmm1, %xmm0             # 484
	movl	4(%ebp), %eax             # 484
	movsd	0(%eax), %xmm1           # 484
	divsd	%xmm1, %xmm0             # 484
	movl	0(%ebp), %ebx             # 486
	movsd	%xmm0, 8(%ebp)           # 486
	movl	%ebx, %eax                # 486
	addl	$16, %ebp                 # 486
	call	o_param_b.1996            # 486
	subl	$16, %ebp                 # 486
	movl	4(%ebp), %eax             # 486
	movsd	8(%eax), %xmm1           # 486
	movsd	8(%ebp), %xmm2           # 486
	mulsd	%xmm2, %xmm1             # 486
	movl	$min_caml_solver_w_vec, %ebx	# 486
	movsd	8(%ebx), %xmm3           # 486
	addsd	%xmm3, %xmm1             # 486
	movsd	%xmm0, 16(%ebp)          # 486
	movsd	%xmm1, %xmm0             # 486
	addl	$24, %ebp                 # 486
	call	min_caml_abs_float        # 486
	subl	$24, %ebp                 # 486
	movsd	16(%ebp), %xmm1          # 486
	comisd	%xmm0, %xmm1            # 486
	ja	jbe_else.5381               # 486
	movl	$0, %eax                  # 490
	jmp	jbe_cont.5382              # 486
jbe_else.5381:                  # 486
	movl	0(%ebp), %eax             # 487
	addl	$24, %ebp                 # 487
	call	o_param_c.1998            # 487
	subl	$24, %ebp                 # 487
	movl	4(%ebp), %eax             # 487
	movsd	16(%eax), %xmm1          # 487
	movsd	8(%ebp), %xmm2           # 487
	mulsd	%xmm2, %xmm1             # 487
	movl	$min_caml_solver_w_vec, %ebx	# 487
	movsd	16(%ebx), %xmm3          # 487
	addsd	%xmm3, %xmm1             # 487
	movsd	%xmm0, 24(%ebp)          # 487
	movsd	%xmm1, %xmm0             # 487
	addl	$32, %ebp                 # 487
	call	min_caml_abs_float        # 487
	subl	$32, %ebp                 # 487
	movsd	24(%ebp), %xmm1          # 487
	comisd	%xmm0, %xmm1            # 487
	ja	jbe_else.5383               # 487
	movl	$0, %eax                  # 489
	jmp	jbe_cont.5384              # 487
jbe_else.5383:                  # 487
	movl	$min_caml_solver_dist, %eax	# 488
	movsd	8(%ebp), %xmm0           # 488
	movsd	%xmm0, 0(%eax)           # 488
	movl	$1, %eax                  # 488
jbe_cont.5384:                  # 487
jbe_cont.5382:                  # 486
je_cont.5376:                   # 479
	cmpl	$0, %eax                  # 493
	jne	je_else.5385               # 493
	movl	$l.4442, %eax             # 496
	movsd	0(%eax), %xmm0           # 496
	movl	4(%ebp), %eax             # 496
	movsd	8(%eax), %xmm1           # 496
	comisd	%xmm1, %xmm0            # 496
	jne	je_else.5386               # 496
	movl	$0, %eax                  # 497
	jmp	je_cont.5387               # 496
je_else.5386:                   # 496
	movl	0(%ebp), %ebx             # 498
	movl	%ebx, %eax                # 498
	addl	$32, %ebp                 # 498
	call	o_isinvert.1990           # 498
	subl	$32, %ebp                 # 498
	movl	$l.4442, %ebx             # 498
	movsd	0(%ebx), %xmm0           # 498
	movl	4(%ebp), %ebx             # 498
	movsd	8(%ebx), %xmm1           # 498
	comisd	%xmm1, %xmm0            # 498
	ja	jbe_else.5388               # 498
	movl	$0, %ecx                  # 499
	jmp	jbe_cont.5389              # 498
jbe_else.5388:                  # 498
	movl	$1, %ecx                  # 499
jbe_cont.5389:                  # 498
	movl	%ecx, %ebx                # 498
	addl	$32, %ebp                 # 498
	call	xor.1977                  # 498
	subl	$32, %ebp                 # 498
	cmpl	$0, %eax                  # 498
	jne	je_else.5390               # 498
	movl	0(%ebp), %eax             # 499
	addl	$32, %ebp                 # 499
	call	o_param_b.1996            # 499
	subl	$32, %ebp                 # 499
	xorpd	min_caml_fnegd, %xmm0    # 499
	jmp	je_cont.5391               # 498
je_else.5390:                   # 498
	movl	0(%ebp), %eax             # 499
	addl	$32, %ebp                 # 499
	call	o_param_b.1996            # 499
	subl	$32, %ebp                 # 499
je_cont.5391:                   # 498
	movl	$min_caml_solver_w_vec, %eax	# 501
	movsd	8(%eax), %xmm1           # 501
	subsd	%xmm1, %xmm0             # 501
	movl	4(%ebp), %eax             # 501
	movsd	8(%eax), %xmm1           # 501
	divsd	%xmm1, %xmm0             # 501
	movl	0(%ebp), %ebx             # 503
	movsd	%xmm0, 32(%ebp)          # 503
	movl	%ebx, %eax                # 503
	addl	$40, %ebp                 # 503
	call	o_param_c.1998            # 503
	subl	$40, %ebp                 # 503
	movl	4(%ebp), %eax             # 503
	movsd	16(%eax), %xmm1          # 503
	movsd	32(%ebp), %xmm2          # 503
	mulsd	%xmm2, %xmm1             # 503
	movl	$min_caml_solver_w_vec, %ebx	# 503
	movsd	16(%ebx), %xmm3          # 503
	addsd	%xmm3, %xmm1             # 503
	movsd	%xmm0, 40(%ebp)          # 503
	movsd	%xmm1, %xmm0             # 503
	addl	$48, %ebp                 # 503
	call	min_caml_abs_float        # 503
	subl	$48, %ebp                 # 503
	movsd	40(%ebp), %xmm1          # 503
	comisd	%xmm0, %xmm1            # 503
	ja	jbe_else.5392               # 503
	movl	$0, %eax                  # 507
	jmp	jbe_cont.5393              # 503
jbe_else.5392:                  # 503
	movl	0(%ebp), %eax             # 504
	addl	$48, %ebp                 # 504
	call	o_param_a.1994            # 504
	subl	$48, %ebp                 # 504
	movl	4(%ebp), %eax             # 504
	movsd	0(%eax), %xmm1           # 504
	movsd	32(%ebp), %xmm2          # 504
	mulsd	%xmm2, %xmm1             # 504
	movl	$min_caml_solver_w_vec, %ebx	# 504
	movsd	0(%ebx), %xmm3           # 504
	addsd	%xmm3, %xmm1             # 504
	movsd	%xmm0, 48(%ebp)          # 504
	movsd	%xmm1, %xmm0             # 504
	addl	$56, %ebp                 # 504
	call	min_caml_abs_float        # 504
	subl	$56, %ebp                 # 504
	movsd	48(%ebp), %xmm1          # 504
	comisd	%xmm0, %xmm1            # 504
	ja	jbe_else.5394               # 504
	movl	$0, %eax                  # 506
	jmp	jbe_cont.5395              # 504
jbe_else.5394:                  # 504
	movl	$min_caml_solver_dist, %eax	# 505
	movsd	32(%ebp), %xmm0          # 505
	movsd	%xmm0, 0(%eax)           # 505
	movl	$1, %eax                  # 505
jbe_cont.5395:                  # 504
jbe_cont.5393:                  # 503
je_cont.5387:                   # 496
	cmpl	$0, %eax                  # 510
	jne	je_else.5396               # 510
	movl	$l.4442, %eax             # 513
	movsd	0(%eax), %xmm0           # 513
	movl	4(%ebp), %eax             # 513
	movsd	16(%eax), %xmm1          # 513
	comisd	%xmm1, %xmm0            # 513
	jne	je_else.5397               # 513
	movl	$0, %eax                  # 514
	jmp	je_cont.5398               # 513
je_else.5397:                   # 513
	movl	0(%ebp), %ebx             # 515
	movl	%ebx, %eax                # 515
	addl	$56, %ebp                 # 515
	call	o_isinvert.1990           # 515
	subl	$56, %ebp                 # 515
	movl	$l.4442, %ebx             # 515
	movsd	0(%ebx), %xmm0           # 515
	movl	4(%ebp), %ebx             # 515
	movsd	16(%ebx), %xmm1          # 515
	comisd	%xmm1, %xmm0            # 515
	ja	jbe_else.5399               # 515
	movl	$0, %ecx                  # 516
	jmp	jbe_cont.5400              # 515
jbe_else.5399:                  # 515
	movl	$1, %ecx                  # 516
jbe_cont.5400:                  # 515
	movl	%ecx, %ebx                # 515
	addl	$56, %ebp                 # 515
	call	xor.1977                  # 515
	subl	$56, %ebp                 # 515
	cmpl	$0, %eax                  # 515
	jne	je_else.5401               # 515
	movl	0(%ebp), %eax             # 516
	addl	$56, %ebp                 # 516
	call	o_param_c.1998            # 516
	subl	$56, %ebp                 # 516
	xorpd	min_caml_fnegd, %xmm0    # 516
	jmp	je_cont.5402               # 515
je_else.5401:                   # 515
	movl	0(%ebp), %eax             # 516
	addl	$56, %ebp                 # 516
	call	o_param_c.1998            # 516
	subl	$56, %ebp                 # 516
je_cont.5402:                   # 515
	movl	$min_caml_solver_w_vec, %eax	# 518
	movsd	16(%eax), %xmm1          # 518
	subsd	%xmm1, %xmm0             # 518
	movl	4(%ebp), %eax             # 518
	movsd	16(%eax), %xmm1          # 518
	divsd	%xmm1, %xmm0             # 518
	movl	0(%ebp), %ebx             # 520
	movsd	%xmm0, 56(%ebp)          # 520
	movl	%ebx, %eax                # 520
	addl	$64, %ebp                 # 520
	call	o_param_a.1994            # 520
	subl	$64, %ebp                 # 520
	movl	4(%ebp), %eax             # 520
	movsd	0(%eax), %xmm1           # 520
	movsd	56(%ebp), %xmm2          # 520
	mulsd	%xmm2, %xmm1             # 520
	movl	$min_caml_solver_w_vec, %ebx	# 520
	movsd	0(%ebx), %xmm3           # 520
	addsd	%xmm3, %xmm1             # 520
	movsd	%xmm0, 64(%ebp)          # 520
	movsd	%xmm1, %xmm0             # 520
	addl	$72, %ebp                 # 520
	call	min_caml_abs_float        # 520
	subl	$72, %ebp                 # 520
	movsd	64(%ebp), %xmm1          # 520
	comisd	%xmm0, %xmm1            # 520
	ja	jbe_else.5403               # 520
	movl	$0, %eax                  # 524
	jmp	jbe_cont.5404              # 520
jbe_else.5403:                  # 520
	movl	0(%ebp), %eax             # 521
	addl	$72, %ebp                 # 521
	call	o_param_b.1996            # 521
	subl	$72, %ebp                 # 521
	movl	4(%ebp), %eax             # 521
	movsd	8(%eax), %xmm1           # 521
	movsd	56(%ebp), %xmm2          # 521
	mulsd	%xmm2, %xmm1             # 521
	movl	$min_caml_solver_w_vec, %eax	# 521
	movsd	8(%eax), %xmm3           # 521
	addsd	%xmm3, %xmm1             # 521
	movsd	%xmm0, 72(%ebp)          # 521
	movsd	%xmm1, %xmm0             # 521
	addl	$80, %ebp                 # 521
	call	min_caml_abs_float        # 521
	subl	$80, %ebp                 # 521
	movsd	72(%ebp), %xmm1          # 521
	comisd	%xmm0, %xmm1            # 521
	ja	jbe_else.5405               # 521
	movl	$0, %eax                  # 523
	jmp	jbe_cont.5406              # 521
jbe_else.5405:                  # 521
	movl	$min_caml_solver_dist, %eax	# 522
	movsd	56(%ebp), %xmm0          # 522
	movsd	%xmm0, 0(%eax)           # 522
	movl	$1, %eax                  # 522
jbe_cont.5406:                  # 521
jbe_cont.5404:                  # 520
je_cont.5398:                   # 513
	cmpl	$0, %eax                  # 527
	jne	je_else.5407               # 527
	movl	$0, %eax                  # 527
	ret                            # 527
je_else.5407:                   # 527
	movl	$3, %eax                  # 527
	ret                            # 527
je_else.5396:                   # 510
	movl	$2, %eax                  # 510
	ret                            # 510
je_else.5385:                   # 493
	movl	$1, %eax                  # 493
	ret                            # 493
solver_surface.2048:            # 535
	movsd	0(%ebx), %xmm0           # 535
	movl	%eax, 0(%ebp)             # 535
	movl	%ebx, 4(%ebp)             # 535
	movsd	%xmm0, 8(%ebp)           # 535
	addl	$16, %ebp                 # 535
	call	o_param_a.1994            # 535
	subl	$16, %ebp                 # 535
	movsd	8(%ebp), %xmm1           # 535
	mulsd	%xmm0, %xmm1             # 535
	movl	4(%ebp), %eax             # 535
	movsd	8(%eax), %xmm0           # 535
	movl	0(%ebp), %ebx             # 535
	movsd	%xmm1, 16(%ebp)          # 535
	movsd	%xmm0, 24(%ebp)          # 535
	movl	%ebx, %eax                # 535
	addl	$32, %ebp                 # 535
	call	o_param_b.1996            # 535
	subl	$32, %ebp                 # 535
	movsd	24(%ebp), %xmm1          # 535
	mulsd	%xmm0, %xmm1             # 535
	movsd	16(%ebp), %xmm0          # 535
	addsd	%xmm1, %xmm0             # 535
	movl	4(%ebp), %eax             # 535
	movsd	16(%eax), %xmm1          # 535
	movl	0(%ebp), %eax             # 535
	movsd	%xmm0, 32(%ebp)          # 535
	movsd	%xmm1, 40(%ebp)          # 535
	addl	$48, %ebp                 # 535
	call	o_param_c.1998            # 535
	subl	$48, %ebp                 # 535
	movsd	40(%ebp), %xmm1          # 535
	mulsd	%xmm0, %xmm1             # 535
	movsd	32(%ebp), %xmm0          # 535
	addsd	%xmm1, %xmm0             # 535
	movl	$l.4442, %eax             # 536
	movsd	0(%eax), %xmm1           # 536
	comisd	%xmm1, %xmm0            # 536
	ja	jbe_else.5408               # 536
	movl	$0, %eax                  # 539
	ret                            # 539
jbe_else.5408:                  # 536
	movl	$min_caml_solver_w_vec, %eax	# 537
	movsd	0(%eax), %xmm1           # 537
	movl	0(%ebp), %eax             # 537
	movsd	%xmm0, 48(%ebp)          # 537
	movsd	%xmm1, 56(%ebp)          # 537
	addl	$64, %ebp                 # 537
	call	o_param_a.1994            # 537
	subl	$64, %ebp                 # 537
	movsd	56(%ebp), %xmm1          # 537
	mulsd	%xmm0, %xmm1             # 537
	movl	$min_caml_solver_w_vec, %eax	# 537
	movsd	8(%eax), %xmm0           # 537
	movl	0(%ebp), %eax             # 537
	movsd	%xmm1, 64(%ebp)          # 537
	movsd	%xmm0, 72(%ebp)          # 537
	addl	$80, %ebp                 # 537
	call	o_param_b.1996            # 537
	subl	$80, %ebp                 # 537
	movsd	72(%ebp), %xmm1          # 537
	mulsd	%xmm0, %xmm1             # 537
	movsd	64(%ebp), %xmm0          # 537
	addsd	%xmm1, %xmm0             # 537
	movl	$min_caml_solver_w_vec, %eax	# 537
	movsd	16(%eax), %xmm1          # 537
	movl	0(%ebp), %eax             # 537
	movsd	%xmm0, 80(%ebp)          # 537
	movsd	%xmm1, 88(%ebp)          # 537
	addl	$96, %ebp                 # 537
	call	o_param_c.1998            # 537
	subl	$96, %ebp                 # 537
	movsd	88(%ebp), %xmm1          # 537
	mulsd	%xmm0, %xmm1             # 537
	movsd	80(%ebp), %xmm0          # 537
	addsd	%xmm1, %xmm0             # 537
	movsd	48(%ebp), %xmm1          # 537
	divsd	%xmm1, %xmm0             # 537
	movl	$min_caml_solver_dist, %eax	# 538
	xorpd	min_caml_fnegd, %xmm0    # 538
	movsd	%xmm0, 0(%eax)           # 538
	movl	$1, %eax                  # 538
	ret                            # 538
in_prod_sqr_obj.2051:           # 546
	movsd	0(%ebx), %xmm0           # 546
	movl	%ebx, 0(%ebp)             # 546
	movl	%eax, 4(%ebp)             # 546
	addl	$8, %ebp                  # 546
	call	fsqr.1980                 # 546
	subl	$8, %ebp                  # 546
	movl	4(%ebp), %eax             # 546
	movsd	%xmm0, 8(%ebp)           # 546
	addl	$16, %ebp                 # 546
	call	o_param_a.1994            # 546
	subl	$16, %ebp                 # 546
	movsd	8(%ebp), %xmm1           # 546
	mulsd	%xmm0, %xmm1             # 546
	movl	0(%ebp), %eax             # 546
	movsd	8(%eax), %xmm0           # 546
	movsd	%xmm1, 16(%ebp)          # 546
	addl	$24, %ebp                 # 546
	call	fsqr.1980                 # 546
	subl	$24, %ebp                 # 546
	movl	4(%ebp), %eax             # 546
	movsd	%xmm0, 24(%ebp)          # 546
	addl	$32, %ebp                 # 546
	call	o_param_b.1996            # 546
	subl	$32, %ebp                 # 546
	movsd	24(%ebp), %xmm1          # 546
	mulsd	%xmm0, %xmm1             # 546
	movsd	16(%ebp), %xmm0          # 546
	addsd	%xmm1, %xmm0             # 546
	movl	0(%ebp), %eax             # 548
	movsd	16(%eax), %xmm1          # 548
	movsd	%xmm0, 32(%ebp)          # 548
	movsd	%xmm1, %xmm0             # 548
	addl	$40, %ebp                 # 548
	call	fsqr.1980                 # 548
	subl	$40, %ebp                 # 548
	movl	4(%ebp), %eax             # 548
	movsd	%xmm0, 40(%ebp)          # 548
	addl	$48, %ebp                 # 548
	call	o_param_c.1998            # 548
	subl	$48, %ebp                 # 548
	movsd	40(%ebp), %xmm1          # 548
	mulsd	%xmm0, %xmm1             # 548
	movsd	32(%ebp), %xmm0          # 546
	addsd	%xmm1, %xmm0             # 546
	ret                            # 546
in_prod_co_objrot.2054:         # 553
	movsd	8(%ebx), %xmm0           # 553
	movsd	16(%ebx), %xmm1          # 553
	mulsd	%xmm1, %xmm0             # 553
	movl	%eax, 0(%ebp)             # 553
	movl	%ebx, 4(%ebp)             # 553
	movsd	%xmm0, 8(%ebp)           # 553
	addl	$16, %ebp                 # 553
	call	o_param_r1.2016           # 553
	subl	$16, %ebp                 # 553
	movsd	8(%ebp), %xmm1           # 553
	mulsd	%xmm0, %xmm1             # 553
	movl	4(%ebp), %eax             # 553
	movsd	0(%eax), %xmm0           # 553
	movsd	16(%eax), %xmm2          # 553
	mulsd	%xmm2, %xmm0             # 553
	movl	0(%ebp), %ebx             # 553
	movsd	%xmm1, 16(%ebp)          # 553
	movsd	%xmm0, 24(%ebp)          # 553
	movl	%ebx, %eax                # 553
	addl	$32, %ebp                 # 553
	call	o_param_r2.2018           # 553
	subl	$32, %ebp                 # 553
	movsd	24(%ebp), %xmm1          # 553
	mulsd	%xmm0, %xmm1             # 553
	movsd	16(%ebp), %xmm0          # 553
	addsd	%xmm1, %xmm0             # 553
	movl	4(%ebp), %eax             # 555
	movsd	0(%eax), %xmm1           # 555
	movsd	8(%eax), %xmm2           # 555
	mulsd	%xmm2, %xmm1             # 555
	movl	0(%ebp), %eax             # 555
	movsd	%xmm0, 32(%ebp)          # 555
	movsd	%xmm1, 40(%ebp)          # 555
	addl	$48, %ebp                 # 555
	call	o_param_r3.2020           # 555
	subl	$48, %ebp                 # 555
	movsd	40(%ebp), %xmm1          # 555
	mulsd	%xmm0, %xmm1             # 555
	movsd	32(%ebp), %xmm0          # 553
	addsd	%xmm1, %xmm0             # 553
	ret                            # 553
solver2nd_mul_b.2057:           # 560
	movl	$min_caml_solver_w_vec, %ecx	# 560
	movsd	0(%ecx), %xmm0           # 560
	movsd	0(%ebx), %xmm1           # 560
	mulsd	%xmm1, %xmm0             # 560
	movl	%eax, 0(%ebp)             # 560
	movl	%ebx, 4(%ebp)             # 560
	movsd	%xmm0, 8(%ebp)           # 560
	addl	$16, %ebp                 # 560
	call	o_param_a.1994            # 560
	subl	$16, %ebp                 # 560
	movsd	8(%ebp), %xmm1           # 560
	mulsd	%xmm0, %xmm1             # 560
	movl	$min_caml_solver_w_vec, %eax	# 560
	movsd	8(%eax), %xmm0           # 560
	movl	4(%ebp), %eax             # 560
	movsd	8(%eax), %xmm2           # 560
	mulsd	%xmm2, %xmm0             # 560
	movl	0(%ebp), %ebx             # 560
	movsd	%xmm1, 16(%ebp)          # 560
	movsd	%xmm0, 24(%ebp)          # 560
	movl	%ebx, %eax                # 560
	addl	$32, %ebp                 # 560
	call	o_param_b.1996            # 560
	subl	$32, %ebp                 # 560
	movsd	24(%ebp), %xmm1          # 560
	mulsd	%xmm0, %xmm1             # 560
	movsd	16(%ebp), %xmm0          # 560
	addsd	%xmm1, %xmm0             # 560
	movl	$min_caml_solver_w_vec, %eax	# 562
	movsd	16(%eax), %xmm1          # 562
	movl	4(%ebp), %eax             # 562
	movsd	16(%eax), %xmm2          # 562
	mulsd	%xmm2, %xmm1             # 562
	movl	0(%ebp), %eax             # 562
	movsd	%xmm0, 32(%ebp)          # 562
	movsd	%xmm1, 40(%ebp)          # 562
	addl	$48, %ebp                 # 562
	call	o_param_c.1998            # 562
	subl	$48, %ebp                 # 562
	movsd	40(%ebp), %xmm1          # 562
	mulsd	%xmm0, %xmm1             # 562
	movsd	32(%ebp), %xmm0          # 560
	addsd	%xmm1, %xmm0             # 560
	ret                            # 560
solver2nd_rot_b.2060:           # 567
	movl	$min_caml_solver_w_vec, %ecx	# 567
	movsd	16(%ecx), %xmm0          # 567
	movsd	8(%ebx), %xmm1           # 567
	mulsd	%xmm1, %xmm0             # 567
	movl	$min_caml_solver_w_vec, %ecx	# 567
	movsd	8(%ecx), %xmm1           # 567
	movsd	16(%ebx), %xmm2          # 567
	mulsd	%xmm2, %xmm1             # 567
	addsd	%xmm1, %xmm0             # 567
	movl	%eax, 0(%ebp)             # 567
	movl	%ebx, 4(%ebp)             # 567
	movsd	%xmm0, 8(%ebp)           # 567
	addl	$16, %ebp                 # 567
	call	o_param_r1.2016           # 567
	subl	$16, %ebp                 # 567
	movsd	8(%ebp), %xmm1           # 567
	mulsd	%xmm0, %xmm1             # 567
	movl	$min_caml_solver_w_vec, %eax	# 567
	movsd	0(%eax), %xmm0           # 567
	movl	4(%ebp), %eax             # 567
	movsd	16(%eax), %xmm2          # 567
	mulsd	%xmm2, %xmm0             # 567
	movl	$min_caml_solver_w_vec, %ebx	# 567
	movsd	16(%ebx), %xmm2          # 567
	movsd	0(%eax), %xmm3           # 567
	mulsd	%xmm3, %xmm2             # 567
	addsd	%xmm2, %xmm0             # 567
	movl	0(%ebp), %ebx             # 567
	movsd	%xmm1, 16(%ebp)          # 567
	movsd	%xmm0, 24(%ebp)          # 567
	movl	%ebx, %eax                # 567
	addl	$32, %ebp                 # 567
	call	o_param_r2.2018           # 567
	subl	$32, %ebp                 # 567
	movsd	24(%ebp), %xmm1          # 567
	mulsd	%xmm0, %xmm1             # 567
	movsd	16(%ebp), %xmm0          # 567
	addsd	%xmm1, %xmm0             # 567
	movl	$min_caml_solver_w_vec, %eax	# 569
	movsd	0(%eax), %xmm1           # 569
	movl	4(%ebp), %eax             # 569
	movsd	8(%eax), %xmm2           # 569
	mulsd	%xmm2, %xmm1             # 569
	movl	$min_caml_solver_w_vec, %ebx	# 569
	movsd	8(%ebx), %xmm2           # 569
	movsd	0(%eax), %xmm3           # 569
	mulsd	%xmm3, %xmm2             # 569
	addsd	%xmm2, %xmm1             # 569
	movl	0(%ebp), %eax             # 569
	movsd	%xmm0, 32(%ebp)          # 569
	movsd	%xmm1, 40(%ebp)          # 569
	addl	$48, %ebp                 # 569
	call	o_param_r3.2020           # 569
	subl	$48, %ebp                 # 569
	movsd	40(%ebp), %xmm1          # 569
	mulsd	%xmm0, %xmm1             # 569
	movsd	32(%ebp), %xmm0          # 567
	addsd	%xmm1, %xmm0             # 567
	ret                            # 567
solver_second.2063:             # 574
	movl	%ebx, 0(%ebp)             # 574
	movl	%eax, 4(%ebp)             # 574
	addl	$8, %ebp                  # 574
	call	in_prod_sqr_obj.2051      # 574
	subl	$8, %ebp                  # 574
	movl	4(%ebp), %eax             # 575
	movsd	%xmm0, 8(%ebp)           # 575
	addl	$16, %ebp                 # 575
	call	o_isrot.1992              # 575
	subl	$16, %ebp                 # 575
	cmpl	$0, %eax                  # 575
	jne	je_else.5409               # 575
	movsd	8(%ebp), %xmm0           # 577
	jmp	je_cont.5410               # 575
je_else.5409:                   # 575
	movl	4(%ebp), %eax             # 576
	movl	0(%ebp), %ebx             # 576
	addl	$16, %ebp                 # 576
	call	in_prod_co_objrot.2054    # 576
	subl	$16, %ebp                 # 576
	movsd	8(%ebp), %xmm1           # 576
	addsd	%xmm1, %xmm0             # 576
je_cont.5410:                   # 575
	movl	$l.4442, %eax             # 579
	movsd	0(%eax), %xmm1           # 579
	comisd	%xmm0, %xmm1            # 579
	jne	je_else.5411               # 579
	movl	$0, %eax                  # 580
	ret                            # 580
je_else.5411:                   # 579
	movl	$l.4440, %eax             # 583
	movsd	0(%eax), %xmm1           # 583
	movl	4(%ebp), %eax             # 583
	movl	0(%ebp), %ebx             # 583
	movsd	%xmm0, 16(%ebp)          # 583
	movsd	%xmm1, 24(%ebp)          # 583
	addl	$32, %ebp                 # 583
	call	solver2nd_mul_b.2057      # 583
	subl	$32, %ebp                 # 583
	movsd	24(%ebp), %xmm1          # 583
	mulsd	%xmm0, %xmm1             # 583
	movl	4(%ebp), %eax             # 585
	movsd	%xmm1, 32(%ebp)          # 585
	addl	$40, %ebp                 # 585
	call	o_isrot.1992              # 585
	subl	$40, %ebp                 # 585
	cmpl	$0, %eax                  # 585
	jne	je_else.5412               # 585
	movsd	32(%ebp), %xmm0          # 587
	jmp	je_cont.5413               # 585
je_else.5412:                   # 585
	movl	4(%ebp), %eax             # 586
	movl	0(%ebp), %ebx             # 586
	addl	$40, %ebp                 # 586
	call	solver2nd_rot_b.2060      # 586
	subl	$40, %ebp                 # 586
	movsd	32(%ebp), %xmm1          # 586
	addsd	%xmm1, %xmm0             # 586
je_cont.5413:                   # 585
	movl	$min_caml_solver_w_vec, %ebx	# 589
	movl	4(%ebp), %eax             # 589
	movsd	%xmm0, 40(%ebp)          # 589
	addl	$48, %ebp                 # 589
	call	in_prod_sqr_obj.2051      # 589
	subl	$48, %ebp                 # 589
	movl	4(%ebp), %eax             # 590
	movsd	%xmm0, 48(%ebp)          # 590
	addl	$56, %ebp                 # 590
	call	o_isrot.1992              # 590
	subl	$56, %ebp                 # 590
	cmpl	$0, %eax                  # 590
	jne	je_else.5414               # 590
	movsd	48(%ebp), %xmm0          # 593
	jmp	je_cont.5415               # 590
je_else.5414:                   # 590
	movl	$min_caml_solver_w_vec, %ebx	# 592
	movl	4(%ebp), %eax             # 592
	addl	$56, %ebp                 # 592
	call	in_prod_co_objrot.2054    # 592
	subl	$56, %ebp                 # 592
	movsd	48(%ebp), %xmm1          # 592
	addsd	%xmm1, %xmm0             # 592
je_cont.5415:                   # 590
	movl	4(%ebp), %eax             # 594
	movsd	%xmm0, 56(%ebp)          # 594
	addl	$64, %ebp                 # 594
	call	o_form.1986               # 594
	subl	$64, %ebp                 # 594
	cmpl	$3, %eax                  # 594
	jne	je_else.5416               # 594
	movl	$l.4444, %eax             # 596
	movsd	0(%eax), %xmm0           # 596
	movsd	56(%ebp), %xmm1          # 596
	subsd	%xmm0, %xmm1             # 596
	jmp	je_cont.5417               # 594
je_else.5416:                   # 594
	movsd	56(%ebp), %xmm0          # 596
	movsd	%xmm0, %xmm1             # 596
je_cont.5417:                   # 594
	movl	$l.4490, %eax             # 598
	movsd	0(%eax), %xmm0           # 598
	movsd	16(%ebp), %xmm2          # 598
	mulsd	%xmm2, %xmm0             # 598
	mulsd	%xmm1, %xmm0             # 598
	movsd	40(%ebp), %xmm1          # 598
	movsd	%xmm0, 64(%ebp)          # 598
	movsd	%xmm1, %xmm0             # 598
	addl	$72, %ebp                 # 598
	call	fsqr.1980                 # 598
	subl	$72, %ebp                 # 598
	movsd	64(%ebp), %xmm1          # 598
	subsd	%xmm1, %xmm0             # 598
	movl	$l.4442, %eax             # 602
	movsd	0(%eax), %xmm1           # 602
	comisd	%xmm1, %xmm0            # 602
	ja	jbe_else.5418               # 602
	movl	$0, %eax                  # 609
	ret                            # 609
jbe_else.5418:                  # 602
	addl	$72, %ebp                 # 605
	call	min_caml_sqrt             # 605
	subl	$72, %ebp                 # 605
	movl	4(%ebp), %eax             # 606
	movsd	%xmm0, 72(%ebp)          # 606
	addl	$80, %ebp                 # 606
	call	o_isinvert.1990           # 606
	subl	$80, %ebp                 # 606
	cmpl	$0, %eax                  # 606
	jne	je_else.5419               # 606
	movsd	72(%ebp), %xmm0          # 606
	xorpd	min_caml_fnegd, %xmm0    # 606
	jmp	je_cont.5420               # 606
je_else.5419:                   # 606
	movsd	72(%ebp), %xmm0          # 606
je_cont.5420:                   # 606
	movl	$min_caml_solver_dist, %eax	# 607
	movsd	40(%ebp), %xmm1          # 607
	subsd	%xmm1, %xmm0             # 607
	movl	$l.4440, %ebx             # 607
	movsd	0(%ebx), %xmm1           # 607
	divsd	%xmm1, %xmm0             # 607
	movsd	16(%ebp), %xmm1          # 607
	divsd	%xmm1, %xmm0             # 607
	movsd	%xmm0, 0(%eax)           # 607
	movl	$1, %eax                  # 607
	ret                            # 607
solver.2066:                    # 616
	movl	$min_caml_objects, %edx   # 616
	movl	(%edx,%eax,4), %eax       # 616
	movl	$min_caml_solver_w_vec, %edx	# 617
	movsd	0(%ecx), %xmm0           # 617
	movl	%ebx, 0(%ebp)             # 617
	movl	%eax, 4(%ebp)             # 617
	movl	%ecx, 8(%ebp)             # 617
	movl	%edx, 12(%ebp)            # 617
	movsd	%xmm0, 16(%ebp)          # 617
	addl	$24, %ebp                 # 617
	call	o_param_x.2000            # 617
	subl	$24, %ebp                 # 617
	movsd	16(%ebp), %xmm1          # 617
	subsd	%xmm0, %xmm1             # 617
	movl	12(%ebp), %eax            # 617
	movsd	%xmm1, 0(%eax)           # 617
	movl	$min_caml_solver_w_vec, %eax	# 618
	movl	8(%ebp), %ebx             # 618
	movsd	8(%ebx), %xmm0           # 618
	movl	4(%ebp), %ecx             # 618
	movl	%eax, 24(%ebp)            # 618
	movsd	%xmm0, 32(%ebp)          # 618
	movl	%ecx, %eax                # 618
	addl	$40, %ebp                 # 618
	call	o_param_y.2002            # 618
	subl	$40, %ebp                 # 618
	movsd	32(%ebp), %xmm1          # 618
	subsd	%xmm0, %xmm1             # 618
	movl	24(%ebp), %eax            # 618
	movsd	%xmm1, 8(%eax)           # 618
	movl	$min_caml_solver_w_vec, %eax	# 619
	movl	8(%ebp), %ebx             # 619
	movsd	16(%ebx), %xmm0          # 619
	movl	4(%ebp), %ebx             # 619
	movl	%eax, 40(%ebp)            # 619
	movsd	%xmm0, 48(%ebp)          # 619
	movl	%ebx, %eax                # 619
	addl	$56, %ebp                 # 619
	call	o_param_z.2004            # 619
	subl	$56, %ebp                 # 619
	movsd	48(%ebp), %xmm1          # 619
	subsd	%xmm0, %xmm1             # 619
	movl	40(%ebp), %eax            # 619
	movsd	%xmm1, 16(%eax)          # 619
	movl	4(%ebp), %eax             # 620
	addl	$56, %ebp                 # 620
	call	o_form.1986               # 620
	subl	$56, %ebp                 # 620
	cmpl	$1, %eax                  # 621
	jne	je_else.5423               # 621
	movl	4(%ebp), %eax             # 621
	movl	0(%ebp), %ebx             # 621
	jmp	solver_rect.2045           # 621
je_else.5423:                   # 621
	cmpl	$2, %eax                  # 622
	jne	je_else.5424               # 622
	movl	4(%ebp), %eax             # 622
	movl	0(%ebp), %ebx             # 622
	jmp	solver_surface.2048        # 622
je_else.5424:                   # 622
	movl	4(%ebp), %eax             # 623
	movl	0(%ebp), %ebx             # 623
	jmp	solver_second.2063         # 623
is_rect_outside.2070:           # 633
	movl	%eax, 0(%ebp)             # 633
	addl	$8, %ebp                  # 633
	call	o_param_a.1994            # 633
	subl	$8, %ebp                  # 633
	movl	$min_caml_isoutside_q, %eax	# 633
	movsd	0(%eax), %xmm1           # 633
	movsd	%xmm0, 8(%ebp)           # 633
	movsd	%xmm1, %xmm0             # 633
	addl	$16, %ebp                 # 633
	call	min_caml_abs_float        # 633
	subl	$16, %ebp                 # 633
	movsd	8(%ebp), %xmm1           # 633
	comisd	%xmm0, %xmm1            # 633
	ja	jbe_else.5426               # 633
	movl	$0, %eax                  # 637
	jmp	jbe_cont.5427              # 633
jbe_else.5426:                  # 633
	movl	0(%ebp), %eax             # 634
	addl	$16, %ebp                 # 634
	call	o_param_b.1996            # 634
	subl	$16, %ebp                 # 634
	movl	$min_caml_isoutside_q, %eax	# 634
	movsd	8(%eax), %xmm1           # 634
	movsd	%xmm0, 16(%ebp)          # 634
	movsd	%xmm1, %xmm0             # 634
	addl	$24, %ebp                 # 634
	call	min_caml_abs_float        # 634
	subl	$24, %ebp                 # 634
	movsd	16(%ebp), %xmm1          # 634
	comisd	%xmm0, %xmm1            # 634
	ja	jbe_else.5428               # 634
	movl	$0, %eax                  # 636
	jmp	jbe_cont.5429              # 634
jbe_else.5428:                  # 634
	movl	0(%ebp), %eax             # 635
	addl	$24, %ebp                 # 635
	call	o_param_c.1998            # 635
	subl	$24, %ebp                 # 635
	movl	$min_caml_isoutside_q, %eax	# 635
	movsd	16(%eax), %xmm1          # 635
	movsd	%xmm0, 24(%ebp)          # 635
	movsd	%xmm1, %xmm0             # 635
	addl	$32, %ebp                 # 635
	call	min_caml_abs_float        # 635
	subl	$32, %ebp                 # 635
	movsd	24(%ebp), %xmm1          # 635
	comisd	%xmm0, %xmm1            # 635
	ja	jbe_else.5430               # 635
	movl	$0, %eax                  # 635
	jmp	jbe_cont.5431              # 635
jbe_else.5430:                  # 635
	movl	$1, %eax                  # 635
jbe_cont.5431:                  # 635
jbe_cont.5429:                  # 634
jbe_cont.5427:                  # 633
	cmpl	$0, %eax                  # 632
	jne	je_else.5432               # 632
	movl	0(%ebp), %eax             # 639
	addl	$32, %ebp                 # 639
	call	o_isinvert.1990           # 639
	subl	$32, %ebp                 # 639
	cmpl	$0, %eax                  # 639
	jne	je_else.5433               # 639
	movl	$1, %eax                  # 639
	ret                            # 639
je_else.5433:                   # 639
	movl	$0, %eax                  # 639
	ret                            # 639
je_else.5432:                   # 632
	movl	0(%ebp), %eax             # 639
	jmp	o_isinvert.1990            # 639
is_plane_outside.2072:          # 644
	movl	%eax, 0(%ebp)             # 644
	addl	$8, %ebp                  # 644
	call	o_param_a.1994            # 644
	subl	$8, %ebp                  # 644
	movl	$min_caml_isoutside_q, %eax	# 644
	movsd	0(%eax), %xmm1           # 644
	mulsd	%xmm1, %xmm0             # 644
	movl	0(%ebp), %eax             # 644
	movsd	%xmm0, 8(%ebp)           # 644
	addl	$16, %ebp                 # 644
	call	o_param_b.1996            # 644
	subl	$16, %ebp                 # 644
	movl	$min_caml_isoutside_q, %eax	# 644
	movsd	8(%eax), %xmm1           # 644
	mulsd	%xmm1, %xmm0             # 644
	movsd	8(%ebp), %xmm1           # 644
	addsd	%xmm0, %xmm1             # 644
	movl	0(%ebp), %eax             # 644
	movsd	%xmm1, 16(%ebp)          # 644
	addl	$24, %ebp                 # 644
	call	o_param_c.1998            # 644
	subl	$24, %ebp                 # 644
	movl	$min_caml_isoutside_q, %eax	# 644
	movsd	16(%eax), %xmm1          # 644
	mulsd	%xmm1, %xmm0             # 644
	movsd	16(%ebp), %xmm1          # 644
	addsd	%xmm0, %xmm1             # 644
	movl	$l.4442, %eax             # 647
	movsd	0(%eax), %xmm0           # 647
	comisd	%xmm1, %xmm0            # 647
	ja	jbe_else.5435               # 647
	movl	$0, %eax                  # 647
	jmp	jbe_cont.5436              # 647
jbe_else.5435:                  # 647
	movl	$1, %eax                  # 647
jbe_cont.5436:                  # 647
	movl	0(%ebp), %ebx             # 648
	movl	%eax, 24(%ebp)            # 648
	movl	%ebx, %eax                # 648
	addl	$32, %ebp                 # 648
	call	o_isinvert.1990           # 648
	subl	$32, %ebp                 # 648
	movl	24(%ebp), %ebx            # 648
	addl	$32, %ebp                 # 648
	call	xor.1977                  # 648
	subl	$32, %ebp                 # 648
	cmpl	$0, %eax                  # 648
	jne	je_else.5437               # 648
	movl	$1, %eax                  # 648
	ret                            # 648
je_else.5437:                   # 648
	movl	$0, %eax                  # 648
	ret                            # 648
is_second_outside.2074:         # 653
	movl	$min_caml_isoutside_q, %ebx	# 653
	movl	%eax, 0(%ebp)             # 653
	addl	$8, %ebp                  # 653
	call	in_prod_sqr_obj.2051      # 653
	subl	$8, %ebp                  # 653
	movl	0(%ebp), %eax             # 654
	movsd	%xmm0, 8(%ebp)           # 654
	addl	$16, %ebp                 # 654
	call	o_form.1986               # 654
	subl	$16, %ebp                 # 654
	cmpl	$3, %eax                  # 654
	jne	je_else.5439               # 654
	movl	$l.4444, %eax             # 654
	movsd	0(%eax), %xmm0           # 654
	movsd	8(%ebp), %xmm1           # 654
	subsd	%xmm0, %xmm1             # 654
	jmp	je_cont.5440               # 654
je_else.5439:                   # 654
	movsd	8(%ebp), %xmm0           # 654
	movsd	%xmm0, %xmm1             # 654
je_cont.5440:                   # 654
	movl	0(%ebp), %eax             # 655
	movsd	%xmm1, 16(%ebp)          # 655
	addl	$24, %ebp                 # 655
	call	o_isrot.1992              # 655
	subl	$24, %ebp                 # 655
	cmpl	$0, %eax                  # 655
	jne	je_else.5441               # 655
	movsd	16(%ebp), %xmm0          # 659
	jmp	je_cont.5442               # 655
je_else.5441:                   # 655
	movl	$min_caml_isoutside_q, %ebx	# 657
	movl	0(%ebp), %eax             # 657
	addl	$24, %ebp                 # 657
	call	in_prod_co_objrot.2054    # 657
	subl	$24, %ebp                 # 657
	movsd	16(%ebp), %xmm1          # 657
	addsd	%xmm1, %xmm0             # 657
je_cont.5442:                   # 655
	movl	$l.4442, %eax             # 661
	movsd	0(%eax), %xmm1           # 661
	comisd	%xmm0, %xmm1            # 661
	ja	jbe_else.5443               # 661
	movl	$0, %eax                  # 661
	jmp	jbe_cont.5444              # 661
jbe_else.5443:                  # 661
	movl	$1, %eax                  # 661
jbe_cont.5444:                  # 661
	movl	0(%ebp), %ebx             # 662
	movl	%eax, 24(%ebp)            # 662
	movl	%ebx, %eax                # 662
	addl	$32, %ebp                 # 662
	call	o_isinvert.1990           # 662
	subl	$32, %ebp                 # 662
	movl	24(%ebp), %ebx            # 662
	addl	$32, %ebp                 # 662
	call	xor.1977                  # 662
	subl	$32, %ebp                 # 662
	cmpl	$0, %eax                  # 662
	jne	je_else.5445               # 662
	movl	$1, %eax                  # 662
	ret                            # 662
je_else.5445:                   # 662
	movl	$0, %eax                  # 662
	ret                            # 662
is_outside.2076:                # 667
	movl	$min_caml_isoutside_q, %ebx	# 667
	movl	$min_caml_chkinside_p, %ecx	# 667
	movsd	0(%ecx), %xmm0           # 667
	movl	%eax, 0(%ebp)             # 667
	movl	%ebx, 4(%ebp)             # 667
	movsd	%xmm0, 8(%ebp)           # 667
	addl	$16, %ebp                 # 667
	call	o_param_x.2000            # 667
	subl	$16, %ebp                 # 667
	movsd	8(%ebp), %xmm1           # 667
	subsd	%xmm0, %xmm1             # 667
	movl	4(%ebp), %eax             # 667
	movsd	%xmm1, 0(%eax)           # 667
	movl	$min_caml_isoutside_q, %eax	# 668
	movl	$min_caml_chkinside_p, %ebx	# 668
	movsd	8(%ebx), %xmm0           # 668
	movl	0(%ebp), %ebx             # 668
	movl	%eax, 16(%ebp)            # 668
	movsd	%xmm0, 24(%ebp)          # 668
	movl	%ebx, %eax                # 668
	addl	$32, %ebp                 # 668
	call	o_param_y.2002            # 668
	subl	$32, %ebp                 # 668
	movsd	24(%ebp), %xmm1          # 668
	subsd	%xmm0, %xmm1             # 668
	movl	16(%ebp), %eax            # 668
	movsd	%xmm1, 8(%eax)           # 668
	movl	$min_caml_isoutside_q, %eax	# 669
	movl	$min_caml_chkinside_p, %ebx	# 669
	movsd	16(%ebx), %xmm0          # 669
	movl	0(%ebp), %ebx             # 669
	movl	%eax, 32(%ebp)            # 669
	movsd	%xmm0, 40(%ebp)          # 669
	movl	%ebx, %eax                # 669
	addl	$48, %ebp                 # 669
	call	o_param_z.2004            # 669
	subl	$48, %ebp                 # 669
	movsd	40(%ebp), %xmm1          # 669
	subsd	%xmm0, %xmm1             # 669
	movl	32(%ebp), %eax            # 669
	movsd	%xmm1, 16(%eax)          # 669
	movl	0(%ebp), %eax             # 670
	addl	$48, %ebp                 # 670
	call	o_form.1986               # 670
	subl	$48, %ebp                 # 670
	cmpl	$1, %eax                  # 671
	jne	je_else.5448               # 671
	movl	0(%ebp), %eax             # 672
	jmp	is_rect_outside.2070       # 672
je_else.5448:                   # 671
	cmpl	$2, %eax                  # 673
	jne	je_else.5449               # 673
	movl	0(%ebp), %eax             # 674
	jmp	is_plane_outside.2072      # 674
je_else.5449:                   # 673
	movl	0(%ebp), %eax             # 676
	jmp	is_second_outside.2074     # 676
check_all_inside.2078:          # 682
	movl	(%ebx,%eax,4), %ecx       # 682
	cmpl	$-1, %ecx                 # 683
	jne	je_else.5450               # 683
	movl	$1, %eax                  # 683
	ret                            # 683
je_else.5450:                   # 683
	movl	$min_caml_objects, %edx   # 684
	movl	(%edx,%ecx,4), %ecx       # 684
	movl	%ebx, 0(%ebp)             # 684
	movl	%eax, 4(%ebp)             # 684
	movl	%ecx, %eax                # 684
	addl	$8, %ebp                  # 684
	call	is_outside.2076           # 684
	subl	$8, %ebp                  # 684
	cmpl	$0, %eax                  # 684
	jne	je_else.5451               # 684
	movl	4(%ebp), %eax             # 685
	addl	$1, %eax                  # 685
	movl	0(%ebp), %ebx             # 685
	jmp	check_all_inside.2078      # 685
je_else.5451:                   # 684
	movl	$0, %eax                  # 684
	ret                            # 684
shadow_check_and_group.2081:    # 697
	movl	(%ebx,%eax,4), %edx       # 697
	cmpl	$-1, %edx                 # 697
	jne	je_else.5452               # 697
	movl	$0, %eax                  # 698
	ret                            # 698
je_else.5452:                   # 697
	movl	(%ebx,%eax,4), %edx       # 700
	movl	$min_caml_light, %esi     # 706
	movl	%ecx, 0(%ebp)             # 706
	movl	%ebx, 4(%ebp)             # 706
	movl	%eax, 8(%ebp)             # 706
	movl	%edx, 12(%ebp)            # 706
	movl	%esi, %ebx                # 706
	movl	%edx, %eax                # 706
	addl	$16, %ebp                 # 706
	call	solver.2066               # 706
	subl	$16, %ebp                 # 706
	movl	$min_caml_solver_dist, %ebx	# 707
	movsd	0(%ebx), %xmm0           # 707
	cmpl	$0, %eax                  # 708
	jne	je_else.5453               # 708
	movl	$0, %eax                  # 708
	jmp	je_cont.5454               # 708
je_else.5453:                   # 708
	movl	$l.4497, %eax             # 708
	movsd	0(%eax), %xmm1           # 708
	comisd	%xmm0, %xmm1            # 708
	ja	jbe_else.5455               # 708
	movl	$0, %eax                  # 708
	jmp	jbe_cont.5456              # 708
jbe_else.5455:                  # 708
	movl	$1, %eax                  # 708
jbe_cont.5456:                  # 708
je_cont.5454:                   # 708
	cmpl	$0, %eax                  # 708
	jne	je_else.5457               # 708
	movl	$min_caml_objects, %eax   # 724
	movl	12(%ebp), %ebx            # 724
	movl	(%eax,%ebx,4), %eax       # 724
	addl	$16, %ebp                 # 724
	call	o_isinvert.1990           # 724
	subl	$16, %ebp                 # 724
	cmpl	$0, %eax                  # 724
	jne	je_else.5458               # 724
	movl	$0, %eax                  # 726
	ret                            # 726
je_else.5458:                   # 724
	movl	8(%ebp), %eax             # 725
	addl	$1, %eax                  # 725
	movl	4(%ebp), %ebx             # 725
	movl	0(%ebp), %ecx             # 725
	jmp	shadow_check_and_group.2081	# 725
je_else.5457:                   # 708
	movl	$l.4499, %eax             # 712
	movsd	0(%eax), %xmm1           # 712
	addsd	%xmm1, %xmm0             # 712
	movl	$min_caml_chkinside_p, %eax	# 713
	movl	$min_caml_light, %ebx     # 713
	movsd	0(%ebx), %xmm1           # 713
	mulsd	%xmm0, %xmm1             # 713
	movl	0(%ebp), %ebx             # 713
	movsd	0(%ebx), %xmm2           # 713
	addsd	%xmm2, %xmm1             # 713
	movsd	%xmm1, 0(%eax)           # 713
	movl	$min_caml_chkinside_p, %eax	# 714
	movl	$min_caml_light, %ecx     # 714
	movsd	8(%ecx), %xmm1           # 714
	mulsd	%xmm0, %xmm1             # 714
	movsd	8(%ebx), %xmm2           # 714
	addsd	%xmm2, %xmm1             # 714
	movsd	%xmm1, 8(%eax)           # 714
	movl	$min_caml_chkinside_p, %eax	# 715
	movl	$min_caml_light, %ecx     # 715
	movsd	16(%ecx), %xmm1          # 715
	mulsd	%xmm0, %xmm1             # 715
	movsd	16(%ebx), %xmm0          # 715
	addsd	%xmm0, %xmm1             # 715
	movsd	%xmm1, 16(%eax)          # 715
	movl	$0, %eax                  # 716
	movl	4(%ebp), %ecx             # 716
	movl	%ecx, %ebx                # 716
	addl	$16, %ebp                 # 716
	call	check_all_inside.2078     # 716
	subl	$16, %ebp                 # 716
	cmpl	$0, %eax                  # 716
	jne	je_else.5459               # 716
	movl	8(%ebp), %eax             # 718
	addl	$1, %eax                  # 718
	movl	4(%ebp), %ebx             # 718
	movl	0(%ebp), %ecx             # 718
	jmp	shadow_check_and_group.2081	# 718
je_else.5459:                   # 716
	movl	$1, %eax                  # 717
	ret                            # 717
shadow_check_one_or_group.2085: # 732
	movl	(%ebx,%eax,4), %edx       # 732
	cmpl	$-1, %edx                 # 733
	jne	je_else.5460               # 733
	movl	$0, %eax                  # 734
	ret                            # 734
je_else.5460:                   # 733
	movl	$min_caml_and_net, %esi   # 736
	movl	(%esi,%edx,4), %edx       # 736
	movl	$0, %esi                  # 737
	movl	%ecx, 0(%ebp)             # 737
	movl	%ebx, 4(%ebp)             # 737
	movl	%eax, 8(%ebp)             # 737
	movl	%edx, %ebx                # 737
	movl	%esi, %eax                # 737
	addl	$16, %ebp                 # 737
	call	shadow_check_and_group.2081	# 737
	subl	$16, %ebp                 # 737
	cmpl	$0, %eax                  # 738
	jne	je_else.5461               # 738
	movl	8(%ebp), %eax             # 739
	addl	$1, %eax                  # 739
	movl	4(%ebp), %ebx             # 739
	movl	0(%ebp), %ecx             # 739
	jmp	shadow_check_one_or_group.2085	# 739
je_else.5461:                   # 738
	movl	$1, %eax                  # 738
	ret                            # 738
shadow_check_one_or_matrix.2089:	# 746
	movl	(%ebx,%eax,4), %edx       # 746
	movl	0(%edx), %esi             # 747
	cmpl	$-1, %esi                 # 748
	jne	je_else.5462               # 748
	movl	$0, %eax                  # 748
	ret                            # 748
je_else.5462:                   # 748
	cmpl	$99, %esi                 # 750
	jne	je_else.5463               # 750
	movl	$1, %esi                  # 753
	movl	%ecx, 0(%ebp)             # 753
	movl	%ebx, 4(%ebp)             # 753
	movl	%eax, 8(%ebp)             # 753
	movl	%edx, %ebx                # 753
	movl	%esi, %eax                # 753
	addl	$16, %ebp                 # 753
	call	shadow_check_one_or_group.2085	# 753
	subl	$16, %ebp                 # 753
	cmpl	$0, %eax                  # 753
	jne	je_else.5464               # 753
	movl	8(%ebp), %eax             # 755
	addl	$1, %eax                  # 755
	movl	4(%ebp), %ebx             # 755
	movl	0(%ebp), %ecx             # 755
	jmp	shadow_check_one_or_matrix.2089	# 755
je_else.5464:                   # 753
	movl	$1, %eax                  # 754
	ret                            # 754
je_else.5463:                   # 750
	movl	$min_caml_light, %edi     # 758
	movl	%edx, 12(%ebp)            # 758
	movl	%ecx, 0(%ebp)             # 758
	movl	%ebx, 4(%ebp)             # 758
	movl	%eax, 8(%ebp)             # 758
	movl	%edi, %ebx                # 758
	movl	%esi, %eax                # 758
	addl	$16, %ebp                 # 758
	call	solver.2066               # 758
	subl	$16, %ebp                 # 758
	cmpl	$0, %eax                  # 761
	jne	je_else.5465               # 761
	movl	8(%ebp), %eax             # 768
	addl	$1, %eax                  # 768
	movl	4(%ebp), %ebx             # 768
	movl	0(%ebp), %ecx             # 768
	jmp	shadow_check_one_or_matrix.2089	# 768
je_else.5465:                   # 761
	movl	$l.4501, %eax             # 762
	movsd	0(%eax), %xmm0           # 762
	movl	$min_caml_solver_dist, %eax	# 762
	movsd	0(%eax), %xmm1           # 762
	comisd	%xmm1, %xmm0            # 762
	ja	jbe_else.5466               # 762
	movl	8(%ebp), %eax             # 767
	addl	$1, %eax                  # 767
	movl	4(%ebp), %ebx             # 767
	movl	0(%ebp), %ecx             # 767
	jmp	shadow_check_one_or_matrix.2089	# 767
jbe_else.5466:                  # 762
	movl	$1, %eax                  # 764
	movl	12(%ebp), %ebx            # 764
	movl	0(%ebp), %ecx             # 764
	addl	$16, %ebp                 # 764
	call	shadow_check_one_or_group.2085	# 764
	subl	$16, %ebp                 # 764
	cmpl	$0, %eax                  # 764
	jne	je_else.5467               # 764
	movl	8(%ebp), %eax             # 766
	addl	$1, %eax                  # 766
	movl	4(%ebp), %ebx             # 766
	movl	0(%ebp), %ecx             # 766
	jmp	shadow_check_one_or_matrix.2089	# 766
je_else.5467:                   # 764
	movl	$1, %eax                  # 765
	ret                            # 765
solve_each_element.2093:        # 778
	movl	(%ebx,%eax,4), %ecx       # 778
	cmpl	$-1, %ecx                 # 779
	jne	je_else.5468               # 779
	ret                            # 779
je_else.5468:                   # 779
	movl	$min_caml_vscan, %edx     # 781
	movl	$min_caml_viewpoint, %esi # 781
	movl	%eax, 0(%ebp)             # 781
	movl	%ebx, 4(%ebp)             # 781
	movl	%ecx, 8(%ebp)             # 781
	movl	%edx, %ebx                # 781
	movl	%ecx, %eax                # 781
	movl	%esi, %ecx                # 781
	addl	$16, %ebp                 # 781
	call	solver.2066               # 781
	subl	$16, %ebp                 # 781
	cmpl	$0, %eax                  # 782
	jne	je_else.5470               # 782
	movl	$min_caml_objects, %eax   # 811
	movl	8(%ebp), %ebx             # 811
	movl	(%eax,%ebx,4), %eax       # 811
	addl	$16, %ebp                 # 811
	call	o_isinvert.1990           # 811
	subl	$16, %ebp                 # 811
	cmpl	$0, %eax                  # 811
	jne	je_else.5472               # 811
	movl	$min_caml_end_flag, %eax  # 811
	movl	$1, %ebx                  # 811
	movl	%ebx, 0(%eax)             # 811
	jmp	je_cont.5473               # 811
je_else.5472:                   # 811
je_cont.5473:                   # 811
	jmp	je_cont.5471               # 782
je_else.5470:                   # 782
	movl	$min_caml_solver_dist, %ebx	# 786
	movsd	0(%ebx), %xmm0           # 786
	movl	$l.4501, %ebx             # 787
	movsd	0(%ebx), %xmm1           # 787
	comisd	%xmm1, %xmm0            # 787
	ja	jbe_else.5474               # 787
	jmp	jbe_cont.5475              # 787
jbe_else.5474:                  # 787
	movl	$min_caml_tmin, %ebx      # 788
	movsd	0(%ebx), %xmm1           # 788
	comisd	%xmm0, %xmm1            # 788
	ja	jbe_else.5476               # 788
	jmp	jbe_cont.5477              # 788
jbe_else.5476:                  # 788
	movl	$l.4499, %ebx             # 790
	movsd	0(%ebx), %xmm1           # 790
	addsd	%xmm1, %xmm0             # 790
	movl	$min_caml_chkinside_p, %ebx	# 791
	movl	$min_caml_vscan, %ecx     # 791
	movsd	0(%ecx), %xmm1           # 791
	mulsd	%xmm0, %xmm1             # 791
	movl	$min_caml_viewpoint, %ecx # 791
	movsd	0(%ecx), %xmm2           # 791
	addsd	%xmm2, %xmm1             # 791
	movsd	%xmm1, 0(%ebx)           # 791
	movl	$min_caml_chkinside_p, %ebx	# 792
	movl	$min_caml_vscan, %ecx     # 792
	movsd	8(%ecx), %xmm1           # 792
	mulsd	%xmm0, %xmm1             # 792
	movl	$min_caml_viewpoint, %ecx # 792
	movsd	8(%ecx), %xmm2           # 792
	addsd	%xmm2, %xmm1             # 792
	movsd	%xmm1, 8(%ebx)           # 792
	movl	$min_caml_chkinside_p, %ebx	# 793
	movl	$min_caml_vscan, %ecx     # 793
	movsd	16(%ecx), %xmm1          # 793
	mulsd	%xmm0, %xmm1             # 793
	movl	$min_caml_viewpoint, %ecx # 793
	movsd	16(%ecx), %xmm2          # 793
	addsd	%xmm2, %xmm1             # 793
	movsd	%xmm1, 16(%ebx)          # 793
	movl	$0, %ebx                  # 794
	movl	4(%ebp), %ecx             # 794
	movl	%eax, 12(%ebp)            # 794
	movsd	%xmm0, 16(%ebp)          # 794
	movl	%ebx, %eax                # 794
	movl	%ecx, %ebx                # 794
	addl	$24, %ebp                 # 794
	call	check_all_inside.2078     # 794
	subl	$24, %ebp                 # 794
	cmpl	$0, %eax                  # 794
	jne	je_else.5478               # 794
	jmp	je_cont.5479               # 794
je_else.5478:                   # 794
	movl	$min_caml_tmin, %eax      # 796
	movsd	16(%ebp), %xmm0          # 796
	movsd	%xmm0, 0(%eax)           # 796
	movl	$min_caml_crashed_point, %eax	# 797
	movl	$min_caml_chkinside_p, %ebx	# 797
	movsd	0(%ebx), %xmm0           # 797
	movsd	%xmm0, 0(%eax)           # 797
	movl	$min_caml_crashed_point, %eax	# 798
	movl	$min_caml_chkinside_p, %ebx	# 798
	movsd	8(%ebx), %xmm0           # 798
	movsd	%xmm0, 8(%eax)           # 798
	movl	$min_caml_crashed_point, %eax	# 799
	movl	$min_caml_chkinside_p, %ebx	# 799
	movsd	16(%ebx), %xmm0          # 799
	movsd	%xmm0, 16(%eax)          # 799
	movl	$min_caml_intsec_rectside, %eax	# 800
	movl	12(%ebp), %ebx            # 800
	movl	%ebx, 0(%eax)             # 800
	movl	$min_caml_crashed_object, %eax	# 801
	movl	8(%ebp), %ebx             # 801
	movl	%ebx, 0(%eax)             # 801
je_cont.5479:                   # 794
jbe_cont.5477:                  # 788
jbe_cont.5475:                  # 787
je_cont.5471:                   # 782
	movl	$min_caml_end_flag, %eax  # 813
	movl	0(%eax), %eax             # 813
	cmpl	$0, %eax                  # 813
	jne	je_else.5480               # 813
	movl	0(%ebp), %eax             # 814
	addl	$1, %eax                  # 814
	movl	4(%ebp), %ebx             # 814
	jmp	solve_each_element.2093    # 814
je_else.5480:                   # 813
	ret                            # 815
solve_one_or_network.2096:      # 822
	movl	(%ebx,%eax,4), %ecx       # 822
	cmpl	$-1, %ecx                 # 823
	jne	je_else.5482               # 823
	ret                            # 823
je_else.5482:                   # 823
	movl	$min_caml_and_net, %edx   # 824
	movl	(%edx,%ecx,4), %ecx       # 824
	movl	$min_caml_end_flag, %edx  # 825
	movl	$0, %esi                  # 825
	movl	%esi, 0(%edx)             # 825
	movl	$0, %edx                  # 826
	movl	%ebx, 0(%ebp)             # 826
	movl	%eax, 4(%ebp)             # 826
	movl	%ecx, %ebx                # 826
	movl	%edx, %eax                # 826
	addl	$8, %ebp                  # 826
	call	solve_each_element.2093   # 826
	subl	$8, %ebp                  # 826
	movl	4(%ebp), %eax             # 827
	addl	$1, %eax                  # 827
	movl	0(%ebp), %ebx             # 827
	jmp	solve_one_or_network.2096  # 827
trace_or_matrix.2099:           # 834
	movl	(%ebx,%eax,4), %ecx       # 834
	movl	0(%ecx), %edx             # 835
	cmpl	$-1, %edx                 # 836
	jne	je_else.5484               # 836
	ret                            # 837
je_else.5484:                   # 836
	movl	%ebx, 0(%ebp)             # 839
	movl	%eax, 4(%ebp)             # 839
	cmpl	$99, %edx                 # 839
	jne	je_else.5486               # 839
	movl	$1, %edx                  # 840
	movl	%ecx, %ebx                # 840
	movl	%edx, %eax                # 840
	addl	$8, %ebp                  # 840
	call	solve_one_or_network.2096 # 840
	subl	$8, %ebp                  # 840
	jmp	je_cont.5487               # 839
je_else.5486:                   # 839
	movl	$min_caml_vscan, %esi     # 844
	movl	$min_caml_viewpoint, %edi # 844
	movl	%ecx, 8(%ebp)             # 844
	movl	%edi, %ecx                # 844
	movl	%esi, %ebx                # 844
	movl	%edx, %eax                # 844
	addl	$16, %ebp                 # 844
	call	solver.2066               # 844
	subl	$16, %ebp                 # 844
	cmpl	$0, %eax                  # 845
	jne	je_else.5488               # 845
	jmp	je_cont.5489               # 845
je_else.5488:                   # 845
	movl	$min_caml_solver_dist, %eax	# 846
	movsd	0(%eax), %xmm0           # 846
	movl	$min_caml_tmin, %eax      # 847
	movsd	0(%eax), %xmm1           # 847
	comisd	%xmm0, %xmm1            # 847
	ja	jbe_else.5490               # 847
	jmp	jbe_cont.5491              # 847
jbe_else.5490:                  # 847
	movl	$1, %eax                  # 848
	movl	8(%ebp), %ebx             # 848
	addl	$16, %ebp                 # 848
	call	solve_one_or_network.2096 # 848
	subl	$16, %ebp                 # 848
jbe_cont.5491:                  # 847
je_cont.5489:                   # 845
je_cont.5487:                   # 839
	movl	4(%ebp), %eax             # 852
	addl	$1, %eax                  # 852
	movl	0(%ebp), %ebx             # 852
	jmp	trace_or_matrix.2099       # 852
tracer.2102:                    # 863
	movl	$min_caml_tmin, %eax      # 863
	movl	$l.4505, %ebx             # 863
	movsd	0(%ebx), %xmm0           # 863
	movsd	%xmm0, 0(%eax)           # 863
	movl	$0, %eax                  # 864
	movl	$min_caml_or_net, %ebx    # 864
	movl	0(%ebx), %ebx             # 864
	call	trace_or_matrix.2099      # 864
	movl	$min_caml_tmin, %eax      # 865
	movsd	0(%eax), %xmm0           # 865
	movl	$l.4501, %eax             # 866
	movsd	0(%eax), %xmm1           # 866
	comisd	%xmm1, %xmm0            # 866
	ja	jbe_else.5492               # 866
	movl	$0, %eax                  # 870
	ret                            # 870
jbe_else.5492:                  # 866
	movl	$l.4508, %eax             # 867
	movsd	0(%eax), %xmm1           # 867
	comisd	%xmm0, %xmm1            # 867
	ja	jbe_else.5493               # 867
	movl	$0, %eax                  # 869
	ret                            # 869
jbe_else.5493:                  # 867
	movl	$1, %eax                  # 868
	ret                            # 868
get_nvector_rect.2105:          # 884
	movl	$min_caml_intsec_rectside, %eax	# 884
	movl	0(%eax), %eax             # 884
	cmpl	$1, %eax                  # 886
	jne	je_else.5494               # 886
	movl	$min_caml_nvector, %eax   # 888
	movl	$min_caml_vscan, %ebx     # 888
	movsd	0(%ebx), %xmm0           # 888
	movl	%eax, 0(%ebp)             # 888
	addl	$8, %ebp                  # 888
	call	sgn.2025                  # 888
	subl	$8, %ebp                  # 888
	xorpd	min_caml_fnegd, %xmm0    # 888
	movl	0(%ebp), %eax             # 888
	movsd	%xmm0, 0(%eax)           # 888
	movl	$min_caml_nvector, %eax   # 889
	movl	$l.4442, %ebx             # 889
	movsd	0(%ebx), %xmm0           # 889
	movsd	%xmm0, 8(%eax)           # 889
	movl	$min_caml_nvector, %eax   # 890
	movl	$l.4442, %ebx             # 890
	movsd	0(%ebx), %xmm0           # 890
	movsd	%xmm0, 16(%eax)          # 890
	ret                            # 890
je_else.5494:                   # 886
	cmpl	$2, %eax                  # 892
	jne	je_else.5496               # 892
	movl	$min_caml_nvector, %eax   # 894
	movl	$l.4442, %ebx             # 894
	movsd	0(%ebx), %xmm0           # 894
	movsd	%xmm0, 0(%eax)           # 894
	movl	$min_caml_nvector, %eax   # 895
	movl	$min_caml_vscan, %ebx     # 895
	movsd	8(%ebx), %xmm0           # 895
	movl	%eax, 4(%ebp)             # 895
	addl	$8, %ebp                  # 895
	call	sgn.2025                  # 895
	subl	$8, %ebp                  # 895
	xorpd	min_caml_fnegd, %xmm0    # 895
	movl	4(%ebp), %eax             # 895
	movsd	%xmm0, 8(%eax)           # 895
	movl	$min_caml_nvector, %eax   # 896
	movl	$l.4442, %ebx             # 896
	movsd	0(%ebx), %xmm0           # 896
	movsd	%xmm0, 16(%eax)          # 896
	ret                            # 896
je_else.5496:                   # 892
	cmpl	$3, %eax                  # 898
	jne	je_else.5498               # 898
	movl	$min_caml_nvector, %eax   # 900
	movl	$l.4442, %ebx             # 900
	movsd	0(%ebx), %xmm0           # 900
	movsd	%xmm0, 0(%eax)           # 900
	movl	$min_caml_nvector, %eax   # 901
	movl	$l.4442, %ebx             # 901
	movsd	0(%ebx), %xmm0           # 901
	movsd	%xmm0, 8(%eax)           # 901
	movl	$min_caml_nvector, %eax   # 902
	movl	$min_caml_vscan, %ebx     # 902
	movsd	16(%ebx), %xmm0          # 902
	movl	%eax, 8(%ebp)             # 902
	addl	$16, %ebp                 # 902
	call	sgn.2025                  # 902
	subl	$16, %ebp                 # 902
	xorpd	min_caml_fnegd, %xmm0    # 902
	movl	8(%ebp), %eax             # 902
	movsd	%xmm0, 16(%eax)          # 902
	ret                            # 902
je_else.5498:                   # 898
	ret                            # 904
get_nvector_plane.2107:         # 910
	movl	$min_caml_nvector, %ebx   # 910
	movl	%eax, 0(%ebp)             # 910
	movl	%ebx, 4(%ebp)             # 910
	addl	$8, %ebp                  # 910
	call	o_param_a.1994            # 910
	subl	$8, %ebp                  # 910
	xorpd	min_caml_fnegd, %xmm0    # 910
	movl	4(%ebp), %eax             # 910
	movsd	%xmm0, 0(%eax)           # 910
	movl	$min_caml_nvector, %eax   # 911
	movl	0(%ebp), %ebx             # 911
	movl	%eax, 8(%ebp)             # 911
	movl	%ebx, %eax                # 911
	addl	$16, %ebp                 # 911
	call	o_param_b.1996            # 911
	subl	$16, %ebp                 # 911
	xorpd	min_caml_fnegd, %xmm0    # 911
	movl	8(%ebp), %eax             # 911
	movsd	%xmm0, 8(%eax)           # 911
	movl	$min_caml_nvector, %eax   # 912
	movl	0(%ebp), %ebx             # 912
	movl	%eax, 12(%ebp)            # 912
	movl	%ebx, %eax                # 912
	addl	$16, %ebp                 # 912
	call	o_param_c.1998            # 912
	subl	$16, %ebp                 # 912
	xorpd	min_caml_fnegd, %xmm0    # 912
	movl	12(%ebp), %eax            # 912
	movsd	%xmm0, 16(%eax)          # 912
	ret                            # 912
get_nvector_second_norot.2109:  # 918
	movl	$min_caml_nvector, %ecx   # 918
	movsd	0(%ebx), %xmm0           # 918
	movl	%ebx, 0(%ebp)             # 918
	movl	%ecx, 4(%ebp)             # 918
	movl	%eax, 8(%ebp)             # 918
	movsd	%xmm0, 16(%ebp)          # 918
	addl	$24, %ebp                 # 918
	call	o_param_x.2000            # 918
	subl	$24, %ebp                 # 918
	movsd	16(%ebp), %xmm1          # 918
	subsd	%xmm0, %xmm1             # 918
	movl	8(%ebp), %eax             # 918
	movsd	%xmm1, 24(%ebp)          # 918
	addl	$32, %ebp                 # 918
	call	o_param_a.1994            # 918
	subl	$32, %ebp                 # 918
	movsd	24(%ebp), %xmm1          # 918
	mulsd	%xmm0, %xmm1             # 918
	movl	4(%ebp), %eax             # 918
	movsd	%xmm1, 0(%eax)           # 918
	movl	$min_caml_nvector, %eax   # 919
	movl	0(%ebp), %ebx             # 919
	movsd	8(%ebx), %xmm0           # 919
	movl	8(%ebp), %ecx             # 919
	movl	%eax, 32(%ebp)            # 919
	movsd	%xmm0, 40(%ebp)          # 919
	movl	%ecx, %eax                # 919
	addl	$48, %ebp                 # 919
	call	o_param_y.2002            # 919
	subl	$48, %ebp                 # 919
	movsd	40(%ebp), %xmm1          # 919
	subsd	%xmm0, %xmm1             # 919
	movl	8(%ebp), %eax             # 919
	movsd	%xmm1, 48(%ebp)          # 919
	addl	$56, %ebp                 # 919
	call	o_param_b.1996            # 919
	subl	$56, %ebp                 # 919
	movsd	48(%ebp), %xmm1          # 919
	mulsd	%xmm0, %xmm1             # 919
	movl	32(%ebp), %eax            # 919
	movsd	%xmm1, 8(%eax)           # 919
	movl	$min_caml_nvector, %eax   # 920
	movl	0(%ebp), %ebx             # 920
	movsd	16(%ebx), %xmm0          # 920
	movl	8(%ebp), %ebx             # 920
	movl	%eax, 56(%ebp)            # 920
	movsd	%xmm0, 64(%ebp)          # 920
	movl	%ebx, %eax                # 920
	addl	$72, %ebp                 # 920
	call	o_param_z.2004            # 920
	subl	$72, %ebp                 # 920
	movsd	64(%ebp), %xmm1          # 920
	subsd	%xmm0, %xmm1             # 920
	movl	8(%ebp), %eax             # 920
	movsd	%xmm1, 72(%ebp)          # 920
	addl	$80, %ebp                 # 920
	call	o_param_c.1998            # 920
	subl	$80, %ebp                 # 920
	movsd	72(%ebp), %xmm1          # 920
	mulsd	%xmm0, %xmm1             # 920
	movl	56(%ebp), %eax            # 920
	movsd	%xmm1, 16(%eax)          # 920
	movl	$min_caml_nvector, %eax   # 921
	movl	8(%ebp), %ebx             # 921
	movl	%eax, 80(%ebp)            # 921
	movl	%ebx, %eax                # 921
	addl	$88, %ebp                 # 921
	call	o_isinvert.1990           # 921
	subl	$88, %ebp                 # 921
	movl	%eax, %ebx                # 921
	movl	80(%ebp), %eax            # 921
	jmp	normalize_vector.2022      # 921
get_nvector_second_rot.2112:    # 926
	movl	$min_caml_nvector_w, %ecx # 926
	movsd	0(%ebx), %xmm0           # 926
	movl	%eax, 0(%ebp)             # 926
	movl	%ebx, 4(%ebp)             # 926
	movl	%ecx, 8(%ebp)             # 926
	movsd	%xmm0, 16(%ebp)          # 926
	addl	$24, %ebp                 # 926
	call	o_param_x.2000            # 926
	subl	$24, %ebp                 # 926
	movsd	16(%ebp), %xmm1          # 926
	subsd	%xmm0, %xmm1             # 926
	movl	8(%ebp), %eax             # 926
	movsd	%xmm1, 0(%eax)           # 926
	movl	$min_caml_nvector_w, %eax # 927
	movl	4(%ebp), %ebx             # 927
	movsd	8(%ebx), %xmm0           # 927
	movl	0(%ebp), %ecx             # 927
	movl	%eax, 24(%ebp)            # 927
	movsd	%xmm0, 32(%ebp)          # 927
	movl	%ecx, %eax                # 927
	addl	$40, %ebp                 # 927
	call	o_param_y.2002            # 927
	subl	$40, %ebp                 # 927
	movsd	32(%ebp), %xmm1          # 927
	subsd	%xmm0, %xmm1             # 927
	movl	24(%ebp), %eax            # 927
	movsd	%xmm1, 8(%eax)           # 927
	movl	$min_caml_nvector_w, %eax # 928
	movl	4(%ebp), %ebx             # 928
	movsd	16(%ebx), %xmm0          # 928
	movl	0(%ebp), %ebx             # 928
	movl	%eax, 40(%ebp)            # 928
	movsd	%xmm0, 48(%ebp)          # 928
	movl	%ebx, %eax                # 928
	addl	$56, %ebp                 # 928
	call	o_param_z.2004            # 928
	subl	$56, %ebp                 # 928
	movsd	48(%ebp), %xmm1          # 928
	subsd	%xmm0, %xmm1             # 928
	movl	40(%ebp), %eax            # 928
	movsd	%xmm1, 16(%eax)          # 928
	movl	$min_caml_nvector, %eax   # 929
	movl	$min_caml_nvector_w, %ebx # 929
	movsd	0(%ebx), %xmm0           # 929
	movl	0(%ebp), %ebx             # 929
	movl	%eax, 56(%ebp)            # 929
	movsd	%xmm0, 64(%ebp)          # 929
	movl	%ebx, %eax                # 929
	addl	$72, %ebp                 # 929
	call	o_param_a.1994            # 929
	subl	$72, %ebp                 # 929
	movsd	64(%ebp), %xmm1          # 929
	mulsd	%xmm0, %xmm1             # 929
	movl	$min_caml_nvector_w, %eax # 929
	movsd	8(%eax), %xmm0           # 929
	movl	0(%ebp), %eax             # 929
	movsd	%xmm1, 72(%ebp)          # 929
	movsd	%xmm0, 80(%ebp)          # 929
	addl	$88, %ebp                 # 929
	call	o_param_r3.2020           # 929
	subl	$88, %ebp                 # 929
	movsd	80(%ebp), %xmm1          # 929
	mulsd	%xmm0, %xmm1             # 929
	movl	$min_caml_nvector_w, %eax # 929
	movsd	16(%eax), %xmm0          # 929
	movl	0(%ebp), %eax             # 929
	movsd	%xmm1, 88(%ebp)          # 929
	movsd	%xmm0, 96(%ebp)          # 929
	addl	$104, %ebp                # 929
	call	o_param_r2.2018           # 929
	subl	$104, %ebp                # 929
	movsd	96(%ebp), %xmm1          # 929
	mulsd	%xmm0, %xmm1             # 929
	movsd	88(%ebp), %xmm0          # 929
	addsd	%xmm1, %xmm0             # 929
	addl	$104, %ebp                # 929
	call	fhalf.1982                # 929
	subl	$104, %ebp                # 929
	movsd	72(%ebp), %xmm1          # 929
	addsd	%xmm0, %xmm1             # 929
	movl	56(%ebp), %eax            # 929
	movsd	%xmm1, 0(%eax)           # 929
	movl	$min_caml_nvector, %eax   # 932
	movl	$min_caml_nvector_w, %ebx # 932
	movsd	8(%ebx), %xmm0           # 932
	movl	0(%ebp), %ebx             # 932
	movl	%eax, 104(%ebp)           # 932
	movsd	%xmm0, 112(%ebp)         # 932
	movl	%ebx, %eax                # 932
	addl	$120, %ebp                # 932
	call	o_param_b.1996            # 932
	subl	$120, %ebp                # 932
	movsd	112(%ebp), %xmm1         # 932
	mulsd	%xmm0, %xmm1             # 932
	movl	$min_caml_nvector_w, %eax # 932
	movsd	0(%eax), %xmm0           # 932
	movl	0(%ebp), %eax             # 932
	movsd	%xmm1, 120(%ebp)         # 932
	movsd	%xmm0, 128(%ebp)         # 932
	addl	$136, %ebp                # 932
	call	o_param_r3.2020           # 932
	subl	$136, %ebp                # 932
	movsd	128(%ebp), %xmm1         # 932
	mulsd	%xmm0, %xmm1             # 932
	movl	$min_caml_nvector_w, %eax # 932
	movsd	16(%eax), %xmm0          # 932
	movl	0(%ebp), %eax             # 932
	movsd	%xmm1, 136(%ebp)         # 932
	movsd	%xmm0, 144(%ebp)         # 932
	addl	$152, %ebp                # 932
	call	o_param_r1.2016           # 932
	subl	$152, %ebp                # 932
	movsd	144(%ebp), %xmm1         # 932
	mulsd	%xmm0, %xmm1             # 932
	movsd	136(%ebp), %xmm0         # 932
	addsd	%xmm1, %xmm0             # 932
	addl	$152, %ebp                # 932
	call	fhalf.1982                # 932
	subl	$152, %ebp                # 932
	movsd	120(%ebp), %xmm1         # 932
	addsd	%xmm0, %xmm1             # 932
	movl	104(%ebp), %eax           # 932
	movsd	%xmm1, 8(%eax)           # 932
	movl	$min_caml_nvector, %eax   # 935
	movl	$min_caml_nvector_w, %ebx # 935
	movsd	16(%ebx), %xmm0          # 935
	movl	0(%ebp), %ebx             # 935
	movl	%eax, 152(%ebp)           # 935
	movsd	%xmm0, 160(%ebp)         # 935
	movl	%ebx, %eax                # 935
	addl	$168, %ebp                # 935
	call	o_param_c.1998            # 935
	subl	$168, %ebp                # 935
	movsd	160(%ebp), %xmm1         # 935
	mulsd	%xmm0, %xmm1             # 935
	movl	$min_caml_nvector_w, %eax # 935
	movsd	0(%eax), %xmm0           # 935
	movl	0(%ebp), %eax             # 935
	movsd	%xmm1, 168(%ebp)         # 935
	movsd	%xmm0, 176(%ebp)         # 935
	addl	$184, %ebp                # 935
	call	o_param_r2.2018           # 935
	subl	$184, %ebp                # 935
	movsd	176(%ebp), %xmm1         # 935
	mulsd	%xmm0, %xmm1             # 935
	movl	$min_caml_nvector_w, %eax # 935
	movsd	8(%eax), %xmm0           # 935
	movl	0(%ebp), %eax             # 935
	movsd	%xmm1, 184(%ebp)         # 935
	movsd	%xmm0, 192(%ebp)         # 935
	addl	$200, %ebp                # 935
	call	o_param_r1.2016           # 935
	subl	$200, %ebp                # 935
	movsd	192(%ebp), %xmm1         # 935
	mulsd	%xmm0, %xmm1             # 935
	movsd	184(%ebp), %xmm0         # 935
	addsd	%xmm1, %xmm0             # 935
	addl	$200, %ebp                # 935
	call	fhalf.1982                # 935
	subl	$200, %ebp                # 935
	movsd	168(%ebp), %xmm1         # 935
	addsd	%xmm0, %xmm1             # 935
	movl	152(%ebp), %eax           # 935
	movsd	%xmm1, 16(%eax)          # 935
	movl	$min_caml_nvector, %eax   # 938
	movl	0(%ebp), %ebx             # 938
	movl	%eax, 200(%ebp)           # 938
	movl	%ebx, %eax                # 938
	addl	$208, %ebp                # 938
	call	o_isinvert.1990           # 938
	subl	$208, %ebp                # 938
	movl	%eax, %ebx                # 938
	movl	200(%ebp), %eax           # 938
	jmp	normalize_vector.2022      # 938
get_nvector.2115:               # 943
	movl	%ebx, 0(%ebp)             # 943
	movl	%eax, 4(%ebp)             # 943
	addl	$8, %ebp                  # 943
	call	o_form.1986               # 943
	subl	$8, %ebp                  # 943
	cmpl	$1, %eax                  # 944
	jne	je_else.5511               # 944
	jmp	get_nvector_rect.2105      # 945
je_else.5511:                   # 944
	cmpl	$2, %eax                  # 946
	jne	je_else.5512               # 946
	movl	4(%ebp), %eax             # 947
	jmp	get_nvector_plane.2107     # 947
je_else.5512:                   # 946
	movl	4(%ebp), %eax             # 949
	addl	$8, %ebp                  # 949
	call	o_isrot.1992              # 949
	subl	$8, %ebp                  # 949
	cmpl	$0, %eax                  # 949
	jne	je_else.5513               # 949
	movl	4(%ebp), %eax             # 952
	movl	0(%ebp), %ebx             # 952
	jmp	get_nvector_second_norot.2109	# 952
je_else.5513:                   # 949
	movl	4(%ebp), %eax             # 950
	movl	0(%ebp), %ebx             # 950
	jmp	get_nvector_second_rot.2112	# 950
utexture.2118:                  # 959
	movl	%ebx, 0(%ebp)             # 959
	movl	%eax, 4(%ebp)             # 959
	addl	$8, %ebp                  # 959
	call	o_texturetype.1984        # 959
	subl	$8, %ebp                  # 959
	movl	$min_caml_texture_color, %ebx	# 961
	movl	4(%ebp), %ecx             # 961
	movl	%eax, 8(%ebp)             # 961
	movl	%ebx, 12(%ebp)            # 961
	movl	%ecx, %eax                # 961
	addl	$16, %ebp                 # 961
	call	o_color_red.2010          # 961
	subl	$16, %ebp                 # 961
	movl	12(%ebp), %eax            # 961
	movsd	%xmm0, 0(%eax)           # 961
	movl	$min_caml_texture_color, %eax	# 962
	movl	4(%ebp), %ebx             # 962
	movl	%eax, 16(%ebp)            # 962
	movl	%ebx, %eax                # 962
	addl	$24, %ebp                 # 962
	call	o_color_green.2012        # 962
	subl	$24, %ebp                 # 962
	movl	16(%ebp), %eax            # 962
	movsd	%xmm0, 8(%eax)           # 962
	movl	$min_caml_texture_color, %eax	# 963
	movl	4(%ebp), %ebx             # 963
	movl	%eax, 20(%ebp)            # 963
	movl	%ebx, %eax                # 963
	addl	$24, %ebp                 # 963
	call	o_color_blue.2014         # 963
	subl	$24, %ebp                 # 963
	movl	20(%ebp), %eax            # 963
	movsd	%xmm0, 16(%eax)          # 963
	movl	8(%ebp), %eax             # 964
	cmpl	$1, %eax                  # 964
	jne	je_else.5514               # 964
	movl	0(%ebp), %eax             # 967
	movsd	0(%eax), %xmm0           # 967
	movl	4(%ebp), %ebx             # 967
	movsd	%xmm0, 24(%ebp)          # 967
	movl	%ebx, %eax                # 967
	addl	$32, %ebp                 # 967
	call	o_param_x.2000            # 967
	subl	$32, %ebp                 # 967
	movsd	24(%ebp), %xmm1          # 967
	subsd	%xmm0, %xmm1             # 967
	movl	$l.4547, %eax             # 968
	movsd	0(%eax), %xmm0           # 968
	mulsd	%xmm1, %xmm0             # 968
	movsd	%xmm1, 32(%ebp)          # 968
	addl	$40, %ebp                 # 968
	call	min_caml_floor            # 968
	subl	$40, %ebp                 # 968
	movl	$l.4549, %eax             # 968
	movsd	0(%eax), %xmm1           # 968
	mulsd	%xmm1, %xmm0             # 968
	movl	$l.4534, %eax             # 968
	movsd	0(%eax), %xmm1           # 968
	movsd	32(%ebp), %xmm2          # 968
	subsd	%xmm0, %xmm2             # 968
	comisd	%xmm2, %xmm1            # 968
	ja	jbe_else.5515               # 968
	movl	$0, %eax                  # 970
	jmp	jbe_cont.5516              # 968
jbe_else.5515:                  # 968
	movl	$1, %eax                  # 970
jbe_cont.5516:                  # 968
	movl	0(%ebp), %ebx             # 972
	movsd	16(%ebx), %xmm0          # 972
	movl	4(%ebp), %ebx             # 972
	movl	%eax, 40(%ebp)            # 972
	movsd	%xmm0, 48(%ebp)          # 972
	movl	%ebx, %eax                # 972
	addl	$56, %ebp                 # 972
	call	o_param_z.2004            # 972
	subl	$56, %ebp                 # 972
	movsd	48(%ebp), %xmm1          # 972
	subsd	%xmm0, %xmm1             # 972
	movl	$l.4547, %eax             # 973
	movsd	0(%eax), %xmm0           # 973
	mulsd	%xmm1, %xmm0             # 973
	movsd	%xmm1, 56(%ebp)          # 973
	addl	$64, %ebp                 # 973
	call	min_caml_floor            # 973
	subl	$64, %ebp                 # 973
	movl	$l.4549, %eax             # 973
	movsd	0(%eax), %xmm1           # 973
	mulsd	%xmm1, %xmm0             # 973
	movl	$l.4534, %eax             # 973
	movsd	0(%eax), %xmm1           # 973
	movsd	56(%ebp), %xmm2          # 973
	subsd	%xmm0, %xmm2             # 973
	comisd	%xmm2, %xmm1            # 973
	ja	jbe_else.5518               # 973
	movl	$0, %eax                  # 975
	jmp	jbe_cont.5519              # 973
jbe_else.5518:                  # 973
	movl	$1, %eax                  # 975
jbe_cont.5519:                  # 973
	movl	$min_caml_texture_color, %ebx	# 977
	movl	40(%ebp), %ecx            # 978
	cmpl	$0, %ecx                  # 978
	jne	je_else.5520               # 978
	cmpl	$0, %eax                  # 980
	jne	je_else.5522               # 980
	movl	$l.4538, %eax             # 980
	movsd	0(%eax), %xmm0           # 980
	jmp	je_cont.5523               # 980
je_else.5522:                   # 980
	movl	$l.4442, %eax             # 980
	movsd	0(%eax), %xmm0           # 980
je_cont.5523:                   # 980
	jmp	je_cont.5521               # 978
je_else.5520:                   # 978
	cmpl	$0, %eax                  # 979
	jne	je_else.5524               # 979
	movl	$l.4442, %eax             # 979
	movsd	0(%eax), %xmm0           # 979
	jmp	je_cont.5525               # 979
je_else.5524:                   # 979
	movl	$l.4538, %eax             # 979
	movsd	0(%eax), %xmm0           # 979
je_cont.5525:                   # 979
je_cont.5521:                   # 978
	movsd	%xmm0, 8(%ebx)           # 977
	ret                            # 977
je_else.5514:                   # 964
	cmpl	$2, %eax                  # 982
	jne	je_else.5527               # 982
	movl	0(%ebp), %eax             # 985
	movsd	8(%eax), %xmm0           # 985
	movl	$l.4542, %eax             # 985
	movsd	0(%eax), %xmm1           # 985
	mulsd	%xmm1, %xmm0             # 985
	addl	$64, %ebp                 # 985
	call	min_caml_sin              # 985
	subl	$64, %ebp                 # 985
	addl	$64, %ebp                 # 985
	call	fsqr.1980                 # 985
	subl	$64, %ebp                 # 985
	movl	$min_caml_texture_color, %eax	# 986
	movl	$l.4538, %ebx             # 986
	movsd	0(%ebx), %xmm1           # 986
	mulsd	%xmm0, %xmm1             # 986
	movsd	%xmm1, 0(%eax)           # 986
	movl	$min_caml_texture_color, %eax	# 987
	movl	$l.4538, %ebx             # 987
	movsd	0(%ebx), %xmm1           # 987
	movl	$l.4444, %ebx             # 987
	movsd	0(%ebx), %xmm2           # 987
	subsd	%xmm0, %xmm2             # 987
	mulsd	%xmm2, %xmm1             # 987
	movsd	%xmm1, 8(%eax)           # 987
	ret                            # 987
je_else.5527:                   # 982
	cmpl	$3, %eax                  # 989
	jne	je_else.5529               # 989
	movl	0(%ebp), %eax             # 992
	movsd	0(%eax), %xmm0           # 992
	movl	4(%ebp), %ebx             # 992
	movsd	%xmm0, 64(%ebp)          # 992
	movl	%ebx, %eax                # 992
	addl	$72, %ebp                 # 992
	call	o_param_x.2000            # 992
	subl	$72, %ebp                 # 992
	movsd	64(%ebp), %xmm1          # 992
	subsd	%xmm0, %xmm1             # 992
	movl	0(%ebp), %eax             # 993
	movsd	16(%eax), %xmm0          # 993
	movl	4(%ebp), %eax             # 993
	movsd	%xmm1, 72(%ebp)          # 993
	movsd	%xmm0, 80(%ebp)          # 993
	addl	$88, %ebp                 # 993
	call	o_param_z.2004            # 993
	subl	$88, %ebp                 # 993
	movsd	80(%ebp), %xmm1          # 993
	subsd	%xmm0, %xmm1             # 993
	movsd	72(%ebp), %xmm0          # 994
	movsd	%xmm1, 88(%ebp)          # 994
	addl	$96, %ebp                 # 994
	call	fsqr.1980                 # 994
	subl	$96, %ebp                 # 994
	movsd	88(%ebp), %xmm1          # 994
	movsd	%xmm0, 96(%ebp)          # 994
	movsd	%xmm1, %xmm0             # 994
	addl	$104, %ebp                # 994
	call	fsqr.1980                 # 994
	subl	$104, %ebp                # 994
	movsd	96(%ebp), %xmm1          # 994
	addsd	%xmm1, %xmm0             # 994
	addl	$104, %ebp                # 994
	call	min_caml_sqrt             # 994
	subl	$104, %ebp                # 994
	movl	$l.4534, %eax             # 994
	movsd	0(%eax), %xmm1           # 994
	divsd	%xmm1, %xmm0             # 994
	movsd	%xmm0, 104(%ebp)         # 995
	addl	$112, %ebp                # 995
	call	min_caml_floor            # 995
	subl	$112, %ebp                # 995
	movsd	104(%ebp), %xmm1         # 995
	subsd	%xmm0, %xmm1             # 995
	movl	$l.4536, %eax             # 995
	movsd	0(%eax), %xmm0           # 995
	mulsd	%xmm1, %xmm0             # 995
	addl	$112, %ebp                # 996
	call	min_caml_cos              # 996
	subl	$112, %ebp                # 996
	addl	$112, %ebp                # 996
	call	fsqr.1980                 # 996
	subl	$112, %ebp                # 996
	movl	$min_caml_texture_color, %eax	# 997
	movl	$l.4538, %ebx             # 997
	movsd	0(%ebx), %xmm1           # 997
	mulsd	%xmm0, %xmm1             # 997
	movsd	%xmm1, 8(%eax)           # 997
	movl	$min_caml_texture_color, %eax	# 998
	movl	$l.4444, %ebx             # 998
	movsd	0(%ebx), %xmm1           # 998
	subsd	%xmm0, %xmm1             # 998
	movl	$l.4538, %ebx             # 998
	movsd	0(%ebx), %xmm0           # 998
	mulsd	%xmm0, %xmm1             # 998
	movsd	%xmm1, 16(%eax)          # 998
	ret                            # 998
je_else.5529:                   # 989
	cmpl	$4, %eax                  # 1000
	jne	je_else.5531               # 1000
	movl	0(%ebp), %eax             # 1002
	movsd	0(%eax), %xmm0           # 1002
	movl	4(%ebp), %ebx             # 1002
	movsd	%xmm0, 112(%ebp)         # 1002
	movl	%ebx, %eax                # 1002
	addl	$120, %ebp                # 1002
	call	o_param_x.2000            # 1002
	subl	$120, %ebp                # 1002
	movsd	112(%ebp), %xmm1         # 1002
	subsd	%xmm0, %xmm1             # 1002
	movl	4(%ebp), %eax             # 1002
	movsd	%xmm1, 120(%ebp)         # 1002
	addl	$128, %ebp                # 1002
	call	o_param_a.1994            # 1002
	subl	$128, %ebp                # 1002
	addl	$128, %ebp                # 1002
	call	min_caml_sqrt             # 1002
	subl	$128, %ebp                # 1002
	movsd	120(%ebp), %xmm1         # 1002
	mulsd	%xmm0, %xmm1             # 1002
	movl	0(%ebp), %eax             # 1003
	movsd	16(%eax), %xmm0          # 1003
	movl	4(%ebp), %ebx             # 1003
	movsd	%xmm1, 128(%ebp)         # 1003
	movsd	%xmm0, 136(%ebp)         # 1003
	movl	%ebx, %eax                # 1003
	addl	$144, %ebp                # 1003
	call	o_param_z.2004            # 1003
	subl	$144, %ebp                # 1003
	movsd	136(%ebp), %xmm1         # 1003
	subsd	%xmm0, %xmm1             # 1003
	movl	4(%ebp), %eax             # 1003
	movsd	%xmm1, 144(%ebp)         # 1003
	addl	$152, %ebp                # 1003
	call	o_param_c.1998            # 1003
	subl	$152, %ebp                # 1003
	addl	$152, %ebp                # 1003
	call	min_caml_sqrt             # 1003
	subl	$152, %ebp                # 1003
	movsd	144(%ebp), %xmm1         # 1003
	mulsd	%xmm0, %xmm1             # 1003
	movsd	128(%ebp), %xmm0         # 1004
	movsd	%xmm1, 152(%ebp)         # 1004
	addl	$160, %ebp                # 1004
	call	fsqr.1980                 # 1004
	subl	$160, %ebp                # 1004
	movsd	152(%ebp), %xmm1         # 1004
	movsd	%xmm0, 160(%ebp)         # 1004
	movsd	%xmm1, %xmm0             # 1004
	addl	$168, %ebp                # 1004
	call	fsqr.1980                 # 1004
	subl	$168, %ebp                # 1004
	movsd	160(%ebp), %xmm1         # 1004
	addsd	%xmm1, %xmm0             # 1004
	addl	$168, %ebp                # 1004
	call	min_caml_sqrt             # 1004
	subl	$168, %ebp                # 1004
	movl	$l.4516, %eax             # 1005
	movsd	0(%eax), %xmm1           # 1005
	movsd	128(%ebp), %xmm2         # 1005
	movsd	%xmm0, 168(%ebp)         # 1005
	movsd	%xmm1, 176(%ebp)         # 1005
	movsd	%xmm2, %xmm0             # 1005
	addl	$184, %ebp                # 1005
	call	min_caml_abs_float        # 1005
	subl	$184, %ebp                # 1005
	movsd	176(%ebp), %xmm1         # 1005
	comisd	%xmm0, %xmm1            # 1005
	ja	jbe_else.5532               # 1005
	movsd	128(%ebp), %xmm0         # 1009
	movsd	152(%ebp), %xmm1         # 1009
	movsd	%xmm0, 184(%ebp)         # 1009
	movsd	%xmm1, %xmm0             # 1009
	divsd	184(%ebp), %xmm0         # 1009
	addl	$184, %ebp                # 1009
	call	min_caml_abs_float        # 1009
	subl	$184, %ebp                # 1009
	addl	$184, %ebp                # 1011
	call	min_caml_atan             # 1011
	subl	$184, %ebp                # 1011
	movl	$l.4520, %eax             # 1011
	movsd	0(%eax), %xmm1           # 1011
	mulsd	%xmm1, %xmm0             # 1011
	jmp	jbe_cont.5533              # 1005
jbe_else.5532:                  # 1005
	movl	$l.4518, %eax             # 1007
	movsd	0(%eax), %xmm0           # 1007
jbe_cont.5533:                  # 1005
	movsd	%xmm0, 184(%ebp)         # 1013
	addl	$192, %ebp                # 1013
	call	min_caml_floor            # 1013
	subl	$192, %ebp                # 1013
	movsd	184(%ebp), %xmm1         # 1013
	movsd	%xmm0, 192(%ebp)         # 1013
	movsd	%xmm1, %xmm0             # 1013
	subsd	192(%ebp), %xmm0         # 1013
	movl	0(%ebp), %eax             # 1015
	movsd	8(%eax), %xmm2           # 1015
	movl	4(%ebp), %eax             # 1015
	movsd	%xmm0, 192(%ebp)         # 1015
	movsd	%xmm2, 200(%ebp)         # 1015
	addl	$208, %ebp                # 1015
	call	o_param_y.2002            # 1015
	subl	$208, %ebp                # 1015
	movsd	200(%ebp), %xmm1         # 1015
	subsd	%xmm0, %xmm1             # 1015
	movl	4(%ebp), %eax             # 1015
	movsd	%xmm1, 208(%ebp)         # 1015
	addl	$216, %ebp                # 1015
	call	o_param_b.1996            # 1015
	subl	$216, %ebp                # 1015
	addl	$216, %ebp                # 1015
	call	min_caml_sqrt             # 1015
	subl	$216, %ebp                # 1015
	movsd	208(%ebp), %xmm1         # 1015
	mulsd	%xmm0, %xmm1             # 1015
	movl	$l.4516, %eax             # 1016
	movsd	0(%eax), %xmm0           # 1016
	movsd	184(%ebp), %xmm2         # 1016
	movsd	%xmm1, 216(%ebp)         # 1016
	movsd	%xmm0, 224(%ebp)         # 1016
	movsd	%xmm2, %xmm0             # 1016
	addl	$232, %ebp                # 1016
	call	min_caml_abs_float        # 1016
	subl	$232, %ebp                # 1016
	movsd	224(%ebp), %xmm1         # 1016
	comisd	%xmm0, %xmm1            # 1016
	ja	jbe_else.5534               # 1016
	movsd	168(%ebp), %xmm0         # 1020
	movsd	216(%ebp), %xmm1         # 1020
	movsd	%xmm0, 232(%ebp)         # 1020
	movsd	%xmm1, %xmm0             # 1020
	divsd	232(%ebp), %xmm0         # 1020
	addl	$232, %ebp                # 1020
	call	min_caml_abs_float        # 1020
	subl	$232, %ebp                # 1020
	addl	$232, %ebp                # 1021
	call	min_caml_atan             # 1021
	subl	$232, %ebp                # 1021
	movl	$l.4520, %eax             # 1021
	movsd	0(%eax), %xmm1           # 1021
	mulsd	%xmm1, %xmm0             # 1021
	jmp	jbe_cont.5535              # 1016
jbe_else.5534:                  # 1016
	movl	$l.4518, %eax             # 1018
	movsd	0(%eax), %xmm0           # 1018
jbe_cont.5535:                  # 1016
	movsd	%xmm0, 232(%ebp)         # 1023
	addl	$240, %ebp                # 1023
	call	min_caml_floor            # 1023
	subl	$240, %ebp                # 1023
	movsd	232(%ebp), %xmm1         # 1023
	subsd	%xmm0, %xmm1             # 1023
	movl	$l.4525, %eax             # 1024
	movsd	0(%eax), %xmm0           # 1024
	movl	$l.4527, %eax             # 1024
	movsd	0(%eax), %xmm2           # 1024
	movsd	192(%ebp), %xmm3         # 1024
	subsd	%xmm3, %xmm2             # 1024
	movsd	%xmm1, 240(%ebp)         # 1024
	movsd	%xmm0, 248(%ebp)         # 1024
	movsd	%xmm2, %xmm0             # 1024
	addl	$256, %ebp                # 1024
	call	fsqr.1980                 # 1024
	subl	$256, %ebp                # 1024
	movsd	248(%ebp), %xmm1         # 1024
	subsd	%xmm0, %xmm1             # 1024
	movl	$l.4527, %eax             # 1024
	movsd	0(%eax), %xmm0           # 1024
	movsd	240(%ebp), %xmm2         # 1024
	subsd	%xmm2, %xmm0             # 1024
	movsd	%xmm1, 256(%ebp)         # 1024
	addl	$264, %ebp                # 1024
	call	fsqr.1980                 # 1024
	subl	$264, %ebp                # 1024
	movsd	256(%ebp), %xmm1         # 1024
	subsd	%xmm0, %xmm1             # 1024
	movl	$min_caml_texture_color, %eax	# 1025
	movl	$l.4442, %ebx             # 1025
	movsd	0(%ebx), %xmm0           # 1025
	comisd	%xmm0, %xmm1            # 1025
	ja	jbe_else.5536               # 1025
	movl	$l.4442, %ebx             # 1025
	movsd	0(%ebx), %xmm1           # 1025
	jmp	jbe_cont.5537              # 1025
jbe_else.5536:                  # 1025
	movl	$l.4531, %ebx             # 1025
	movsd	0(%ebx), %xmm0           # 1025
	mulsd	%xmm0, %xmm1             # 1025
jbe_cont.5537:                  # 1025
	movsd	%xmm1, 16(%eax)          # 1025
	ret                            # 1025
je_else.5531:                   # 1000
	ret                            # 1027
in_prod.2121:                   # 1039
	movsd	0(%eax), %xmm0           # 1039
	movsd	0(%ebx), %xmm1           # 1039
	mulsd	%xmm1, %xmm0             # 1039
	movsd	8(%eax), %xmm1           # 1039
	movsd	8(%ebx), %xmm2           # 1039
	mulsd	%xmm2, %xmm1             # 1039
	addsd	%xmm1, %xmm0             # 1039
	movsd	16(%eax), %xmm1          # 1039
	movsd	16(%ebx), %xmm2          # 1039
	mulsd	%xmm2, %xmm1             # 1039
	addsd	%xmm1, %xmm0             # 1039
	ret                            # 1039
accumulate_vec_mul.2124:        # 1045
	movsd	0(%eax), %xmm1           # 1045
	movsd	0(%ebx), %xmm2           # 1045
	mulsd	%xmm0, %xmm2             # 1045
	addsd	%xmm2, %xmm1             # 1045
	movsd	%xmm1, 0(%eax)           # 1045
	movsd	8(%eax), %xmm1           # 1046
	movsd	8(%ebx), %xmm2           # 1046
	mulsd	%xmm0, %xmm2             # 1046
	addsd	%xmm2, %xmm1             # 1046
	movsd	%xmm1, 8(%eax)           # 1046
	movsd	16(%eax), %xmm1          # 1047
	movsd	16(%ebx), %xmm2          # 1047
	mulsd	%xmm2, %xmm0             # 1047
	addsd	%xmm0, %xmm1             # 1047
	movsd	%xmm1, 16(%eax)          # 1047
	ret                            # 1047
raytracing.2128:                # 1052
	movl	$min_caml_viewpoint, %ebx # 1052
	movl	$min_caml_vscan, %ecx     # 1052
	movsd	%xmm0, 0(%ebp)           # 1052
	movl	%eax, 8(%ebp)             # 1052
	movl	%ebx, %eax                # 1052
	movl	%ecx, %ebx                # 1052
	addl	$16, %ebp                 # 1052
	call	tracer.2102               # 1052
	subl	$16, %ebp                 # 1052
	movl	%eax, 12(%ebp)            # 1056
	cmpl	$0, %eax                  # 1056
	jne	je_else.5541               # 1056
	movl	8(%ebp), %ebx             # 1057
	cmpl	$0, %ebx                  # 1057
	jne	je_else.5543               # 1057
	jmp	je_cont.5544               # 1057
je_else.5543:                   # 1057
	movl	$min_caml_vscan, %ecx     # 1059
	movl	$min_caml_light, %edx     # 1059
	movl	%edx, %ebx                # 1059
	movl	%ecx, %eax                # 1059
	addl	$16, %ebp                 # 1059
	call	in_prod.2121              # 1059
	subl	$16, %ebp                 # 1059
	xorpd	min_caml_fnegd, %xmm0    # 1059
	movl	$l.4442, %eax             # 1061
	movsd	0(%eax), %xmm1           # 1061
	comisd	%xmm1, %xmm0            # 1061
	ja	jbe_else.5545               # 1061
	jmp	jbe_cont.5546              # 1061
jbe_else.5545:                  # 1061
	movsd	%xmm0, 16(%ebp)          # 1064
	addl	$24, %ebp                 # 1064
	call	fsqr.1980                 # 1064
	subl	$24, %ebp                 # 1064
	movsd	16(%ebp), %xmm1          # 1064
	mulsd	%xmm1, %xmm0             # 1064
	movsd	0(%ebp), %xmm1           # 1064
	mulsd	%xmm1, %xmm0             # 1064
	movl	$min_caml_beam, %eax      # 1064
	movsd	0(%eax), %xmm2           # 1064
	mulsd	%xmm2, %xmm0             # 1064
	movl	$min_caml_rgb, %eax       # 1065
	movl	$min_caml_rgb, %ebx       # 1065
	movsd	0(%ebx), %xmm2           # 1065
	addsd	%xmm0, %xmm2             # 1065
	movsd	%xmm2, 0(%eax)           # 1065
	movl	$min_caml_rgb, %eax       # 1066
	movl	$min_caml_rgb, %ebx       # 1066
	movsd	8(%ebx), %xmm2           # 1066
	addsd	%xmm0, %xmm2             # 1066
	movsd	%xmm2, 8(%eax)           # 1066
	movl	$min_caml_rgb, %eax       # 1067
	movl	$min_caml_rgb, %ebx       # 1067
	movsd	16(%ebx), %xmm2          # 1067
	addsd	%xmm0, %xmm2             # 1067
	movsd	%xmm2, 16(%eax)          # 1067
jbe_cont.5546:                  # 1061
je_cont.5544:                   # 1057
	jmp	je_cont.5542               # 1056
je_else.5541:                   # 1056
je_cont.5542:                   # 1056
	movl	12(%ebp), %eax            # 1074
	cmpl	$0, %eax                  # 1074
	jne	je_else.5547               # 1074
	ret                            # 1134
je_else.5547:                   # 1074
	movl	$min_caml_objects, %eax   # 1078
	movl	$min_caml_crashed_object, %ebx	# 1078
	movl	0(%ebx), %ebx             # 1078
	movl	(%eax,%ebx,4), %eax       # 1078
	movl	$min_caml_crashed_point, %ebx	# 1079
	movl	%eax, 24(%ebp)            # 1079
	addl	$32, %ebp                 # 1079
	call	get_nvector.2115          # 1079
	subl	$32, %ebp                 # 1079
	movl	$0, %eax                  # 1080
	movl	$min_caml_or_net, %ebx    # 1080
	movl	0(%ebx), %ebx             # 1080
	movl	$min_caml_crashed_point, %ecx	# 1080
	addl	$32, %ebp                 # 1080
	call	shadow_check_one_or_matrix.2089	# 1080
	subl	$32, %ebp                 # 1080
	cmpl	$0, %eax                  # 1080
	jne	je_else.5549               # 1080
	movl	$min_caml_nvector, %eax   # 1085
	movl	$min_caml_light, %ebx     # 1085
	addl	$32, %ebp                 # 1085
	call	in_prod.2121              # 1085
	subl	$32, %ebp                 # 1085
	xorpd	min_caml_fnegd, %xmm0    # 1085
	movl	$l.4442, %eax             # 1086
	movsd	0(%eax), %xmm1           # 1086
	comisd	%xmm0, %xmm1            # 1086
	ja	jbe_else.5551               # 1086
	movl	$l.4562, %eax             # 1086
	movsd	0(%eax), %xmm1           # 1086
	addsd	%xmm1, %xmm0             # 1086
	jmp	jbe_cont.5552              # 1086
jbe_else.5551:                  # 1086
	movl	$l.4562, %eax             # 1086
	movsd	0(%eax), %xmm0           # 1086
jbe_cont.5552:                  # 1086
	movsd	0(%ebp), %xmm1           # 1087
	mulsd	%xmm1, %xmm0             # 1087
	movl	24(%ebp), %eax            # 1087
	movsd	%xmm0, 32(%ebp)          # 1087
	addl	$40, %ebp                 # 1087
	call	o_diffuse.2006            # 1087
	subl	$40, %ebp                 # 1087
	movsd	32(%ebp), %xmm1          # 1087
	mulsd	%xmm0, %xmm1             # 1087
	jmp	je_cont.5550               # 1080
je_else.5549:                   # 1080
	movl	$l.4442, %eax             # 1083
	movsd	0(%eax), %xmm1           # 1083
je_cont.5550:                   # 1080
	movl	$min_caml_crashed_point, %ebx	# 1090
	movl	24(%ebp), %eax            # 1090
	movsd	%xmm1, 40(%ebp)          # 1090
	addl	$48, %ebp                 # 1090
	call	utexture.2118             # 1090
	subl	$48, %ebp                 # 1090
	movl	$min_caml_rgb, %eax       # 1091
	movl	$min_caml_texture_color, %ebx	# 1091
	movsd	40(%ebp), %xmm0          # 1091
	addl	$48, %ebp                 # 1091
	call	accumulate_vec_mul.2124   # 1091
	subl	$48, %ebp                 # 1091
	movl	8(%ebp), %eax             # 1093
	cmpl	$4, %eax                  # 1093
	jg	jle_else.5554               # 1093
	movl	$l.4565, %ebx             # 1094
	movsd	0(%ebx), %xmm0           # 1094
	movsd	0(%ebp), %xmm1           # 1094
	comisd	%xmm0, %xmm1            # 1094
	ja	jbe_else.5555               # 1094
	ret                            # 1132
jbe_else.5555:                  # 1094
	movl	$l.4567, %ebx             # 1097
	movsd	0(%ebx), %xmm0           # 1097
	movl	$min_caml_vscan, %ebx     # 1097
	movl	$min_caml_nvector, %ecx   # 1097
	movsd	%xmm0, 48(%ebp)          # 1097
	movl	%ebx, %eax                # 1097
	movl	%ecx, %ebx                # 1097
	addl	$56, %ebp                 # 1097
	call	in_prod.2121              # 1097
	subl	$56, %ebp                 # 1097
	movsd	48(%ebp), %xmm1          # 1097
	mulsd	%xmm1, %xmm0             # 1097
	movl	$min_caml_vscan, %eax     # 1099
	movl	$min_caml_nvector, %ebx   # 1099
	addl	$56, %ebp                 # 1099
	call	accumulate_vec_mul.2124   # 1099
	subl	$56, %ebp                 # 1099
	movl	24(%ebp), %eax            # 1101
	addl	$56, %ebp                 # 1101
	call	o_reflectiontype.1988     # 1101
	subl	$56, %ebp                 # 1101
	cmpl	$1, %eax                  # 1102
	jne	je_else.5557               # 1102
	movl	$l.4442, %eax             # 1105
	movsd	0(%eax), %xmm0           # 1105
	movl	24(%ebp), %eax            # 1105
	movsd	%xmm0, 56(%ebp)          # 1105
	addl	$64, %ebp                 # 1105
	call	o_hilight.2008            # 1105
	subl	$64, %ebp                 # 1105
	movsd	56(%ebp), %xmm1          # 1105
	comisd	%xmm0, %xmm1            # 1105
	jne	je_else.5558               # 1105
	ret                            # 1106
je_else.5558:                   # 1105
	movl	$min_caml_vscan, %eax     # 1108
	movl	$min_caml_light, %ebx     # 1108
	addl	$64, %ebp                 # 1108
	call	in_prod.2121              # 1108
	subl	$64, %ebp                 # 1108
	xorpd	min_caml_fnegd, %xmm0    # 1108
	movl	$l.4442, %eax             # 1109
	movsd	0(%eax), %xmm1           # 1109
	comisd	%xmm1, %xmm0            # 1109
	ja	jbe_else.5560               # 1109
	ret                            # 1119
jbe_else.5560:                  # 1109
	addl	$64, %ebp                 # 1111
	call	fsqr.1980                 # 1111
	subl	$64, %ebp                 # 1111
	addl	$64, %ebp                 # 1111
	call	fsqr.1980                 # 1111
	subl	$64, %ebp                 # 1111
	movsd	0(%ebp), %xmm1           # 1111
	mulsd	%xmm1, %xmm0             # 1111
	movsd	40(%ebp), %xmm1          # 1111
	mulsd	%xmm1, %xmm0             # 1111
	movl	24(%ebp), %eax            # 1111
	movsd	%xmm0, 64(%ebp)          # 1111
	addl	$72, %ebp                 # 1111
	call	o_hilight.2008            # 1111
	subl	$72, %ebp                 # 1111
	movsd	64(%ebp), %xmm1          # 1111
	mulsd	%xmm0, %xmm1             # 1111
	movl	$min_caml_rgb, %eax       # 1115
	movl	$min_caml_rgb, %ebx       # 1115
	movsd	0(%ebx), %xmm0           # 1115
	addsd	%xmm1, %xmm0             # 1115
	movsd	%xmm0, 0(%eax)           # 1115
	movl	$min_caml_rgb, %eax       # 1116
	movl	$min_caml_rgb, %ebx       # 1116
	movsd	8(%ebx), %xmm0           # 1116
	addsd	%xmm1, %xmm0             # 1116
	movsd	%xmm0, 8(%eax)           # 1116
	movl	$min_caml_rgb, %eax       # 1117
	movl	$min_caml_rgb, %ebx       # 1117
	movsd	16(%ebx), %xmm0          # 1117
	addsd	%xmm1, %xmm0             # 1117
	movsd	%xmm0, 16(%eax)          # 1117
	ret                            # 1117
je_else.5557:                   # 1102
	cmpl	$2, %eax                  # 1121
	jne	je_else.5563               # 1121
	movl	$min_caml_viewpoint, %eax # 1124
	movl	$min_caml_crashed_point, %ebx	# 1124
	movsd	0(%ebx), %xmm0           # 1124
	movsd	%xmm0, 0(%eax)           # 1124
	movl	$min_caml_viewpoint, %eax # 1125
	movl	$min_caml_crashed_point, %ebx	# 1125
	movsd	8(%ebx), %xmm0           # 1125
	movsd	%xmm0, 8(%eax)           # 1125
	movl	$min_caml_viewpoint, %eax # 1126
	movl	$min_caml_crashed_point, %ebx	# 1126
	movsd	16(%ebx), %xmm0          # 1126
	movsd	%xmm0, 16(%eax)          # 1126
	movl	$l.4444, %eax             # 1127
	movsd	0(%eax), %xmm0           # 1127
	movl	24(%ebp), %eax            # 1127
	movsd	%xmm0, 72(%ebp)          # 1127
	addl	$80, %ebp                 # 1127
	call	o_diffuse.2006            # 1127
	subl	$80, %ebp                 # 1127
	movsd	72(%ebp), %xmm1          # 1127
	subsd	%xmm0, %xmm1             # 1127
	movsd	0(%ebp), %xmm0           # 1127
	mulsd	%xmm1, %xmm0             # 1127
	movl	8(%ebp), %eax             # 1128
	addl	$1, %eax                  # 1128
	jmp	raytracing.2128            # 1128
je_else.5563:                   # 1121
	ret                            # 1130
jle_else.5554:                  # 1093
	ret                            # 1093
write_rgb.2131:                 # 1141
	movl	$min_caml_rgb, %eax       # 1141
	movsd	0(%eax), %xmm0           # 1141
	call	min_caml_int_of_float     # 1141
	cmpl	$255, %eax                # 1142
	jg	jle_else.5566               # 1142
	jmp	jle_cont.5567              # 1142
jle_else.5566:                  # 1142
	movl	$255, %eax                # 1142
jle_cont.5567:                  # 1142
	call	min_caml_print_byte       # 1143
	movl	$min_caml_rgb, %eax       # 1145
	movsd	8(%eax), %xmm0           # 1145
	call	min_caml_int_of_float     # 1145
	cmpl	$255, %eax                # 1146
	jg	jle_else.5568               # 1146
	jmp	jle_cont.5569              # 1146
jle_else.5568:                  # 1146
	movl	$255, %eax                # 1146
jle_cont.5569:                  # 1146
	call	min_caml_print_byte       # 1147
	movl	$min_caml_rgb, %eax       # 1149
	movsd	16(%eax), %xmm0          # 1149
	call	min_caml_int_of_float     # 1149
	cmpl	$255, %eax                # 1150
	jg	jle_else.5570               # 1150
	jmp	jle_cont.5571              # 1150
jle_else.5570:                  # 1150
	movl	$255, %eax                # 1150
jle_cont.5571:                  # 1150
	jmp	min_caml_print_byte        # 1151
write_ppm_header.2133:          # 1158
	movl	$80, %eax                 # 1158
	call	min_caml_print_byte       # 1158
	movl	$54, %eax                 # 1159
	call	min_caml_print_byte       # 1159
	movl	$10, %eax                 # 1160
	call	min_caml_print_byte       # 1160
	movl	$min_caml_size, %eax      # 1161
	movl	0(%eax), %eax             # 1161
	call	min_caml_print_int        # 1161
	movl	$32, %eax                 # 1162
	call	min_caml_print_byte       # 1162
	movl	$min_caml_size, %eax      # 1163
	movl	4(%eax), %eax             # 1163
	call	min_caml_print_int        # 1163
	movl	$10, %eax                 # 1164
	call	min_caml_print_byte       # 1164
	movl	$255, %eax                # 1165
	call	min_caml_print_int        # 1165
	movl	$10, %eax                 # 1166
	jmp	min_caml_print_byte        # 1166
scan_point.2135:                # 1173
	movl	$min_caml_size, %ebx      # 1173
	movl	0(%ebx), %ebx             # 1173
	cmpl	%eax, %ebx                # 1173
	jg	jle_else.5572               # 1173
	ret                            # 1173
jle_else.5572:                  # 1173
	movl	%eax, 0(%ebp)             # 1176
	addl	$8, %ebp                  # 1176
	call	min_caml_float_of_int     # 1176
	subl	$8, %ebp                  # 1176
	movl	$min_caml_scan_offset, %eax	# 1176
	movsd	0(%eax), %xmm1           # 1176
	subsd	%xmm1, %xmm0             # 1176
	movl	$min_caml_scan_d, %eax    # 1176
	movsd	0(%eax), %xmm1           # 1176
	mulsd	%xmm1, %xmm0             # 1176
	movl	$min_caml_vscan, %eax     # 1178
	movl	$min_caml_cos_v, %ebx     # 1178
	movsd	8(%ebx), %xmm1           # 1178
	mulsd	%xmm0, %xmm1             # 1178
	movl	$min_caml_wscan, %ebx     # 1178
	movsd	0(%ebx), %xmm2           # 1178
	addsd	%xmm2, %xmm1             # 1178
	movsd	%xmm1, 0(%eax)           # 1178
	movl	$min_caml_vscan, %eax     # 1179
	movl	$min_caml_scan_sscany, %ebx	# 1179
	movsd	0(%ebx), %xmm1           # 1179
	movl	$min_caml_cos_v, %ebx     # 1179
	movsd	0(%ebx), %xmm2           # 1179
	mulsd	%xmm2, %xmm1             # 1179
	movl	$min_caml_vp, %ebx        # 1179
	movsd	8(%ebx), %xmm2           # 1179
	subsd	%xmm2, %xmm1             # 1179
	movsd	%xmm1, 8(%eax)           # 1179
	movl	$min_caml_vscan, %eax     # 1180
	movsd	%xmm0, %xmm1             # 1180
	xorpd	min_caml_fnegd, %xmm1    # 1180
	movl	$min_caml_sin_v, %ebx     # 1180
	movsd	8(%ebx), %xmm2           # 1180
	mulsd	%xmm2, %xmm1             # 1180
	movl	$min_caml_wscan, %ebx     # 1180
	movsd	16(%ebx), %xmm2          # 1180
	addsd	%xmm2, %xmm1             # 1180
	movsd	%xmm1, 16(%eax)          # 1180
	addl	$8, %ebp                  # 1183
	call	fsqr.1980                 # 1183
	subl	$8, %ebp                  # 1183
	movl	$min_caml_scan_met1, %eax # 1183
	movsd	0(%eax), %xmm1           # 1183
	addsd	%xmm1, %xmm0             # 1183
	addl	$8, %ebp                  # 1183
	call	min_caml_sqrt             # 1183
	subl	$8, %ebp                  # 1183
	movl	$min_caml_vscan, %eax     # 1184
	movl	$min_caml_vscan, %ebx     # 1184
	movsd	0(%ebx), %xmm1           # 1184
	divsd	%xmm0, %xmm1             # 1184
	movsd	%xmm1, 0(%eax)           # 1184
	movl	$min_caml_vscan, %eax     # 1185
	movl	$min_caml_vscan, %ebx     # 1185
	movsd	8(%ebx), %xmm1           # 1185
	divsd	%xmm0, %xmm1             # 1185
	movsd	%xmm1, 8(%eax)           # 1185
	movl	$min_caml_vscan, %eax     # 1186
	movl	$min_caml_vscan, %ebx     # 1186
	movsd	16(%ebx), %xmm1          # 1186
	divsd	%xmm0, %xmm1             # 1186
	movsd	%xmm1, 16(%eax)          # 1186
	movl	$min_caml_viewpoint, %eax # 1188
	movl	$min_caml_view, %ebx      # 1188
	movsd	0(%ebx), %xmm0           # 1188
	movsd	%xmm0, 0(%eax)           # 1188
	movl	$min_caml_viewpoint, %eax # 1189
	movl	$min_caml_view, %ebx      # 1189
	movsd	8(%ebx), %xmm0           # 1189
	movsd	%xmm0, 8(%eax)           # 1189
	movl	$min_caml_viewpoint, %eax # 1190
	movl	$min_caml_view, %ebx      # 1190
	movsd	16(%ebx), %xmm0          # 1190
	movsd	%xmm0, 16(%eax)          # 1190
	movl	$min_caml_rgb, %eax       # 1193
	movl	$l.4442, %ebx             # 1193
	movsd	0(%ebx), %xmm0           # 1193
	movsd	%xmm0, 0(%eax)           # 1193
	movl	$min_caml_rgb, %eax       # 1194
	movl	$l.4442, %ebx             # 1194
	movsd	0(%ebx), %xmm0           # 1194
	movsd	%xmm0, 8(%eax)           # 1194
	movl	$min_caml_rgb, %eax       # 1195
	movl	$l.4442, %ebx             # 1195
	movsd	0(%ebx), %xmm0           # 1195
	movsd	%xmm0, 16(%eax)          # 1195
	movl	$0, %eax                  # 1198
	movl	$l.4444, %ebx             # 1198
	movsd	0(%ebx), %xmm0           # 1198
	addl	$8, %ebp                  # 1198
	call	raytracing.2128           # 1198
	subl	$8, %ebp                  # 1198
	addl	$8, %ebp                  # 1201
	call	write_rgb.2131            # 1201
	subl	$8, %ebp                  # 1201
	movl	0(%ebp), %eax             # 1204
	addl	$1, %eax                  # 1204
	jmp	scan_point.2135            # 1204
scan_line.2137:                 # 1211
	movl	$min_caml_size, %ebx      # 1211
	movl	0(%ebx), %ebx             # 1211
	cmpl	%eax, %ebx                # 1211
	jg	jle_else.5574               # 1211
	ret                            # 1233
jle_else.5574:                  # 1211
	movl	$min_caml_scan_sscany, %ebx	# 1220
	movl	$min_caml_scan_offset, %ecx	# 1220
	movsd	0(%ecx), %xmm0           # 1220
	movl	$l.4444, %ecx             # 1220
	movsd	0(%ecx), %xmm1           # 1220
	subsd	%xmm1, %xmm0             # 1220
	movl	%eax, 0(%ebp)             # 1220
	movl	%ebx, 4(%ebp)             # 1220
	movsd	%xmm0, 8(%ebp)           # 1220
	addl	$16, %ebp                 # 1220
	call	min_caml_float_of_int     # 1220
	subl	$16, %ebp                 # 1220
	movsd	8(%ebp), %xmm1           # 1220
	subsd	%xmm0, %xmm1             # 1220
	movl	$min_caml_scan_d, %eax    # 1220
	movsd	0(%eax), %xmm0           # 1220
	mulsd	%xmm1, %xmm0             # 1220
	movl	4(%ebp), %eax             # 1220
	movsd	%xmm0, 0(%eax)           # 1220
	movl	$min_caml_scan_met1, %eax # 1224
	movl	$min_caml_scan_sscany, %ebx	# 1224
	movsd	0(%ebx), %xmm0           # 1224
	movl	%eax, 16(%ebp)            # 1224
	addl	$24, %ebp                 # 1224
	call	fsqr.1980                 # 1224
	subl	$24, %ebp                 # 1224
	movl	$l.4577, %eax             # 1224
	movsd	0(%eax), %xmm1           # 1224
	addsd	%xmm1, %xmm0             # 1224
	movl	16(%ebp), %eax            # 1224
	movsd	%xmm0, 0(%eax)           # 1224
	movl	$min_caml_scan_sscany, %eax	# 1226
	movsd	0(%eax), %xmm0           # 1226
	movl	$min_caml_sin_v, %eax     # 1226
	movsd	0(%eax), %xmm1           # 1226
	mulsd	%xmm1, %xmm0             # 1226
	movl	$min_caml_wscan, %eax     # 1227
	movl	$min_caml_sin_v, %ebx     # 1227
	movsd	8(%ebx), %xmm1           # 1227
	mulsd	%xmm0, %xmm1             # 1227
	movl	$min_caml_vp, %ebx        # 1227
	movsd	0(%ebx), %xmm2           # 1227
	subsd	%xmm2, %xmm1             # 1227
	movsd	%xmm1, 0(%eax)           # 1227
	movl	$min_caml_wscan, %eax     # 1228
	movl	$min_caml_cos_v, %ebx     # 1228
	movsd	8(%ebx), %xmm1           # 1228
	mulsd	%xmm1, %xmm0             # 1228
	movl	$min_caml_vp, %ebx        # 1228
	movsd	16(%ebx), %xmm1          # 1228
	subsd	%xmm1, %xmm0             # 1228
	movsd	%xmm0, 16(%eax)          # 1228
	movl	$0, %eax                  # 1229
	addl	$24, %ebp                 # 1229
	call	scan_point.2135           # 1229
	subl	$24, %ebp                 # 1229
	movl	0(%ebp), %eax             # 1230
	addl	$1, %eax                  # 1230
	jmp	scan_line.2137             # 1230
scan_start.2139:                # 1240
	call	write_ppm_header.2133     # 1240
	movl	$min_caml_size, %eax      # 1241
	movl	0(%eax), %eax             # 1241
	call	min_caml_float_of_int     # 1241
	movl	$min_caml_scan_d, %eax    # 1242
	movl	$l.4579, %ebx             # 1242
	movsd	0(%ebx), %xmm1           # 1242
	divsd	%xmm0, %xmm1             # 1242
	movsd	%xmm1, 0(%eax)           # 1242
	movl	$min_caml_scan_offset, %eax	# 1243
	movl	$l.4440, %ebx             # 1243
	movsd	0(%ebx), %xmm1           # 1243
	divsd	%xmm1, %xmm0             # 1243
	movsd	%xmm0, 0(%eax)           # 1243
	movl	$0, %eax                  # 1244
	jmp	scan_line.2137             # 1244
rt.2141:                        # 1253
	movl	$min_caml_size, %edx      # 1253
	movl	%eax, 0(%edx)             # 1253
	movl	$min_caml_size, %eax      # 1254
	movl	%ebx, 4(%eax)             # 1254
	movl	$min_caml_dbg, %eax       # 1255
	movl	%ecx, 0(%eax)             # 1255
	call	read_parameter.2043       # 1256
	jmp	scan_start.2139            # 1257
.globl	min_caml_start
min_caml_start:
.globl	_min_caml_start
_min_caml_start: # for cygwin
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	%ebp
	movl	32(%esp),%ebp
	movl	36(%esp),%eax
	movl	%eax,min_caml_hp
	movl	$768, %eax                # 1261
	movl	$768, %ebx                # 1261
	movl	$0, %ecx                  # 1261
	call	rt.2141                   # 1261
	popl	%ebp
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	ret
