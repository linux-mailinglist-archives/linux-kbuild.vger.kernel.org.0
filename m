Return-Path: <linux-kbuild+bounces-11496-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEziNDNKpGkIcwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-11496-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 15:16:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A061D028B
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 15:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B06300EFBC
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Mar 2026 14:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2E431716E;
	Sun,  1 Mar 2026 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4jcPH2U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF47309EFB;
	Sun,  1 Mar 2026 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772374577; cv=none; b=dU9l3DdbJu78QWVEbuSqKiZZhyE9iR8ypKNxoDV3rJWgV44unVdYsZ1+bRLMEzvQXcQm/yomlBgPDiYq9lAYRmViz4Cs4sTtgpohxbqYywidKo1esUew/LsqbVtU1OzTMV711pVd1arBByKh+kBkt/dKBYeWSg3BHuUflUyXFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772374577; c=relaxed/simple;
	bh=dfEnPFfxtkhujtcgTVsN8yWIY1QCr6Cpl/Oxj5eBJbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrdHn22SuZnJCgBzTwSmTvbjnTilCjthgfroa9kx1/RRX5VtSFoS9rZlxmLjeqX+E8jdwYzhs8mFM0y69f6JLwJ4VCIbERPameGfnNuhKj9dHcR6HSzRSAJXJBuYM5F3LIoSsG3nSl/VSSRisb6mDB5bRZbBdUVFAnbCRbcDKAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4jcPH2U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772374574; x=1803910574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dfEnPFfxtkhujtcgTVsN8yWIY1QCr6Cpl/Oxj5eBJbE=;
  b=b4jcPH2UDLscrq1NUKtuer4dcvpS42Sc3jSOXXnbjM0aA6lzv085tDJw
   lYk1GdBOGilPw9YbmosWV9gFgDvxrX1GfyS8FBxQy9fKkoZn5fZY5SIqP
   Zwg9pC0xxt6XvoqLdmlLvd4FFPhH3YoZGFfQ7xW78qaHN0vp0duYqc9FA
   j1/kX9I570h4zrb2wO8f2FpvhB+Cgj2hHfcFtXe6TJ9eoQQdBTlzLve2Z
   +HTyNmHO0eeL6HlHw4eYGNtJcBSU8uyyar/XZKMxP69kKVyy2h0jZhKso
   kBCLKFsfPvwtfllX7qPsube42KPwUglNiMGSIs7r9GvK8WDsbIqBNpub0
   A==;
X-CSE-ConnectionGUID: pA45o15bQdiO9MtJBQaRRg==
X-CSE-MsgGUID: 6UMkHBs5S7SrbonoO0bjzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77005506"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="77005506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 06:16:14 -0800
X-CSE-ConnectionGUID: JtOZPkQMQdKIhfgsIWC4ig==
X-CSE-MsgGUID: C1jpVu+LR6ykDoO3jlz+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="215098650"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Mar 2026 06:16:11 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwhaa-000000001Ur-41nk;
	Sun, 01 Mar 2026 14:16:08 +0000
Date: Sun, 1 Mar 2026 22:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Xingjing Deng <micro6947@gmail.com>, nathan@kernel.org, nsc@kernel.org,
	rdunlap@infradead.org, masahiroy@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xingjing Deng <micro6947@gmail.com>
Subject: Re: [PATCH v2] kconfig: fix potential NULL pointer dereference in
 conf_askvalue()
Message-ID: <202603012239.PzfGASyC-lkp@intel.com>
References: <20260301053035.1950087-1-micro6947@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301053035.1950087-1-micro6947@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11496-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44A061D028B
X-Rspamd-Action: no action

Hi Xingjing,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on masahiroy-kbuild/for-next masahiroy-kbuild/fixes v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xingjing-Deng/kconfig-fix-potential-NULL-pointer-dereference-in-conf_askvalue/20260301-133159
base:   linus/master
patch link:    https://lore.kernel.org/r/20260301053035.1950087-1-micro6947%40gmail.com
patch subject: [PATCH v2] kconfig: fix potential NULL pointer dereference in conf_askvalue()
config: x86_64-kexec (attached as .config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603012239.PzfGASyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603012239.PzfGASyC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/kconfig/conf.c:300:22: error: expected ')'
     300 |                 printf("%s\n", def :? "");
         |                                    ^
   scripts/kconfig/conf.c:300:9: note: to match this '('
     300 |                 printf("%s\n", def :? "");
         |                       ^
   scripts/kconfig/conf.c:308:23: error: expected ')'
     308 |                         printf("%s\n", def :? "");
         |                                            ^
   scripts/kconfig/conf.c:308:10: note: to match this '('
     308 |                         printf("%s\n", def :? "");
         |                               ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/conf.o] Error 1
   make[3]: Target 'oldconfig' not remade because of errors.
   make[2]: *** [Makefile:746: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> scripts/kconfig/conf.c:300:22: error: expected ')'
     300 |                 printf("%s\n", def :? "");
         |                                    ^
   scripts/kconfig/conf.c:300:9: note: to match this '('
     300 |                 printf("%s\n", def :? "");
         |                       ^
   scripts/kconfig/conf.c:308:23: error: expected ')'
     308 |                         printf("%s\n", def :? "");
         |                                            ^
   scripts/kconfig/conf.c:308:10: note: to match this '('
     308 |                         printf("%s\n", def :? "");
         |                               ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/conf.o] Error 1
   make[3]: Target 'olddefconfig' not remade because of errors.
   make[2]: *** [Makefile:746: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +300 scripts/kconfig/conf.c

   290	
   291	static int conf_askvalue(struct symbol *sym, const char *def)
   292	{
   293		if (!sym_has_value(sym))
   294			printf("(NEW) ");
   295	
   296		line[0] = '\n';
   297		line[1] = 0;
   298	
   299		if (!sym_is_changeable(sym)) {
 > 300			printf("%s\n", def :? "");
   301			return 0;
   302		}
   303	
   304		switch (input_mode) {
   305		case oldconfig:
   306		case syncconfig:
   307			if (sym_has_value(sym)) {
   308				printf("%s\n", def :? "");
   309				return 0;
   310			}
   311			/* fall through */
   312		default:
   313			fflush(stdout);
   314			xfgets(line, sizeof(line), stdin);
   315			break;
   316		}
   317	
   318		return 1;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

