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

/* This file is designed for use with ISim build 0xcb73ee62 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//Maxwell/zjf10$/353/CPU/BIT_XOR.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_3765808442_3851825451_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned char t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned char t25;
    unsigned char t26;
    char *t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 948U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 - 1);
    t1 = (t0 + 2892);
    *((int *)t1) = t4;
    t5 = (t0 + 2896);
    *((int *)t5) = 0;
    t6 = t4;
    t7 = 0;

LAB2:    if (t6 >= t7)
        goto LAB3;

LAB5:    t1 = (t0 + 1700);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(36, ng0);
    t8 = (t0 + 592U);
    t9 = *((char **)t8);
    t8 = (t0 + 2892);
    t10 = *((int *)t8);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t8));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t15 = (t9 + t14);
    t16 = *((unsigned char *)t15);
    t17 = (t0 + 684U);
    t18 = *((char **)t17);
    t17 = (t0 + 2892);
    t19 = *((int *)t17);
    t20 = (t19 - 7);
    t21 = (t20 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t17));
    t22 = (1U * t21);
    t23 = (0 + t22);
    t24 = (t18 + t23);
    t25 = *((unsigned char *)t24);
    t26 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t25);
    t27 = (t0 + 2892);
    t28 = *((int *)t27);
    t29 = (t28 - 7);
    t30 = (t29 * -1);
    t31 = (1 * t30);
    t32 = (0U + t31);
    t33 = (t0 + 1744);
    t34 = (t33 + 32U);
    t35 = *((char **)t34);
    t36 = (t35 + 40U);
    t37 = *((char **)t36);
    *((unsigned char *)t37) = t26;
    xsi_driver_first_trans_delta(t33, t32, 1, 0LL);

LAB4:    t1 = (t0 + 2892);
    t6 = *((int *)t1);
    t2 = (t0 + 2896);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB5;

LAB6:    t3 = (t6 + -1);
    t6 = t3;
    t5 = (t0 + 2892);
    *((int *)t5) = t6;
    goto LAB2;

}


extern void work_a_3765808442_3851825451_init()
{
	static char *pe[] = {(void *)work_a_3765808442_3851825451_p_0};
	xsi_register_didat("work_a_3765808442_3851825451", "isim/cutb_isim_beh.exe.sim/work/a_3765808442_3851825451.didat");
	xsi_register_executes(pe);
}
