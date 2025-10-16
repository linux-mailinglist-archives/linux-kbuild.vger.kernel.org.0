Return-Path: <linux-kbuild+bounces-9198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3ABE2FC1
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 12:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3230C4FC99A
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 10:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA1D30171D;
	Thu, 16 Oct 2025 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/YBsZO5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EF16132F;
	Thu, 16 Oct 2025 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760612124; cv=none; b=rIUQ/MaDcZ1QGsDr6/gctfcE03t7OEaMxqcNwQZj9cnUmoe0DpETbd3IP8cnpwmWGgYmCvaon5cvxJB5lJdCmT8TcOSJtQvtQ5zDn8w+3HOqw5K/faxPGlsh4j2DWpx9qX+NaiFCkQZPsc7C30bpx7JdXHgeCmDTXtVQY7H5F+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760612124; c=relaxed/simple;
	bh=+kiiKROK28TM5gnwbZCyi+ykIDPugSZOQFkBToxu0jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMeTQ6WXHOd2prfwKc+4zHPaawgUiTCwnYbAsMBaS+j+JlHNxBrBHRbdWMO2FNiSMaokeutABUi85QdlSfPk4vsUdC5GymvambxN2SvXFJp2W2Y9IUlLNLFOQEXVZVaNPlmO3ak2bmOnnVD4tyLu8apXr21/QxVdpLc45MCyV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/YBsZO5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760612123; x=1792148123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+kiiKROK28TM5gnwbZCyi+ykIDPugSZOQFkBToxu0jo=;
  b=C/YBsZO5Em33EEP7u1wcXv2MNQfPNEeVM7QXIiTjkG6D+vlBgMQ9LLXA
   9tuECriA9S9GN5L2Zamx3KmatKl+3ABMH2OitCVAohXWvIK6MLpp76R9f
   721KYO9F63Zhlg3vyYQA5kK7l5sDuImkiQf4B3doSfjIUJwwYesWgnyAm
   amuGctL4gQ4T6u3/j30/ZL31iSqCtMYwRW1pImSno/rA3l6TRZ3g3M1Ui
   ppu8FzKAuW9GqqRILu634bkNHEzg8gQdFyYip9+g5FGa1ChTBKDS7IFCl
   2FA8Ot8HKIPReOgsFKnvjJHQrdUG+J8MAoHDuDgq9vVUbZ6ZJPx4pFRNN
   A==;
X-CSE-ConnectionGUID: lus6fO+8T4KG+50/18+3vA==
X-CSE-MsgGUID: TNcgd+s1R0eQCVgLOghkTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="88270174"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="88270174"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:55:22 -0700
X-CSE-ConnectionGUID: 6Pwt631hROa6t2dloMedSQ==
X-CSE-MsgGUID: nVF/XZuOTxaj+SsEOmyH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182406928"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Oct 2025 03:55:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Ldb-0004il-1P;
	Thu, 16 Oct 2025 10:55:15 +0000
Date: Thu, 16 Oct 2025 18:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v9 4/4] tracing: Add warnings for unused tracepoints for
 modules
Message-ID: <202510161811.9iIH3K15-lkp@intel.com>
References: <20251015203924.731213165@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015203924.731213165@kernel.org>

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.18-rc1 next-20251015]
[cannot apply to trace/for-next arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/sorttable-Move-ELF-parsing-into-scripts-elf-parse-ch/20251016-044008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251015203924.731213165%40kernel.org
patch subject: [PATCH v9 4/4] tracing: Add warnings for unused tracepoints for modules
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20251016/202510161811.9iIH3K15-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161811.9iIH3K15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161811.9iIH3K15-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: ./scripts/tracepoint-update: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

