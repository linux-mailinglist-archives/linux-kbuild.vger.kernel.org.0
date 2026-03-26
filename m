Return-Path: <linux-kbuild+bounces-12267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHnXEZOmxGmZ1wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12267-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 04:22:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9291832EBF5
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 04:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B63B300E710
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 03:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429E837996B;
	Thu, 26 Mar 2026 03:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGj9pC7U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45892F362B;
	Thu, 26 Mar 2026 03:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495162; cv=none; b=XsevCfLZI4ZYE1/cw9xYH1+k6Knn7DmBEtdkc1H47DiZaj885vssQC85RbBDYGolcGRjHcxOPrC44JJNF8ZBHZWLD/Fs2TrVDXPOhtkIltCfa2aVxmhOgCezz1xC3oRUIjj8ASxIBFy0ec3EMPVsj1MgTuTb5gz9ygLqixgdYOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495162; c=relaxed/simple;
	bh=wyMUop065AGEuXj2FUPnIZ9Ayur7IMuk6aXC0UUeYtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t54VDJXXcobvbdT69HYkIxGiPBxfCo91+hTDGv0/8OnKalL3uhJMCrmGY418c51my9vr2aSdSzDbOINupNU61mnVwZQhbPHJsy6SQTck2DpW4qADJfheY/Ny2MQW9psGMZf9GnHKviElTrqfUsIhboeTko/GJqUAGD+XAPDtbUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGj9pC7U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774495161; x=1806031161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wyMUop065AGEuXj2FUPnIZ9Ayur7IMuk6aXC0UUeYtg=;
  b=fGj9pC7UL/rOc9cWiayatt3V2YK9kdf/Mz1IshxS9pQECwNM7/2AtBpL
   aaxfeW85SiR8PYW2haaXt7vCsfEQqTZSJKRLMe+nbDPNWRkQRJng8unqR
   qsugpukSKfVpSTAIumLr+r3xy+F6qL3VnQ5j5V3MUPOHf3qBFYVogUbVd
   H7IXoSgufQlxsPZBQBFft4zbtbbIU2Dopthd1bqbgGAlpBiL2owTXWfyS
   HoD+I22YKylapsk3gnzSGZho+Z5l+3sZvilrOohPSfTjfDVJgDvQpFOJ6
   oTKPXvo3mNI1RqcIni16wJkOZRJT+FPV1hFigCNfhMTFlvNYUhDPXk1Ky
   Q==;
X-CSE-ConnectionGUID: X2Hn36NDQSezOgDP6ZDrVA==
X-CSE-MsgGUID: QdJuH5hXSY+llfwQpA/tmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75659312"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75659312"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 20:19:10 -0700
X-CSE-ConnectionGUID: v2UdeSH2QIirO/MLDO7XvQ==
X-CSE-MsgGUID: FpZkpFQ+QoWXD2rce+lMuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224896195"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2026 20:18:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bFD-0000000083B-3TlK;
	Thu, 26 Mar 2026 03:18:51 +0000
Date: Thu, 26 Mar 2026 11:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	Aaron Ballman <aaron@aaronballman.com>,
	Cole Nixon <nixontcole@gmail.com>,
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>,
	James Foster <jafosterja@gmail.com>,
	Jeff Takahashi <jeffrey.takahashi@gmail.com>,
	Jordan Cantrell <jordan.cantrell@mail.com>
Subject: Re: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
Message-ID: <202603261112.bLTUmUGa-lkp@intel.com>
References: <20260323130224.165738-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323130224.165738-1-ojeda@kernel.org>
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
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,gmail.com,google.com,aaronballman.com,maskray.me,mail.com];
	TAGGED_FROM(0.00)[bounces-12267-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 9291832EBF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

kernel test robot noticed the following build errors:

[auto build test ERROR on bf074eb6891be799174ff42e0051492681fdc045]

url:    https://github.com/intel-lab-lkp/linux/commits/Miguel-Ojeda/rust-allow-Clang-native-RANDSTRUCT-configs/20260325-210001
base:   bf074eb6891be799174ff42e0051492681fdc045
patch link:    https://lore.kernel.org/r/20260323130224.165738-1-ojeda%40kernel.org
patch subject: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603261112.bLTUmUGa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261112.bLTUmUGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261112.bLTUmUGa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: kernel-address sanitizer is not supported for this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

