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
static const char *ng0 = "E:/All Other Files/Hardware/Research Project/CPU_IMPLEMENTATION/CPU/PC_ctl.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2731871368_0632001823_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(56, ng0);

LAB3:    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 2196);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 2144);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2731871368_0632001823_p_1(char *t0)
{
    char t14[16];
    char t20[16];
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
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t21;
    char *t22;
    int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 2268);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 2152);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 776U);
    t5 = *((char **)t1);
    t1 = (t0 + 4340);
    t7 = xsi_mem_cmp(t1, t5, 2U);
    if (t7 == 1)
        goto LAB6;

LAB10:    t8 = (t0 + 4342);
    t10 = xsi_mem_cmp(t8, t5, 2U);
    if (t10 == 1)
        goto LAB7;

LAB11:    t11 = (t0 + 4344);
    t13 = xsi_mem_cmp(t11, t5, 2U);
    if (t13 == 1)
        goto LAB8;

LAB12:
LAB9:    xsi_set_current_line(69, ng0);

LAB5:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2268);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB6:    xsi_set_current_line(65, ng0);
    t15 = (t0 + 592U);
    t16 = *((char **)t15);
    t17 = (15 - 9);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t15 = (t16 + t19);
    t21 = (t20 + 0U);
    t22 = (t21 + 0U);
    *((int *)t22) = 9;
    t22 = (t21 + 4U);
    *((int *)t22) = 2;
    t22 = (t21 + 8U);
    *((int *)t22) = -1;
    t23 = (2 - 9);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t24;
    t22 = (t0 + 960U);
    t25 = *((char **)t22);
    t22 = (t0 + 4248U);
    t26 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t14, t15, t20, t25, t22);
    t27 = (t0 + 2232);
    t28 = (t27 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memcpy(t31, t26, 16U);
    xsi_driver_first_trans_fast(t27);
    goto LAB5;

LAB7:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 4248U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t14, t2, t1, 1);
    t6 = (t0 + 2232);
    t8 = (t6 + 32U);
    t9 = *((char **)t8);
    t11 = (t9 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB5;

LAB8:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2232);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB13:;
}


extern void work_a_2731871368_0632001823_init()
{
	static char *pe[] = {(void *)work_a_2731871368_0632001823_p_0,(void *)work_a_2731871368_0632001823_p_1};
	xsi_register_didat("work_a_2731871368_0632001823", "isim/CU_isim_beh.exe.sim/work/a_2731871368_0632001823.didat");
	xsi_register_executes(pe);
}
