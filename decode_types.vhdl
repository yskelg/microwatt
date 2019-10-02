library ieee;
use ieee.std_logic_1164.all;

package decode_types is
	type insn_type_t is (OP_ILLEGAL, OP_NOP, OP_ADD, OP_ADDE, OP_ADDEX, OP_ADDME,
		OP_ADDPCIS, OP_AND, OP_ANDC, OP_ATTN, OP_B, OP_BC, OP_BCREG,
		OP_BPERM, OP_CMP, OP_CMPB, OP_CMPEQB, OP_CMPL, OP_CMPRB,
		OP_CNTLZD, OP_CNTLZW, OP_CNTTZD, OP_CNTTZW, OP_CRAND,
		OP_CRANDC, OP_CREQV, OP_CRNAND, OP_CRNOR, OP_CROR, OP_CRORC,
		OP_CRXOR, OP_DARN, OP_DCBF, OP_DCBST, OP_DCBT, OP_DCBTST,
		OP_DCBZ, OP_DIV, OP_EQV, OP_EXTSB, OP_EXTSH,
		OP_EXTSW, OP_EXTSWSLI, OP_ICBI, OP_ICBT, OP_ISEL, OP_ISYNC,
		OP_LOAD, OP_STORE, OP_MADDHD, OP_MADDHDU, OP_MADDLD, OP_MCRF,
		OP_MCRXR, OP_MCRXRX, OP_MFCR, OP_MFSPR, OP_MOD,
		OP_MTCRF, OP_MTSPR, OP_MUL_L64,
		OP_MUL_H64, OP_MUL_H32, OP_NAND, OP_NEG, OP_NOR, OP_OR,
		OP_ORC, OP_POPCNTB, OP_POPCNTD, OP_POPCNTW, OP_PRTYD,
		OP_PRTYW, OP_RLDCX, OP_RLDIC, OP_RLDICL, OP_RLDICR,
		OP_RLDIMI, OP_RLWIMI, OP_RLWINM, OP_RLWNM, OP_SETB, OP_SLD,
		OP_SLW, OP_SRAD, OP_SRADI, OP_SRAW, OP_SRAWI, OP_SRD, OP_SRW,
		OP_SUBF, OP_SUBFE, OP_SUBFME, OP_SYNC, OP_TD, OP_TDI, OP_TW,
		OP_TWI, OP_XOR, OP_SIM_CONFIG);

	type input_reg_a_t is (NONE, RA, RA_OR_ZERO, RS);
	type input_reg_b_t is (NONE, RB, RS, CONST_UI, CONST_SI, CONST_SI_HI, CONST_UI_HI, CONST_LI, CONST_BD, CONST_DS);
	type input_reg_c_t is (NONE, RS);
	type output_reg_a_t is (NONE, RT, RA);
	type rc_t is (NONE, ONE, RC);

	constant SH_OFFSET : integer := 0;
	constant MB_OFFSET : integer := 1;
	constant ME_OFFSET : integer := 1;
	constant SH32_OFFSET : integer := 0;
	constant MB32_OFFSET : integer := 1;
	constant ME32_OFFSET : integer := 2;

	constant FXM_OFFSET : integer := 0;

	constant BO_OFFSET : integer := 0;
	constant BI_OFFSET : integer := 1;
	constant BH_OFFSET : integer := 2;

	constant BF_OFFSET : integer := 0;
	constant L_OFFSET  : integer := 1;

	constant TOO_OFFSET : integer := 0;

	type unit_t is (NONE, ALU, LDST, MUL, DIV);
	type length_t is (NONE, is1B, is2B, is4B, is8B);

	type decode_rom_t is record
		unit         : unit_t;
		insn_type    : insn_type_t;
		input_reg_a  : input_reg_a_t;
		input_reg_b  : input_reg_b_t;
		input_reg_c  : input_reg_c_t;
		output_reg_a : output_reg_a_t;

		input_cr     : std_ulogic;
		output_cr    : std_ulogic;

		input_carry  : std_ulogic;
		output_carry : std_ulogic;

		-- load/store signals
		length       : length_t;
		byte_reverse : std_ulogic;
		sign_extend  : std_ulogic;
		update       : std_ulogic;
		reserve      : std_ulogic;

		-- multiplier signals
		mul_32bit     : std_ulogic;
		mul_signed    : std_ulogic;

		rc           : rc_t;
		lr           : std_ulogic;

		sgl_pipe     : std_ulogic;
	end record;
	constant decode_rom_init : decode_rom_t := (unit => NONE,
		insn_type => OP_ILLEGAL, input_reg_a => NONE,
		input_reg_b => NONE, input_reg_c => NONE,
		output_reg_a => NONE, input_cr => '0', output_cr => '0',
		input_carry => '0', output_carry => '0',
		length => NONE, byte_reverse => '0', sign_extend => '0',
		update => '0', reserve => '0', mul_32bit => '0',
		mul_signed => '0', rc => NONE, lr => '0', sgl_pipe => '0');

end decode_types;

package body decode_types is
end decode_types;
