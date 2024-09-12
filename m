Return-Path: <linux-kbuild+bounces-3526-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776D97685C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 13:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A4651C23375
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA561A42A2;
	Thu, 12 Sep 2024 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U02Iawe7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CBF1A3AB2;
	Thu, 12 Sep 2024 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726141978; cv=none; b=YhGuM1hW5PkHRzwAb78OcssTnwOrhpjBPPOTg3NAc8q31619gZ7C5pu8MTUS+MRkbTEaFpN5MsSf/zpBNYPeFxKJ43h6Z5msnFQZ4CjPbiBDy7O+009S7nTzxAGS6QT5GPSWJuiQV1i68tRzz7cFVpXhUNi2gtdlppd4gIjl7DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726141978; c=relaxed/simple;
	bh=RYDm5Sxu5zrgBnEy4z/i2TH7rbJhd7Gc8K8TI0achpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tia7MuyD/1cUCbm1W35jvfxwXAX+XW6FyTHOog22nUgntM8ixDS3Y6LAxNLQjcxdV8wK78rpwVZga5SP3fc6veLi4quIR7KVnwbLRtdmOClnnQ3mwyktO4DZS6xsKe/OJasmE70CmfSiGI6qqgEcIAbrGKoDOFtsGmRmd7siCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U02Iawe7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726141977; x=1757677977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RYDm5Sxu5zrgBnEy4z/i2TH7rbJhd7Gc8K8TI0achpU=;
  b=U02Iawe7zR01roilk1f1SA/Bz2vDzdYnKhidnvc4Z3tWkFZRPsoDG6vn
   ao3P81VeiqayZAx37do1YtNiiJ1usypZukr0MBvDIrY+5Dmq50bkAF+zd
   VYIGub245ZsbBSL88lsBWxnRiu5FU9wCs7rj0kB15EZPdQ6gXZjb1bz8M
   fvAVxOg2VvzYN05RRM+tSniI8tREEzFUOaQHozxarEuN6JOC3E8uBCIPo
   d1DiP0jWQfNHxeJirTe0uftqxrKZlV+UJbzw47STmFKNehmAPQkVgpZcm
   WMuHYjkvOr/rG7Ie3vPDWUfwhp2GByVrmrPCciL8awvLltjBjKdq3DIgd
   Q==;
X-CSE-ConnectionGUID: erIEs4MoR3es7P/DR9NAnA==
X-CSE-MsgGUID: CV6Mk4dqSc+BhusUHLU0xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25137408"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="25137408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 04:52:56 -0700
X-CSE-ConnectionGUID: LM0uj5UlSAOM/vqLMa5gwA==
X-CSE-MsgGUID: fCvNLip+TeO4cLZkcPnhTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="67751446"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2024 04:52:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soiNX-000564-1w;
	Thu, 12 Sep 2024 11:52:51 +0000
Date: Thu, 12 Sep 2024 19:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jing Leng <3090101217@zju.edu.cn>, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, corbet@lwn.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jing Leng <3090101217@zju.edu.cn>
Subject: Re: [PATCH] kbuild: Support separating source and output of the
 external module
Message-ID: <202409121947.7NkNsyuC-lkp@intel.com>
References: <20240911112017.14427-1-3090101217@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911112017.14427-1-3090101217@zju.edu.cn>

Hi Jing,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/fixes]
[also build test ERROR on linus/master v6.11-rc7]
[cannot apply to masahiroy-kbuild/for-next next-20240912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jing-Leng/kbuild-Support-separating-source-and-output-of-the-external-module/20240911-192242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git fixes
patch link:    https://lore.kernel.org/r/20240911112017.14427-1-3090101217%40zju.edu.cn
patch subject: [PATCH] kbuild: Support separating source and output of the external module
config: x86_64-kexec (attached as .config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121947.7NkNsyuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121947.7NkNsyuC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'scripts/kconfig/lexer.lex.c', needed by 'scripts/kconfig/lexer.lex.o'.
>> make[3]: *** No rule to make target 'scripts/kconfig/parser.tab.c', needed by 'scripts/kconfig/parser.tab.o'.
   make[3]: Target 'oldconfig' not remade because of errors.
   make[2]: *** [Makefile:680: oldconfig] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> make[3]: *** No rule to make target 'scripts/kconfig/lexer.lex.c', needed by 'scripts/kconfig/lexer.lex.o'.
>> make[3]: *** No rule to make target 'scripts/kconfig/parser.tab.c', needed by 'scripts/kconfig/parser.tab.o'.
   make[3]: Target 'olddefconfig' not remade because of errors.
   make[2]: *** [Makefile:680: olddefconfig] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

