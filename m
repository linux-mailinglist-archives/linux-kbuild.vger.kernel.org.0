Return-Path: <linux-kbuild+bounces-13184-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL7JAmlDCWr3SAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13184-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:26:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5055F306
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 298123003D24
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 04:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A347308F26;
	Sun, 17 May 2026 04:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDd2pC3L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2D2F7EEA;
	Sun, 17 May 2026 04:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778991971; cv=none; b=DNRQK4hSuEy763PpnQhZTzw9AEZk08UCCGUCng4glk1t5gxH8tBGsfjiDmHZPz67wmFY9oaEeANoVScYmCWNReAd9hW4oo2uzLoNsVzcQl9H08nlaUBB9k0ANeK8UIKg48YNtiJOddcjmUPs7157EiaXZrnImtmS1tLGoNgTovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778991971; c=relaxed/simple;
	bh=IUrTSPbIiSxlbqxcBL5fIiV3UDBalCFZmnVu7VBorV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmP/NSwvRydOTQG1xrQFuJkDxGh5g2unO5q0PEESuLtz8li5Jo2V8ipn65gFeFPF+AyHd4LAZPQhQBX5aED+QZebjy/A0P+qWrlUPLpXdZWQhSqtopN6ItWk2oxDOFugYEWJpFoCu/rH8HozJYLfvkTsMxHAt7SpPf+YWWHYD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDd2pC3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB64C2BCB0;
	Sun, 17 May 2026 04:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778991971;
	bh=IUrTSPbIiSxlbqxcBL5fIiV3UDBalCFZmnVu7VBorV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDd2pC3LwbrPmYmqR+3Pk4lltA+PVbtXi6jWs/fygpap09EJ+9w+0cpMcZRh8y2w9
	 3jBCwMxDezvn5+eGiP2kGqLZieawrIHWMgWskFnDvGVkFz9tqKiu9ev1MnvpnUki2w
	 1/IwyCpUg3kL+r0O5H3n6y6gtVNBIdUHVUTq4PgSPWC3IOL89uu8Vjc4IT3PUFk6ad
	 bG5gvGxxthVfa7uck9666ZAGjRIMiFX83dqXso0ZBjxQUmkGmRNHXhpM00LQktePSC
	 ajT88m3+FcXGyYDstrEUfG/wLek0RZxDWYCXBD3S3wJQbOt+txn3ci89EWrAVLIzll
	 94nm37QMnnAvA==
Date: Sun, 17 May 2026 13:26:07 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <20260517042607.GA1534263@ax162>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
 <agdvF1g0jSp3A6EP@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agdvF1g0jSp3A6EP@levanger>
X-Rspamd-Queue-Id: 91D5055F306
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13184-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 09:08:07PM +0200, Nicolas Schier wrote:
> On Thu, May 14, 2026 at 10:32:12PM +0900, Nathan Chancellor wrote:
> > On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:
> [...]
> > >
> > > diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
> > > new file mode 100755
> > > index 000000000000..a6907e585962
> > > --- /dev/null
> > > +++ b/scripts/kconfig/kconfig-sym-check.pl
> > > @@ -0,0 +1,93 @@
> > > +#!/usr/bin/env perl
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +use warnings;
> > > +use strict;
> > > +
> > > +my $kconfig_sym_check_excludes = undef;
> > > +$kconfig_sym_check_excludes = $ARGV[0] if (defined $ARGV[0]);
> > > +
> > > +my @files = `git ls-files '*Kconfig*'`;
> > 
> > What happens if you run this command on a release tarball? We should
> > probably use something like
> > 
> >   find $(srctree) -name '*Kconfig*'
> 
> not fully related, but that reminds me to this thread:
> https://lore.kernel.org/linux-kbuild/CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com/#r

Ah yeah, that is definitely worth keeping in mind for the future. I feel
like 'find' is not "more complicated" than 'git ls-files' in this case,
so I will assume that such an objection would not really hold here
(especially since it would help people with development of fresh Kconfig
files that have not been committed yet). If we did want to rely on 'git
ls-files', we should at least error gracefully if we are not in a git
checkout.

-- 
Cheers,
Nathan

