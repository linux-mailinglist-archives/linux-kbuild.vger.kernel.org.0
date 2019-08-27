Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2AC9DB3F
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2019 03:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfH0BjD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Aug 2019 21:39:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:1168 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727646AbfH0Bgq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Aug 2019 21:36:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 18:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; 
   d="gz'50?scan'50,208,50";a="379852002"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2019 18:36:40 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1i2QPY-000BbQ-88; Tue, 27 Aug 2019 09:36:40 +0800
Date:   Tue, 27 Aug 2019 09:36:18 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     kbuild-all@01.org, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 1/2] kbuild: change *FLAGS_<basetarget>.o to take the
 path relative to $(obj)
Message-ID: <201908270916.Jlg3oeZx%lkp@intel.com>
References: <20190825172833.5708-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="elipqe7rvl55wgsa"
Content-Disposition: inline
In-Reply-To: <20190825172833.5708-1-yamada.masahiro@socionext.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--elipqe7rvl55wgsa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc6 next-20190826]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-change-FLAGS_-basetarget-o-to-take-the-path-relative-to-obj/20190827-071627
config: ia64-allnoconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=ia64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/ia64/kernel/efi.o: In function `find_memmap_space':
   efi.c:(.text+0x2402): undefined reference to `__udivdi3'
   arch/ia64/kernel/time.o: In function `ia64_init_itm':
   time.c:(.text+0xa32): undefined reference to `__udivdi3'
   time.c:(.text+0xae2): undefined reference to `__udivdi3'
   time.c:(.text+0xb62): undefined reference to `__udivdi3'
   time.c:(.text+0xd62): undefined reference to `__udivdi3'
   arch/ia64/kernel/time.o:time.c:(.text+0xe12): more undefined references to `__udivdi3' follow
   kernel/ptrace.o: In function `ptrace_request':
   ptrace.c:(.text+0x3262): undefined reference to `__umoddi3'
   kernel/sched/core.o: In function `to_ratio':
   core.c:(.text+0x2c32): undefined reference to `__udivdi3'
   kernel/sched/cputime.o: In function `cputime_adjust':
   cputime.c:(.text+0xd72): undefined reference to `__udivdi3'
   kernel/sched/fair.o: In function `__calc_delta':
   fair.c:(.text+0x362): undefined reference to `__udivdi3'
   kernel/time/timekeeping.o: In function `scale64_check_overflow':
   timekeeping.c:(.text+0x42): undefined reference to `__umoddi3'
   timekeeping.c:(.text+0x62): undefined reference to `__udivdi3'
   timekeeping.c:(.text+0x1b2): undefined reference to `__udivdi3'
   kernel/time/timekeeping.o: In function `timekeeping_advance':
   timekeeping.c:(.text+0x1552): undefined reference to `__udivdi3'
   kernel/time/timekeeping.o: In function `tk_setup_internals.constprop.6':
   timekeeping.c:(.text+0x19b2): undefined reference to `__udivdi3'
   kernel/time/timekeeping.o: In function `get_device_system_crosststamp':
   timekeeping.c:(.text+0x3f52): undefined reference to `__umoddi3'
   timekeeping.c:(.text+0x3f72): undefined reference to `__udivdi3'
   timekeeping.c:(.text+0x3f92): undefined reference to `__udivdi3'
   kernel/time/clocksource.o: In function `clocks_calc_mult_shift':
   clocksource.c:(.text+0x4b2): undefined reference to `__udivdi3'
   kernel/time/clocksource.o: In function `clocks_calc_max_nsecs':
   clocksource.c:(.text+0xaa2): undefined reference to `__udivdi3'
   kernel/time/clocksource.o: In function `__clocksource_update_freq_scale':
   clocksource.c:(.text+0xb72): undefined reference to `__udivdi3'
   kernel/time/clocksource.o:clocksource.c:(.text+0xb82): more undefined references to `__udivdi3' follow
   mm/percpu.o: In function `pcpu_setup_first_chunk':
>> percpu.c:(.init.text+0xa02): undefined reference to `__moddi3'
>> percpu.c:(.init.text+0xae2): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0xb22): undefined reference to `__moddi3'
   percpu.c:(.init.text+0xc32): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0xc72): undefined reference to `__moddi3'
   percpu.c:(.init.text+0xd52): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0xd92): undefined reference to `__moddi3'
   percpu.c:(.init.text+0xe72): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0xeb2): undefined reference to `__moddi3'
   percpu.c:(.init.text+0xf92): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0xfd2): undefined reference to `__moddi3'
   percpu.c:(.init.text+0x10b2): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0x1132): undefined reference to `__moddi3'
   percpu.c:(.init.text+0x1242): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0x12c2): undefined reference to `__moddi3'
   percpu.c:(.init.text+0x1672): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0x16e2): undefined reference to `__moddi3'
   percpu.c:(.init.text+0x1812): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0x1882): undefined reference to `__moddi3'
   percpu.c:(.init.text+0x1a72): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0x1ae2): undefined reference to `__moddi3'
   percpu.c:(.init.text+0x1bc2): undefined reference to `__udivdi3'
   percpu.c:(.init.text+0x1c32): undefined reference to `__moddi3'
   mm/page_alloc.o: In function `setup_per_zone_lowmem_reserve':
   page_alloc.c:(.text+0x572): undefined reference to `__udivdi3'
   mm/page_alloc.o: In function `__setup_per_zone_wmarks':
   page_alloc.c:(.text+0xb42): undefined reference to `__udivdi3'
   mm/page_alloc.o: In function `pageset_set_high_and_batch':
   page_alloc.c:(.text+0x15e2): undefined reference to `__udivdi3'
   mm/page_alloc.o: In function `find_zone_movable_pfns_for_nodes':
   page_alloc.c:(.init.text+0x9f2): undefined reference to `__udivdi3'
   page_alloc.c:(.init.text+0xa72): undefined reference to `__udivdi3'
   mm/page_alloc.o:page_alloc.c:(.init.text+0x2d82): more undefined references to `__udivdi3' follow
   mm/dmapool.o: In function `dma_pool_create':
   dmapool.c:(.text+0x3e2): undefined reference to `__umoddi3'
   mm/mempolicy.o: In function `offset_il_node':
   mempolicy.c:(.text+0x412): undefined reference to `__umoddi3'
   mm/slub.o: In function `__kmem_cache_create':
   slub.c:(.text+0x6ff2): undefined reference to `__udivdi3'
   slub.c:(.text+0x7042): undefined reference to `__udivdi3'
   slub.c:(.text+0x7302): undefined reference to `__udivdi3'
   slub.c:(.text+0x7392): undefined reference to `__udivdi3'
   slub.c:(.text+0x7732): undefined reference to `__udivdi3'
   slub.c:(.text+0x7752): undefined reference to `__umoddi3'
   slub.c:(.text+0x77b2): undefined reference to `__umoddi3'
   slub.c:(.text+0x77d2): undefined reference to `__udivdi3'
   slub.c:(.text+0x7932): undefined reference to `__umoddi3'
   slub.c:(.text+0x7992): undefined reference to `__umoddi3'
   slub.c:(.text+0x7a52): undefined reference to `__umoddi3'
   slub.c:(.text+0x7ab2): undefined reference to `__umoddi3'
   mm/quicklist.o: In function `quicklist_trim':
   quicklist.c:(.text+0x142): undefined reference to `__udivdi3'
   fs/super.o: In function `super_cache_scan':
   super.c:(.text+0x1ca2): undefined reference to `__udivdi3'
   super.c:(.text+0x1cc2): undefined reference to `__umoddi3'
   super.c:(.text+0x1cf2): undefined reference to `__udivdi3'
   super.c:(.text+0x1d42): undefined reference to `__udivdi3'
   super.c:(.text+0x1dc2): undefined reference to `__udivdi3'
   fs/inode.o: In function `timespec64_trunc':
   inode.c:(.text+0x5172): undefined reference to `__moddi3'
   fs/inode.o: In function `current_time':
   inode.c:(.text+0x52b2): undefined reference to `__moddi3'
   lib/bitmap.o: In function `bitmap_remap':
   bitmap.c:(.text+0x24c2): undefined reference to `__umoddi3'
   lib/bitmap.o: In function `bitmap_bitremap':
   bitmap.c:(.text+0x2682): undefined reference to `__moddi3'
   lib/bitmap.o: In function `bitmap_fold':
   bitmap.c:(.text+0x2982): undefined reference to `__umoddi3'
   lib/kfifo.o: In function `kfifo_copy_from_user.isra.1':
   kfifo.c:(.text+0x232): undefined reference to `__udivdi3'
   kfifo.c:(.text+0x312): undefined reference to `__udivdi3'
   lib/kfifo.o: In function `kfifo_copy_to_user.isra.2':
   kfifo.c:(.text+0x582): undefined reference to `__udivdi3'
   lib/kfifo.o: In function `__kfifo_init':
   kfifo.c:(.text+0x1302): undefined reference to `__udivdi3'
   lib/kfifo.o: In function `__kfifo_from_user':
   kfifo.c:(.text+0x1672): undefined reference to `__udivdi3'
   lib/kfifo.o:kfifo.c:(.text+0x17a2): more undefined references to `__udivdi3' follow
   lib/string_helpers.o: In function `string_get_size':
   string_helpers.c:(.text+0x282): undefined reference to `__umoddi3'
   lib/hexdump.o: In function `hex_dump_to_buffer':
   hexdump.c:(.text+0x682): undefined reference to `__umoddi3'
   hexdump.c:(.text+0x6a2): undefined reference to `__udivdi3'
   lib/kstrtox.o: In function `_parse_integer':
   kstrtox.c:(.text+0x2e2): undefined reference to `__udivdi3'
   lib/math/lcm.o: In function `lcm':
   lcm.c:(.text+0x62): undefined reference to `__udivdi3'
   lib/math/lcm.o: In function `lcm_not_zero':
   lcm.c:(.text+0x122): undefined reference to `__udivdi3'
   lib/math/reciprocal_div.o: In function `reciprocal_value':
   reciprocal_div.c:(.text+0xd2): undefined reference to `__udivdi3'
   lib/math/reciprocal_div.o:reciprocal_div.c:(.text+0x1e2): more undefined references to `__udivdi3' follow
   drivers/pci/pci.o: In function `pci_set_cacheline_size':
   pci.c:(.text+0xb7e2): undefined reference to `__umoddi3'
   drivers/pci/setup-bus.o: In function `pci_bus_distribute_available_resources':
   setup-bus.c:(.text+0x1ec2): undefined reference to `__udivdi3'
   setup-bus.c:(.text+0x1f42): undefined reference to `__udivdi3'
   setup-bus.c:(.text+0x1fc2): undefined reference to `__udivdi3'
   setup-bus.c:(.text+0x21a2): undefined reference to `__udivdi3'
   setup-bus.c:(.text+0x2212): undefined reference to `__udivdi3'
   drivers/pci/setup-bus.o:setup-bus.c:(.text+0x2282): more undefined references to `__udivdi3' follow
   drivers/acpi/acpica/exfldio.o: In function `acpi_ex_insert_into_field':
   exfldio.c:(.text+0x812): undefined reference to `__umoddi3'
   drivers/acpi/acpica/exfldio.o: In function `acpi_ex_extract_from_field':
   exfldio.c:(.text+0x1222): undefined reference to `__udivdi3'
   exfldio.c:(.text+0x1332): undefined reference to `__udivdi3'
   exfldio.c:(.text+0x1362): undefined reference to `__umoddi3'
   drivers/acpi/acpica/tbutils.o: In function `acpi_tb_parse_root_table':
   tbutils.c:(.init.text+0x462): undefined reference to `__udivdi3'
   drivers/acpi/acpica/utmath.o: In function `acpi_ut_short_divide':
   utmath.c:(.text+0x152): undefined reference to `__udivdi3'
   utmath.c:(.text+0x192): undefined reference to `__umoddi3'
   drivers/acpi/acpica/utmath.o: In function `acpi_ut_divide':
   utmath.c:(.text+0x262): undefined reference to `__udivdi3'
   utmath.c:(.text+0x2a2): undefined reference to `__umoddi3'
   drivers/tty/tty_port.o: In function `tty_port_close_start.part.1':
   tty_port.c:(.text+0x5a2): undefined reference to `__udivdi3'
   drivers/char/random.o: In function `add_device_randomness':
   random.c:(.text+0x39d2): undefined reference to `__umoddi3'
   drivers/char/random.o: In function `randomize_page':
   random.c:(.text+0x4f82): undefined reference to `__umoddi3'
   drivers/base/swnode.o: In function `software_node_read_int_array':
   swnode.c:(.text+0x12f2): undefined reference to `__udivdi3'
   drivers/firmware/efi/memmap.o: In function `__efi_memmap_init':
>> memmap.c:(.init.text+0x112): undefined reference to `__udivdi3'
   arch/ia64/hp/common/sba_iommu.o: In function `sba_init':
   sba_iommu.c:(.init.text+0x982): undefined reference to `__udivdi3'
   arch/ia64/sn/kernel/bte.o: In function `bte_copy':
   bte.c:(.text+0x3b2): undefined reference to `__moddi3'
   arch/ia64/sn/pci/tioca_provider.o: In function `tioca_bus_fixup':
   tioca_provider.c:(.text+0x662): undefined reference to `__udivdi3'
   tioca_provider.c:(.text+0x772): undefined reference to `__udivdi3'
   tioca_provider.c:(.text+0xab2): undefined reference to `__udivdi3'
   arch/ia64/sn/pci/tioca_provider.o: In function `tioca_dma_map':
   tioca_provider.c:(.text+0x1392): undefined reference to `__umoddi3'
   lib/nodemask.o: In function `node_random':
   nodemask.c:(.text+0x102): undefined reference to `__umoddi3'
   lib/vsprintf.o: In function `vsscanf':
   vsprintf.c:(.text+0xac62): undefined reference to `__udivdi3'

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--elipqe7rvl55wgsa
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--elipqe7rvl55wgsa--
