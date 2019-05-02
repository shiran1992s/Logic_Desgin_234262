/**
*
*	made by Tsuf Cohen and Shiran Saada - Wednesday, 16 January 2019
*
**/

	forwarding_unit forwarding_unit (
/**
*	the inputs of the unit
**/
		.op_code_EXE(op_code_EXE),
		.rs_EXE(rs_EXE), 
		.rt_EXE(rt_EXE),
		.reg_write_MEM(reg_write_MEM),
		.reg_write_WB(reg_write_WB),
		.dest_MEM(dest_MEM), 
		.dest_WB(dest_WB),
/**
*	the outputs of the unit
**/
		.sel_alu1(sel_alu1),
		.sel_alu2(sel_alu2),
		.sel_store_val(sel_store_val)

	);

/**
*
*	made by Tsuf Cohen and Shiran Saada - Wednesday, 16 January 2019
*
**/