Return-Path: <linux-kbuild+bounces-13190-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCxdLeFcCWrZWgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13190-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:14:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47655F6C7
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3B61300B773
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E81313520;
	Sun, 17 May 2026 06:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDSvtT7c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2DE282F12;
	Sun, 17 May 2026 06:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778998494; cv=none; b=kuw6ZR7CIg1WVAguj+JA7POLUQFHg4hEGOibaRoPwhh6LHQyDlg5NsU6JhASe1R5XKxzAGje9Su3ZXveNWISKFWoTYpTB9ZwW3XNF8/f7NfJ/h1tF4YVSS4pnJebmooVfczwJrKrdqLoA64qxLRQO4/30sW58or1GLDT7l2cU/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778998494; c=relaxed/simple;
	bh=D8XiYNIWUGD4YGEvbV78JAnahSlr8oSJQ+FbkgE6+dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVVsOC4msxUiMs/W2pVXgqZLYIX4ApyHtsbJDEA0NPv6nsV60Wubbcc6oyDJZrAiQ6I0bhWx2ioLp3uO6wZZPgPAhRs+FSYgyMFz8NiIxi/YXvOuilKIlJp11ctqSTBSPj0gG/Y7ZDjbqKzBRXt/b6PfXB6Z25sACsNECT71Xjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDSvtT7c; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778998492; x=1810534492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D8XiYNIWUGD4YGEvbV78JAnahSlr8oSJQ+FbkgE6+dY=;
  b=EDSvtT7c2aS/HajvJN6E3txDyG/QatFhM0WvgJhoFQ8ikH5eu+Rlywxh
   4v145O/1hGds/eTuc4Or1DdwbZIonGUdN+TyFBQlQrY/vcysXXnG2wQNn
   4fmetpEScnRYGTCEk2oo94BcHbS2HhBuU2Wv4HztHZZs+8u8OYGLp4QLQ
   UoTKnDkKqNtitsomcVxb5sn3fL+T70biH2zVm8+9TuzsnqcTu1V7v4/vw
   UYk7r9nId3qxASzueu6B6QHshoIfFxbxsn4KOLteQ9dWiK3f/rlq27zIw
   fH1MjPO2i28gEYWjUuViYWDh6GoFeLGWHHBSPfokbFV7/IcA8nOwemEZ7
   Q==;
X-CSE-ConnectionGUID: Qt8HKNMnR++afqg2Wi1lIQ==
X-CSE-MsgGUID: Aa+7B9BlRaKSPKfk6C4w8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90586237"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90586237"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:14:51 -0700
X-CSE-ConnectionGUID: z7yYHHj6TQyCnfM6ebYbcg==
X-CSE-MsgGUID: nBBDeTmcSSGpxD7nAiT6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="238119821"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:14:49 -0700
Date: Sun, 17 May 2026 09:14:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <aglc1wxyLtEWX2qW@ashevche-desk.local>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
 <agdvF1g0jSp3A6EP@levanger>
 <20260517042607.GA1534263@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517042607.GA1534263@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: AE47655F6C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13190-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid,linux.dev:email]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 01:26:07PM +0900, Nathan Chancellor wrote:
> On Fri, May 15, 2026 at 09:08:07PM +0200, Nicolas Schier wrote:
> > On Thu, May 14, 2026 at 10:32:12PM +0900, Nathan Chancellor wrote:
> > > On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:

[...]

> > > > diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
> > > > new file mode 100755
> > > > index 000000000000..a6907e585962
> > > > --- /dev/null
> > > > +++ b/scripts/kconfig/kconfig-sym-check.pl
> > > > @@ -0,0 +1,93 @@
> > > > +#!/usr/bin/env perl
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +use warnings;
> > > > +use strict;
> > > > +
> > > > +my $kconfig_sym_check_excludes = undef;
> > > > +$kconfig_sym_check_excludes = $ARGV[0] if (defined $ARGV[0]);
> > > > +
> > > > +my @files = `git ls-files '*Kconfig*'`;
> > > 
> > > What happens if you run this command on a release tarball? We should
> > > probably use something like
> > > 
> > >   find $(srctree) -name '*Kconfig*'
> > 
> > not fully related, but that reminds me to this thread:
> > https://lore.kernel.org/linux-kbuild/CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com/#r
> 
> Ah yeah, that is definitely worth keeping in mind for the future. I feel
> like 'find' is not "more complicated" than 'git ls-files' in this case,
> so I will assume that such an objection would not really hold here
> (especially since it would help people with development of fresh Kconfig
> files that have not been committed yet). If we did want to rely on 'git
> ls-files', we should at least error gracefully if we are not in a git
> checkout.

Can we do both depending on the environment (if we are in Git, do that,
otherwise fallback to `find`)? `find` uses FS, while Git uses index, which
is much faster.

-- 
With Best Regards,
Andy Shevchenko



