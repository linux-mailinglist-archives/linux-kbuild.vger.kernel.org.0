Return-Path: <linux-kbuild+bounces-13746-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NmDvIwqMLWpyhQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13746-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 18:57:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF267F189
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 18:57:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F244cEWm;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13746-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13746-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A317230179F4
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191B030DECE;
	Sat, 13 Jun 2026 16:57:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B12741B6;
	Sat, 13 Jun 2026 16:57:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781369864; cv=none; b=eoPO54xlcP/VPCvaV9o4iPhZ6dej2Wtnww12SbOM7NO1odnA+HWB5IuRGWKMs4Eu7JTIuNm7e8TsxPB/n4tV9NjYYRqSQDWxMqwmRxOQwHa3Uq8BU9lOtCpmwsrDNIbAFSjcwlTA9v5/Yu6IFC8h+HpUV1wyp75FiyZVFkEU8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781369864; c=relaxed/simple;
	bh=gBl6HYf2cYjTVKCP6gyydKpLvyLum+plGHiCXwPUrxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFnyTu1xkkZbxQ8bNDkYbUt4A2xXYWgHdpVdlBRbxybJxUevlQTtm9YPmdvYISq6F212Z0wWg5pKZMyACAmH4zZK36kQaG/DbptOeH7+ahfSO1Z8bVJAhOdOlgulZFQvcl4pX00ZSONr70W3PA/NuDxkEsYh9z3tuHXqdE0WJRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F244cEWm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC1A1F000E9;
	Sat, 13 Jun 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781369862;
	bh=35IHbTu3tEKf360Pfg5kvbRcvSef/I2tzHiMDnwImus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F244cEWmHnbJibbpiKRprqc6qHovylKhChnoyg4aofPNwbGTnM1haO2LY6NXOpyuN
	 8CTBMDShd4n3g1JV9phkkK21tJ7HzEwSQ5rmm3rgH97eWphy8KSEgLdBCcs1GuzDFk
	 Kl4dthrklx3MvAN7Zne0uBiqDoKxzcxdhh0yHFhMu1hYWifobF1Lorx8X6F7oUjhlO
	 MhTeEYvghJOA49XDzksMbxRHdW0fFBTs1RCbrSu0CqJSp3s/AlIIP6XdTRQrpVsGK+
	 jrphqAuz+sz8LywVc/Lv2We1GWQ+QORKn0MEsnntsVQpKyhbZhg24FrfN0EZ8UlxWY
	 VSYFlXYe1AdTQ==
Date: Sat, 13 Jun 2026 12:57:38 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <20260613165738.GA3152432@ax162>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <20260313235618.GA4171564@ax162>
 <3d6608fe-be15-497a-85a3-e6af2dbded0a@t-8ch.de>
 <20260324183501.GA3704429@ax162>
 <a31f2655-2ce8-4029-a63d-321c849730f7@t-8ch.de>
 <ai0tYULNorM5UDqd@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ai0tYULNorM5UDqd@levanger>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13746-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[weissschuh.net,arndb.de,orcam.me.uk,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:linux@weissschuh.net,m:arnd@arndb.de,m:macro@orcam.me.uk,m:sef1548@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3EF267F189

On Sat, Jun 13, 2026 at 12:13:53PM +0200, Nicolas Schier wrote:
> On Tue, Mar 24, 2026 at 08:58:08PM +0100, Thomas Weißschuh wrote:
> > On 2026-03-24 11:35:01-0700, Nathan Chancellor wrote:
> > > On Tue, Mar 24, 2026 at 06:05:34PM +0100, Thomas Weißschuh wrote:
> > > > On 2026-03-13 16:56:18-0700, Nathan Chancellor wrote:
> > > > > It sounds like the "< GCC 3.0" part of that might not be true based on
> > > > > Maciej's research?
> > > > > 
> > > > >   https://lore.kernel.org/alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk/
> > > > 
> > > > Yes, indeed. In my opinion the consistency aspect is still sufficient
> > > > to have this change. What do you think?
> > > 
> > > Yes, I think so. Will you keep it as going from __ASSEMBLY__ to
> > > __ASSEMBLER__? It probably makes more sense that way given there should
> > > be no regressions on the compiler side and that is the intended end
> > > result?
> > 
> > I would have stuck to the old name '__ASSEMBLY__', just for robustness
> > and because we are late in the cycle.
> > Then we can switch it early in the next cycle.
> 
> What's the state with this?  Shall this show up in linux-next early this
> cycle?

This fell off my radar. I think the commit message needs some small
updates based on my review upthread but once resent, we should be able
to take it when 7.2-rc1 is out?

-- 
Cheers,
Nathan

