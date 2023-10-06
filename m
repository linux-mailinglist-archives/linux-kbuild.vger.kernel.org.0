Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6BE7BBD37
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 18:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjJFQu3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 12:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjJFQu2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 12:50:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A12CAD
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696611026; x=1728147026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TyZTCYRndky9FsZgVN2Q0xbD13CmF4KqHE4WAZmVZT0=;
  b=Bt6JHlWyruBhP6GpuklgA9OdsoWl8d4vHNHlZjeUNxrKeHaS1+MrbDaC
   5ZTtVsMoVxlw7DxlqDvLmnzvGXQjgIPVJLiaelOWYskW2OcwSgC9coRrX
   cbNcRKhHRIMzKH/Iq9p1taoDw9cSRk8k4L5ckHEZNk4Y8TOAKUwCgQPsg
   0h2WdMygXjMUHzF52bi5Q6x8Oqxpedxb1WFR+C00C4XVe6lOVz3kDBQxP
   luSm2XD3o858Z+TmHlEcJE++yuxkdhtz2j2uR4+UcfISANMmcsQ416lKu
   f4S4Rree+FQUQp9jeIpt9aZDoDIOCq9TS7eeGTjoVXwxNvpc1D/GXWnn+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382650032"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="382650032"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 09:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="1083515255"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="1083515255"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2023 09:50:22 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qoo1s-0003RN-2o;
        Fri, 06 Oct 2023 16:50:20 +0000
Date:   Sat, 7 Oct 2023 00:49:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        jani.nikula@intel.com, Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: enable W=1 warnings by default
Message-ID: <202310070011.Fji48IBk-lkp@intel.com>
References: <f50c8ea0e63615aea28fe7f6049703e1d28ba7eb.1696595500.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f50c8ea0e63615aea28fe7f6049703e1d28ba7eb.1696595500.git.jani.nikula@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-drop-Wall-and-related-disables-from-cflags-as-redundant/20231006-203658
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/f50c8ea0e63615aea28fe7f6049703e1d28ba7eb.1696595500.git.jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 2/2] drm/i915: enable W=1 warnings by default
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231007/202310070011.Fji48IBk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310070011.Fji48IBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310070011.Fji48IBk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:9:
>> include/linux/thread_info.h:240:29: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned long') [-Wsign-compare]
           if (unlikely(sz >= 0 && sz < bytes)) {
                                   ~~ ^ ~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_driver.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1036:13: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           return cid == MM_CID_UNSET;
                  ~~~ ^  ~~~~~~~~~~~~
   include/linux/mm_types.h:1074:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_possible_cpu(i) {
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:974:36: note: expanded from macro 'for_each_possible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:282:2: note: expanded from macro 'for_each_cpu'
           for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
           ^                ~~~                      ~~~~~~~~~~~~~~~~~~
   include/linux/find.h:559:70: note: expanded from macro 'for_each_set_bit'
           for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                                                          ~~~  ^  ~~~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1627:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_driver.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:20:
>> include/linux/percpu-refcount.h:205:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_add(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:49:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:370:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:20:
   include/linux/percpu-refcount.h:244:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_add(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:101:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:370:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:30:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:20:
   include/linux/percpu-refcount.h:333:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_sub(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:33: note: expanded from macro 'this_cpu_sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:209:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:370:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:33:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:2168:
>> include/linux/vmstat.h:231:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:975:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:282:2: note: expanded from macro 'for_each_cpu'
           for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
           ^                ~~~                      ~~~~~~~~~~~~~~~~~~
   include/linux/find.h:559:70: note: expanded from macro 'for_each_set_bit'
           for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                                                          ~~~  ^  ~~~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:203:
>> include/linux/bio.h:401:14: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           if (sectors >= bio_sectors(bio))
               ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
>> include/linux/pagemap.h:813:36: warning: comparison of integers of different signs: 'unsigned long' and 'long' [-Wsign-compare]
           return index - folio_index(folio) < folio_nr_pages(folio);
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:52:
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h:31:
>> include/linux/pwm.h:335:50: warning: comparison of integers of different signs: 'u64' (aka 'unsigned long long') and 'int' [-Wsign-compare]
           if (state.duty_cycle == duty_ns && state.period == period_ns)
                                              ~~~~~~~~~~~~ ^  ~~~~~~~~~
   include/linux/pwm.h:335:23: warning: comparison of integers of different signs: 'u64' (aka 'unsigned long long') and 'int' [-Wsign-compare]
           if (state.duty_cycle == duty_ns && state.period == period_ns)
               ~~~~~~~~~~~~~~~~ ^  ~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:52:
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h:49:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_object.h:15:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:13:
   In file included from include/drm/ttm/ttm_bo.h:39:
   In file included from include/drm/ttm/ttm_device.h:30:
>> include/drm/ttm/ttm_resource.h:312:16: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for (i = 0; i < TTM_MAX_BO_PRIORITY; i++)
                       ~ ^ ~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_driver.c:52:
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h:49:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_object.h:16:
   In file included from drivers/gpu/drm/i915/i915_gem_gtt.h:14:
>> drivers/gpu/drm/i915/gt/intel_gtt.h:435:16: warning: comparison of integers of different signs: 'int' and 'unsigned long' [-Wsign-compare]
           if ((int)type >= ARRAY_SIZE(vm->min_alignment))
               ~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.
--
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:7:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:9:
>> include/linux/thread_info.h:240:29: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned long') [-Wsign-compare]
           if (unlikely(sz >= 0 && sz < bytes)) {
                                   ~~ ^ ~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:7:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1036:13: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           return cid == MM_CID_UNSET;
                  ~~~ ^  ~~~~~~~~~~~~
   include/linux/mm_types.h:1074:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_possible_cpu(i) {
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:974:36: note: expanded from macro 'for_each_possible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:282:2: note: expanded from macro 'for_each_cpu'
           for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
           ^                ~~~                      ~~~~~~~~~~~~~~~~~~
   include/linux/find.h:559:70: note: expanded from macro 'for_each_set_bit'
           for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                                                          ~~~  ^  ~~~~
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:7:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1627:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:7:
   In file included from include/linux/slab.h:20:
>> include/linux/percpu-refcount.h:205:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_add(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:28:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:370:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:7:
   In file included from include/linux/slab.h:20:
   include/linux/percpu-refcount.h:244:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_add(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:80:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:370:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:7:
   In file included from include/linux/slab.h:20:
   include/linux/percpu-refcount.h:333:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
                   this_cpu_sub(*percpu_count, nr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:33: note: expanded from macro 'this_cpu_sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:188:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:370:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                 ~~~  ^  ~~
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:14:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.h:10:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20:
   In file included from drivers/gpu/drm/i915/gt/intel_context_types.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2168:
>> include/linux/vmstat.h:231:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:975:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:282:2: note: expanded from macro 'for_each_cpu'
           for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
           ^                ~~~                      ~~~~~~~~~~~~~~~~~~
   include/linux/find.h:559:70: note: expanded from macro 'for_each_set_bit'
           for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                                                          ~~~  ^  ~~~~
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:14:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.h:12:
   In file included from drivers/gpu/drm/i915/gt/intel_context.h:14:
   In file included from drivers/gpu/drm/i915/i915_drv.h:37:
   In file included from include/drm/ttm/ttm_device.h:30:
>> include/drm/ttm/ttm_resource.h:312:16: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for (i = 0; i < TTM_MAX_BO_PRIORITY; i++)
                       ~ ^ ~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drm_client.c:14:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.h:12:
   In file included from drivers/gpu/drm/i915/gt/intel_context.h:14:
   In file included from drivers/gpu/drm/i915/i915_drv.h:46:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:14:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_object.h:16:
   In file included from drivers/gpu/drm/i915/i915_gem_gtt.h:14:
>> drivers/gpu/drm/i915/gt/intel_gtt.h:435:16: warning: comparison of integers of different signs: 'int' and 'unsigned long' [-Wsign-compare]
           if ((int)type >= ARRAY_SIZE(vm->min_alignment))
               ~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 warnings generated.
..


vim +240 include/linux/thread_info.h

b0377fedb65280 Al Viro   2017-06-29  235  
9dd819a15162f8 Kees Cook 2019-09-25  236  static __always_inline __must_check bool
b0377fedb65280 Al Viro   2017-06-29  237  check_copy_size(const void *addr, size_t bytes, bool is_source)
b0377fedb65280 Al Viro   2017-06-29  238  {
c80d92fbb67b2c Kees Cook 2021-06-17  239  	int sz = __builtin_object_size(addr, 0);
b0377fedb65280 Al Viro   2017-06-29 @240  	if (unlikely(sz >= 0 && sz < bytes)) {
b0377fedb65280 Al Viro   2017-06-29  241  		if (!__builtin_constant_p(bytes))
b0377fedb65280 Al Viro   2017-06-29  242  			copy_overflow(sz, bytes);
b0377fedb65280 Al Viro   2017-06-29  243  		else if (is_source)
b0377fedb65280 Al Viro   2017-06-29  244  			__bad_copy_from();
b0377fedb65280 Al Viro   2017-06-29  245  		else
b0377fedb65280 Al Viro   2017-06-29  246  			__bad_copy_to();
b0377fedb65280 Al Viro   2017-06-29  247  		return false;
b0377fedb65280 Al Viro   2017-06-29  248  	}
6d13de1489b6bf Kees Cook 2019-12-04  249  	if (WARN_ON_ONCE(bytes > INT_MAX))
6d13de1489b6bf Kees Cook 2019-12-04  250  		return false;
b0377fedb65280 Al Viro   2017-06-29  251  	check_object_size(addr, bytes, is_source);
b0377fedb65280 Al Viro   2017-06-29  252  	return true;
b0377fedb65280 Al Viro   2017-06-29  253  }
b0377fedb65280 Al Viro   2017-06-29  254  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
