
module cpu (
	clk_clk,
	reset_reset_n,
	pio_sw_external_connection_export,
	pio_ledr_external_connection_export,
	fft_ii_sw_source_valid,
	fft_ii_sw_source_ready,
	fft_ii_sw_source_error,
	fft_ii_sw_source_startofpacket,
	fft_ii_sw_source_endofpacket,
	fft_ii_sw_source_data,
	fft_ii_ledr_sink_valid,
	fft_ii_ledr_sink_ready,
	fft_ii_ledr_sink_error,
	fft_ii_ledr_sink_startofpacket,
	fft_ii_ledr_sink_endofpacket,
	fft_ii_ledr_sink_data);	

	input		clk_clk;
	input		reset_reset_n;
	input	[15:0]	pio_sw_external_connection_export;
	output	[28:0]	pio_ledr_external_connection_export;
	output		fft_ii_sw_source_valid;
	input		fft_ii_sw_source_ready;
	output	[1:0]	fft_ii_sw_source_error;
	output		fft_ii_sw_source_startofpacket;
	output		fft_ii_sw_source_endofpacket;
	output	[70:0]	fft_ii_sw_source_data;
	input		fft_ii_ledr_sink_valid;
	output		fft_ii_ledr_sink_ready;
	input	[1:0]	fft_ii_ledr_sink_error;
	input		fft_ii_ledr_sink_startofpacket;
	input		fft_ii_ledr_sink_endofpacket;
	input	[45:0]	fft_ii_ledr_sink_data;
endmodule
