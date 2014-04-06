[<font size=4>��������Ŀ¼<font>](./README.md)
</br></br></br>

### ����FGPA�ĸ�λ

������ʼѧFPGA��ʱ�������ɻ�FPGA����û�и�λ�ܽ�ô��������always�����и�λ�źš������λ�źţ��������ҳ�Ϊrst_n������������

ʵ�����ǿ��Դ����������õģ��������ǵ�MCUһ����

1. �ϵ��Զ���λ
2. �ֶ�������λ

���ǵ�ϵͳ�ĳ�ʼ��������Ҫһ����ʱ�䣬��Ҫдһ��Verilog���������ʱ��λ����δ����ۺϺ�����ϵ��Զ���λ�Ĺ��̣��ϵ��Զ���λҲҪ�ⲿӲ���ṩһ���͵�ƽ���壬�ڶ��ַ���Ҫ���а�����λ�İ�����·����Ϊһ��������ϵͳ���ϵ��Զ���λ���ֶ��İ�����λ���Ǳ���ģ�������ʵ�����ǲ��ɷָ�ġ�

### �ϵ��Զ���λ

ԭ���Ϻܼ򵥣�дһ����λģ�飬�ȴ�һ���ȶ�ʱ�䣬����λ�ź�����һ���㹻����ʱ�䣬�ٽ���λ�ź����ߡ�

����VerilogԴ�룬�ⲿ������λҲ����Ϊģ���һ���������룬�����첽��ȫ�ָ�λ�����������ĸ�λ����Ҫ���У�����Ҫ���ⲿ��һ�����ݵ�����������rst_n�ź��ϣ������ͨ��������·�е�RC��·ʵ�֡�


```Verilog
/**************************************
*  ���ܣ��ϵ縴λģ��
*  ���������
*         clk�� 50M ʱ������
*         rst_n���ⲿ����ȫ�ָ�λ�ź�
*  ���������
*         sys_rst_n:ϵͳȫ��ͬ����λ�ź�
***************************************/
module    reset
(
    input    clk,
    input    rst_n,
    output   sys_rst_n
);

//------------------------------------------
// Delay 100ms for steady state
reg    [22:0] cnt;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        cnt <= 0;
    else
        begin
        if(cnt < 23'd50_00000) //100ms
            cnt <= cnt+1'b1;
        else
            cnt <= cnt;
        end
end

//------------------------------------------
//rst_n synchronism
reg    rst_nr0;
reg    rst_nr1;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
        rst_nr0 <= 0;
        rst_nr1 <= 0;
        end
    else if(cnt == 23'd50_00000)
        begin
        rst_nr0 <= 1;
        rst_nr1 <= rst_nr0;
        end
    else
        begin
        rst_nr0 <= 0;
        rst_nr1 <= 0;
        end
end

assign    sys_rst_n = rst_nr1;

endmodule
```

### �����ֶ���λ��·

��ʹ��ר��оƬ�Ĳο��͵�ƽ��λ��·���£�

![reset1]

��·�еĸ�λ�ܽ�һ�����ӵ�FPGA��ĳ����ͨͨ�ùܽţ�������·�е�RC��·����������Verilog�����е�rst_n�ϵ�����壬����Ǳ��Ŀ�ͷ˵�Զ��ϵ縴λ��Ӳ��������λ�ศ��ɡ�

��ע�����������ֵ��R21Ҫ��R22���������������ϣ��������ܱ�֤�������º�ʶ��Ϊ�͵�ƽ��

�ֶ���λ������Ϊ��֤������λ���ȶ��ԣ��������޸������Verilog������а���������⡣������ץ���İ����ڱպϵ�ʱ��Ĳ��Σ�

![key_bounce]

�����ڼ���us֮�ھ��ܴﵽ�͵�ƽ�����ڼ䴥�㶶���Ƚ����ء�

``` Verilog
module RMV_BJ (
	BJ_CLK,    //�ɼ�ʱ�ӣ�40Hz
	RESET,     //ϵͳ��λ�ź�
	BUTTON_IN, //���������ź�
	BUTTON_OUT //�����������ź�
);
input B_CLK;
input RESET;
input BUTTON_IN;
output BUTTON_OUT;
reg BUTTON_IN_Q, BUTTON_IN_2Q, BUTTON_IN_3Q;

always @(posedge BJ_CLK or negedge RESET)
begin
	if(~RESET)
	begin
		BUTTON_IN_Q <= 1'b1;
		BUTTON_IN_2Q <= 1'b1;
		BUTTON_IN_3Q <= 1'b1;
	end
	else
	begin
		BUTTON_IN_Q <= BUTTON_IN;
		BUTTON_IN_2Q <= BUTTON_IN_Q;
		BUTTON_IN_3Q <= BUTTON_IN_2Q;
	end
end

wire BUTTON_OUT = BUTTON_IN_2Q | BUTTON_IN_3Q;

endmodule
```

��������򵥵ĸ�λ��·������ʹ��CAT811/TPS3823-33��ר�ŵĸ�λоƬ��������ȥ�������������Ĳ�����










[reset1]:../images/FPGA�ĸ�λ/reset1.png
[key_bounce]:../images/FPGA�ĸ�λ/key_bounce.png
