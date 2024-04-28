function [bit] = get_ith_bit(value, ith)
    %
    bit_num = 8;
    bit = 0;
    while bit_num > ith-1
        corresp_power = 2^(bit_num-1);
        diff = value - corresp_power;
        if diff >= 0
            if bit_num == ith
                bit = 1;
            end
            value = value - corresp_power;
        end
        bit_num = bit_num - 1;
    end
end