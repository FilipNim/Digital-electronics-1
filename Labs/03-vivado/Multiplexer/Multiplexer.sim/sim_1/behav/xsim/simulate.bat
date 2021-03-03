@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Tue Mar 02 20:26:51 +0100 2021
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_mux_2bit_4to1_behav -key {Behavioral:sim_1:Functional:tb_mux_2bit_4to1} -tclbatch tb_mux_2bit_4to1.tcl -log simulate.log"
call xsim  tb_mux_2bit_4to1_behav -key {Behavioral:sim_1:Functional:tb_mux_2bit_4to1} -tclbatch tb_mux_2bit_4to1.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
