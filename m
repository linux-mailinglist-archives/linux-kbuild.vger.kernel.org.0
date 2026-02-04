Return-Path: <linux-kbuild+bounces-11025-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDk5EfQHg2lLgwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11025-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:48:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17B7E352A
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32801309C4BE
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 08:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C83396D09;
	Wed,  4 Feb 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO3RKyfR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E02D77F5;
	Wed,  4 Feb 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194723; cv=none; b=O6qnAdejyRYIxAhX/z6zs85X700s6J+5R2XC8tTan5QgjqI36WaacXUKyW0kuuFBF3bdV6Jn6nRgdhCpKwf8Yjxomi5qlmlINrOAucEWjL5+tBTcKamUmB6V4GqsWgjFtEugKkuaoscY8i2N4U5Tkh64LVV7mKeOsP7H/oEKCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194723; c=relaxed/simple;
	bh=7BJovgRmBrl/hGJfIkPVkdGV/MPjKN0VXD20GsNx1yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbEdQOlaCgUBXSn2gkOrwVT69FHCbs7hrwM+J7yRGGJB0xoiLho62cXZBEa/D++N0u1KtAz9sefSzKBd+RAh6XsO4Zgn3Ee1c2Na6ozEhjajQ6xJkqwWmvObQXJI0PpRM1enBVOmF/IKlDdAjZyeXUkhyBPWeubatrFGgiu59pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO3RKyfR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D30C19422;
	Wed,  4 Feb 2026 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770194723;
	bh=7BJovgRmBrl/hGJfIkPVkdGV/MPjKN0VXD20GsNx1yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jO3RKyfRMqLoXWSPiZSlYZNwrI5Y7orNY+Vq3Aj5/WoRCs/7pk6Kz/8Owt4l0kYVq
	 9P+k8BbOPM1zqzFney+wZi3LgeWmY+L6CAghdUVIi0y00hJesrP+kpMHwkhnUOc+fb
	 hH9m75VPgRUTmVMlMGUrS2QmCDTlCeTYU/F1Ug6+v3VGG68GEKCU2jitdI+jtZ7oHo
	 7CiI3s5OVIErcUA6KIv5aTS1ravKgP7Jxxw3bBl/E9c5fBxTE4xW11L8QBk228prxM
	 KZXVXMDPNGa5PrAaAfXMGyN5Dr3uEAFGXxi89mFEdDu92I8II+8IiaitZmczchE1Wp
	 rcAitSPAzflJA==
Date: Wed, 4 Feb 2026 01:45:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
	WangYuli <wangyuli@uniontech.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	James Le Cuirot <chewi@gentoo.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: do not exclude
 scripts/dtc/libfdt/
Message-ID: <20260204084517.GA3900164@ax162>
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
 <20260204021603.GA2646832@ax162>
 <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
 <ed9cd9a5d1f51b83c46ada7adb942e611c0c8a41.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed9cd9a5d1f51b83c46ada7adb942e611c0c8a41.camel@icenowy.me>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11025-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,rong.moe];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: E17B7E352A
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:27:24AM +0800, Icenowy Zheng wrote:
> 在 2026-02-04星期三的 11:26 +0800，Icenowy Zheng写道：
> > 在 2026-02-03星期二的 19:16 -0700，Nathan Chancellor写道：
> > > + Rob, Saravana, and devicetree@ since this concerns files they
> > > own.
> > > 
> > > On Sun, Feb 01, 2026 at 09:02:59PM +0800, Icenowy Zheng wrote:
> > > > There exists a header file in include/linux/ called libfdt.h that
> > > > is
> > > > just a wrapper for libfdt header file in scripts/dtc/libfdt/.
> > > > This
> > > > makes
> > > > the headers inside libfdt copy at scripts/dtc/libfdt/ part of the
> > > > kernel
> > > > headers for building external modules.
> > > > 
> > > > Do not exclude them, otherwise modules that include
> > > > <linux/libfdt.h>
> > > > will fail to build externally.
> > > > 
> > > > Fixes: aaed5c7739be ("kbuild: slim down package for building
> > > > external modules")
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > 
> > > This does indeed bring back scripts/dtc/libfdt back into the
> > > headers
> > > package that I examined. However, how does including libfdt.h in an
> > > external module actually work, even with this change? libfdt
> > > appears
> > > to
> > > be built into vmlinux IIUC and I do not see any EXPORT_SYMBOLs in
> > > the
> > > list, so how can you actually use any of the functions from libfdt
> > > within the module? Would you just build and link the pieces that
> > > your
> > > module needs using the other source files?
> > 
> > To be honest what I met is quite weird -- my module [1] does not use
> > libfdt at all. However, as a MIPS platform-specific module, it
> > includes
> > arch/mips/include/asm/bootinfo.h, which pulls in libfdt.h.
> > 
> > Or maybe I should prevent libfdt.h inclusion from other kernel
> > headers?
> > It looks like only two headers in MIPS architecture-specific code
> > includes libfdt.h, asm/bootinfo.h and asm/machine.h .

Ah, thanks for that information. Moving the libfdt.h bits out of
bootinfo.h does not seem like it would be too difficult but I am less
sure about asm/machine.h. Alternatively, maybe this could be avoided by
separating out what you would need from bootinfo.h into its own header
but I did not look too hard.

As for a solution within install-extmod-build, maybe the libfdt headers
could be included so that inadvertent inclusions of libfdt.h do not
break the build but the link fails if the module actually tries to use
any libfdt functions?

> Ah, forgot to place the [1] reference link, although I doubt whether
> it's really related to the context:
> 
> [1] https://github.com/Icenowy/mips-loong-3nod-laptop-driver

This was helpful for testing the following diff, so thanks for providing
it still.

Cheers,
Nathan

