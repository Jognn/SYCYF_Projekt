module fft
#(
    parameter S = 0,
	 parameter E = 4096
)
(
   input clk, reset,
	input  [15:0] sw,
	output [15:0] ledr
);


    cpu u0 (
        .clk_clk                             (clk),                         //                          clk.clk
        .reset_reset_n                       (reset),                       //                        reset.reset_n
        .pio_sw_external_connection_export   (sw),                          //   pio_sw_external_connection.export
        .pio_ledr_external_connection_export (ledr),                        // pio_ledr_external_connection.export
        .fft_ii_sw_source_valid              (<connected-to-fft_ii_sw_source_valid>),              //             fft_ii_sw_source.valid
        .fft_ii_sw_source_ready              (<connected-to-fft_ii_sw_source_ready>),              //                             .ready
        .fft_ii_sw_source_error              (<connected-to-fft_ii_sw_source_error>),              //                             .error
        .fft_ii_sw_source_startofpacket      (<connected-to-fft_ii_sw_source_startofpacket>),      //                             .startofpacket
        .fft_ii_sw_source_endofpacket        (<connected-to-fft_ii_sw_source_endofpacket>),        //                             .endofpacket
        .fft_ii_sw_source_data               (<connected-to-fft_ii_sw_source_data>),               //                             .data
        .fft_ii_ledr_sink_valid              (<connected-to-fft_ii_ledr_sink_valid>),              //             fft_ii_ledr_sink.valid
        .fft_ii_ledr_sink_ready              (<connected-to-fft_ii_ledr_sink_ready>),              //                             .ready
        .fft_ii_ledr_sink_error              (<connected-to-fft_ii_ledr_sink_error>),              //                             .error
        .fft_ii_ledr_sink_startofpacket      (<connected-to-fft_ii_ledr_sink_startofpacket>),      //                             .startofpacket
        .fft_ii_ledr_sink_endofpacket        (<connected-to-fft_ii_ledr_sink_endofpacket>),        //                             .endofpacket
        .fft_ii_ledr_sink_data               (<connected-to-fft_ii_ledr_sink_data>)                //                             .data
    );



endmodule