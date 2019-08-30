Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBDBCA2CF0
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2019 04:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbfH3CsP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Aug 2019 22:48:15 -0400
Received: from mga12.intel.com ([192.55.52.136]:28968 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727216AbfH3CsP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 22:48:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 19:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; 
   d="gz'50?scan'50,208,50";a="188742535"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2019 19:48:12 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1i3WxQ-000BR2-AE; Fri, 30 Aug 2019 10:48:12 +0800
Date:   Fri, 30 Aug 2019 10:47:21 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     kbuild-all@01.org, linux-kbuild@vger.kernel.org
Subject: [kbuild:kbuild 50/55] efi.c:undefined reference to `__udivdi3'
Message-ID: <201908301018.5WtD8EDc%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="k6cfnimkycsd4xp3"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--k6cfnimkycsd4xp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   025960c034eacc433afd366085077991f8ed6e4e
commit: 9d429754d43ad1c701b8875cfd645736c8570976 [50/55] kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)
config: ia64-defconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 9d429754d43ad1c701b8875cfd645736c8570976
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=ia64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   init/do_mounts_rd.o: In function `rd_load_image':
   do_mounts_rd.c:(.init.text+0xce2): undefined reference to `__udivdi3'
   do_mounts_rd.c:(.init.text+0xec2): undefined reference to `__umoddi3'
   arch/ia64/kernel/efi.o: In function `find_memmap_space':
>> efi.c:(.text+0x2542): undefined reference to `__udivdi3'
   arch/ia64/kernel/time.o: In function `ia64_cpu_local_tick':
>> time.c:(.text+0x741): undefined reference to `__udivdi3'
   arch/ia64/kernel/time.o: In function `ia64_init_itm':
   time.c:(.text+0x982): undefined reference to `__udivdi3'
   time.c:(.text+0xc52): undefined reference to `__udivdi3'
   time.c:(.text+0xcd2): undefined reference to `__udivdi3'
   arch/ia64/kernel/time.o:time.c:(.text+0xeb2): more undefined references to `__udivdi3' follow
   arch/ia64/kernel/iosapic.o: In function `get_target_cpu':
   iosapic.c:(.text+0x1822): undefined reference to `__moddi3'
   arch/ia64/kernel/mca_drv.o: In function `mca_make_slidx':
   mca_drv.c:(.text+0x412): undefined reference to `__moddi3'
   mca_drv.c:(.text+0xa52): undefined reference to `__moddi3'
   mca_drv.c:(.text+0xb32): undefined reference to `__moddi3'
   mca_drv.c:(.text+0xc12): undefined reference to `__moddi3'
   arch/ia64/kernel/mca_drv.o:mca_drv.c:(.text+0xcf2): more undefined references to `__moddi3' follow
   arch/ia64/dig/setup.o: In function `dig_setup':
>> setup.c:(.init.text+0x122): undefined reference to `__udivdi3'
   kernel/sysctl.o: In function `__do_proc_doulongvec_minmax':
   sysctl.c:(.text+0x23a2): undefined reference to `__udivdi3'
   sysctl.c:(.text+0x2772): undefined reference to `__udivdi3'
   kernel/ptrace.o: In function `ptrace_request':
>> ptrace.c:(.text+0x4312): undefined reference to `__umoddi3'
   kernel/sched/core.o: In function `to_ratio':
>> core.c:(.text+0x8412): undefined reference to `__udivdi3'
   kernel/sched/cputime.o: In function `cputime_adjust':
>> cputime.c:(.text+0x1012): undefined reference to `__udivdi3'
   kernel/sched/fair.o: In function `__calc_delta':
>> fair.c:(.text+0x682): undefined reference to `__udivdi3'
   kernel/sched/fair.o: In function `attach_entity_load_avg.isra.1':
   fair.c:(.text+0x2702): undefined reference to `__udivdi3'
   kernel/sched/fair.o: In function `select_task_rq_fair':
   fair.c:(.text+0x39d2): undefined reference to `__udivdi3'
   kernel/sched/fair.o:fair.c:(.text+0x3fb2): more undefined references to `__udivdi3' follow
   kernel/irq/irqdomain.o: In function `irq_domain_alloc_descs':
   irqdomain.c:(.text+0x2372): undefined reference to `__umoddi3'
   kernel/irq/affinity.o: In function `__irq_build_affinity_masks':
   affinity.c:(.text+0x4b2): undefined reference to `__udivdi3'
   affinity.c:(.text+0x532): undefined reference to `__umoddi3'
   affinity.c:(.text+0x572): undefined reference to `__udivdi3'
   kernel/rcu/tree.o: In function `rcu_gp_slow.part.40':
   tree.c:(.text+0x8542): undefined reference to `__umoddi3'
   kernel/rcu/tree.o: In function `rcu_init':
   tree.c:(.init.text+0xb52): undefined reference to `__udivdi3'
   tree.c:(.init.text+0x1112): undefined reference to `__moddi3'
   kernel/time/timekeeping.o: In function `scale64_check_overflow':
>> timekeeping.c:(.text+0x2002): undefined reference to `__umoddi3'
>> timekeeping.c:(.text+0x2022): undefined reference to `__udivdi3'
   timekeeping.c:(.text+0x2172): undefined reference to `__udivdi3'
   kernel/time/timekeeping.o: In function `get_device_system_crosststamp':
   timekeeping.c:(.text+0x32f2): undefined reference to `__umoddi3'
   timekeeping.c:(.text+0x3312): undefined reference to `__udivdi3'
   timekeeping.c:(.text+0x3332): undefined reference to `__udivdi3'
   kernel/time/timekeeping.o: In function `timekeeping_advance':
   timekeeping.c:(.text+0x4442): undefined reference to `__udivdi3'
   kernel/time/timekeeping.o: In function `tk_setup_internals.constprop.6':
   timekeeping.c:(.text+0x4bf2): undefined reference to `__udivdi3'
   kernel/time/clocksource.o: In function `clocks_calc_mult_shift':
>> clocksource.c:(.text+0xf2): undefined reference to `__udivdi3'
   kernel/time/clocksource.o:clocksource.c:(.text+0x13e2): more undefined references to `__udivdi3' follow
   kernel/bpf/core.o: In function `___bpf_prog_run':
>> core.c:(.text+0xb82): undefined reference to `__umoddi3'
   core.c:(.text+0xc22): undefined reference to `__umoddi3'
   core.c:(.text+0xd22): undefined reference to `__udivdi3'
   core.c:(.text+0xd62): undefined reference to `__umoddi3'
   core.c:(.text+0xe02): undefined reference to `__umoddi3'
   mm/page-writeback.o: In function `__wb_calc_thresh':
   page-writeback.c:(.text+0x602): undefined reference to `__udivdi3'
   mm/page-writeback.o: In function `__wb_update_bandwidth.isra.10':
   page-writeback.c:(.text+0x2a92): undefined reference to `__udivdi3'
   page-writeback.c:(.text+0x2ab2): undefined reference to `__udivdi3'
   page-writeback.c:(.text+0x2b52): undefined reference to `__udivdi3'
   page-writeback.c:(.text+0x2ca2): undefined reference to `__udivdi3'
   mm/page-writeback.o:page-writeback.c:(.text+0x2e22): more undefined references to `__udivdi3' follow
   mm/percpu.o: In function `pcpu_dump_alloc_info':
>> percpu.c:(.text.unlikely+0x3f2): undefined reference to `__moddi3'
   percpu.c:(.text.unlikely+0x492): undefined reference to `__moddi3'
   mm/compaction.o: In function `compaction_zonelist_suitable':
>> compaction.c:(.text+0x8492): undefined reference to `__udivdi3'
   mm/vmalloc.o: In function `pcpu_get_vm_areas':
   vmalloc.c:(.text+0xa852): undefined reference to `__moddi3'
   mm/page_alloc.o: In function `setup_per_zone_lowmem_reserve':
>> page_alloc.c:(.text+0x7c2): undefined reference to `__udivdi3'
   mm/page_alloc.o: In function `pageset_set_high_and_batch':
   page_alloc.c:(.text+0x4942): undefined reference to `__udivdi3'
   mm/page_alloc.o: In function `setup_per_zone_wmarks':
   page_alloc.c:(.text+0x101f2): undefined reference to `__udivdi3'
   mm/page_alloc.o: In function `find_zone_movable_pfns_for_nodes':
>> page_alloc.c:(.init.text+0xdc2): undefined reference to `__udivdi3'
   page_alloc.c:(.init.text+0xe42): undefined reference to `__udivdi3'
   mm/page_alloc.o:page_alloc.c:(.init.text+0x3c12): more undefined references to `__udivdi3' follow
   mm/swapfile.o: In function `__se_sys_swapon':
>> swapfile.c:(.text+0xc732): undefined reference to `__umoddi3'
   mm/dmapool.o: In function `show_pools':
>> dmapool.c:(.text+0x242): undefined reference to `__udivdi3'
   dmapool.c:(.text+0x3e2): undefined reference to `__udivdi3'
   mm/dmapool.o: In function `dma_pool_create':
>> dmapool.c:(.text+0x4e2): undefined reference to `__umoddi3'
   mm/mempolicy.o: In function `offset_il_node':
>> mempolicy.c:(.text+0x412): undefined reference to `__umoddi3'
   mm/slub.o: In function `calculate_sizes':
>> slub.c:(.text+0x14e2): undefined reference to `__udivdi3'
   slub.c:(.text+0x1572): undefined reference to `__udivdi3'
   slub.c:(.text+0x1652): undefined reference to `__udivdi3'
   slub.c:(.text+0x1692): undefined reference to `__udivdi3'

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--k6cfnimkycsd4xp3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--k6cfnimkycsd4xp3--
