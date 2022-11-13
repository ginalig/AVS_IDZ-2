.PHONY: run
run: 
    gcc 19.s -o c.out
    ./c.out test_input/input1.txt output.txt

.PHONY: build
build: 
    gcc -O2 -Wall -masm=intel  -fcf-protection=none   -fno-asynchronous-unwind-tables     -fno-jump-tables     -fno-stack-protector     -fno-exceptions     ./19_registers.c     -S -o ./19_Optimized2.s


.PHONY: generate-test
generate-test:
    ./19_1_2.out test_input/input1.txt 19_1_2_test_output/output1.txt
    ./19_1_2.out test_input/input1.txt 19_test_output/output1.txt
    ./19_1_2.out test_input/input1.txt 19_Optimized_test_output/output1.txt
    ./19_1_2.out test_input/input2.txt 19_1_2_test_output/output2.txt
    ./19_1_2.out test_input/input2.txt 19_test_output/output2.txt
    ./19_1_2.out test_input/input2.txt 19_Optimized_test_output/output2.txt
    ./19_1_2.out test_input/input3.txt 19_1_2_test_output/output3.txt
    ./19_1_2.out test_input/input3.txt 19_test_output/output3.txt
    ./19_1_2.out test_input/input3.txt 19_Optimized_test_output/output3.txt
    ./19_1_2.out test_input/input4.txt 19_1_2_test_output/output4.txt
    ./19_1_2.out test_input/input4.txt 19_test_output/output4.txt
    ./19_1_2.out test_input/input4.txt 19_Optimized_test_output/output4.txt
    ./19_1_2.out test_input/input5.txt 19_1_2_test_output/output5.txt
    ./19_1_2.out test_input/input5.txt 19_test_output/output5.txt
    ./19_1_2.out test_input/input5.txt 19_Optimized_test_output/output5.txt
    ./19_1_2.out test_input/input6.txt 19_1_2_test_output/output6.txt
    ./19_1_2.out test_input/input6.txt 19_test_output/output6.txt
    ./19_1_2.out test_input/input6.txt 19_Optimized_test_output/output6.txt
    ./19_1_2.out test_input/input7.txt 19_1_2_test_output/output7.txt
    ./19_1_2.out test_input/input7.txt 19_test_output/output7.txt
    ./19_1_2.out test_input/input7.txt 19_Optimized_test_output/output7.txt
    ./19_1_2.out test_input/input8.txt 19_1_2_test_output/output8.txt
    ./19_1_2.out test_input/input8.txt 19_test_output/output8.txt
    ./19_1_2.out test_input/input8.txt 19_Optimized_test_output/output8.txt
    ./19_1_2.out test_input/input9.txt 19_1_2_test_output/output9.txt
    ./19_1_2.out test_input/input9.txt 19_test_output/output9.txt
    ./19_1_2.out test_input/input9.txt 19_Optimized_test_output/output9.txt
    ./19_1_2.out test_input/input10.txt 19_1_2_test_output/output10.txt
    ./19_1_2.out test_input/input10.txt 19_test_output/output10.txt
    ./19_1_2.out test_input/input10.txt 19_Optimized_test_output/output10.txt