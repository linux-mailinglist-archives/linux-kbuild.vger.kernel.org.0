Return-Path: <linux-kbuild+bounces-11015-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ne+EoW8gmk4ZgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11015-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 04:27:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9959E13CE
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 04:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB243300A76B
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 03:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6332D191C;
	Wed,  4 Feb 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="oBhYW2KY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f119.zoho.com (sender4-pp-f119.zoho.com [136.143.188.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6648287269;
	Wed,  4 Feb 2026 03:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770175594; cv=pass; b=YNnZCnUSFsACFmW4jWQ9xuVQVRAndTeOrFzHwjdhSB9xxl5+oiQShJY+IjBdfSzAI8LMYg6rksUSoMZ/+eBTnR02kf+RWYycP3dXJv9rbSIciPbWAfQucZ0KBUPkOyrB135ABDrmuOtSVqDC0XB9rKJnoCFxsaOmtGWbY1lC1dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770175594; c=relaxed/simple;
	bh=5xaGXDmLMViRMswFsyuPsO1QbDCALA7Jqm6zuvkS6lY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IbUOtP8RTMwkf4ZON8d+bWYr4masMNhVvYq7eTzvcxDxUUGuL68WDgMgn87rQGdGuYl8pw6pVkVixAy8TiOvCaJH8uaTpp4tATQVddbtuwRS42UmYcSkBCOW+lNuv7sRVv21VdnMcZExf6w475edyOpKXjDA+kkern1Q8Aj6vP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=oBhYW2KY; arc=pass smtp.client-ip=136.143.188.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1770175569; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fcMSL9xMHKoMhfyzWf637TZcgxaKpfLmm19YterM8H8JE0IB0DXofAhjAklMeu2tyFHcsdK+ayfr5FvTnC2rmi4cfPGzcWz+751cNZqAfimnrrK4mzKuTXzWmIKFtslBALiozb0gTG5Swg/JYxGrqZyELiHlxps1HVuzvFpZu08=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770175569; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5xaGXDmLMViRMswFsyuPsO1QbDCALA7Jqm6zuvkS6lY=; 
	b=fuiR8k1tGaH/F3fEhdKsLLDFAdWKMBryasJrTWWPxcPfkamOiqB/pF0PB3/VhqKICamKzOZkEyx37HhwheIzhVT7O8nYESKN2ZBSph3DHpLd6F+qqHeOPEtiInpBPs8DU1yudxkpOsuYtoWa9KNZIuxyYNhYDg43jDPTFzq2qPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770175568;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=5xaGXDmLMViRMswFsyuPsO1QbDCALA7Jqm6zuvkS6lY=;
	b=oBhYW2KYwptosU1J/BNS8tmxZR5tHGpW10pT4V7dSBwNoijBxa4Y4ScusKaW/rPe
	oH7RAMZRyIkvmOs1r0Wcy7aYpdBo7FIzQpR+huzYp6eXhXMIVq9+s8KkUa86z2xePGI
	hIX9rjdBWq54H/KR1hpS/djyzOG2o02zrQNFQ6FtI4pEnL71Ood2Tls/lekKPz5lw/T
	xJ8GZ/uD/nfHn2674FSWPv0/kXNE2MmdzU4ESrVAk3oWJ/+UO6dDeLhVz5UkKWGAN8a
	SaFGKAoT2BJRRYFAY0i2nJX1LyjNuBjVtuMVDfWMwiVZ0EUSQsqR9MhzLxyfaB3zMJg
	lAHvcj0Mqg==
Received: by mx.zohomail.com with SMTPS id 1770175566800833.2613376478058;
	Tue, 3 Feb 2026 19:26:06 -0800 (PST)
Message-ID: <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
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
Date: Wed, 04 Feb 2026 11:26:00 +0800
In-Reply-To: <20260204021603.GA2646832@ax162>
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
	 <20260204021603.GA2646832@ax162>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11015-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,rong.moe];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icenowy.me:mid,icenowy.me:dkim]
X-Rspamd-Queue-Id: E9959E13CE
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-03=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 19:16 -0700=EF=BC=
=8CNathan Chancellor=E5=86=99=E9=81=93=EF=BC=9A
> + Rob, Saravana, and devicetree@ since this concerns files they own.
>=20
> On Sun, Feb 01, 2026 at 09:02:59PM +0800, Icenowy Zheng wrote:
> > There exists a header file in include/linux/ called libfdt.h that
> > is
> > just a wrapper for libfdt header file in scripts/dtc/libfdt/. This
> > makes
> > the headers inside libfdt copy at scripts/dtc/libfdt/ part of the
> > kernel
> > headers for building external modules.
> >=20
> > Do not exclude them, otherwise modules that include
> > <linux/libfdt.h>
> > will fail to build externally.
> >=20
> > Fixes: aaed5c7739be ("kbuild: slim down package for building
> > external modules")
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>=20
> This does indeed bring back scripts/dtc/libfdt back into the headers
> package that I examined. However, how does including libfdt.h in an
> external module actually work, even with this change? libfdt appears
> to
> be built into vmlinux IIUC and I do not see any EXPORT_SYMBOLs in the
> list, so how can you actually use any of the functions from libfdt
> within the module? Would you just build and link the pieces that your
> module needs using the other source files?

To be honest what I met is quite weird -- my module [1] does not use
libfdt at all. However, as a MIPS platform-specific module, it includes
arch/mips/include/asm/bootinfo.h, which pulls in libfdt.h.

Or maybe I should prevent libfdt.h inclusion from other kernel headers?
It looks like only two headers in MIPS architecture-specific code
includes libfdt.h, asm/bootinfo.h and asm/machine.h .

Thanks,
Icenowy

>=20
> > ---
> > =C2=A0scripts/package/install-extmod-build | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/package/install-extmod-build
> > b/scripts/package/install-extmod-build
> > index 2576cf7902dbb..d1e448d7f59f6 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -11,7 +11,8 @@ is_enabled() {
> > =C2=A0
> > =C2=A0find_in_scripts() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0find scripts \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0\( -name atomic -o -name dtc -o -name kconfig -o -
> > name package \) -prune -o \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0\( -name atomic -o -name kconfig -o -name package -
> > o \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \( -path '*/dtc/*' -a ! -path '*/libfdt*'=
 \) \)
> > -prune -o \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0! -name unifdef -a ! -name mk_elfconfig -a \( -t=
ype
> > f -o -type l \) -print
> > =C2=A0}
> > =C2=A0
> > --=20
> > 2.52.0
> >=20


