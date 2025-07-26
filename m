Return-Path: <linux-kbuild+bounces-8195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3127B12A20
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 12:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA4D4E6159
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 10:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1605C242935;
	Sat, 26 Jul 2025 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCqPe9SH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8450323F417;
	Sat, 26 Jul 2025 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753526254; cv=none; b=TtzmnrpUOSBPrnxB0jWALM68FJiWJFzyGb+TvHf0kOIX5hL6/ME8zp46v++vXT8DYXeAw1IijugQRPwHzbdTF9g43FQyyScVM7zREg3stRXMAt61sys459vA3ei4/qO81SQ9X+jjLOIBwqASjMf+t03XhGdE/pUyQaDkfxH2CbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753526254; c=relaxed/simple;
	bh=vo5MJkjAfYI/OCY1QVvQzWRjvyqTgOOz6i7fhoJvwB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAlmXfWuKVjQk6mMNPvvW1pzmfcRpf2jIG/8dtGGNTuybWWue7NrwltH25oEDMidVUWsOe631hA7QOZAcQXpQIhcfTauwbvKDRSukrXLWV+McLNk1SZzvlUfU54dHWhvTRBcvzpcuyIt0rKV13aJRiJPcrJjY7PMZIpwpcl31vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCqPe9SH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753526253; x=1785062253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vo5MJkjAfYI/OCY1QVvQzWRjvyqTgOOz6i7fhoJvwB8=;
  b=SCqPe9SH3m2I38LKLqotDY04cUz2YF1uCvBZbQitU46nvUDfZo+Pb9MO
   Rz3A/xjl+fnF1/pTCEdKbxeMPOKUasfPWSBl5rOAvfw/Y74ZQmO/KSPdH
   mZ4z8gniUjqid1M1Cq0AB1w3KGLdYYhRKEG43SJhdIoeIs9yoEsM05/kN
   chjsiH5exsAB9NfRHcII0IsVUvltXlbc+tbS+nXK6gK9d7eAj7V6x/ZTF
   kDGea9yLkxSrgrN6TKL9Wj8K1dTd6LXcMVG1r6dZyaEhuUDBDLZA0IF7P
   NdA26Iy2EjHT+wtbmQFkLuGhwGluDQMotfJq2i4IYCm4MySaaQORqfEyN
   A==;
X-CSE-ConnectionGUID: 9ctrnIN8Sv+l0libsN7Ziw==
X-CSE-MsgGUID: nuy2cMQBS4u7RdbKW//LLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55704398"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55704398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:37:31 -0700
X-CSE-ConnectionGUID: ncmExNasR5e06hxL51eTVw==
X-CSE-MsgGUID: qct0OuocQruFVFyGmStVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161413943"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2025 03:37:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcHM-000Lsr-31;
	Sat, 26 Jul 2025 10:37:24 +0000
Date: Sat, 26 Jul 2025 18:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v5 2/3] tracing: Add a tracepoint verification check at
 build time
Message-ID: <202507261823.mtwUpXNM-lkp@intel.com>
References: <20250725025213.342188378@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725025213.342188378@kernel.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes trace/for-next arnd-asm-generic/master linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/sorttable-Move-ELF-parsing-into-scripts-elf-parse-ch/20250725-105526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250725025213.342188378%40kernel.org
patch subject: [PATCH v5 2/3] tracing: Add a tracepoint verification check at build time
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250726/202507261823.mtwUpXNM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261823.mtwUpXNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261823.mtwUpXNM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/tracepoint-update.c:106:6: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     106 |         int count = 0;
         |             ^
   1 warning generated.
--
>> scripts/tracepoint-update.c:106:6: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     106 |         int count = 0;
         |             ^
   1 warning generated.


vim +/count +106 scripts/tracepoint-update.c

   102	
   103	static void check_tracepoints(struct elf_tracepoint *etrace)
   104	{
   105		Elf_Ehdr *ehdr = etrace->ehdr;
 > 106		int count = 0;
   107		int len;
   108	
   109		if (!etrace->array)
   110			return;
   111	
   112		for_each_shdr_str(len, ehdr, tracepoint_data_sec) {
   113			if (!len)
   114				continue;
   115			if (!find_event(str, etrace->array, etrace->count)) {
   116				fprintf(stderr, "warning: tracepoint '%s' is unused.\n", str);
   117			}
   118			count++;
   119		}
   120	
   121		free(etrace->array);
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

