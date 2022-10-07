Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE6F65F73FB
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Oct 2022 07:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJGFjJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Oct 2022 01:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJGFjH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Oct 2022 01:39:07 -0400
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B34115C24
        for <linux-kbuild@vger.kernel.org>; Thu,  6 Oct 2022 22:39:05 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 2975ch0H005449
        for <linux-kbuild@vger.kernel.org>; Fri, 7 Oct 2022 14:38:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 2975ch0H005449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665121124;
        bh=0iD+/yvc7QreXFcJvNSHN5CfC9g3IjW6m1n2SfBwcV0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HugQwZpDlNbcua+xwPLrV5RWU55WGEq1OGJEFnv7GUpVZbnKrXCkVp/c/19zPU6Sf
         IPDPdapdw6DU6GQW4hhD3YaJqXXAEqnNfXQNYo3qhFZEdpKIMOSby+Gw1BJEi1Tu/v
         xQ8QVAm/VoOaIOiHbegR1L3qeusLjaMIMB8R1R5QrfQTCadCQvuIJc6Rsm2dGdPwzz
         vxoqGTtrUlxAZ4XYqesYsYJQO4TusWInU2Eljs756iBgnK9qd/QYBpb08Ro+MZvDHs
         gVF6eoBrDRZGRbvIowB7t2lca0llFoUZ2NIVwQUUGTA9SpbegeRhIJzRIQJPLv0zGM
         fM03g1LOCrd0Q==
X-Nifty-SrcIP: [209.85.160.44]
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1326637be6eso4524903fac.13
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Oct 2022 22:38:43 -0700 (PDT)
X-Gm-Message-State: ACrzQf0aaxssKnf5tWqAL4Pi/KCxj1aDBWOU1KdbjOidkLrHQ5GYXM6I
        HbgOW/RGAsEsc2HmG0Vmh9l18/+4+hy5vlw7Gug=
X-Google-Smtp-Source: AMsMyM6A3ltouBAyR7XzUy0v/QFLL6usNR3cJWxIaBmNp8ZfB8SgJP5/jCm4BGMOwFniNd8SS2wEGxVFK/LDwS43tS0=
X-Received: by 2002:a05:6870:8a09:b0:132:554d:2f3d with SMTP id
 p9-20020a0568708a0900b00132554d2f3dmr7293117oaq.194.1665121122540; Thu, 06
 Oct 2022 22:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <633f0406.050a0220.9431e.d406@mx.google.com> <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
In-Reply-To: <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 7 Oct 2022 14:38:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
Message-ID: <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
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

On Fri, Oct 7, 2022 at 2:11 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Oct 7, 2022 at 1:53 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, Oct 06, 2022 at 09:36:22AM -0700, KernelCI bot wrote:
> >
> > The KernelCI bisection bot found a boot regression on qemu in today's
> > -next for a multi_v7_defconfig with additional debug options running on
> > virt-gicv3 which it identified as being triggered by 5750121ae738
> > ("kbuild: list sub-directories in ./Kbuild") which does seem surprising
> > but the bot did test a revert so it seemed worth reporting
>
>
>
> Please tell me the command line arguments to qemu-system-arm.
> Especially, how to turn on gicv3.


I found it in the qemu manual:
https://www.qemu.org/docs/master/system/arm/virt.html?highlight=gic%20version




The arm virt machine with gicv3 booted as far as I tested.

So, I need to know more details about the settings of the KernelCI.




This is my qemu command line.


qemu-system-arm -machine virt,gic-version=3 \
-kernel /home/masahiro/tools/qemu-arm_virt/kernel \
-initrd /home/masahiro/tools/qemu-arm_virt/initrd \
-drive file=fat:rw:/home/masahiro/tools/qemu-arm_virt/disk-shared,if=none,format=raw,id=drive0
\
-netdev bridge,id=netdev0,br=virbr0,helper=/usr/lib/qemu/qemu-bridge-helper \
-serial stdio -monitor vc:800x600 -cpu cortex-a15 \
-smp 4 -device virtio-blk-pci,drive=drive0 \
-device virtio-net-pci,netdev=netdev0 -append console=ttyAMA0




This is the boot log on my local test.




[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.0.0-rc7-00023-g5750121ae738
(masahiro@zoe) (arm-linux-gnueabi-gcc (GCC) 12.1.0, GNU ld (GNU
Binutils) 2.38) #2 SMP Fri Oct  7 13:53:12 JST 2022
[    0.000000] CPU: ARMv7 Processor [412fc0f1] revision 1 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: linux,dummy-virt
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Failed to reserve 64 MiB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x0000000047ffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000047ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000047ffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv0.2 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] percpu: Embedded 16 pages/cpu s34068 r8192 d23276 u65536
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: console=ttyAMA0
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536
bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768
bytes, linear)
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] Memory: 90564K/131072K available (13312K kernel code,
2401K rwdata, 5644K rodata, 2048K init, 425K bss, 40508K reserved, 0K
cma-reserved, 0K highmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU event tracing is enabled.
[    0.000000] rcu: RCU restricting CPUs from NR_CPUS=16 to nr_cpu_ids=4.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] GICv3: 224 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x080a0000
[    0.000000] ITS [mem 0x08080000-0x0809ffff]
[    0.000000] ITS@0x08080000: allocated 8192 Devices @420b0000
(indirect, esz 8, psz 64K, shr 1)
[    0.000000] ITS@0x08080000: allocated 8192 Interrupt Collections
@420c0000 (flat, esz 8, psz 64K, shr 1)
[    0.000000] GICv3: using LPI property table @0x420d0000
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x420e0000
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
[    0.000101] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps
every 4398046511096ns
[    0.000207] Switching to timer-based delay loop, resolution 16ns
[    0.004951] Console: colour dummy device 80x30
[    0.005996] Calibrating delay loop (skipped), value calculated
using timer frequency.. 125.00 BogoMIPS (lpj=625000)
[    0.006096] pid_max: default: 32768 minimum: 301
[    0.007637] Mount-cache hash table entries: 1024 (order: 0, 4096
bytes, linear)
[    0.007665] Mountpoint-cache hash table entries: 1024 (order: 0,
4096 bytes, linear)
[    0.017615] CPU: Testing write buffer coherency: ok
[    0.018600] CPU0: Spectre v2: firmware did not set auxiliary
control register IBE bit, system vulnerable
[    0.018705] CPU0: Spectre BHB: enabling loop workaround for all CPUs
[    0.025292] /cpus/cpu@0 missing clock-frequency property
[    0.025495] /cpus/cpu@1 missing clock-frequency property
[    0.025523] /cpus/cpu@2 missing clock-frequency property
[    0.025547] /cpus/cpu@3 missing clock-frequency property
[    0.025640] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.029784] Setting up static identity map for 0x40300000 - 0x403000ac
[    0.030913] rcu: Hierarchical SRCU implementation.
[    0.030939] rcu: Max phase no-delay instances is 1000.
[    0.032589] Platform MSI: its@8080000 domain created
[    0.032791] PCI/MSI: /intc@8000000/its@8080000 domain created
[    0.033897] EFI services will not be available.
[    0.034945] smp: Bringing up secondary CPUs ...
[    0.037345] GICv3: CPU1: found redistributor 1 region 0:0x080c0000
[    0.037491] GICv3: CPU1: using allocated LPI pending table @0x420f0000
[    0.037769] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.037805] CPU1: Spectre v2: firmware did not set auxiliary
control register IBE bit, system vulnerable
[    0.041870] GICv3: CPU2: found redistributor 2 region 0:0x080e0000
[    0.042035] GICv3: CPU2: using allocated LPI pending table @0x42100000
[    0.042447] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.042474] CPU2: Spectre v2: firmware did not set auxiliary
control register IBE bit, system vulnerable
[    0.045118] GICv3: CPU3: found redistributor 3 region 0:0x08100000
[    0.045244] GICv3: CPU3: using allocated LPI pending table @0x42110000
[    0.045532] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.045551] CPU3: Spectre v2: firmware did not set auxiliary
control register IBE bit, system vulnerable
[    0.046060] smp: Brought up 1 node, 4 CPUs
[    0.046138] SMP: Total of 4 processors activated (500.00 BogoMIPS).
[    0.046191] CPU: All CPU(s) started in SVC mode.
[    0.055178] devtmpfs: initialized
[    0.060968] VFP support v0.3: implementor 41 architecture 4 part 30
variant f rev 0
[    0.073088] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.073607] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.076419] pinctrl core: initialized pinctrl subsystem
[    0.087501] DMI not present or invalid.
[    0.094365] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.097176] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.101173] thermal_sys: Registered thermal governor 'step_wise'
[    0.108561] cpuidle: using governor menu
[    0.108998] No ATAGs?
[    0.109385] hw-breakpoint: CPU 0 debug is powered down!
[    0.113069] Serial: AMBA PL011 UART driver
[    0.135891] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq = 28,
base_baud = 0) is a PL011 rev1
[    0.144412] printk: console [ttyAMA0] enabled
[    0.182593] iommu: Default domain type: Translated
[    0.182753] iommu: DMA domain TLB invalidation policy: strict mode
[    0.184858] SCSI subsystem initialized
[    0.187628] pps_core: LinuxPPS API ver. 1 registered
[    0.187805] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.188009] PTP clock support registered
[    0.188353] EDAC MC: Ver: 3.0.0
[    0.199703] vgaarb: loaded
[    0.609615] clocksource: Switched to clocksource arch_sys_counter
[    0.631708] NET: Registered PF_INET protocol family
[    0.632657] IP idents hash table entries: 2048 (order: 2, 16384
bytes, linear)
[    0.636163] tcp_listen_portaddr_hash hash table entries: 512
(order: 0, 4096 bytes, linear)
[    0.636317] Table-perturb hash table entries: 65536 (order: 6,
262144 bytes, linear)
[    0.636408] TCP established hash table entries: 1024 (order: 0,
4096 bytes, linear)
[    0.636602] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.636727] TCP: Hash tables configured (established 1024 bind 1024)
[    0.637661] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.637842] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.638587] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.641096] RPC: Registered named UNIX socket transport module.
[    0.641197] RPC: Registered udp transport module.
[    0.641249] RPC: Registered tcp transport module.
[    0.641287] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.641379] PCI: CLS 0 bytes, default 64
[    0.643336] Initialise system trusted keyrings
[    0.644330] Trying to unpack rootfs image as initramfs...
[    0.644867] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[    0.651129] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.653168] NFS: Registering the id_resolver key type
[    0.653474] Key type id_resolver registered
[    0.653533] Key type id_legacy registered
[    0.653822] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.653941] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    0.657872] Key type cifs.idmap registered
[    0.657998] ntfs: driver 2.1.32 [Flags: R/O].
[    0.659591] Key type asymmetric registered
[    0.659695] Asymmetric key parser 'x509' registered
[    0.660108] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 248)
[    0.660292] io scheduler mq-deadline registered
[    0.660370] io scheduler kyber registered
[    0.672302] pl061_gpio 9030000.pl061: PL061 GPIO chip registered
[    0.676129] pci-host-generic 4010000000.pcie: host bridge
/pcie@10000000 ranges:
[    0.676728] pci-host-generic 4010000000.pcie:       IO
0x003eff0000..0x003effffff -> 0x0000000000
[    0.677148] pci-host-generic 4010000000.pcie:      MEM
0x0010000000..0x003efeffff -> 0x0010000000
[    0.677260] pci-host-generic 4010000000.pcie:      MEM
0x8000000000..0xffffffffff -> 0x8000000000
[    0.677914] pci-host-generic 4010000000.pcie: can't claim ECAM area
[mem 0x10000000-0x1fffffff]: address conflict with pcie@10000000 [mem
0x10000000-0x3efeffff]
[    0.678245] pci-host-generic: probe of 4010000000.pcie failed with error -16
[    0.722335] Freeing initrd memory: 13708K
[    0.788038] Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
[    0.793673] SuperH (H)SCI(F) driver initialized
[    0.794378] msm_serial: driver initialized
[    0.794431] STMicroelectronics ASC driver initialized
[    0.795077] STM32 USART driver initialized
[    0.818717] brd: module loaded
[    0.830120] loop: module loaded
[    0.834637] physmap-flash 0.flash: physmap platform flash device:
[mem 0x00000000-0x03ffffff]
[    0.835668] 0.flash: Found 2 x16 devices at 0x0 in 32-bit bank.
Manufacturer ID 0x000000 Chip ID 0x000000
[    0.836092] Intel/Sharp Extended Query Table at 0x0031
[    0.836656] Using buffer write method
[    0.837749] physmap-flash 0.flash: physmap platform flash device:
[mem 0x04000000-0x07ffffff]
[    0.838138] 0.flash: Found 2 x16 devices at 0x0 in 32-bit bank.
Manufacturer ID 0x000000 Chip ID 0x000000
[    0.838277] Intel/Sharp Extended Query Table at 0x0031
[    0.838679] Using buffer write method
[    0.838821] Concatenating MTD devices:
[    0.838867] (0): "0.flash"
[    0.839072] (1): "0.flash"
[    0.839115] into device "0.flash"
[    0.955177] CAN device driver interface
[    0.955933] bgmac_bcma: Broadcom 47xx GBit MAC driver loaded
[    0.956695] e1000e: Intel(R) PRO/1000 Network Driver
[    0.956771] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.956912] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.956971] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.964091] rtc-pl031 9010000.pl031: registered as rtc0
[    0.964730] rtc-pl031 9010000.pl031: setting system clock to
2022-10-07T05:29:58 UTC (1665120598)
[    0.966534] i2c_dev: i2c /dev entries driver
[    0.976031] sdhci: Secure Digital Host Controller Interface driver
[    0.976125] sdhci: Copyright(c) Pierre Ossman
[    0.977162] Synopsys Designware Multimedia Card Interface Driver
[    0.978119] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.981065] ledtrig-cpu: registered to indicate activity on CPUs
[    0.986996] NET: Registered PF_INET6 protocol family
[    0.992740] Segment Routing with IPv6
[    0.992926] In-situ OAM (IOAM) with IPv6
[    0.993223] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.995354] NET: Registered PF_PACKET protocol family
[    0.995506] can: controller area network core
[    0.995781] NET: Registered PF_CAN protocol family
[    0.995846] can: raw protocol
[    0.995953] can: broadcast manager protocol
[    0.996079] can: netlink gateway - max_hops=1
[    0.996700] Key type dns_resolver registered
[    0.996915] ThumbEE CPU extension supported.
[    0.996991] Registering SWP/SWPB emulation handler
[    0.998595] Loading compiled-in X.509 certificates
[    1.020911] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    1.028435] uart-pl011 9000000.pl011: no DMA platform data
[    1.140039] Freeing unused kernel image (initmem) memory: 2048K
[    1.325328] Run /init as init process
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving random seed: [    7.159326] random: crng init done
OK
Starting network: Waiting for interface eth0 to appear............... timeout!
run-parts: /etc/network/if-pre-up.d/wait_iface: exit status 1
FAIL
Starting dhcpcd...
dhcpcd-9.4.1 starting
[   23.460126] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[   23.531096] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   23.532484] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[   23.532755] cfg80211: failed to load regulatory.db
forked to background, child pid 150
no valid interfaces found

Welcome to Buildroot





-- 
Best Regards
Masahiro Yamada
