Return-Path: <linux-kbuild+bounces-13170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /qOXC0twB2oj3gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13170-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 21:13:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864D5569B3
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 21:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12986300B619
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 19:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA26384CDF;
	Fri, 15 May 2026 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnEPl7rD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48635E1A3;
	Fri, 15 May 2026 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872390; cv=none; b=OMkd2gwTVGAu71q38EgwiohZ+bOV8opDL4kfZqaQNhc93xVVDNNnx8U4J+JSiWbKjfvKXnwdaj369T+9YVjxggrE1OMVk3evmQh7xnDOThlzK+HaRxSIChhGVFulrTXVynvvotQLJ2tjB9ntaVsDGnhaYL6sESz4TJhqCzetjxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872390; c=relaxed/simple;
	bh=UkH18Yz0wzFlauUdm9334lSCF/QEO1vtj9F3SXrxR60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ao5r5YC4mXzr+DZqPC4e+jq1qW13toW6ntziPtBrnV9gSgjmLLZAZ114/uhBzJM8Gpj593y6wZBcG23KdlixHY6/JXyL/OCKusSDDLFAdslJ2bTW2X1pi0hZluManIKHg6S4pETlGnKaA6/pQJpCa5AddvzMrRtap3hdRtYB2Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnEPl7rD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E1BC2BCB0;
	Fri, 15 May 2026 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778872390;
	bh=UkH18Yz0wzFlauUdm9334lSCF/QEO1vtj9F3SXrxR60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnEPl7rD0fix06euTH4zgTWHgU8sfDLDCkszlOaizmpJGe7m2fuG3uLs71QkXFDL9
	 HIOCms7Z7595Nss3Zw4z24gvRgXn90h+U3EJ9oUSXsMpU/zK/24BQN3n1Wte2XZnIo
	 TMuI1S2PQ7qIgO03/iMM/Wp8ynEhq2FSHCoXjMHMbV6pUcnMUkB9yjH+k2k1l+0yzG
	 jnes2syZVYuXfYC/gez2eoALciOncBBp9cbwAEe+zTM2jlkAEyGpE1ta8Ln+pQeZJV
	 eZ8y7wkhsgqS7kSikneji/EgRLGq1vKHsvDQSypc/lsyWvlW1rZpa7SC5tWZXKfPp2
	 c8jNQ8c4llnTg==
Date: Fri, 15 May 2026 21:08:07 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <agdvF1g0jSp3A6EP@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com
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
X-Rspamd-Queue-Id: 7864D5569B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13170-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:32:12PM +0900, Nathan Chancellor wrote:
> On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:
[...]
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

not fully related, but that reminds me to this thread:
https://lore.kernel.org/linux-kbuild/CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com/#r


-- 
Nicolas

