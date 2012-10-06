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
static const char *ng0 = "E:/All Other Files/Hardware/Research Project/CPU_IMPLEMENTATION/CPU/ADD_ctl.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );
char *ieee_p_3620187407_sub_436351764_3965413181(char *, char *, char *, char *, int );


static void work_a_3498887350_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(59, ng0);

LAB3:    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 2288);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 2236);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3498887350_3212880686_p_1(char *t0)
{
    char t26[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 2360);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 2244);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 776U);
    t5 = *((char **)t1);
    t1 = (t0 + 4551);
    t7 = xsi_mem_cmp(t1, t5, 3U);
    if (t7 == 1)
        goto LAB6;

LAB12:    t8 = (t0 + 4554);
    t10 = xsi_mem_cmp(t8, t5, 3U);
    if (t10 == 1)
        goto LAB7;

LAB13:    t11 = (t0 + 4557);
    t13 = xsi_mem_cmp(t11, t5, 3U);
    if (t13 == 1)
        goto LAB8;

LAB14:    t14 = (t0 + 4560);
    t16 = xsi_mem_cmp(t14, t5, 3U);
    if (t16 == 1)
        goto LAB9;

LAB15:    t17 = (t0 + 4563);
    t19 = xsi_mem_cmp(t17, t5, 3U);
    if (t19 == 1)
        goto LAB10;

LAB16:
LAB11:    xsi_set_current_line(73, ng0);

LAB5:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2360);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB6:    xsi_set_current_line(68, ng0);
    t20 = (t0 + 592U);
    t21 = *((char **)t20);
    t20 = (t0 + 2324);
    t22 = (t20 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 40U);
    t25 = *((char **)t24);
    memcpy(t25, t21, 8U);
    xsi_driver_first_trans_delta(t20, 8U, 8U, 0LL);
    goto LAB5;

LAB7:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2324);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 8U);
    xsi_driver_first_trans_delta(t1, 0U, 8U, 0LL);
    goto LAB5;

LAB8:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 4464U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t26, t2, t1, 1);
    t6 = (t0 + 2324);
    t8 = (t6 + 32U);
    t9 = *((char **)t8);
    t11 = (t9 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB5;

LAB9:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 4464U);
    t5 = ieee_p_3620187407_sub_436351764_3965413181(IEEE_P_3620187407, t26, t2, t1, 1);
    t6 = (t0 + 2324);
    t8 = (t6 + 32U);
    t9 = *((char **)t8);
    t11 = (t9 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB5;

LAB10:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 2324);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB17:;
}


extern void work_a_3498887350_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3498887350_3212880686_p_0,(void *)work_a_3498887350_3212880686_p_1};
	xsi_register_didat("work_a_3498887350_3212880686", "isim/CU_isim_beh.exe.sim/work/a_3498887350_3212880686.didat");
	xsi_register_executes(pe);
}
