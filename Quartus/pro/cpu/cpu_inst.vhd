	component cpu is
		port (
			clk_clk                             : in  std_logic                     := 'X';             -- clk
			reset_reset_n                       : in  std_logic                     := 'X';             -- reset_n
			pio_sw_external_connection_export   : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			pio_ledr_external_connection_export : out std_logic_vector(28 downto 0);                    -- export
			fft_ii_sw_source_valid              : out std_logic;                                        -- valid
			fft_ii_sw_source_ready              : in  std_logic                     := 'X';             -- ready
			fft_ii_sw_source_error              : out std_logic_vector(1 downto 0);                     -- error
			fft_ii_sw_source_startofpacket      : out std_logic;                                        -- startofpacket
			fft_ii_sw_source_endofpacket        : out std_logic;                                        -- endofpacket
			fft_ii_sw_source_data               : out std_logic_vector(70 downto 0);                    -- data
			fft_ii_ledr_sink_valid              : in  std_logic                     := 'X';             -- valid
			fft_ii_ledr_sink_ready              : out std_logic;                                        -- ready
			fft_ii_ledr_sink_error              : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- error
			fft_ii_ledr_sink_startofpacket      : in  std_logic                     := 'X';             -- startofpacket
			fft_ii_ledr_sink_endofpacket        : in  std_logic                     := 'X';             -- endofpacket
			fft_ii_ledr_sink_data               : in  std_logic_vector(45 downto 0) := (others => 'X')  -- data
		);
	end component cpu;

	u0 : component cpu
		port map (
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                          clk.clk
			reset_reset_n                       => CONNECTED_TO_reset_reset_n,                       --                        reset.reset_n
			pio_sw_external_connection_export   => CONNECTED_TO_pio_sw_external_connection_export,   --   pio_sw_external_connection.export
			pio_ledr_external_connection_export => CONNECTED_TO_pio_ledr_external_connection_export, -- pio_ledr_external_connection.export
			fft_ii_sw_source_valid              => CONNECTED_TO_fft_ii_sw_source_valid,              --             fft_ii_sw_source.valid
			fft_ii_sw_source_ready              => CONNECTED_TO_fft_ii_sw_source_ready,              --                             .ready
			fft_ii_sw_source_error              => CONNECTED_TO_fft_ii_sw_source_error,              --                             .error
			fft_ii_sw_source_startofpacket      => CONNECTED_TO_fft_ii_sw_source_startofpacket,      --                             .startofpacket
			fft_ii_sw_source_endofpacket        => CONNECTED_TO_fft_ii_sw_source_endofpacket,        --                             .endofpacket
			fft_ii_sw_source_data               => CONNECTED_TO_fft_ii_sw_source_data,               --                             .data
			fft_ii_ledr_sink_valid              => CONNECTED_TO_fft_ii_ledr_sink_valid,              --             fft_ii_ledr_sink.valid
			fft_ii_ledr_sink_ready              => CONNECTED_TO_fft_ii_ledr_sink_ready,              --                             .ready
			fft_ii_ledr_sink_error              => CONNECTED_TO_fft_ii_ledr_sink_error,              --                             .error
			fft_ii_ledr_sink_startofpacket      => CONNECTED_TO_fft_ii_ledr_sink_startofpacket,      --                             .startofpacket
			fft_ii_ledr_sink_endofpacket        => CONNECTED_TO_fft_ii_ledr_sink_endofpacket,        --                             .endofpacket
			fft_ii_ledr_sink_data               => CONNECTED_TO_fft_ii_ledr_sink_data                --                             .data
		);

