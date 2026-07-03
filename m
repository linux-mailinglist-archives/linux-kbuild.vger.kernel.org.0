Return-Path: <linux-kbuild+bounces-13929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FdXCBOIMSGpTkwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13929-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 21:26:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3BA70518A
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 21:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AQTEPXna;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13929-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13929-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6828C301AD13
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 19:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D3E3290C8;
	Fri,  3 Jul 2026 19:26:21 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C0326D4A;
	Fri,  3 Jul 2026 19:26:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106781; cv=none; b=AHjr0BDWNBye67DH2ATBqpgf2c3azw+f8R/IAbX3uUfIJeFhbhGZFvv4qjgiUCLlVt1blBgEnLM5gPs4HaDfcE+hiNrql6eXBMp2dvi+SsxGO0Fqn0SSlhnzShIL8PRD/n0Oike5ud6ka1vYvpjjRbGMG2SE1sv0/OTaUOqGevA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106781; c=relaxed/simple;
	bh=0BE8UCtgwMe/W+YJ6rS13MNVFlvxNIXuS76bDmle718=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/3Ha7Idmcj9f4qDBy6OllDVeEpoiaK79YMib55rdwht+Od3QPsFJ1e7KJFbTqc9XuAvnrPKON/tyxjQJiiv0V2Z48eji+vAcRwP7NkMUdWdBaNhFZr3JpsWcI4EmV9Sz+DpjX86pZEtJHwa9NscSoherAIU1nzHEZg33Li9h/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQTEPXna; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E07A11F000E9;
	Fri,  3 Jul 2026 19:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106779;
	bh=MEgpkqGul0n6ffAp2eA2uUfdXTni9ivgOvrmkoB0774=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AQTEPXnax0WBd1xsUAveab8iG+vtPMYpFX8zmO40Rt+Eh38kWF+iM3TGCv9rVW5hN
	 W+R7mecoj/QWY8ypw+ibw+L/o1cxtznbJdEgitRYnoCn9VCM4JXSlWR/vQa3dXAGFK
	 aQcmsPK66yoN84CXp3utWyyJTp/FYjmuhY69NKsSNrRYr54HaCW6TOzCwtICvA8Fmb
	 4RZ4GA16+s9cI94AbcWGOQmjWMVnzK14Vi5jn17LJNhEk5PBeA49WX+eremqe31hAy
	 /75CFvbzp3AwPbpmwbq179OPwY2zPECsaPO5fbZcJNOqsZ/UNZmv4tFgNh2pEgzyTN
	 IBlSPp6awGu5Q==
Date: Fri, 3 Jul 2026 21:24:29 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	sashiko-reviews@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	shuah@kernel.org, Zelin Deng <zelin.deng@linux.alibaba.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akgMbd9fFOZYXUoC@levanger>
Mail-Followup-To: Petr Mladek <pmladek@suse.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	sashiko-reviews@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	shuah@kernel.org, Zelin Deng <zelin.deng@linux.alibaba.com>,
	linux-kbuild@vger.kernel.org
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <20260703061449.246801F000E9@smtp.kernel.org>
 <akdyH7rRV1WHtBJ3@pathway.suse.cz>
 <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>
 <akeJto1TC2CSs4Yw@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akeJto1TC2CSs4Yw@pathway.suse.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:thomas.weissschuh@linutronix.de,m:sashiko-reviews@lists.linux.dev,m:nathan@kernel.org,m:live-patching@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:mbenes@suse.cz,m:shuah@kernel.org,m:zelin.deng@linux.alibaba.com,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13929-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D3BA70518A

On Fri, Jul 03, 2026 at 12:06:46PM +0200, Petr Mladek wrote:
> On Fri 2026-07-03 11:32:30, Thomas Weiﬂschuh wrote:
> > On Fri, Jul 03, 2026 at 10:26:07AM +0200, Petr Mladek wrote:
> > > On Fri 2026-07-03 06:14:48, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > - [Medium] Incomplete fix and inconsistent state: The patch correctly unsets `sub_make_done` for the `kselftest` targets to allow Kbuild command-line reevaluation when building external kernel modules. However, it fails to apply the same logic to the `tools/` and `tools/%` targets, introducing a discrepancy between build entry points.
> > > > --
> > > > 
> > > > commit 06c418388d65deb3d8494a6e8e7071c0e709186b
> > > > Author: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > > 
> > > > kbuild: unset sub_make_done before calling kselftest build system
> > > > 
> > > > This commit unsets sub_make_done before invoking the kselftest build system to
> > > > ensure Kbuild reevaluates command-line flags when building test modules. It
> > > > mirrors a previous fix done for scripts/install.sh.
> > > > 
> > > > > diff --git a/Makefile b/Makefile
> > > > > index b9c5792c79e01..f717a4dc96d6a 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> > > > >  
> > > > >  PHONY += kselftest
> > > > >  kselftest: headers
> > > > > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > > > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > > 
> > > > [Severity: Medium]
> > > > Will make tools/selftests still fail after this change?
> > > > 
> > > > The tools/ and tools/% targets in Makefile delegate to the tools build
> > > > system, which can also trigger external kernel module builds (like bpf_testmod).
> > > > 
> > > > Because sub_make_done is not unset for these targets, invoking commands like
> > > > make tools/selftests or make tools/all will skip Kbuild's M= argument parsing.
> > > > 
> > > > Should sub_make_done also be unset in the tools/ and tools/% targets to maintain
> > > > consistency across the build entry points?
> > > 
> > > This might make sense. I see that the tools: and tools/%: targets are
> > > defined right above the kselftest*: ones. And they are even advertised
> > > in "make help" or "make tools/help".
> > 
> > I am not sure how the tools/ targets can reach back into kbuild.
> > The example with bpf_testmod above is bogus, as tools/* is only for
> > top-level tools directories. Subdirectories in tools/testing/selftests/
> > don't seem to be reachable.
> 
> I see.
> 
> > > Well it probably should be done in a separate patch. It would be better
> > > for bisecting potential regressions. Thomas, Zelin, what do you think, please?
> > 
> > If we do it for consistency it should be its own patch, agreed.
> 
> I would keep it as is until anyone reports a real problem.

Ack.

Thomas, thanks for fix!

Reviewed-by: Nicolas Schier <nsc@kernel.org>


-- 
Nicolas

