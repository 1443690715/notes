[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>


��ǰ����һ��ɵ������ʹ��

```Verilog
always @ (posedge signal)
```

�����Ĵ���ȥ���signal�������أ��ֳ��˺ܶ����⡣

����ʵ���ҵ�һͬѧָ�̺���Ҳ����ɵ�������������ˡ���Ȼ���㿴������Ҳ�����������ˡ�

��������ص�ԭ��ʹ�ø�Ƶ��ʱ�Ӷ��źŽ��в��������Ҫʵ�������ؼ�⣬ʱ��Ƶ������Ҫ���ź����Ƶ�ʵ�2�����ϣ�����Ϳ��ܳ���©��⡣������μ�������롣

```Verilog
module edge_check(clk, rst_n, signal, pos_edge, neg_edge, both_edge);

input clk;
input rst_n;
input signal;
output pos_edge;
output neg_edge;
output both_edge;


reg sig_r0, sig_r1;  // ״̬�Ĵ���
always @ (posedge clk or negedge rst_n)
	if (!rst_n) begin 
		sig_r0 <= 1'b0;
		sig_r1 <= 1'b0;
	end else begin 
		sig_r0 <= signal;
		sig_r1 <= sig_r0;
	end 

assign pos_edge = (~sig_r1) & (sig_r0);
assign neg_edge = sig_r1 & (~sig_r0);	
assign both_edge = sig_r1 ^ sig_r0;  // ˫���ؼ�⣬��pos_edge|neg_edge
	
endmodule 
```

ʹ��Quartus II�ۺϲ���֮���RTL��ͼ���£�

![check_regs]

��RTL��ͼ�п��Կ�������·��ͨ��һ���첽��λ��D������ʵ�ֵġ�

ModelSim�ķ�����ͼ���£����пɿ����Ѽ����������½��أ�������һ����ʱ��������Ϊʹ����ʱ��ͬ���ļ�⡣

![modelsim1]

���������Verilog���뻹���Ի�һ��д����Ч���ϲ��̫�ࣻ

```Verilog
module edge_check(clk, rst_n, signal, pos_edge, neg_edge, both_edge);

input clk;
input rst_n;
input signal;
output pos_edge;
output neg_edge;
output both_edge;

reg [1:0]sig_fifo;
always @ (posedge clk or negedge rst_n)
	if (!rst_n) begin 
		sig_fifo <= 2'b0;
	end else begin 
		sig_fifo <= {sig_fifo[0], signal};
	end 

assign pos_edge = (sig_fifo == 2'b01);
assign neg_edge = (sig_fifo == 2'b10);	
assign both_edge = sig_fifo[0] ^ sig_fifo[1];  // ˫���ؼ�⣬��pos_edge|neg_edge
	
endmodule 
```

���ɵ�RTL��ͼΪ

![check_fifo]



[check_regs]:../images/FPGA�ı��ؼ��/check_regs.png
[check_fifo]:../images/FPGA�ı��ؼ��/check_fifo.png
[modelsim1]:../images/FPGA�ı��ؼ��/modelsim1.png