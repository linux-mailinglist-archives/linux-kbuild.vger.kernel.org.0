Return-Path: <linux-kbuild+bounces-12619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDEfH/fLzmntqAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12619-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:05:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316638DDCE
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 749F03020035
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 20:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04005384232;
	Thu,  2 Apr 2026 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/CX681n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFA361DD9;
	Thu,  2 Apr 2026 20:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775160269; cv=none; b=Di/T05xyolrW3pJLBFdPjKyygi3MXpaQTCS7sVp2V6MkzxnPtxSjXZOeonLHt3vZSDr41u/2xinvjH9NNwV3DuGkhZL6uxbP5X2hSxp5b6JVqnmvZEO82CqDHATSqKOSU9OLx3VaujqClvpj5ciM/jh1vT2nvCly0bl2qn2cVe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775160269; c=relaxed/simple;
	bh=4qv2zdPZEgT5oC3SiH+LBfJp4zAyy2TSrWtsJir3Quk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSp0eSSPSmM0DKTsqepCodLu5HECKYBv+IZOvtLLEiwusWw/rRAUrCWnGV+K3KVmgr5uyDWAAgZ75TCzBugLOUQgBY/9sR0U+wyiN6ASp9XqRJLOXVzSN98gATgMoGh+RuJmux6Ryi6rFTN272hnSfV3ARL0fO2cJbPIZh2GY5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/CX681n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775160268; x=1806696268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4qv2zdPZEgT5oC3SiH+LBfJp4zAyy2TSrWtsJir3Quk=;
  b=i/CX681n/aRE7twk8zhWuuhn+vx/XrpNioMiuyZeMf5m1odZwhyBaRCe
   3vlloJxkXJgd0DJQ/QOY1JIv7zLII60iQUN2gllIE/YtDqFPho0hHXUS5
   L0jG0V7xldG+nEnHDGxyUSoUnCjSI3t1d8uc4+CkXpSOg8x8f1ZuKAKJT
   iHHC5wCaQM9fR+EKEUnipYaTU9WouZklxJ2WGxiimGqN/cYgsXteYBvSZ
   Q1RRXyC3d+ddVeHtKpchEcuafraORLZViKzSa34BUUPSdR6YHq2rSvz3r
   xD9HQryaBRAN07q0XQEiGofJoXq6L1aQLftRN2YfO1dULLf2ZsAV7AnBZ
   Q==;
X-CSE-ConnectionGUID: 2shTMeNiSiqZf2QF0VyRDQ==
X-CSE-MsgGUID: W4RfLMWpQuWr8Ewi/wpCpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75947953"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75947953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 13:04:27 -0700
X-CSE-ConnectionGUID: 9eC3JQUSTwuyBMZyfVDRig==
X-CSE-MsgGUID: 5SWOeqtHSpa8wjMW5l0r5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="231108937"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2026 13:04:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8OH8-0000000098H-2Lhf;
	Thu, 02 Apr 2026 20:04:22 +0000
Date: Thu, 2 Apr 2026 22:04:11 +0200
From: kernel test robot <lkp@intel.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	ritesh.list@gmail.com, arnd@arndb.de, chleroy@kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v3] char: nvram: Remove unused nvram_mutex to fix
 -Wunused-variable warning
Message-ID: <202604022248.LErLuuXd-lkp@intel.com>
References: <20260330062201.2581-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330062201.2581-1-venkat88@linux.ibm.com>
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
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.ozlabs.org,linux.ibm.com,gmail.com,arndb.de,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12619-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 0316638DDCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Venkat,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v7.0-rc6 next-20260402]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Venkat-Rao-Bagalkote/char-nvram-Remove-unused-nvram_mutex-to-fix-Wunused-variable-warning/20260330-234134
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260330062201.2581-1-venkat88%40linux.ibm.com
patch subject: [PATCH v3] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable warning
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260402/202604022248.LErLuuXd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022248.LErLuuXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022248.LErLuuXd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/nvram.c: In function 'nvram_misc_ioctl':
>> drivers/char/nvram.c:327:37: error: 'nvram_mutex' undeclared (first use in this function)
     327 |                         mutex_lock(&nvram_mutex);
         |                                     ^~~~~~~~~~~
   drivers/char/nvram.c:327:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/nvram_mutex +327 drivers/char/nvram.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  278  
cb8d8006d43f22 Finn Thain          2019-01-15  279  static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
55929332c92e5d Arnd Bergmann       2010-04-27  280  			     unsigned long arg)
^1da177e4c3f41 Linus Torvalds      2005-04-16  281  {
2d58636e0af724 Finn Thain          2019-01-15  282  	long ret = -ENOTTY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  283  
^1da177e4c3f41 Linus Torvalds      2005-04-16  284  	switch (cmd) {
95ac14b8a32817 Finn Thain          2019-01-15  285  #ifdef CONFIG_PPC
95ac14b8a32817 Finn Thain          2019-01-15  286  	case OBSOLETE_PMAC_NVRAM_GET_OFFSET:
95ac14b8a32817 Finn Thain          2019-01-15  287  		pr_warn("nvram: Using obsolete PMAC_NVRAM_GET_OFFSET ioctl\n");
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  288  		fallthrough;
95ac14b8a32817 Finn Thain          2019-01-15  289  	case IOC_NVRAM_GET_OFFSET:
95ac14b8a32817 Finn Thain          2019-01-15  290  		ret = -EINVAL;
95ac14b8a32817 Finn Thain          2019-01-15  291  #ifdef CONFIG_PPC_PMAC
95ac14b8a32817 Finn Thain          2019-01-15  292  		if (machine_is(powermac)) {
95ac14b8a32817 Finn Thain          2019-01-15  293  			int part, offset;
95ac14b8a32817 Finn Thain          2019-01-15  294  
95ac14b8a32817 Finn Thain          2019-01-15  295  			if (copy_from_user(&part, (void __user *)arg,
95ac14b8a32817 Finn Thain          2019-01-15  296  					   sizeof(part)) != 0)
95ac14b8a32817 Finn Thain          2019-01-15  297  				return -EFAULT;
95ac14b8a32817 Finn Thain          2019-01-15  298  			if (part < pmac_nvram_OF || part > pmac_nvram_NR)
95ac14b8a32817 Finn Thain          2019-01-15  299  				return -EINVAL;
95ac14b8a32817 Finn Thain          2019-01-15  300  			offset = pmac_get_partition(part);
20e07af71f34d9 Finn Thain          2019-01-15  301  			if (offset < 0)
20e07af71f34d9 Finn Thain          2019-01-15  302  				return -EINVAL;
95ac14b8a32817 Finn Thain          2019-01-15  303  			if (copy_to_user((void __user *)arg,
95ac14b8a32817 Finn Thain          2019-01-15  304  					 &offset, sizeof(offset)) != 0)
95ac14b8a32817 Finn Thain          2019-01-15  305  				return -EFAULT;
95ac14b8a32817 Finn Thain          2019-01-15  306  			ret = 0;
95ac14b8a32817 Finn Thain          2019-01-15  307  		}
95ac14b8a32817 Finn Thain          2019-01-15  308  #endif
95ac14b8a32817 Finn Thain          2019-01-15  309  		break;
20e07af71f34d9 Finn Thain          2019-01-15  310  #ifdef CONFIG_PPC32
95ac14b8a32817 Finn Thain          2019-01-15  311  	case IOC_NVRAM_SYNC:
95ac14b8a32817 Finn Thain          2019-01-15  312  		if (ppc_md.nvram_sync != NULL) {
95ac14b8a32817 Finn Thain          2019-01-15  313  			mutex_lock(&nvram_mutex);
95ac14b8a32817 Finn Thain          2019-01-15  314  			ppc_md.nvram_sync();
95ac14b8a32817 Finn Thain          2019-01-15  315  			mutex_unlock(&nvram_mutex);
95ac14b8a32817 Finn Thain          2019-01-15  316  		}
95ac14b8a32817 Finn Thain          2019-01-15  317  		ret = 0;
95ac14b8a32817 Finn Thain          2019-01-15  318  		break;
20e07af71f34d9 Finn Thain          2019-01-15  319  #endif
95ac14b8a32817 Finn Thain          2019-01-15  320  #elif defined(CONFIG_X86) || defined(CONFIG_M68K)
^1da177e4c3f41 Linus Torvalds      2005-04-16  321  	case NVRAM_INIT:
^1da177e4c3f41 Linus Torvalds      2005-04-16  322  		/* initialize NVRAM contents and checksum */
^1da177e4c3f41 Linus Torvalds      2005-04-16  323  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds      2005-04-16  324  			return -EACCES;
^1da177e4c3f41 Linus Torvalds      2005-04-16  325  
2d58636e0af724 Finn Thain          2019-01-15  326  		if (arch_nvram_ops.initialize != NULL) {
613655fa39ff69 Arnd Bergmann       2010-06-02 @327  			mutex_lock(&nvram_mutex);
2d58636e0af724 Finn Thain          2019-01-15  328  			ret = arch_nvram_ops.initialize();
613655fa39ff69 Arnd Bergmann       2010-06-02  329  			mutex_unlock(&nvram_mutex);
2d58636e0af724 Finn Thain          2019-01-15  330  		}
2d58636e0af724 Finn Thain          2019-01-15  331  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  332  	case NVRAM_SETCKS:
^1da177e4c3f41 Linus Torvalds      2005-04-16  333  		/* just set checksum, contents unchanged (maybe useful after
^1da177e4c3f41 Linus Torvalds      2005-04-16  334  		 * checksum garbaged somehow...) */
^1da177e4c3f41 Linus Torvalds      2005-04-16  335  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds      2005-04-16  336  			return -EACCES;
^1da177e4c3f41 Linus Torvalds      2005-04-16  337  
2d58636e0af724 Finn Thain          2019-01-15  338  		if (arch_nvram_ops.set_checksum != NULL) {
613655fa39ff69 Arnd Bergmann       2010-06-02  339  			mutex_lock(&nvram_mutex);
2d58636e0af724 Finn Thain          2019-01-15  340  			ret = arch_nvram_ops.set_checksum();
613655fa39ff69 Arnd Bergmann       2010-06-02  341  			mutex_unlock(&nvram_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  342  		}
2d58636e0af724 Finn Thain          2019-01-15  343  		break;
95ac14b8a32817 Finn Thain          2019-01-15  344  #endif /* CONFIG_X86 || CONFIG_M68K */
2d58636e0af724 Finn Thain          2019-01-15  345  	}
2d58636e0af724 Finn Thain          2019-01-15  346  	return ret;
^1da177e4c3f41 Linus Torvalds      2005-04-16  347  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  348  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

