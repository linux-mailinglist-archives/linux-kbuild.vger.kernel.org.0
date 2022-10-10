Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FE35F9F6D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Oct 2022 15:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiJJNcv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Oct 2022 09:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJJNcu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2022 09:32:50 -0400
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3796172858
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 06:32:48 -0700 (PDT)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 29ADWT0j004121
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 22:32:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 29ADWT0j004121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665408750;
        bh=HQH47iCzVps6Fj9U3L/SX7ILx3Fs99Vd9Wi6PZuIRgA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YpC+UCt1GN+RlXEi9IoofVyguh05cNq6vrHELB5xoUHACVG5VDw2Iuv8M94U1aFb0
         DqCe78AvhrwVxQSkY7tpYc1tUdAO2HQGJQaFQaKUKTqK85wGknIWRXLnv5W0NS+y5U
         +R0kYOu59RSN0CbG6TEXUY9aGN6jg+iNwq+7KNORsh2rNbh14mmOdUkbadEkmI/dq9
         wnFp49x80SKnzZHiLdieyiTp0faRzKEZZTyKkKGlOcseXxXoQiN6Oe2qMYMTj83uH4
         MRo8iJa5Im6P8mYc94UvOJaW7grHKkps33V3so+aHJexDwYaP934eXHxGCMN+uds2R
         0lp+JWnRyASvw==
X-Nifty-SrcIP: [209.85.160.47]
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1364357a691so5962863fac.7
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 06:32:29 -0700 (PDT)
X-Gm-Message-State: ACrzQf0B96hie1gJhEohtF/on1BzX2afiJRQjA1DEr0E9zakEm8Q55iV
        6ASbzjeuyWEC4FXhm2BAcw4FS1uoFVxZuSXYPBk=
X-Google-Smtp-Source: AMsMyM4k3pF8PJFc1mJf4JCe2zisOGL6bMxtj08w9IVZ26OYTsAJKmY0S8gSC+W76goc15/KIAvyjbl5ncJ4AwstRTs=
X-Received: by 2002:a05:6870:8a09:b0:132:554d:2f3d with SMTP id
 p9-20020a0568708a0900b00132554d2f3dmr15395772oaq.194.1665408748414; Mon, 10
 Oct 2022 06:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <633f0406.050a0220.9431e.d406@mx.google.com> <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
 <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
 <Y0AOD/EfGEiGevsD@sirena.org.uk> <CAK7LNASR0ufUDmAUdkH1sEtXH9DoG5_==XcNw+KxvpoUg=57bA@mail.gmail.com>
 <Y0P1cBijSd2OfYVD@sirena.org.uk>
In-Reply-To: <Y0P1cBijSd2OfYVD@sirena.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 10 Oct 2022 22:31:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATK10aT20SbGdJGLFebSQb3EnnMQ2pmy=_=gG7dpLB6JA@mail.gmail.com>
Message-ID: <CAK7LNATK10aT20SbGdJGLFebSQb3EnnMQ2pmy=_=gG7dpLB6JA@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
To:     Mark Brown <broonie@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 10, 2022 at 7:35 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Oct 07, 2022 at 11:35:25PM +0900, Masahiro Yamada wrote:
>
> > I suspect "+debug" in "multi_v7_defconfig+debug"
> > because the failure log says "ftrace bug" multiple times.
>
> > Which config options does "+debug" enable?
>
> > Can you share the .config file?
>
> The baseline config and fragment are both in:
>
>    https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defconfig%2Bdebug/gcc-10/config/



Thanks for sharing the .config file.

With it applied, I can reproduce the boot error.

And, I see the same boot error on v6.0-rc7, which my branch is based on.


So, arm is already broken in the mainline, and
my kbuild patches are irrelevant.

Also, please check the bisection logic of kernelci.


I attached the boot log of v6.0-rc7 below.
("Linux version 6.0.0-rc7" in the kernel log)


Thanks.














+ qemu-system-arm -cpu cortex-a15 -machine virt-2.11,gic-version=3 -m
1024 -kernel /home/masahiro/tools/qemu-arm_virt/kernel -initrd
/home/masahiro/tools/qemu-arm_virt/initrd -drive
file=fat:rw:/home/masahiro/tools/qemu-arm_virt/disk-shared,if=none,format=raw,id=drive0
-netdev bridge,id=netdev0,br=virbr0,helper=/usr/lib/qemu/qemu-bridge-helper
-serial stdio -monitor vc:800x600 -device virtio-blk-pci,drive=drive0
-device virtio-net-pci,netdev=netdev0 -append console=ttyAMA0
[    0.000000][    T0] Booting Linux on physical CPU 0x0
[    0.000000][    T0] Linux version 6.0.0-rc7 (masahiro@zoe)
(arm-linux-gnueabi-gcc (GCC) 12.1.0, GNU ld (GNU Binutils) 2.38) #5
SMP Mon Oct 10 22:10:35 JST 2022
[    0.000000][    T0] CPU: ARMv7 Processor [412fc0f1] revision 1
(ARMv7), cr=10c5387d
[    0.000000][    T0] CPU: div instructions available: patching division code
[    0.000000][    T0] CPU: PIPT / VIPT nonaliasing data cache, PIPT
instruction cache
[    0.000000][    T0] OF: fdt: Machine model: linux,dummy-virt
[    0.000000][    T0] Memory policy: Data cache writealloc
[    0.000000][    T0] efi: UEFI not found.
[    0.000000][    T0] cma: Reserved 64 MiB at 0x7c000000
[    0.000000][    T0] Zone ranges:
[    0.000000][    T0]   DMA      [mem 0x0000000040000000-0x000000006fffffff]
[    0.000000][    T0]   Normal   empty
[    0.000000][    T0]   HighMem  [mem 0x0000000070000000-0x000000007fffffff]
[    0.000000][    T0] Movable zone start for each node
[    0.000000][    T0] Early memory node ranges
[    0.000000][    T0]   node   0: [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000][    T0] Initmem setup node 0 [mem
0x0000000040000000-0x000000007fffffff]
[    0.000000][    T0] kasan: Truncating shadow for memory block at
0x40000000-0x80000000 to lowmem region at 0x70000000
[    0.000000][    T0] kasan: Mapping kernel virtual memory block:
c0000000-f0000000 at shadow: b7000000-bd000000
[    0.000000][    T0] kasan: Mapping kernel virtual memory block:
bf000000-c0000000 at shadow: b6e00000-b7000000
[    0.000000][    T0] kasan: Kernel address sanitizer initialized
[    0.000000][    T0] psci: probing for conduit method from DT.
[    0.000000][    T0] psci: PSCIv0.2 detected in firmware.
[    0.000000][    T0] psci: Using standard PSCI v0.2 function IDs
[    0.000000][    T0] psci: Trusted OS migration not required
[    0.000000][    T0] percpu: Embedded 17 pages/cpu s37876 r8192 d23564 u69632
[    0.000000][    T0] Built 1 zonelists, mobility grouping on.  Total
pages: 260608
[    0.000000][    T0] Kernel command line: console=ttyAMA0
[    0.000000][    T0] Dentry cache hash table entries: 131072 (order:
7, 524288 bytes, linear)
[    0.000000][    T0] Inode-cache hash table entries: 65536 (order:
6, 262144 bytes, linear)
[    0.000000][    T0] mem auto-init: stack:all(zero), heap alloc:off,
heap free:off
[    0.000000][    T0] stackdepot hash table entries: 1048576 (order:
10, 4194304 bytes, linear)
[    0.000000][    T0] Memory: 243724K/1048576K available (55296K
kernel code, 11177K rwdata, 18244K rodata, 3072K init, 10742K bss,
739316K reserved, 65536K cma-reserved, 196608K highmem)
[    0.000000][    T0]
**********************************************************
[    0.000000][    T0] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
NOTICE   **
[    0.000000][    T0] **
        **
[    0.000000][    T0] ** This system shows unhashed kernel memory
addresses   **
[    0.000000][    T0] ** via the console, logs, and other interfaces.
This    **
[    0.000000][    T0] ** might reduce the security of your system.
        **
[    0.000000][    T0] **
        **
[    0.000000][    T0] ** If you see this message and you are not
debugging    **
[    0.000000][    T0] ** the kernel, report this immediately to your
system   **
[    0.000000][    T0] ** administrator!
        **
[    0.000000][    T0] **
        **
[    0.000000][    T0] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
NOTICE   **
[    0.000000][    T0]
**********************************************************
[    0.000000][    T0] SLUB: HWalign=64, Order=0-3, MinObjects=0,
CPUs=1, Nodes=1
[    0.000000][    T0] ftrace: allocating 61066 entries in 180 pages
[    0.000000][    T0] ------------[ cut here ]------------
[    0.000000][    T0] WARNING: CPU: 0 PID: 0 at
arch/arm/kernel/insn.c:48 __arm_gen_branch+0x74/0x7c
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc7 #5
[    0.000000][    T0] Hardware name: Generic DT based system
[    0.000000][    T0]  unwind_backtrace from show_stack+0x18/0x1c
[    0.000000][    T0]  show_stack from dump_stack_lvl+0x70/0xb0
[    0.000000][    T0]  dump_stack_lvl from __warn+0x1e0/0x48c
[    0.000000][    T0]  __warn from warn_slowpath_fmt+0xcc/0x134
[    0.000000][    T0]  warn_slowpath_fmt from __arm_gen_branch+0x74/0x7c
[    0.000000][    T0]  __arm_gen_branch from ftrace_make_nop+0x10c/0x240
[    0.000000][    T0]  ftrace_make_nop from ftrace_process_locs+0x4ac/0x8c8
[    0.000000][    T0]  ftrace_process_locs from ftrace_init+0xa8/0x180
[    0.000000][    T0]  ftrace_init from start_kernel+0x178/0x3a8
[    0.000000][    T0]  start_kernel from 0x0
[    0.000000][    T0] irq event stamp: 0
[    0.000000][    T0] hardirqs last  enabled at (0): [<00000000>] 0x0
[    0.000000][    T0] hardirqs last disabled at (0): [<00000000>] 0x0
[    0.000000][    T0] softirqs last  enabled at (0): [<00000000>] 0x0
[    0.000000][    T0] softirqs last disabled at (0): [<00000000>] 0x0
[    0.000000][    T0] ---[ end trace 0000000000000000 ]---
[    0.000000][    T0] ------------[ ftrace bug ]------------
[    0.000000][    T0] ftrace failed to modify
[    0.000000][    T0] [<c232b6c8>] check_cmd_set+0x8/0x244
[    0.000000][    T0]  actual:   1f:7e:0d:eb
[    0.000000][    T0] Initializing ftrace call sites
[    0.000000][    T0] ftrace record flags: 0
[    0.000000][    T0]  (0)
[    0.000000][    T0]  expected tramp: c032b384
[    0.000000][    T0] ------------[ cut here ]------------
[    0.000000][    T0] WARNING: CPU: 0 PID: 0 at
kernel/trace/ftrace.c:2120 ftrace_bug+0x320/0x38c
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Tainted: G        W
         6.0.0-rc7 #5
[    0.000000][    T0] Hardware name: Generic DT based system
[    0.000000][    T0]  unwind_backtrace from show_stack+0x18/0x1c
[    0.000000][    T0]  show_stack from dump_stack_lvl+0x70/0xb0
[    0.000000][    T0]  dump_stack_lvl from __warn+0x1e0/0x48c
[    0.000000][    T0]  __warn from warn_slowpath_fmt+0xcc/0x134
[    0.000000][    T0]  warn_slowpath_fmt from ftrace_bug+0x320/0x38c
[    0.000000][    T0]  ftrace_bug from ftrace_process_locs+0x8c0/0x8c8
[    0.000000][    T0]  ftrace_process_locs from ftrace_init+0xa8/0x180
[    0.000000][    T0]  ftrace_init from start_kernel+0x178/0x3a8
[    0.000000][    T0]  start_kernel from 0x0
[    0.000000][    T0] irq event stamp: 0
[    0.000000][    T0] hardirqs last  enabled at (0): [<00000000>] 0x0
[    0.000000][    T0] hardirqs last disabled at (0): [<00000000>] 0x0
[    0.000000][    T0] softirqs last  enabled at (0): [<00000000>] 0x0
[    0.000000][    T0] softirqs last disabled at (0): [<00000000>] 0x0
[    0.000000][    T0] ---[ end trace 0000000000000000 ]---
[    0.000000][    T0] ftrace: allocated 179 pages with 5 groups
[    0.000000][    T0] trace event string verifier disabled
[    0.000000][    T0] Running RCU self tests
[    0.000000][    T0] rcu: Hierarchical RCU implementation.
[    0.000000][    T0] rcu: RCU event tracing is enabled.
[    0.000000][    T0] rcu: RCU lockdep checking is enabled.
[    0.000000][    T0] rcu: RCU restricting CPUs from NR_CPUS=16 to
nr_cpu_ids=1.
[    0.000000][    T0] rcu: RCU callback double-/use-after-free debug
is enabled.
[    0.000000][    T0] Rude variant of Tasks RCU enabled.
[    0.000000][    T0] rcu: RCU calculated value of
scheduler-enlistment delay is 10 jiffies.
[    0.000000][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=16,
nr_cpu_ids=1
[    0.000000][    T0] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000][    T0] GICv3: 224 SPIs implemented
[    0.000000][    T0] GICv3: 0 Extended SPIs implemented
[    0.000000][    T0] GICv3: GICv3 features: 16 PPIs
[    0.000000][    T0] GICv3: CPU0: found redistributor 0 region 0:0x080a0000
[    0.000000][    T0] rcu: srcu_init: Setting srcu_struct sizes based
on contention.
[    0.000000][    T0] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
[    0.000000][    T0] clocksource: arch_sys_counter: mask:
0x1ffffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314
ns
[    0.000131][    T0] sched_clock: 57 bits at 63MHz, resolution 16ns,
wraps every 4398046511096ns
[    0.000345][    T0] Switching to timer-based delay loop, resolution 16ns
[    0.022661][    T0] Console: colour dummy device 80x30
[    0.023663][    T0] Lock dependency validator: Copyright (c) 2006
Red Hat, Inc., Ingo Molnar
[    0.023698][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.023724][    T0] ... MAX_LOCK_DEPTH:          48
[    0.023744][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    0.023763][    T0] ... CLASSHASH_SIZE:          4096
[    0.023780][    T0] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.023796][    T0] ... MAX_LOCKDEP_CHAINS:      65536
[    0.023812][    T0] ... CHAINHASH_SIZE:          32768
[    0.023828][    T0]  memory used by lock dependency info: 4061 kB
[    0.023846][    T0]  memory used for stack traces: 2112 kB
[    0.023864][    T0]  per task-struct memory footprint: 1536 bytes
[    0.026140][    T0] Calibrating delay loop (skipped), value
calculated using timer frequency.. 125.00 BogoMIPS (lpj=625000)
[    0.026342][    T0] pid_max: default: 32768 minimum: 301
[    0.037995][    T0] Mount-cache hash table entries: 2048 (order: 1,
8192 bytes, linear)
[    0.038163][    T0] Mountpoint-cache hash table entries: 2048
(order: 1, 8192 bytes, linear)
[    0.090792][    T0] CPU: Testing write buffer coherency: ok
[    0.094569][    T0] CPU0: Spectre v2: firmware did not set
auxiliary control register IBE bit, system vulnerable
[    0.094718][    T0] CPU0: Spectre BHB: enabling loop workaround for all CPUs
[    0.118342][    T1] /cpus/cpu@0 missing clock-frequency property
[    0.118989][    T1] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.148451][    T1] cblist_init_generic: Setting adjustable number
of callback queues.
[    0.149021][    T1] cblist_init_generic: Setting shift to 0 and lim to 1.
[    0.152188][    T1] Running RCU-tasks wait API self tests
[    0.153928][    T1] Setting up static identity map for 0x40300000 -
0x403000ac
[    0.159343][   T10] Callback from call_rcu_tasks_rude() invoked.
[    0.161023][    T1] rcu: Hierarchical SRCU implementation.
[    0.161074][    T1] rcu: Max phase no-delay instances is 1000.
[    0.252842][    T1] EFI services will not be available.
[    0.271339][    T1] smp: Bringing up secondary CPUs ...
[    0.271508][    T1] smp: Brought up 1 node, 1 CPU
[    0.271655][    T1] SMP: Total of 1 processors activated (125.00 BogoMIPS).
[    0.271736][    T1] CPU: All CPU(s) started in SVC mode.
[    0.309434][    T1] devtmpfs: initialized
[    0.541181][    T1] VFP support v0.3: implementor 41 architecture 4
part 30 variant f rev 0
[    0.594425][    T1] clocksource: jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.595491][    T1] futex hash table entries: 256 (order: 2, 16384
bytes, linear)
[    0.616188][    T1] pinctrl core: initialized pinctrl subsystem
[    0.714541][    T1] DMI not present or invalid.
[    0.744673][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.784366][    T1] DMA: preallocated 256 KiB pool for atomic
coherent allocations
[    0.898919][    T1] thermal_sys: Registered thermal governor 'step_wise'
[    0.900853][    T1] cpuidle: using governor menu
[    0.909869][    T1] No ATAGs?
[    0.911758][   T15] hw-breakpoint: CPU 0 debug is powered down!
[    0.987167][    T1] Serial: AMBA PL011 UART driver
[    1.291555][    T1] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =
28, base_baud = 0) is a PL011 rev1
[    1.318988][    T1] printk: console [ttyAMA0] enabled
[    3.249051][    T1] iommu: Default domain type: Translated
[    3.249309][    T1] iommu: DMA domain TLB invalidation policy: strict mode
[    3.299995][    T1] SCSI subsystem initialized
[    3.370300][    T1] usbcore: registered new interface driver usbfs
[    3.373579][    T1] usbcore: registered new interface driver hub
[    3.375785][    T1] usbcore: registered new device driver usb
[    3.431672][    T1] pps_core: LinuxPPS API ver. 1 registered
[    3.431947][    T1] pps_core: Software ver. 5.3.6 - Copyright
2005-2007 Rodolfo Giometti <giometti@linux.it>
[    3.433518][    T1] PTP clock support registered
[    3.438143][    T1] EDAC MC: Ver: 3.0.0
[    3.581025][    T1] vgaarb: loaded
[    3.603786][    T1] clocksource: Switched to clocksource arch_sys_counter
[    7.305343][    T1] NET: Registered PF_INET protocol family
[    7.310851][    T1] IP idents hash table entries: 16384 (order: 5,
131072 bytes, linear)
[    7.339760][    T1] tcp_listen_portaddr_hash hash table entries:
512 (order: 2, 20480 bytes, linear)
[    7.341016][    T1] Table-perturb hash table entries: 65536 (order:
6, 262144 bytes, linear)
[    7.341745][    T1] TCP established hash table entries: 8192
(order: 3, 32768 bytes, linear)
[    7.343032][    T1] TCP bind hash table entries: 8192 (order: 6,
327680 bytes, linear)
[    7.345920][    T1] TCP: Hash tables configured (established 8192 bind 8192)
[    7.362779][    T2] kthreadd invoked oom-killer:
gfp_mask=0x40cc0(GFP_KERNEL|__GFP_COMP), order=1, oom_score_adj=0
[    7.363723][    T2] CPU: 0 PID: 2 Comm: kthreadd Tainted: G
W          6.0.0-rc7 #5
[    7.363998][    T2] Hardware name: Generic DT based system
[    7.364324][    T2]  unwind_backtrace from show_stack+0x18/0x1c
[    7.365084][    T2]  show_stack from dump_stack_lvl+0x90/0xb0
[    7.365198][    T2]  dump_stack_lvl from dump_header+0x13c/0x688
[    7.365306][    T2]  dump_header from out_of_memory+0x8c4/0x9f0
[    7.365408][    T2]  out_of_memory from __alloc_pages_may_oom+0x298/0x438
[    7.365517][    T2]  __alloc_pages_may_oom from
__alloc_pages_slowpath.constprop.0+0x854/0x10a8
[    7.365635][    T2]  __alloc_pages_slowpath.constprop.0 from
__alloc_pages+0x630/0x768
[    7.365773][    T2]  __alloc_pages from alloc_slab_page+0x64/0x8c
[    7.365871][    T2]  alloc_slab_page from allocate_slab+0x1f0/0x268
[    7.365998][    T2]  allocate_slab from ___slab_alloc.constprop.0+0x77c/0xcd4
[    7.366138][    T2]  ___slab_alloc.constprop.0 from
__slab_alloc.constprop.0+0x2c/0x3c
[    7.366292][    T2]  __slab_alloc.constprop.0 from
kmem_cache_alloc+0x258/0x45c
[    7.366432][    T2]  kmem_cache_alloc from dup_task_struct+0x38/0x74c
[    7.366565][    T2]  dup_task_struct from copy_process+0x53c/0x5048
[    7.366695][    T2]  copy_process from kernel_clone+0xec/0xa98
[    7.366822][    T2]  kernel_clone from kernel_thread+0xd4/0x104
[    7.366940][    T2]  kernel_thread from kthreadd+0x34c/0x4f4
[    7.367061][    T2]  kthreadd from ret_from_fork+0x14/0x2c
[    7.367195][    T2] Exception stack(0xf0833fb0 to 0xf0833ff8)
[    7.367458][    T2] 3fa0:
00000000 00000000 00000000 00000000
[    7.367595][    T2] 3fc0: 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000
[    7.367719][    T2] 3fe0: 00000000 00000000 00000000 00000000
00000013 00000000
[    7.367947][    T2] Mem-Info:
[    7.368456][    T2] active_anon:0 inactive_anon:0 isolated_anon:0
[    7.368456][    T2]  active_file:0 inactive_file:0 isolated_file:0
[    7.368456][    T2]  unevictable:0 dirty:0 writeback:0
[    7.368456][    T2]  slab_reclaimable:2219 slab_unreclaimable:6009
[    7.368456][    T2]  mapped:0 shmem:0 pagetables:0 bounce:0
[    7.368456][    T2]  kernel_misc_reclaimable:0
[    7.368456][    T2]  free:67525 free_pcp:271 free_cma:16320
[    7.370314][    T2] Node 0 active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB
writeback_tmp:0kB kernel_stack:448kB pagetables:0kB all_unreclaimable?
no
[    7.371128][    T2] DMA free:8744kB boost:8192kB min:9060kB
low:9276kB high:9492kB reserved_highatomic:16384KB active_anon:0kB
inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB
writepending:0kB present:786432kB managed:47116kB mlocked:0kB
bounce:0kB free_pcp:1036kB local_pcp:1036kB free_cma:0kB
[    7.371610][    T2] lowmem_reserve[]: 0 0 256 256
[    7.371906][    T2] HighMem free:261356kB boost:0kB min:256kB
low:1460kB high:2664kB reserved_highatomic:0KB active_anon:0kB
inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB
writepending:0kB present:262144kB managed:262144kB mlocked:0kB
bounce:0kB free_pcp:48kB local_pcp:48kB free_cma:65280kB
[    7.372300][    T2] lowmem_reserve[]: 0 0 0 0
[    7.372570][    T2] DMA: 2*4kB (M) 2*8kB (MH) 3*16kB (MH) 3*32kB
(M) 2*64kB (M) 2*128kB (M) 2*256kB (M) 3*512kB (M) 2*1024kB (MH)
2*2048kB (M) 0*4096kB 0*8192kB = 8744kB
[    7.373576][    T2] HighMem: 1*4kB (U) 1*8kB (U) 0*16kB 1*32kB (U)
1*64kB (U) 1*128kB (U) 2*256kB (UC) 1*512kB (C) 2*1024kB (UC) 2*2048kB
(UC) 2*4096kB (UC) 30*8192kB (MC) = 261356kB
[    7.374320][    T2] 0 total pagecache pages
[    7.374460][    T2] 0 pages in swap cache
[    7.374590][    T2] Free swap  = 0kB
[    7.374697][    T2] Total swap = 0kB
[    7.374915][    T2] 262144 pages RAM
[    7.375011][    T2] 65536 pages HighMem/MovableOnly
[    7.375114][    T2] 184829 pages reserved
[    7.375206][    T2] 16384 pages cma reserved
[    7.375417][    T2] Unreclaimable slab info:
[    7.375711][    T2] Name                      Used          Total
[    7.376044][    T2] bio-164                   10KB         11KB
[    7.376250][    T2] bio-120                    0KB          3KB
[    7.376390][    T2] biovec-max               110KB        117KB
[    7.376532][    T2] dmaengine-unmap-256          1KB         15KB
[    7.376665][    T2] dmaengine-unmap-128          0KB          7KB
[    7.376787][    T2] dmaengine-unmap-16          0KB          4KB
[    7.376909][    T2] dmaengine-unmap-2          0KB          4KB
[    7.377041][    T2] skbuff_head_cache          8KB         11KB
[    7.377180][    T2] proc_dir_entry            42KB         43KB
[    7.377318][    T2] shmem_inode_cache         82KB         83KB
[    7.377440][    T2] kernfs_node_cache        978KB        980KB
[    7.377566][    T2] mnt_cache                  4KB          7KB
[    7.377688][    T2] names_cache              363KB        367KB
[    7.377810][    T2] nsproxy                    0KB          3KB
[    7.377943][    T2] mm_struct                  0KB          7KB
[    7.378069][    T2] fs_cache                   0KB          4KB
[    7.378192][    T2] files_cache                0KB          4KB
[    7.378317][    T2] signal_cache              29KB         31KB
[    7.378440][    T2] sighand_cache             43KB         46KB
[    7.378915][    T2] task_struct              122KB        122KB
[    7.379084][    T2] cred_jar                   7KB          8KB
[    7.379222][    T2] pid                        7KB          8KB
[    7.379349][    T2] trace_event_file         157KB        160KB
[    7.379473][    T2] ftrace_event_field        391KB        393KB
[    7.379603][    T2] pool_workqueue             9KB         15KB
[    7.379721][    T2] vmap_area                  8KB         11KB
[    7.379849][    T2] debug_objects_cache        178KB        180KB
[    7.379977][    T2] kmemleak_scan_area          2KB          3KB
[    7.380105][    T2] kmemleak_object         9091KB       9091KB
[    7.380267][    T2] kmalloc-8k                48KB         48KB
[    7.380389][    T2] kmalloc-4k              6732KB       6744KB
[    7.380505][    T2] kmalloc-2k               174KB        180KB
[    7.380626][    T2] kmalloc-1k               477KB        480KB
[    7.380746][    T2] kmalloc-512              337KB        345KB
[    7.380861][    T2] kmalloc-256               29KB         30KB
[    7.380984][    T2] kmalloc-192               85KB         86KB
[    7.381108][    T2] kmalloc-128              192KB        195KB
[    7.381230][    T2] kmalloc-64               988KB        992KB
[    7.381352][    T2] kmem_cache_node           26KB         28KB
[    7.381475][    T2] kmem_cache                33KB         33KB
[    7.381643][    T2] Tasks state (memory values in pages):
[    7.381765][    T2] [  pid  ]   uid  tgid total_vm      rss
pgtables_bytes swapents oom_score_adj name
[    7.382110][    T2] Out of memory and no killable processes...
[    7.382452][    T2] Kernel panic - not syncing: System is
deadlocked on memory
[    7.382695][    T2] CPU: 0 PID: 2 Comm: kthreadd Tainted: G
W          6.0.0-rc7 #5
[    7.382859][    T2] Hardware name: Generic DT based system
[    7.382990][    T2]  unwind_backtrace from show_stack+0x18/0x1c
[    7.383145][    T2]  show_stack from dump_stack_lvl+0x70/0xb0
[    7.383277][    T2]  dump_stack_lvl from panic+0x234/0x5b0
[    7.383401][    T2]  panic from out_of_memory+0x958/0x9f0
[    7.383525][    T2]  out_of_memory from __alloc_pages_may_oom+0x298/0x438
[    7.383655][    T2]  __alloc_pages_may_oom from
__alloc_pages_slowpath.constprop.0+0x854/0x10a8
[    7.383813][    T2]  __alloc_pages_slowpath.constprop.0 from
__alloc_pages+0x630/0x768
[    7.383965][    T2]  __alloc_pages from alloc_slab_page+0x64/0x8c
[    7.384066][    T2]  alloc_slab_page from allocate_slab+0x1f0/0x268
[    7.384194][    T2]  allocate_slab from ___slab_alloc.constprop.0+0x77c/0xcd4
[    7.384337][    T2]  ___slab_alloc.constprop.0 from
__slab_alloc.constprop.0+0x2c/0x3c
[    7.384491][    T2]  __slab_alloc.constprop.0 from
kmem_cache_alloc+0x258/0x45c
[    7.384641][    T2]  kmem_cache_alloc from dup_task_struct+0x38/0x74c
[    7.384777][    T2]  dup_task_struct from copy_process+0x53c/0x5048
[    7.384906][    T2]  copy_process from kernel_clone+0xec/0xa98
[    7.385029][    T2]  kernel_clone from kernel_thread+0xd4/0x104
[    7.385157][    T2]  kernel_thread from kthreadd+0x34c/0x4f4
[    7.385280][    T2]  kthreadd from ret_from_fork+0x14/0x2c
[    7.385398][    T2] Exception stack(0xf0833fb0 to 0xf0833ff8)
[    7.385518][    T2] 3fa0:
00000000 00000000 00000000 00000000
[    7.385683][    T2] 3fc0: 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000
[    7.385833][    T2] 3fe0: 00000000 00000000 00000000 00000000
00000013 00000000
[    7.386915][    T2] ---[ end Kernel panic - not syncing: System is
deadlocked on memory ]---



--
Best Regards
Masahiro Yamada
