Return-Path: <linux-kbuild+bounces-13194-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB7EOE2GCWq2dwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13194-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:11:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC932560143
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DAD93002915
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 09:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4DF355F22;
	Sun, 17 May 2026 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpN+Io5C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC580347503;
	Sun, 17 May 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009092; cv=none; b=h6AJ1XsW1iIf1c+cmUVvc9gPg/OSxZr8pA4lE9VtKDi+kBodKvt/XP4g3Py6diyJEjdfE9aeoXzDzMvprq0fduX3sOPB8+3Fmb+hCmcVpWZIM+VAzUjun9e5JWM8z8on8s91w1kJZIFlDvfHYAOOE/iFXTCuW1TEWdq/d+oGZNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009092; c=relaxed/simple;
	bh=+BhF477tYbsk8cFUF9rwYJ4XqRZyieR9zjav/Nogz9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGVcO+qeAZeKoSqlGTCMkDmPTCvjZFwcpsfdIsefEjlI0Adc8C4PDpu+TKmpqQ1njmuu+8DYEuDGUslzoWtBZT/W93wTDqPIQJmVeYo3kurmcBWD3yxy5F4gpznOqnHv0M2m8da0Efhgp+MKRTfxqqqiGnlinK8hDHuNapulO/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpN+Io5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0F4C2BCB0;
	Sun, 17 May 2026 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779009092;
	bh=+BhF477tYbsk8cFUF9rwYJ4XqRZyieR9zjav/Nogz9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpN+Io5CIpy1+nAGAIhniYnsPMnKAOwNuCUiduKbet9/mTsgYU/As+zl/RYqyXwK6
	 R18wo6McoU27ZMbY4EhBqRPNXw7QYyd6V9hBc2jQ0Bzpsl5RreX+YIQ7yu7cj11BEj
	 l9wJFuK3uaSsXfTN0qzTXRa99k4azbuRiCYNiEMHfzFzxEChpCTY8rHdVQMMqUJFe0
	 GTnyzJk3oXe9mA6d78GedhcKhBrEDVOHBg/rQZMVwvYpx+vX3gUgFMwEWoFLeYlG8m
	 a1JRk5ec6Sc5HP08GQgv7/GMgmXVhVo4/r8p5XwS0gmQbdY+nPeT1uN+2zngoNsq8L
	 mAoz1qM0xw7oA==
Date: Sun, 17 May 2026 18:11:28 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Schier <nsc@kernel.org>, Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <20260517091128.GA3773662@ax162>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
 <agdvF1g0jSp3A6EP@levanger>
 <20260517042607.GA1534263@ax162>
 <aglc1wxyLtEWX2qW@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aglc1wxyLtEWX2qW@ashevche-desk.local>
X-Rspamd-Queue-Id: DC932560143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13194-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 09:14:47AM +0300, Andy Shevchenko wrote:
> On Sun, May 17, 2026 at 01:26:07PM +0900, Nathan Chancellor wrote:
> > On Fri, May 15, 2026 at 09:08:07PM +0200, Nicolas Schier wrote:
> > > On Thu, May 14, 2026 at 10:32:12PM +0900, Nathan Chancellor wrote:
> > > > On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:
> 
> [...]
> 
> > > > > diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
> > > > > new file mode 100755
> > > > > index 000000000000..a6907e585962
> > > > > --- /dev/null
> > > > > +++ b/scripts/kconfig/kconfig-sym-check.pl
> > > > > @@ -0,0 +1,93 @@
> > > > > +#!/usr/bin/env perl
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +use warnings;
> > > > > +use strict;
> > > > > +
> > > > > +my $kconfig_sym_check_excludes = undef;
> > > > > +$kconfig_sym_check_excludes = $ARGV[0] if (defined $ARGV[0]);
> > > > > +
> > > > > +my @files = `git ls-files '*Kconfig*'`;
> > > > 
> > > > What happens if you run this command on a release tarball? We should
> > > > probably use something like
> > > > 
> > > >   find $(srctree) -name '*Kconfig*'
> > > 
> > > not fully related, but that reminds me to this thread:
> > > https://lore.kernel.org/linux-kbuild/CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com/#r
> > 
> > Ah yeah, that is definitely worth keeping in mind for the future. I feel
> > like 'find' is not "more complicated" than 'git ls-files' in this case,
> > so I will assume that such an objection would not really hold here
> > (especially since it would help people with development of fresh Kconfig
> > files that have not been committed yet). If we did want to rely on 'git
> > ls-files', we should at least error gracefully if we are not in a git
> > checkout.
> 
> Can we do both depending on the environment (if we are in Git, do that,
> otherwise fallback to `find`)? `find` uses FS, while Git uses index, which
> is much faster.

It feels like that starts to get into the complicated territory for
little gain, considering there is indeed a performance difference but I
am not sure that it is an obvious one in the grand scheme of things.

  $ hyperfine 'git ls-files "*Kconfig*"' 'find . -name "*Kconfig*"'
  Benchmark 1: git ls-files "*Kconfig*"
    Time (mean ± σ):      24.6 ms ±   1.0 ms    [User: 18.0 ms, System: 6.1 ms]
    Range (min … max):    20.5 ms …  28.7 ms    120 runs

  Benchmark 2: find . -name "*Kconfig*"
    Time (mean ± σ):     222.9 ms ±   4.5 ms    [User: 80.6 ms, System: 140.1 ms]
    Range (min … max):   216.0 ms … 227.6 ms    13 runs

  Summary
    git ls-files "*Kconfig*" ran
      9.06 ± 0.43 times faster than find . -name "*Kconfig*"

But I don't know how complicated such checking is in Perl, so I would be
willing to see what it looks like.

-- 
Cheers,
Nathan

