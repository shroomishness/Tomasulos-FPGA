/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_0097912753_0464399812_init();
    work_a_4022982590_1655354400_init();
    work_a_3576486456_0341724124_init();
    work_a_3765808442_3851825451_init();
    work_a_0421965820_0602738166_init();
    work_a_0290648082_2693161217_init();
    work_a_3699058664_2337485674_init();
    work_a_0832606739_3212880686_init();
    work_a_2274648968_3363810493_init();
    work_a_2731871368_0632001823_init();
    work_a_2023191012_3212880686_init();
    work_a_0997120309_3708392848_init();
    work_a_3498887350_3212880686_init();
    work_a_0641563594_3212880686_init();
    work_a_1710397419_3878460488_init();
    work_a_0472177031_2372691052_init();


    xsi_register_tops("work_a_0472177031_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}
