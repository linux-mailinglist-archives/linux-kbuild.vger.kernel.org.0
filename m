Return-Path: <linux-kbuild+bounces-4628-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A629C3BD3
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6655A1C21BD7
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D929156C69;
	Mon, 11 Nov 2024 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOQyFlMU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6515C15F;
	Mon, 11 Nov 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731320774; cv=none; b=c2OczSSpIIAI74EGvKNvV3uZkp5r0uQZ1ua2+iDZhs2OEYiVGC2wEK+0I9n2cML/TAow7CCLVI6j7hOKSkAuE5KeOpfsiTGx+6WI/Y0IEEpaLanPGuhw5RcVHg3dxAlCvXruabZDZuhwyU+oDRS1wp4wmOX6XqULpg8LdKO+jUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731320774; c=relaxed/simple;
	bh=APD2TjIxAvb8PHQKlfqdSkDm3jLyE2wTGiDrAbkSdZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atzOpWWqn5lpDARhfnpcyGUdpfY3ocLNKlSDLmKTlX7x2rtLvIRf59/gXOV0DtM0lLGjs3HUzcrioMe7gKTiMjsgd78BOpUGEVmjQOiDnQZi11r9oFmQKasxotXd3E7GAVWiZmSZTXRKAg74ra+dL3pv8FRaG5fkPFv9qZ6cB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOQyFlMU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731320771; x=1762856771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=APD2TjIxAvb8PHQKlfqdSkDm3jLyE2wTGiDrAbkSdZs=;
  b=SOQyFlMU3pvB5LamO75XwOxBAtQryiTd9n/FzeTSYFNYNFs8+lD5RGZx
   r8v8UMbOdrR3qbOdDd0oDrUzjRDtPMWVCpRcUBideJlEnI+mv4Ga9aDC+
   QHxr056fegGP6VWtGTHv0TLoDefAYtIadC7t7eCEq3aPUpmbtc65bhq6c
   Fk57SgDCwpocP/mEOhNdXOetuH5AYc0A6sbfg1V+m+o5NfldSD5vKlF6n
   Rj24P85WHPI8v1GQgtBArHEAswCTBt84GxC3UgPnShdJ7MMikTOTl/fEt
   +BpLu+j0XcAEqv345Y5S1Ex7Lo7/AHkSYmSaolOXZfHY9viAm8QnTAk5/
   Q==;
X-CSE-ConnectionGUID: 9Nmg9HE5TDiAuLQuJch18g==
X-CSE-MsgGUID: WXXgIlw3SxOILHhhHn9crA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31080894"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31080894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 02:26:10 -0800
X-CSE-ConnectionGUID: r9yjkMffQou478zgqlPq1w==
X-CSE-MsgGUID: DDTqgKjKTZK25QJi2u1k/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91369316"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2024 02:26:07 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tARcS-0000An-0A;
	Mon, 11 Nov 2024 10:26:04 +0000
Date: Mon, 11 Nov 2024 18:25:59 +0800
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
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kbuild@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Message-ID: <202411111823.Y2NHM1AE-lkp@intel.com>
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
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241111/202411111823.Y2NHM1AE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111823.Y2NHM1AE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111823.Y2NHM1AE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/mod/packed_fields.c:15:
   scripts/mod/packed_fields.c: In function 'handle_packed_field_symbol':
>> scripts/mod/packed_fields.c:134:23: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'Elf64_Xword' {aka 'long unsigned int'} [-Wformat=]
     134 |                 error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ~~~~~~~~~~~~
         |                                              |
         |                                              Elf64_Xword {aka long unsigned int}
   scripts/mod/modpost.h:207:51: note: in definition of macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ^~~
   scripts/mod/packed_fields.c:134:49: note: format string is defined here
     134 |                 error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
         |                                                ~^
         |                                                 |
         |                                                 unsigned int
         |                                                %lu
--
   In file included from scripts/mod/packed_fields.c:15:
   scripts/mod/packed_fields.c: In function 'handle_packed_field_symbol':
>> scripts/mod/packed_fields.c:134:23: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'Elf64_Xword' {aka 'long unsigned int'} [-Wformat=]
     134 |                 error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     135 |                       mod->name, symname, sym->st_size, field_size);
         |                                           ~~~~~~~~~~~~
         |                                              |
         |                                              Elf64_Xword {aka long unsigned int}
   scripts/mod/modpost.h:207:51: note: in definition of macro 'error'
     207 | #define error(fmt, args...)     modpost_log(true, fmt, ##args)
         |                                                   ^~~
   scripts/mod/packed_fields.c:134:49: note: format string is defined here
     134 |                 error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
         |                                                ~^
         |                                                 |
         |                                                 unsigned int
         |                                                %lu


vim +134 scripts/mod/packed_fields.c

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
 > 134			error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

