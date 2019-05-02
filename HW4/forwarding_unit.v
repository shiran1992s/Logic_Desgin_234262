/**
*
*	made by Tsuf Cohen and Shiran Saada - Wednesday, 16 January 2019
*
**/

module forwarding_unit( op_code_EXE,
						rs_EXE,
						rt_EXE,
						reg_write_MEM,
						reg_write_WB,
						dest_MEM,
						dest_WB,
						sel_alu1,
						sel_alu2,
						sel_store_val );
/**
*	the inputs of the unit
**/
	input [5:0] op_code_EXE;
	input [4:0] rs_EXE;
	input [4:0] rt_EXE;
	input reg_write_MEM;
	input reg_write_WB;
	input [4:0] dest_MEM;
	input [4:0] dest_WB;
/**
*	the outputs of the unit
**/
	output reg [1:0] sel_alu1;
	output reg [1:0] sel_alu2;
	output reg [1:0] sel_store_val;
/**
*	make sel signals = 0
**/
	initial begin 
		sel_alu1=0;
		sel_alu2=0;
		sel_store_val=0;
	end
/**
*	here we check if forwarding is need to be done
**/
	always @ ( * ) begin
		if((op_code_EXE==`OP_ADD) || (op_code_EXE==`OP_SUB)) begin
			if(reg_write_MEM && dest_MEM && (dest_MEM==rs_EXE))
				sel_alu1=2'd1;
			else if(reg_write_WB && dest_WB && (dest_WB==rs_EXE))
				sel_alu1=2'd2;
			else
				sel_alu1=2'd0;
	
			if(reg_write_MEM && dest_MEM && (dest_MEM==rt_EXE))
				sel_alu2=2'd1;
			else if(reg_write_WB && dest_WB && (dest_WB==rt_EXE))
				sel_alu2=2'd2;
			else
				sel_alu2=2'd0;
			
			sel_store_val=0;
		end
		
		if((op_code_EXE==`OP_ADDI) || (op_code_EXE==`OP_SUBI)) begin
			if(reg_write_MEM && dest_MEM && (dest_MEM==rs_EXE))
				sel_alu1=2'd1;
			else if(reg_write_WB && dest_WB && (dest_WB==rs_EXE))
				sel_alu1=2'd2;
			else
				sel_alu1=2'd0;
			
			sel_alu2=0;
			sel_store_val=0;
		end
		
		if(op_code_EXE==`OP_SW) begin 
			if(reg_write_MEM && dest_MEM && (dest_MEM==rs_EXE))
				sel_alu1=2'd1;
			else if(reg_write_WB && dest_WB && (dest_WB==rs_EXE))
				sel_alu1=2'd2;
			else
				sel_alu1=2'd0;
			
			sel_alu2=0;
			
			if(reg_write_MEM && dest_MEM && (dest_MEM==rt_EXE))
				sel_store_val=2'd1;
			else if(reg_write_WB && dest_WB && dest_WB == rt_EXE)
				sel_store_val=2'd2;
			else
				sel_store_val=2'd0;
		end 
		
		if(op_code_EXE==`OP_LW) begin 
			if(reg_write_MEM && dest_MEM && (dest_MEM==rs_EXE))
				sel_alu1=2'd1;
			else if(reg_write_WB && dest_WB && (dest_WB==rs_EXE))
				sel_alu1=2'd2;
			else
				sel_alu1=2'd0;
			
			sel_alu2=0;
			sel_store_val=0;
		end
	end	
endmodule

/**
*
*	made by Tsuf Cohen and Shiran Saada - Wednesday, 16 January 2019
*
**/