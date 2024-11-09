Return-Path: <linux-kbuild+bounces-4595-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8499C2A82
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 07:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256461F21F5E
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 06:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C279BC8FF;
	Sat,  9 Nov 2024 06:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAS/whhl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922A28E8;
	Sat,  9 Nov 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731133000; cv=none; b=fEtmVXFnqr5+7gjfb2gfZdbhS1yUb0ROu7oKmq4guEKENvqUIoDy+ZZDKJ2YqI7aTSDreLheZ9C3t862B98nERX5Y5/RFy8kfPy5lyYeaJJM/gw3WYlpXzAW5q3c7lACy2ilyJozeYtC7ud+/JHdEOx9+lyjytb842sl7JJk+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731133000; c=relaxed/simple;
	bh=rCuKDejdsh+8s+xtkSEN3tnnY5Jx/GJkZI24D8T2Azw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZs39srsA5aaOIvLFwUQT8jMKCNH7I0klXRM7vXmTzKCBrp7uFpcAz/QjiYX4LsYF9Fjhh4k6wenUT/RCdXtyoIqJpFRXhYUZr54r55L0i3IrOXuIbPz4uKXbC9I2QWZU1dFmOIdGaAnvgrBu6zMOmW7hynLfwwFpx3x1HB2QQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAS/whhl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731132999; x=1762668999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rCuKDejdsh+8s+xtkSEN3tnnY5Jx/GJkZI24D8T2Azw=;
  b=fAS/whhlTRwnx/+iCCZNr6diBdMO7Fc31QaAHHjZXcIyg7stUwN/jA+f
   yd7PY14hUbDIBpt70ZD1tE8jJpkg6Q3FZB+egwbRk7diGlN3sP2ssqoPT
   40eYPCXos7IRvSCWLYh/LqgibKEe93vUe5PIcA0ptrn8HZI6sAqwbjZYd
   xZwECr8wUpc7D094FMu+LOQLbT9eb1G//4BCevNKZe9/ySifZM2+0EacH
   by9A+03PG9fu7LaoJ8s23q1mb75nnBbCt+b3NS1ryRhmJwewAiIYibNqM
   9bq585cTsG+jD3ePIj0SAES3SyI6zzlv68SGTxyyH6zUGaHFCSGZCTXgV
   Q==;
X-CSE-ConnectionGUID: gHWCE44eSempxoQ6YLq/6g==
X-CSE-MsgGUID: Tm7OibiASDOGbfP5W0L0Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42118400"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42118400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 22:16:39 -0800
X-CSE-ConnectionGUID: 3ft4vDXRRYS9q09f2nN3/Q==
X-CSE-MsgGUID: Bu6AIph+QXCICCY1dtrNsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="85893822"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 22:16:35 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9elt-000s8G-0I;
	Sat, 09 Nov 2024 06:16:33 +0000
Date: Sat, 9 Nov 2024 14:16:26 +0800
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
Subject: Re: [PATCH net-next v4 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Message-ID: <202411091400.YHOiIq55-lkp@intel.com>
References: <20241108-packing-pack-fields-and-ice-implementation-v4-3-81a9f42c30e5@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-packing-pack-fields-and-ice-implementation-v4-3-81a9f42c30e5@intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a84e8c05f58305dfa808bc5465c5175c29d7c9b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/lib-packing-create-__pack-and-__unpack-variants-without-error-checking/20241109-093307
base:   a84e8c05f58305dfa808bc5465c5175c29d7c9b6
patch link:    https://lore.kernel.org/r/20241108-packing-pack-fields-and-ice-implementation-v4-3-81a9f42c30e5%40intel.com
patch subject: [PATCH net-next v4 3/9] lib: packing: add pack_fields() and unpack_fields()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241109/202411091400.YHOiIq55-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091400.YHOiIq55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091400.YHOiIq55-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/mod/packed_fields.c:135:29: warning: format specifies type 'size_t' (aka 'unsigned long') but the argument has type 'Elf32_Word' (aka 'unsigned int') [-Wformat]
     134 |                 error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",
         |                                                ~~~
         |                                                %u
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ^~~~~~~~~~~~
   scripts/mod/modpost.h:207:54: note: expanded from macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ~~~    ^~~~
   1 warning generated.
--
>> scripts/mod/packed_fields.c:135:29: warning: format specifies type 'size_t' (aka 'unsigned long') but the argument has type 'Elf32_Word' (aka 'unsigned int') [-Wformat]
     134 |                 error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",
         |                                                ~~~
         |                                                %u
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ^~~~~~~~~~~~
   scripts/mod/modpost.h:207:54: note: expanded from macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ~~~    ^~~~
   1 warning generated.


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
   134			error("[%s.ko] \"%s\" has size %zu which is not a multiple of the field size (%zu)\n",
 > 135			      mod->name, symname, sym->st_size, field_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

