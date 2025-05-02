Return-Path: <linux-kbuild+bounces-6858-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E0AA6E6B
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 11:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4FF49C13A5
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 09:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A554E22DFB6;
	Fri,  2 May 2025 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sb2ckM/S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375522AE7F;
	Fri,  2 May 2025 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179274; cv=none; b=cDyR84ba9c6cW23oLCvy5HuT78O5DKvkQs18Dk1dqKs1iIzZC+L7Tu5hOvlozj8xKCj1BGkumkREbjqNlvAwrX8ZFVVSEsrwsE3/Iw08qmPdPgfO8NnlO1WeLRxd7hEvnWDycmOfEpeAEXdwzsP6K4LIOq+c+30jELSINEV4qvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179274; c=relaxed/simple;
	bh=P5UCzUKv4/n0vlYFviJHuU1DmLeX/5NeD5upa3uzmcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crOwrEV1RQM0bAbg5IH+Ce/tVOHFzWl7cFDMq/sp1tkYgGx4alpBjUgsXsd5uS1+4HWHi3wCfQpRGaOnsR3zW8pZi+u42i6Gc4bnL6t5qlBF1npoQO7vpmZbRJQ+Bq2vnL7lu4usm0yGq90XjbjHZ9+76e8B23pIDDmukp+l7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sb2ckM/S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746179271; x=1777715271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P5UCzUKv4/n0vlYFviJHuU1DmLeX/5NeD5upa3uzmcA=;
  b=Sb2ckM/S3JGe7nvfYgSjpb2KKo81cgTNzBgVNcgqAv5kjZHYrHBjD62U
   Pg+jS3VOfVsrIfxzzBh7kKJWQMwWgXIEWeWPNx5fx2yOlAftVB7DL2XGb
   4XQ0eIgv+i5hKod4RYqQbxMn2YUqZmXyvJtdfUVlXL1SzqPXYawYc9z/0
   Lmfxg06i1IPhXlz9SIWIsPlXKRZj5W//ud+w+gHfpD1GY2fCN0zkkNOv2
   g6AjfTVEWOjPuiLdTHClYYmIdhTgnlglx9iq2R7inweCs0EbDrqNnRizq
   U5pLHbHtOxliaptcztX6Gdca7H02bJd5M5cUcNS9XVE/D4Xd56vIjYHyI
   A==;
X-CSE-ConnectionGUID: qCMUd5p7SLOc4gYCBjO6xw==
X-CSE-MsgGUID: HHOlUGkyRZ20x5Q6qESzwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58527394"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58527394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:47:50 -0700
X-CSE-ConnectionGUID: Z0kay3TzT3e/uQiC9vR0Kg==
X-CSE-MsgGUID: 0HqwONdjQgarRTfnniSxFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139411714"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 May 2025 02:47:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAmzf-0004fJ-0c;
	Fri, 02 May 2025 09:47:43 +0000
Date: Fri, 2 May 2025 17:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Marcus Seyfarth <m.seyfarth@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy
 variables
Message-ID: <202505021716.olmL8WzB-lkp@intel.com>
References: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>

Hi Nathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on ebd297a2affadb6f6f4d2e5d975c1eda18ac762d]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Disable-Wdefault-const-init-field-unsafe/20250502-070313
base:   ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
patch link:    https://lore.kernel.org/r/20250501-default-const-init-clang-v1-2-3d2c6c185dbb%40kernel.org
patch subject: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
config: arc-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021716.olmL8WzB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021716.olmL8WzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021716.olmL8WzB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/sched.h:15,
                    from arch/arc/kernel/asm-offsets.c:6:
   include/linux/irqflags.h: In function 'class_irqsave_destructor':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:268:21: note: in expansion of macro 'local_irq_restore'
     268 |                     local_irq_restore(_T->flags),
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/irqflags.h: In function 'class_irqsave_constructor':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:403:9: note: in definition of macro '__DEFINE_LOCK_GUARD_0'
     403 |         _lock;                                                          \
         |         ^~~~~
   include/linux/irqflags.h:266:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
     266 | DEFINE_LOCK_GUARD_0(irqsave,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:267:21: note: in expansion of macro 'local_irq_save'
     267 |                     local_irq_save(_T->flags),
         |                     ^~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:7,
                    from include/linux/thread_info.h:27,
                    from include/linux/sched.h:14:
   include/linux/spinlock_api_smp.h: In function '__raw_spin_lock_irqsave':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:108:9: note: in expansion of macro 'local_irq_save'
     108 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h: In function '__raw_spin_unlock_irqrestore':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:151:9: note: in expansion of macro 'local_irq_restore'
     151 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h: In function '__raw_read_lock_irqsave':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:158:9: note: in expansion of macro 'local_irq_save'
     158 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h: In function '__raw_write_lock_irqsave':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:184:9: note: in expansion of macro 'local_irq_save'
     184 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h: In function '__raw_read_unlock_irqrestore':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:241:9: note: in expansion of macro 'local_irq_restore'
     241 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h: In function '__raw_write_unlock_irqrestore':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/irqflags.h:177:17: note: in expansion of macro 'typecheck'
     177 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:225:17: note: in expansion of macro 'raw_local_irq_restore'
     225 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rwlock_api_smp.h:265:9: note: in expansion of macro 'local_irq_restore'
     265 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h: In function 'spin_unlock_irqrestore':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h: In function 'class_raw_spinlock_irqsave_destructor':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:559:21: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     559 |                     raw_spin_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:559:21: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     559 |                     raw_spin_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:559:21: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     559 |                     raw_spin_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:385:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     385 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:281:17: note: in expansion of macro 'typecheck'
     281 |                 typecheck(unsigned long, flags);                \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:559:21: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     559 |                     raw_spin_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h: In function 'class_raw_spinlock_irqsave_constructor':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:394:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     394 |         _lock;                                                          \
         |         ^~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:243:17: note: in expansion of macro 'typecheck'
     243 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:558:21: note: in expansion of macro 'raw_spin_lock_irqsave'
     558 |                     raw_spin_lock_irqsave(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:394:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     394 |         _lock;                                                          \
         |         ^~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:243:17: note: in expansion of macro 'typecheck'
     243 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:558:21: note: in expansion of macro 'raw_spin_lock_irqsave'
     558 |                     raw_spin_lock_irqsave(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:394:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     394 |         _lock;                                                          \
         |         ^~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:243:17: note: in expansion of macro 'typecheck'
     243 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:558:21: note: in expansion of macro 'raw_spin_lock_irqsave'
     558 |                     raw_spin_lock_irqsave(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:394:9: note: in definition of macro '__DEFINE_LOCK_GUARD_1'
     394 |         _lock;                                                          \
         |         ^~~~~
   include/linux/spinlock.h:557:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     557 | DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:243:17: note: in expansion of macro 'typecheck'
     243 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:558:21: note: in expansion of macro 'raw_spin_lock_irqsave'
     558 |                     raw_spin_lock_irqsave(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h: In function 'class_raw_spinlock_irqsave_try_constructor':
>> include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:255:25: note: in definition of macro 'EXTEND_CLASS'
     255 | { class_##_name##_t t = _init; return t; }
         |                         ^~~~~
   include/linux/spinlock.h:562:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1_COND'
     562 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:563:26: note: in expansion of macro 'raw_spin_trylock_irqsave'
     563 |                          raw_spin_trylock_irqsave(_T->lock, _T->flags))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: note: (near initialization for '__dummy')
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:255:25: note: in definition of macro 'EXTEND_CLASS'
     255 | { class_##_name##_t t = _init; return t; }
         |                         ^~~~~
   include/linux/spinlock.h:562:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1_COND'
     562 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:563:26: note: in expansion of macro 'raw_spin_trylock_irqsave'
     563 |                          raw_spin_trylock_irqsave(_T->lock, _T->flags))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: error: empty scalar initializer
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:255:25: note: in definition of macro 'EXTEND_CLASS'
     255 | { class_##_name##_t t = _init; return t; }
         |                         ^~~~~
   include/linux/spinlock.h:562:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1_COND'
     562 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:563:26: note: in expansion of macro 'raw_spin_trylock_irqsave'
     563 |                          raw_spin_trylock_irqsave(_T->lock, _T->flags))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:11:30: note: (near initialization for '__dummy2')
      11 |         typeof(x) __dummy2 = {}; \
         |                              ^
   include/linux/cleanup.h:255:25: note: in definition of macro 'EXTEND_CLASS'
     255 | { class_##_name##_t t = _init; return t; }
         |                         ^~~~~
   include/linux/spinlock.h:562:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1_COND'
     562 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:172:17: note: in expansion of macro 'typecheck'
     172 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:216:17: note: in expansion of macro 'raw_local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:563:26: note: in expansion of macro 'raw_spin_trylock_irqsave'
     563 |                          raw_spin_trylock_irqsave(_T->lock, _T->flags))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:10:24: error: empty scalar initializer
      10 | ({      type __dummy = {}; \
         |                        ^
   include/linux/cleanup.h:255:25: note: in definition of macro 'EXTEND_CLASS'
     255 | { class_##_name##_t t = _init; return t; }
         |                         ^~~~~
   include/linux/spinlock.h:562:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1_COND'
     562 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:188:17: note: in expansion of macro 'typecheck'
     188 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:217:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \


vim +10 include/linux/typecheck.h

     4	
     5	/*
     6	 * Check at compile time that something is of a particular type.
     7	 * Always evaluates to 1 so you may use it easily in comparisons.
     8	 */
     9	#define typecheck(type,x) \
  > 10	({	type __dummy = {}; \
    11		typeof(x) __dummy2 = {}; \
    12		(void)(&__dummy == &__dummy2); \
    13		1; \
    14	})
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

