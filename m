Return-Path: <linux-kbuild+bounces-11040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPMPEVxThGkx2gMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11040-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 09:22:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E452EFD5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 09:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56E133008626
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Feb 2026 08:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C4A36212B;
	Thu,  5 Feb 2026 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="nFwvjlpD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-g123.zoho.com (sender4-pp-g123.zoho.com [136.143.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386D361DC5;
	Thu,  5 Feb 2026 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279758; cv=pass; b=mho+W1oawrKerDvUz447yxN7+7vf6otivTXJXgmyK8PIH87s2YBgKLkCFujnz0EArK3dLcr/0pV9dQ236mPdrDs7ahABn5NlJMfNKJJeC8tTaXkBoTt5Fz3FGnYJwX8Hor6hJmUe4iOQq869efTrzFBb8UzB+QXgdXqrgFuvH0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279758; c=relaxed/simple;
	bh=KX8SoHLXFD+hXBQkIr9EhsKDttDXNItNDBV6BxC2Dwg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B6eBfGur/7M4Oxyr7HXt4k3o11gqF91Wy5yG7V5tx4WbAb3jo9/cOOtAi2fqEZzw6fDGXteNsyjTzhOcFu8OtZ/ESkRXusnd5wtIOS48htIVsBHow0SNLz+TBbpQvvHnyLJR+c5YCYYo9RGvz0ylP1A0xk3Cz7ty4SY/BLxe79M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=nFwvjlpD; arc=pass smtp.client-ip=136.143.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1770279736; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e37DTfkJ5CFlNkQV2jmeQgmAaLK+Wu/w+T/8XkMR7+BeKbYcD8GEPyzfzKHByB5TS+sU5rk7MNir1VyS9ILOhM2K9hU0L+HD0vXm+MTIvtmS0qPB07bEJ5255sXfEip51tFSHrs8WTAVFhmTIznSqE0xQSSXPF4cfvLHd0ewMJ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770279736; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KX8SoHLXFD+hXBQkIr9EhsKDttDXNItNDBV6BxC2Dwg=; 
	b=bFwUgMlD7h8KF6uAuI6aZSSGiB1+yVuItKYw8Z8ePTG1eAemQqGdmVHAcWiBV+YWC5AsmRBKBG90mcUDVow599kwNQZtdaeREVGifGamQQwStm1EBIBBfz7b169vOxAZ0mq1wZ9WUyb0BeAZr2f+SJKcsuiZyVA0RosM+94X9cQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770279736;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=KX8SoHLXFD+hXBQkIr9EhsKDttDXNItNDBV6BxC2Dwg=;
	b=nFwvjlpDQIXov2TtG2ZnW9GzbymC1jve4QkUrf31DWW0VUGpH7TYw8xI4R8wvIOU
	/Blh7/2Pv2Xfhfs820Q3eJB0rd01FDRRj4OKUQD+8+clCYubC46odpBD4q6WXYX8Wz0
	rtfIziSo2ctmgtY6lSn4jv/wRcuYJpEQ00KmQWX0DuIym+FZFkNStLnZiRI+i2L7Zad
	UHA00gU13/wRC/DL2WLxmcqoCpSXZkvdwEAPU9up6UeDdrvj8bGxieluLybnnGYUZDW
	och4++42H5FVnUp9NRXC30ySuy3CIti3ChWyPlXChf5bM93LBT1Xnr/RGBWbVZifJTi
	sCJqbzYRCg==
Received: by mx.zohomail.com with SMTPS id 1770279733473580.7790868083038;
	Thu, 5 Feb 2026 00:22:13 -0800 (PST)
Message-ID: <f630f4b595027fbd60d440eb90c3e332c2b52def.camel@icenowy.me>
Subject: Re: [PATCH] kbuild: install-extmod-build: do not exclude
 scripts/dtc/libfdt/
From: Icenowy Zheng <uwu@icenowy.me>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
  Abel Vesa <abelvesa@kernel.org>, Mingcong Bai <jeffbai@aosc.io>, WangYuli
 <wangyuli@uniontech.com>,  Inochi Amaoto <inochiama@gmail.com>, James Le
 Cuirot <chewi@gentoo.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 devicetree@vger.kernel.org
Date: Thu, 05 Feb 2026 16:22:05 +0800
In-Reply-To: <20260204084517.GA3900164@ax162>
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
	 <20260204021603.GA2646832@ax162>
	 <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
	 <ed9cd9a5d1f51b83c46ada7adb942e611c0c8a41.camel@icenowy.me>
	 <20260204084517.GA3900164@ax162>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11040-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,rong.moe];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E452EFD5B
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-04=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 01:45 -0700=EF=BC=
=8CNathan Chancellor=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Feb 04, 2026 at 11:27:24AM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-02-04=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:26 +0800=EF=
=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > > =E5=9C=A8 2026-02-03=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 19:16 -0700=
=EF=BC=8CNathan Chancellor=E5=86=99=E9=81=93=EF=BC=9A
> > > > + Rob, Saravana, and devicetree@ since this concerns files they
> > > > own.
> > > >=20
> > > > On Sun, Feb 01, 2026 at 09:02:59PM +0800, Icenowy Zheng wrote:
> > > > > There exists a header file in include/linux/ called libfdt.h
> > > > > that
> > > > > is
> > > > > just a wrapper for libfdt header file in scripts/dtc/libfdt/.
> > > > > This
> > > > > makes
> > > > > the headers inside libfdt copy at scripts/dtc/libfdt/ part of
> > > > > the
> > > > > kernel
> > > > > headers for building external modules.
> > > > >=20
> > > > > Do not exclude them, otherwise modules that include
> > > > > <linux/libfdt.h>
> > > > > will fail to build externally.
> > > > >=20
> > > > > Fixes: aaed5c7739be ("kbuild: slim down package for building
> > > > > external modules")
> > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > >=20
> > > > This does indeed bring back scripts/dtc/libfdt back into the
> > > > headers
> > > > package that I examined. However, how does including libfdt.h
> > > > in an
> > > > external module actually work, even with this change? libfdt
> > > > appears
> > > > to
> > > > be built into vmlinux IIUC and I do not see any EXPORT_SYMBOLs
> > > > in
> > > > the
> > > > list, so how can you actually use any of the functions from
> > > > libfdt
> > > > within the module? Would you just build and link the pieces
> > > > that
> > > > your
> > > > module needs using the other source files?
> > >=20
> > > To be honest what I met is quite weird -- my module [1] does not
> > > use
> > > libfdt at all. However, as a MIPS platform-specific module, it
> > > includes
> > > arch/mips/include/asm/bootinfo.h, which pulls in libfdt.h.
> > >=20
> > > Or maybe I should prevent libfdt.h inclusion from other kernel
> > > headers?
> > > It looks like only two headers in MIPS architecture-specific code
> > > includes libfdt.h, asm/bootinfo.h and asm/machine.h .
>=20
> Ah, thanks for that information. Moving the libfdt.h bits out of
> bootinfo.h does not seem like it would be too difficult but I am less
> sure about asm/machine.h. Alternatively, maybe this could be avoided
> by
> separating out what you would need from bootinfo.h into its own
> header
> but I did not look too hard.

A bad joke -- the driver seems to require no bootinfo.h now. It's a
stale inclusion (because it's taken from some downstream tree and
rewritten to use mainline i8042 lock). Sorry for this...

Although I do think the libfdt.h inclusion should be removed from MIPS
headers.

For testing this any stub module can work with `#include
<asm/bootinfo.h>` (or machine.h) injected...

>=20
> As for a solution within install-extmod-build, maybe the libfdt
> headers
> could be included so that inadvertent inclusions of libfdt.h do not
> break the build but the link fails if the module actually tries to
> use
> any libfdt functions?

I don't think it proper either.

By the way, should include/linux/libfdt.h be removed from extmod build
installations? As it's not going to work...

>=20
> > Ah, forgot to place the [1] reference link, although I doubt
> > whether
> > it's really related to the context:
> >=20
> > [1] https://github.com/Icenowy/mips-loong-3nod-laptop-driver
>=20
> This was helpful for testing the following diff, so thanks for
> providing
> it still.
>=20
> Cheers,
> Nathan


