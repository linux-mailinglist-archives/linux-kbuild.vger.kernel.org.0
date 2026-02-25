Return-Path: <linux-kbuild+bounces-11418-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGxcEhTAnmnsXAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11418-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 10:25:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C038C194EB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 10:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B582305FD8A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90BA38F230;
	Wed, 25 Feb 2026 09:22:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E3438E13F;
	Wed, 25 Feb 2026 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011335; cv=none; b=WO3/2dgTHouJjfo08O8ozSOaeHqP+jyvAL/86o2lYxRjBqcFNivgIiriReEGkhqnDh0fp/H0JVdpK8n8Bv9U3WhAvKDhJTZXvPn5jAxis3p3T+HA5tXT09olPvrh4TYXoSpl3HE4reTBrH4y1NyhXjIGoNbLvLCULkk7uRV+Lvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011335; c=relaxed/simple;
	bh=daiE84+x1DTsBjb8hPYrKAxTbbAtgw32SOcK/r2ArD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUUAdpC9oAK7KdJufSvJK1HtkGiUGPMhhHBTqhfJEwwUszTWFBW4moywkXoe5a+YccOZIa7lBF5Vqm7RN9DI8fKT3hhVshPCfapxNpcM/PgCAELneZtRrxifnt+uea4HGlLtHWlpJ4mSJx2PDlInb8TB172EF0t4OmTBYoC6zP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0444A165C;
	Wed, 25 Feb 2026 01:22:07 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24573F7BD;
	Wed, 25 Feb 2026 01:22:12 -0800 (PST)
Date: Wed, 25 Feb 2026 09:22:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
Message-ID: <20260225092210.GC4184494@e132581.arm.com>
References: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
 <20260224171956.GA639152@ax162>
 <202602241310.C3641B97@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602241310.C3641B97@keescook>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11418-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.926];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gnu.org:url,e132581.arm.com:mid]
X-Rspamd-Queue-Id: C038C194EB3
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 01:11:19PM -0800, Kees Cook wrote:
> On Tue, Feb 24, 2026 at 10:19:56AM -0700, Nathan Chancellor wrote:
> > Hi Leo,
> > 
> > On Tue, Feb 24, 2026 at 12:16:40PM +0000, Leo Yan wrote:
> > > GCC-15 release claims [1]:
> > > 
> > >   {0} initializer in C or C++ for unions no longer guarantees clearing
> > >   of the whole union (except for static storage duration initialization),
> > >   it just initializes the first union member to zero. If initialization
> > >   of the whole union including padding bits is desirable, use {} (valid
> > >   in C23 or C++) or use -fzero-init-padding-bits=unions option to
> > >   restore old GCC behavior.
> > > 
> > > As a result, this new behaviour might cause unexpected data when we
> > > initialize a union with using the '{ 0 }' initializer.
> > > 
> > > Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
> > > the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
> > > in unions and structures.  This commit applies the same option for tools
> > > building.
> > > 
> > > The option is not supported neither by any version older than GCC 15 and
> > > is also not supported by LLVM, this patch adds the cc-option function to
> > > dynamically detect the compiler option.
> > > 
> > > [1] https://gcc.gnu.org/gcc-15/changes.html
> > > 
> > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > > Resent to linux-kbuild mailing list.
> > 
> > Kbuild does not maintain/touch tools/. This should go via another tree
> > like perf or something. It does not look like
> > tools/scripts/Makefile.include has a clear owner, perf and bpf tend to
> > be the ones who touch it the most.

This is a circular deadlock.  Namhyung (the perf maintainer) advised me
to send patch to the linux-kbuild [1], for fixing an union init issue
found recently.

> You could claim it! ;)
> 
> Regardless, I like to see cc-option available here, as I doubt this will
> be the last conditional option for tool builds. (Actually, are there
> other conditional options that could use this today in the tools
> Makefiles?)

Some subprojects in tools have their own conditional options.

This patch is ambitious that it changes the global Makefile.include file
so it can propagate the '-fzero-init-padding-bits=all' option to
projects that include it.  Why do we need to do this globally?  This is
because Perf needs to build several subprojects (libperf and bpftool).

Thanks,
Leo

[1] https://lore.kernel.org/linux-perf-users/20260224122054.GB4184494@e132581.arm.com/T/#ma07fc114e84254d0173490409955e9d3bea147be

