Return-Path: <linux-kbuild+bounces-4629-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F549C3C24
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ACED1C21AE8
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 10:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDAB185B47;
	Mon, 11 Nov 2024 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+kUb3zD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5870E1586C8;
	Mon, 11 Nov 2024 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731321434; cv=none; b=rgHkt21R7ixQ1SvAyGWrIYr8Ho6nbktiHnzz7z0IZ9obWKyGv1+tfVtmQUpElbV608HbRK3pIt08iPzTHuXZjUcsj3AppIgazT1qRoPKs+d+TwOBPaDtoZWfC8sYtiZ36qO/ipCOwkel4jCHoiih/zKsYed85K1tfLiIPHnnvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731321434; c=relaxed/simple;
	bh=lbBtDcDQ9kheWZRjMZF8X46phct9ThmwwCKiRgasnlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e03vD5QQZ8Ud5QwxBFnu8Lnsr935QZM/M8ewRUIg7cM0jBptA4+syg7k5k+b/NNzmIGph4GpHITB7EoJ6sc1LvS6xHjsP5YgLqttwzaFcNz9FqKhQZ0xvvgTsRciTeGXxik6kxJkj2gA6ni22wTJHz5O+4r/pv4fhm35GPgMHXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+kUb3zD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731321433; x=1762857433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lbBtDcDQ9kheWZRjMZF8X46phct9ThmwwCKiRgasnlw=;
  b=h+kUb3zDsLhjEJQx+Ie6AjOMrhLL+YpNS1DkRaqs4eqtTVHkSZh60pzt
   G779AeHwij61/bzFq0DZtYvvBgadfzzmP6YhSkK0CofMW/9PvQOW1i2ph
   iYXZeVWv/UNexzfxq5tu+2nU0scIJ1igKTYtLx9FebTmFZEpC7d62lXpA
   WUYaulY/QMLqCmBdRDSayzE57wuNSJXD72tD0Z5qu754nNnpsB5vj2hMp
   /4aPcgQhVtNuTs4ZAH6GZFcVLmRk+e4rcSIG5SHTv1Kak9NVJmTvqiJtI
   TcNaRnkDbVtho9eNjGIXOuSgFWW8svuRvbMz49og/GoCj+g4U5uOXkNZ/
   A==;
X-CSE-ConnectionGUID: DFFMxdGrQB6WNgW/Ohi5iA==
X-CSE-MsgGUID: pv8/KionTG+CxRChOrCD9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41736486"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41736486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 02:37:12 -0800
X-CSE-ConnectionGUID: 7xxRbpz/To+LaU8KVyt60w==
X-CSE-MsgGUID: 3KYomZw+R7urgEfELjxcIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="124420917"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2024 02:37:08 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tARn7-0000BT-0h;
	Mon, 11 Nov 2024 10:37:05 +0000
Date: Mon, 11 Nov 2024 18:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	netdev <netdev@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kbuild@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Message-ID: <202411111817.tgnRn8v3-lkp@intel.com>
References: <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 774ca6d3bf24287ff60b7d6dd4171ebb6e47760a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/lib-packing-create-__pack-and-__unpack-variants-without-error-checking/20241111-161131
base:   774ca6d3bf24287ff60b7d6dd4171ebb6e47760a
patch link:    https://lore.kernel.org/r/20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7%40intel.com
patch subject: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and unpack_fields()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241111/202411111817.tgnRn8v3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111817.tgnRn8v3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111817.tgnRn8v3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/mod/packed_fields.c:135:29: warning: format specifies type 'unsigned int' but the argument has type 'Elf64_Xword' (aka 'unsigned long') [-Wformat]
     134 |                 error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
         |                                                ~~
         |                                                %lu
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ^~~~~~~~~~~~
   scripts/mod/modpost.h:207:54: note: expanded from macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ~~~    ^~~~
   1 warning generated.
--
>> scripts/mod/packed_fields.c:135:29: warning: format specifies type 'unsigned int' but the argument has type 'Elf64_Xword' (aka 'unsigned long') [-Wformat]
     134 |                 error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
         |                                                ~~
         |                                                %lu
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ^~~~~~~~~~~~
   scripts/mod/modpost.h:207:54: note: expanded from macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ~~~    ^~~~
   1 warning generated.
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +135 scripts/mod/packed_fields.c

    99	
   100	void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
   101					Elf_Sym *sym, const char *symname)
   102	{
   103		unsigned int secindex = get_secindex(info, sym);
   104		struct packed_field_elem elem = {}, prev = {};
   105		enum element_order order = FIRST_ELEMENT;
   106		enum field_type type = UNKNOWN_SECTION;
   107		size_t field_size, count;
   108		const void *data, *ptr;
   109		const char *section;
   110	
   111		/* Skip symbols without a name */
   112		if (*symname == '\0')
   113			return;
   114	
   115		/* Skip symbols with invalid sections */
   116		if (secindex >= info->num_sections)
   117			return;
   118	
   119		section = sec_name(info, secindex);
   120	
   121		if (strcmp(section, ".rodata.packed_fields_s") == 0)
   122			type = PACKED_FIELD_S;
   123		else if (strcmp(section, ".rodata.packed_fields_m") == 0)
   124			type = PACKED_FIELD_M;
   125	
   126		/* Other sections don't relate to packed fields */
   127		if (type == UNKNOWN_SECTION)
   128			return;
   129	
   130		field_size = field_type_to_size(type);
   131	
   132		/* check that the data is a multiple of the size */
   133		if (sym->st_size % field_size != 0) {
   134			error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
 > 135			      mod->name, symname, sym->st_size, field_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

