Return-Path: <linux-kbuild+bounces-11016-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO2NLcu8gmk4ZgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11016-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 04:28:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115FDE1403
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 04:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41F68300B110
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 03:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419012D1F4E;
	Wed,  4 Feb 2026 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Prf/TSY8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09073BB48;
	Wed,  4 Feb 2026 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770175674; cv=pass; b=kS3NNVJkMrSIBh6N5SG2uTtKDkmQdKprKmNbjG6VkNx8Cmywa8+M5LH05qGK05gZuvTCNx42a5UcET/nKvROtsF1hzQ0T6X19BIixrM5E9VZfqCERcn/3RqbPB9W6wfuM9aefbd7/I3+DhbqsWGI1A4BKrVV0Iy+T655tvW4TZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770175674; c=relaxed/simple;
	bh=PsO73wFKIQYbaGS1zgEpzgUrYfJanbxreuRCbtSIuVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EghVei5YBWisE36XqMutXHVMmDiRz0E6hGmUhliDtAlv3o8w3yqN4SPHhnMM7cJljOlIl/BqRoefFrhQsUOZbOLZ03SgFV707NduixJRe50jYB4hgMnpLvx0r7G2PD4YIN9bj6pbLDoJ05KpEKxO6zVCaFxkLZO1lVyz8R5evCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=Prf/TSY8; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1770175653; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OxdAaQqpOOoL1QyLMmVDRj+i3GhlZJsnOrFO3MhKK1j7z4JknWuGEFf0eyfNBIt1ERzv3fySUlM+56sSw/J+xdeTTuSkcrIIHbCB2Ne+YpWHbBr/jMsmALraTwIv7eYFaWzBZhN8UmNspS7jUvoGUs43sLIw+LZfKWvlWr6JnIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770175653; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PsO73wFKIQYbaGS1zgEpzgUrYfJanbxreuRCbtSIuVA=; 
	b=cb6bXUucU8zC+YoVfsrP9E4qjeOHCUXFipVQzCCeTJmGBpQt3PcA2uv9OEKsYZ4/+LARqUyciVbz2v3sr+PHw9gwR+m6n0rK6BUe/5cWnc2H5PhVmmI1bUb3zoEUG0cSbR19gUYGMrvaANC/120zkY20fewB4z3TdJCqdwlqy04=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770175653;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=PsO73wFKIQYbaGS1zgEpzgUrYfJanbxreuRCbtSIuVA=;
	b=Prf/TSY8fOoti0OgtdtpbvI/WitFPSQdDJ3nXHSmcyDB9zpWItWoBeqFlzbSsT8X
	Ws9Pha10Z4l1VxqPVkpaPKx3uKh6PP97Ypm9R2XPTDq6xYwKQpTNij0jPzdzsk70Y8e
	TIZFOz8y4AG5ul0tmzrcLK2mGOoy8R5qNi4saVT+aydd4Av5d3aLQ5EpIB3HfKu2OV2
	WLzEGboMUcLQcX3ywtDiF8nnmNfAHRCgmLsO8OO2C1g8Rx8vk8RJ6qzU+lY1IsCgWDx
	qkrEp0M5ukl4hUAeWze+zh51KNjN5HI/bmXac6mjc09qQSNfPOzvlRlVl5Ymzvgb+fk
	p+u7+xG8qw==
Received: by mx.zohomail.com with SMTPS id 1770175651636281.5564596535203;
	Tue, 3 Feb 2026 19:27:31 -0800 (PST)
Message-ID: <ed9cd9a5d1f51b83c46ada7adb942e611c0c8a41.camel@icenowy.me>
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
Date: Wed, 04 Feb 2026 11:27:24 +0800
In-Reply-To: <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
	 <20260204021603.GA2646832@ax162>
	 <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
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
	TAGGED_FROM(0.00)[bounces-11016-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[icenowy.me:mid,icenowy.me:dkim,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 115FDE1403
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-04=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:26 +0800=EF=BC=
=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A8 2026-02-03=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 19:16 -0700=EF=
=BC=8CNathan Chancellor=E5=86=99=E9=81=93=EF=BC=9A
> > + Rob, Saravana, and devicetree@ since this concerns files they
> > own.
> >=20
> > On Sun, Feb 01, 2026 at 09:02:59PM +0800, Icenowy Zheng wrote:
> > > There exists a header file in include/linux/ called libfdt.h that
> > > is
> > > just a wrapper for libfdt header file in scripts/dtc/libfdt/.
> > > This
> > > makes
> > > the headers inside libfdt copy at scripts/dtc/libfdt/ part of the
> > > kernel
> > > headers for building external modules.
> > >=20
> > > Do not exclude them, otherwise modules that include
> > > <linux/libfdt.h>
> > > will fail to build externally.
> > >=20
> > > Fixes: aaed5c7739be ("kbuild: slim down package for building
> > > external modules")
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> >=20
> > This does indeed bring back scripts/dtc/libfdt back into the
> > headers
> > package that I examined. However, how does including libfdt.h in an
> > external module actually work, even with this change? libfdt
> > appears
> > to
> > be built into vmlinux IIUC and I do not see any EXPORT_SYMBOLs in
> > the
> > list, so how can you actually use any of the functions from libfdt
> > within the module? Would you just build and link the pieces that
> > your
> > module needs using the other source files?
>=20
> To be honest what I met is quite weird -- my module [1] does not use
> libfdt at all. However, as a MIPS platform-specific module, it
> includes
> arch/mips/include/asm/bootinfo.h, which pulls in libfdt.h.
>=20
> Or maybe I should prevent libfdt.h inclusion from other kernel
> headers?
> It looks like only two headers in MIPS architecture-specific code
> includes libfdt.h, asm/bootinfo.h and asm/machine.h .
>=20
> Thanks,
> Icenowy

Ah, forgot to place the [1] reference link, although I doubt whether
it's really related to the context:

[1] https://github.com/Icenowy/mips-loong-3nod-laptop-driver

>=20
> >=20
> > > ---
> > > =C2=A0scripts/package/install-extmod-build | 3 ++-
> > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/scripts/package/install-extmod-build
> > > b/scripts/package/install-extmod-build
> > > index 2576cf7902dbb..d1e448d7f59f6 100755
> > > --- a/scripts/package/install-extmod-build
> > > +++ b/scripts/package/install-extmod-build
> > > @@ -11,7 +11,8 @@ is_enabled() {
> > > =C2=A0
> > > =C2=A0find_in_scripts() {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0find scripts \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0\( -name atomic -o -name dtc -o -name kconfig -o
> > > -
> > > name package \) -prune -o \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0\( -name atomic -o -name kconfig -o -name package
> > > -
> > > o \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \( -path '*/dtc/*' -a ! -path '*/libfd=
t*' \)
> > > \)
> > > -prune -o \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0! -name unifdef -a ! -name mk_elfconfig -a \( -
> > > type
> > > f -o -type l \) -print
> > > =C2=A0}
> > > =C2=A0
> > > --=20
> > > 2.52.0
> > >=20
>=20


