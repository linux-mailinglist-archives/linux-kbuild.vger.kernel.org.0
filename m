Return-Path: <linux-kbuild+bounces-7319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84474AC9DF7
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 09:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79E133B14C4
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 07:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7609618DB14;
	Sun,  1 Jun 2025 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ass8kz2I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C117ADF8;
	Sun,  1 Jun 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748762856; cv=none; b=poxcV19rJZREf0gSooEmnOUogLfMLqbhN4k0L29Fvs8p5SBHM8oeRxYRlOcDRIsTaNaloygGDG9zTJ/kJrTWAa7Z34/QcJcSNt34SehOZJ3LSwat8GT7xrbjPvHqtOA/4Rc0XXgcHMjSIh+9Kt29UwUrJvuNKLX1VcInd7mLCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748762856; c=relaxed/simple;
	bh=TSIGAsRYaW85cdl+wamftWOl+ellU2bWsRYBQ2l+1+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMX8bBp/jpV7zViBK18usfWj+AGGBX2qOtuhB9SwUeAGc7wvcSXV1ALb615TaIW7BHDXqdUUFj2lxIT32k4UZWZDLiwTJd73kPY+w/Fa0mvL4oZRH6e33XkWdUcaE7LLZsJk9sTSufzVOgGO7PKXc2VAHdrDNWYO6tXuTEF988I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ass8kz2I; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748762853; x=1780298853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TSIGAsRYaW85cdl+wamftWOl+ellU2bWsRYBQ2l+1+c=;
  b=Ass8kz2IIx14w6CZ1t3ucdNID2Ko2rVLdBscQ78Vd24c/HSbIkxjDTDH
   mRJnHPfd0THzpSq6KnQ90Dbk4Wv0LlGty3PArRKdKWxJ2MQ/PFDiuqSg/
   kfiHypaWh5d3vijTHBpdcQN4Ge2wilXHpLGqjZMne1YyF9m+4YqLMMh92
   9C6iNHVDjCzbXhb+amhq/gw4HUGcAw/1OLEZrCQ5HKHIqVCgdcWo+utrU
   4m72nmSbYveRmDl4fEZrB6iZgUupNCRvdpA0zKrol3kLKtZs9croyI5ZY
   yge/ode41phmQMhuRUHdEXBGG9xnbAgMHwoReeW7BRFYEwPg71DHQGwNU
   A==;
X-CSE-ConnectionGUID: jgxUAdFBTeqTUPUdRP49aQ==
X-CSE-MsgGUID: qeuMTRbeRraQPCpS4c8kFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50672997"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="50672997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 00:27:33 -0700
X-CSE-ConnectionGUID: 9Ot9ppksRUCULTzU/oFn4w==
X-CSE-MsgGUID: tFsjKZ0IQYChMml0V9Ujqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="149296680"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jun 2025 00:27:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLd6O-000Yqm-38;
	Sun, 01 Jun 2025 07:27:28 +0000
Date: Sun, 1 Jun 2025 15:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/3] scripts/misc-check: check missing #include
 <linux/export.h>
Message-ID: <202506011554.4QOxHuBb-lkp@intel.com>
References: <20250531183217.3844357-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531183217.3844357-2-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/scripts-misc-check-check-missing-include-linux-export-h/20250601-023341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250531183217.3844357-2-masahiroy%40kernel.org
patch subject: [PATCH 2/3] scripts/misc-check: check missing #include <linux/export.h>
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250601/202506011554.4QOxHuBb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506011554.4QOxHuBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506011554.4QOxHuBb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> grep: arch/alpha/kernel/core_irongate.c: No such file or directory
>> grep: arch/alpha/kernel/core_marvel.c: No such file or directory
>> grep: arch/alpha/kernel/core_titan.c: No such file or directory
>> grep: arch/alpha/kernel/core_tsunami.c: No such file or directory
>> grep: arch/alpha/kernel/io.c: No such file or directory
>> grep: arch/alpha/kernel/irq_alpha.c: No such file or directory
>> grep: arch/alpha/kernel/machvec_impl.h: No such file or directory
>> grep: arch/alpha/kernel/pci.c: No such file or directory
>> grep: arch/alpha/kernel/pci_iommu.c: No such file or directory
>> grep: arch/alpha/kernel/process.c: No such file or directory
>> grep: arch/alpha/kernel/setup.c: No such file or directory
>> grep: arch/alpha/kernel/smp.c: No such file or directory
>> grep: arch/alpha/kernel/time.c: No such file or directory
>> grep: arch/alpha/kernel/traps.c: No such file or directory
>> grep: arch/alpha/lib/checksum.c: No such file or directory
>> grep: arch/alpha/lib/csum_partial_copy.c: No such file or directory
>> grep: arch/alpha/lib/fls.c: No such file or directory
>> grep: arch/alpha/lib/fpreg.c: No such file or directory
>> grep: arch/alpha/lib/memcpy.c: No such file or directory
>> grep: arch/alpha/lib/udelay.c: No such file or directory
   grep: arch/arc/kernel/arcksyms.c: No such file or directory
   grep: arch/arc/kernel/intc-compact.c: No such file or directory
   grep: arch/arc/kernel/process.c: No such file or directory
   grep: arch/arc/kernel/reset.c: No such file or directory
   grep: arch/arc/kernel/smp.c: No such file or directory
   grep: arch/arc/kernel/stacktrace.c: No such file or directory
   grep: arch/arc/kernel/unwind.c: No such file or directory
   grep: arch/arc/mm/cache.c: No such file or directory
   grep: arch/arc/mm/init.c: No such file or directory
   grep: arch/arc/mm/ioremap.c: No such file or directory
   grep: arch/arm/common/bL_switcher.c: No such file or directory
   grep: arch/arm/common/krait-l2-accessors.c: No such file or directory
   grep: arch/arm/common/locomo.c: No such file or directory
   grep: arch/arm/common/mcpm_entry.c: No such file or directory
   grep: arch/arm/common/sa1111.c: No such file or directory
   grep: arch/arm/common/scoop.c: No such file or directory
   grep: arch/arm/common/sharpsl_param.c: No such file or directory
   grep: arch/arm/crypto/aes-cipher-glue.c: No such file or directory
   grep: arch/arm/crypto/blake2s-glue.c: No such file or directory
   grep: arch/arm/crypto/chacha-glue.c: No such file or directory
   grep: arch/arm/crypto/curve25519-glue.c: No such file or directory
   grep: arch/arm/crypto/poly1305-glue.c: No such file or directory
   grep: arch/arm/crypto/sha1_glue.c: No such file or directory
   grep: arch/arm/crypto/sha256_glue.c: No such file or directory
   grep: arch/arm/kernel/armksyms.c: No such file or directory
   grep: arch/arm/kernel/bios32.c: No such file or directory
   grep: arch/arm/kernel/cacheinfo.c: No such file or directory
   grep: arch/arm/kernel/dma.c: No such file or directory
   grep: arch/arm/kernel/elf.c: No such file or directory
   grep: arch/arm/kernel/fiq.c: No such file or directory
   grep: arch/arm/kernel/io.c: No such file or directory
   grep: arch/arm/kernel/opcodes.c: No such file or directory
   grep: arch/arm/kernel/process.c: No such file or directory
   grep: arch/arm/kernel/reboot.c: No such file or directory
   grep: arch/arm/kernel/return_address.c: No such file or directory
   grep: arch/arm/kernel/setup.c: No such file or directory
   grep: arch/arm/kernel/stacktrace.c: No such file or directory
   grep: arch/arm/kernel/tcm.c: No such file or directory
   grep: arch/arm/kernel/time.c: No such file or directory
   grep: arch/arm/kernel/traps.c: No such file or directory
   grep: arch/arm/kernel/unwind.c: No such file or directory
   grep: arch/arm/lib/crc-t10dif-glue.c: No such file or directory
   grep: arch/arm/lib/crc32-glue.c: No such file or directory
   grep: arch/arm/lib/delay.c: No such file or directory
   grep: arch/arm/lib/xor-neon.c: No such file or directory
   grep: arch/arm/mach-at91/pm.c: No such file or directory
   grep: arch/arm/mach-davinci/common.c: No such file or directory
   grep: arch/arm/mach-davinci/sram.c: No such file or directory
   grep: arch/arm/mach-footbridge/common.c: No such file or directory
   grep: arch/arm/mach-footbridge/netwinder-hw.c: No such file or directory
   grep: arch/arm/mach-imx/cpu-imx25.c: No such file or directory
   grep: arch/arm/mach-imx/cpu-imx27.c: No such file or directory
   grep: arch/arm/mach-imx/cpu-imx31.c: No such file or directory
   grep: arch/arm/mach-imx/cpu-imx35.c: No such file or directory
   grep: arch/arm/mach-imx/cpu-imx5.c: No such file or directory
   grep: arch/arm/mach-imx/cpuidle-imx6q.c: No such file or directory
   grep: arch/arm/mach-imx/irq-common.c: No such file or directory
   grep: arch/arm/mach-imx/ssi-fiq-ksym.c: No such file or directory
   grep: arch/arm/mach-lpc32xx/common.c: No such file or directory
   grep: arch/arm/mach-lpc32xx/serial.c: No such file or directory
   grep: arch/arm/mach-mmp/common.c: No such file or directory
   grep: arch/arm/mach-omap1/board-sx1.c: No such file or directory
   grep: arch/arm/mach-omap1/id.c: No such file or directory
   grep: arch/arm/mach-omap1/io.c: No such file or directory
   grep: arch/arm/mach-omap1/mux.c: No such file or directory
   grep: arch/arm/mach-omap1/ocpi.c: No such file or directory
   grep: arch/arm/mach-omap1/omap-dma.c: No such file or directory
   grep: arch/arm/mach-omap2/id.c: No such file or directory
   grep: arch/arm/mach-pxa/generic.c: No such file or directory
   grep: arch/arm/mach-pxa/pm.c: No such file or directory
   grep: arch/arm/mach-pxa/pxa27x.c: No such file or directory
   grep: arch/arm/mach-rpc/ecard.c: No such file or directory
   grep: arch/arm/mach-s3c/dev-audio-s3c64xx.c: No such file or directory
   grep: arch/arm/mach-s3c/gpio-samsung.c: No such file or directory
   grep: arch/arm/mach-sa1100/assabet.c: No such file or directory
   grep: arch/arm/mach-sa1100/jornada720_ssp.c: No such file or directory
   grep: arch/arm/mach-sa1100/neponset.c: No such file or directory
   grep: arch/arm/mach-sa1100/ssp.c: No such file or directory
   grep: arch/arm/mach-zynq/platsmp.c: No such file or directory
   grep: arch/arm/mm/dma-mapping.c: No such file or directory
   grep: arch/arm/mm/flush.c: No such file or directory
   grep: arch/arm/mm/init.c: No such file or directory
   grep: arch/arm/mm/iomap.c: No such file or directory
   grep: arch/arm/mm/ioremap.c: No such file or directory
   grep: arch/arm/mm/mmu.c: No such file or directory
   grep: arch/arm/mm/nommu.c: No such file or directory
   grep: arch/arm/mm/physaddr.c: No such file or directory
   grep: arch/arm/mm/proc-syms.c: No such file or directory
   grep: arch/arm/plat-orion/gpio.c: No such file or directory
   grep: arch/arm/probes/decode-arm.c: No such file or directory
   grep: arch/arm/probes/decode-thumb.c: No such file or directory
   grep: arch/arm/vfp/vfpmodule.c: No such file or directory
   grep: arch/arm/xen/enlighten.c: No such file or directory
   grep: arch/arm/xen/p2m.c: No such file or directory
   grep: arch/arm64/crypto/aes-ce-glue.c: No such file or directory
   grep: arch/arm64/crypto/aes-glue.c: No such file or directory
   grep: arch/arm64/crypto/chacha-neon-glue.c: No such file or directory
   grep: arch/arm64/crypto/poly1305-glue.c: No such file or directory
   grep: arch/arm64/crypto/sha256-glue.c: No such file or directory
   grep: arch/arm64/crypto/sha512-glue.c: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

