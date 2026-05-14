Return-Path: <linux-kbuild+bounces-13159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJiyFXXTBWpUbwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13159-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 15:51:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0221542813
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 15:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AC283009CCC
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 13:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E200C3E4C99;
	Thu, 14 May 2026 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rKS+X7Wp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492BC3EDE5B
	for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766705; cv=none; b=TkD/RL0kVcwNsowb+BA6ZfXrJjWT2RqUQbzmAjR5SirqQqYQ0v39l+B2R3S+EgPCamzfwgk8pfUVKHPRHOQqqS9ttovY0cICW78ABspuygL5/4byp5DnmV6X5L5NaRa9cNdR6qptw3m2qVxwoI8fFAdRncqp2xTJV2Xk6gEgLEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766705; c=relaxed/simple;
	bh=3nmM4uhI7OiLcmFBb4/evfxqVSEoNjbn9VxKNaBoR1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxwiT+BvGrrn7s7470/DRHXoBA0jYl9Ics5Ip46YxGSxy8+AfKW+goASFsmWV0TJ+17RSmKE3MgPJIjZ2QEr8JgkZ7sJK9GQ++rIxGqaLG7I02EBPWR//XQtHljnTb8OzbX6SWkfudCP98gzMvu+im0meYGiTeh0qcv/fa0RK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rKS+X7Wp; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 14 May 2026 08:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778766687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+g+7ghVEB0/ZiZK5+AesV/g+T1Xkp1KmaOpSr95qEQ=;
	b=rKS+X7WpAz3EieqLnmxyVusEEbQBsnnzC5FkFeRRVIkr//CTCTf5wHpnT4squpZm4d+j9/
	ARI+CQbVANNqYXjdufxzbwcCszBy4bwlQ2biL1bUfYGJNJoD3b1SKm0Q1tDTRukVxYmoMv
	nQhHwV9Ld4gwJJE/e9hl5qC8Sqc+dEM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nsc@kernel.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <fd2gftpt6hlxsupytk62szqoq6beex46yi3cipmhwnguxulkle@mlte4jsvstie>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177876553250.305249.17848321995033732158.b4-review@b4>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: E0221542813
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13159-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.jones@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kconfig-sym-check.pl:url]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:32:12PM +0900, Nathan Chancellor wrote:
> On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:
> 
> Hi Andrew,
> 
> > [...]
> > 
> > This new static checker is the script used for [1] with a few
> > improvements to avoid some false positives.
> > 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748 [1]
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> 
> I think something like this is reasonable, as least until kconfirm
> is potentially ready for integration into the tree.
> 
>   https://lore.kernel.org/20260509203808.1142311-1-julianbraha@gmail.com/
> 
> That said, I don't know perl, so some superficial comments to follow.
> 
> >
> >
> > diff --git a/Makefile b/Makefile
> > index e27c91ea56fc..75487383805b 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -2240,6 +2242,9 @@ versioncheck:
> >  coccicheck:
> >  	$(Q)$(BASH) $(srctree)/scripts/$@
> >  
> > +kconfig-sym-check:
> > +	$(Q)cd $(srctree) && $(PERL) scripts/kconfig/kconfig-sym-check.pl $(KCONFIG_SYM_CHECK_EXCLUDES)
> 
> I would prefer to avoid the 'cd $(srctree)' here.
> 
> >
> > diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
> > new file mode 100755
> > index 000000000000..a6907e585962
> > --- /dev/null
> > +++ b/scripts/kconfig/kconfig-sym-check.pl
> > @@ -0,0 +1,93 @@
> > +#!/usr/bin/env perl
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +use warnings;
> > +use strict;
> > +
> > +my $kconfig_sym_check_excludes = undef;
> > +$kconfig_sym_check_excludes = $ARGV[0] if (defined $ARGV[0]);
> > +
> > +my @files = `git ls-files '*Kconfig*'`;
> 
> What happens if you run this command on a release tarball? We should
> probably use something like
> 
>   find $(srctree) -name '*Kconfig*'
> 
> here, which would avoid needing the 'cd $(srctree)' above (although
> kconfig-sym-check.pl would need to be prefixed with $(srctree)/ to
> ensure the path is valid).
> 
> Sashiko has some additional comments that may be relevant, if you have
> not already seen them.
> 
>   https://sashiko.dev/#/patchset/19870

Thanks, Nathan. I'll make some improvements based on your and Sashiko's
comments and send a v2.

drew

