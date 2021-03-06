# Lab Assignment

## Assignment 1
 
 | **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
 | :-: | :-: | :-: | :-: | :-: | :-: |
 | 0 | 0 0 | 0 0 | 0 | 1 | 0 |
 | 1 | 0 0 | 0 1 | 0 | 0 | 1 |
 | 2 | 0 0 | 1 0 | 0 | 0 | 1 |
 | 3 | 0 0 | 1 1 | 0 | 0 | 1 |
 | 4 | 0 1 | 0 0 | 1 | 0 | 0 |
 | 5 | 0 1 | 0 1 | 0 | 1 | 0 |
 | 6 | 0 1 | 1 0 | 0 | 0 | 1 |
 | 7 | 0 1 | 1 1 | 0 | 0 | 1 |
 | 8 | 1 0 | 0 0 | 1 | 0 | 0 |
 | 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

equals_SoP = m0 + m5 + m10 +m15 = (/B1 * /B0 * /A1 * /A0) + (/B1 * B0 * /A1 * A0) + (B1 * /B0 * A1 * /A0) + (B1 * B0 * A1 * A0)

less_PoS = M0 * M4 * M5 * M8 * M9 * M10 * M12 * M13 * M14 * M15 = (B1 + B0 + A1 + A0) * (B1 + /B0 + A1 + A0) * (B1 + /B0 + A1 + /A0) * (/B1 + B0 + A1 + A0) * (/B1 + B0 + A1 + /A0) * (/B1 + B0 + /A1 + A0) * (/B1 + /B0 + A1 + A0) * (/B1 + /B0 + A1 + /A0) * (/B1 + /B0 + /A1 + A0) * (/B1 + /B0 + /A1 + /A0)

## Assignment 2

### 1)
The K-map for the "equals" function is as follows:

![equals](Images/equals.png)

The K-map for the "less" function is as follows:

![less](Images/less.png)

The K-map for the "greater" function is as follows:

![greater](Images/greater.png)

### 2)

greater_SoP_min = (B1 * /A1) + (B0 * /A1 * /A0) + (B1 * B0 * /A0)

less_PoS_min = (A1 + A0) * (/B1 + /B0) * (/B1 + A1) * (/B0 + A0) * (/B1 + A0)

### 3)

Link to EDA Playground: (https://www.edaplayground.com/x/cP9j)

## Assignment 3

### 1) ```design.vhd```

```VHDL
------------------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------------------
entity comparator_4bit is
    port(
        a_i           : in  std_logic_vector(4 - 1 downto 0);
	b_i           : in  std_logic_vector(4 - 1 downto 0);
	B_greater_A_o : out std_logic;
        B_equals_A_o  : out std_logic;
        B_less_A_o    : out std_logic       -- B is less than A
    );
end entity comparator_4bit;

------------------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of comparator_4bit is
begin
    B_greater_A_o <= '1' when (b_i > a_i) else '0';
    B_less_A_o <= '1' when (b_i < a_i) else '0';
    B_equals_A_o <= '1' when (b_i = a_i) else '0';

end architecture Behavioral;
```
### 2) ```testbench.vhd```

```VHDL
entity tb_comparator_4bit is
    -- Entity of testbench is always empty
end entity tb_comparator_4bit;

architecture testbench of tb_comparator_4bit is

    -- Local signals
    signal s_a       : std_logic_vector(4 - 1 downto 0);
    signal s_b       : std_logic_vector(4 - 1 downto 0);
    signal s_B_greater_A : std_logic;
    signal s_B_less_A    : std_logic;
    signal s_B_equals_A  : std_logic;

begin
    -- Connecting testbench signals with comparator_4bit entity (Unit Under Test)
    uut_comparator_4bit : entity work.comparator_4bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_less_A_o    => s_B_less_A,
            B_equals_A_o  => s_B_equals_A
            
        );
  
  
    p_stimulus : process
    begin


        report "Stimulus process started" severity note;
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '1') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0000, 0000" severity error;

        s_b <= "0010"; s_a <= "0001"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 0010, 0001" severity error;

        s_b <= "0110"; s_a <= "0110"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        report "Test failed for input combination: 0110, 0110" severity error;

        s_b <= "0001"; s_a <= "0010"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0001, 0010" severity error;

        s_b <= "1100"; s_a <= "0110"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 1100, 0110" severity error;

        s_b <= "1001"; s_a <= "0101"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 1001, 0101" severity error;

        s_b <= "0101"; s_a <= "0011"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 0101, 0011" severity error;

        s_b <= "1111"; s_a <= "0111"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 1111, 0111" severity error;

        s_b <= "0100"; s_a <= "1010"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0100, 1010" severity error;

        s_b <= "0001"; s_a <= "1001"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0001, 1001" severity error;

        s_b <= "1000"; s_a <= "1010"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 1000, 1010" severity error;

        s_b <= "0011"; s_a <= "1011"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0000, 1011" severity error;

        s_b <= "0110"; s_a <= "1100"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0110, 1100" severity error;

        s_b <= "1100"; s_a <= "1111"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 1100, 1111" severity error;

        s_b <= "1010"; s_a <= "1110"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 1010, 1110" severity error;

        s_b <= "1011"; s_a <= "1111"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 1011, 1111" severity error;


        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end architecture testbench;
```
### 3) simulator console output

```VHDL
[2021-02-21 13:19:27 EST] ghdl -i design.vhd testbench.vhd  && ghdl -m  tb_comparator_4bit && ghdl -r  tb_comparator_4bit   --vcd=dump.vcd && sed -i 's/^U/X/g; s/^-/X/g; s/^H/1/g; s/^L/0/g' dump.vcd 
analyze design.vhd
analyze testbench.vhd
elaborate tb_comparator_4bit
testbench.vhd:35:9:@0ms:(report note): Stimulus process started
testbench.vhd:37:9:@100ns:(assertion error): Test failed for input combination: 0000, 0000
testbench.vhd:101:9:@1600ns:(report note): Stimulus process finished
Finding VCD file...
./dump.vcd
[2021-02-21 13:19:29 EST] Opening EPWave...
Done
```
### 4)

Link to EDA Playground: (https://www.edaplayground.com/x/jbgd)



