Return-Path: <linux-kbuild+bounces-4214-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451EF9A5BC8
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 08:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17EE2826D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 06:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13746195385;
	Mon, 21 Oct 2024 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="F71kmBZ5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2A41D0F68;
	Mon, 21 Oct 2024 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493750; cv=none; b=ju6vxXKhaQkm4nKgOlat2aMcYbBRCEycTlWWj2K9Ig4O+H+XW7/YfPQ0X6RoETsbztmcVIcu9oSSQx9onoh9EE1uTKcE8XlmDcloMa25AymJoqyBm/74A3mBZd62/c+kDXKxfh5w7PrYhk8pjAlpAidKNnPywUzJu2rd1qRuiR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493750; c=relaxed/simple;
	bh=arkWI03su4YSBSMmr5PkdZjKRvultl8DVI/Ao8Lq9UQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/1qYbmbtMPmZxl6JJ1xkJI3HE6/4D+M/Ehr/9vhQE2kq78rABiEdMBGF3yjhtc3/PKl1aHTCy5PXiOYSwl52sGEvgnTanZGCtG4x4LPaPhsVfjuW4WzIlk2mECxkrk8XGssjNobMp8/ZXnUIRGvdl4uJo0d5AeiWMHK7DYV5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=F71kmBZ5; arc=none smtp.client-ip=185.70.40.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729493740; x=1729752940;
	bh=arkWI03su4YSBSMmr5PkdZjKRvultl8DVI/Ao8Lq9UQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F71kmBZ5RES2Ir+IWSGNZDbm78U1UiT1fbYk0BVQxwXV3CfipwjYeWB6dN3WtMQTm
	 dmK6v2GCZ5Obtz51Ri8F94paK6LNY54/kv/QWr57jVdCd7sU7/OWUwTfoTryRrxyqU
	 EAQ33pIbKn5Qe2HDgwQAnut7GQTL21RaqeQkD0hKEuP9B9kPNldkcezZTez4Hk9gU7
	 fApobs8rITw0PG91KlrICVVkyHC6htMV/vGKtqelCzpoHgaNHbyK6LGXmMxcPKDNQ5
	 qwKE0b8wABFGDC3qIz7YyG5KaqbyRSl8zCXoSWY8Zx4B73F0dJJEvVb5Rq9ufoehFx
	 BN74jFVgsNYtQ==
Date: Mon, 21 Oct 2024 06:55:35 +0000
To: koachan@protonmail.com
From: Koakuma <koachan@protonmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sparc/build: Remove all usage of -fcall-used* flags
Message-ID: <iBnrR9d4gRwtBGXlD_1AXH2OXuzLp6oR4PGkk4pg7KUVIsfs0G1zvzJTrO8o4y5ZHBWHdYOifN2_ZhbnrVd9jUTwJjeA5sdQhIcHp1o4xd0=@protonmail.com>
In-Reply-To: <20240716-sparc-cflags-v2-1-40bdc4484d10@protonmail.com>
References: <20240716-sparc-cflags-v2-0-40bdc4484d10@protonmail.com> <20240716-sparc-cflags-v2-1-40bdc4484d10@protonmail.com>
Feedback-ID: 6608610:user:proton
X-Pm-Message-ID: 1a094c75eebe4bf961b497dbdf4c0791a94cc949
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Koakuma via B4 Relay <devnull+koachan.protonmail.com@kernel.org> wrote:

> From: Koakuma koachan@protonmail.com
>
>
> Remove all usage of -fcall-used* flags so that all flags used are
> portable between GCC and clang.
>
> The reasoning is as follows:
>
> In the (normal) 32-bit ABI, %g5 and %g7 is normally reserved, and in
> the 64-bit ABI, %g7 is the reserved one.
> Linux turns them into volatile registers by the way of -fcall-used-*,
> but on the other hand, omitting the flags shouldn't be harmful;
> compilers will now simply refuse to touch them, and any assembly
> code that happens to touch them would still work like usual (because
> Linux' conventions already treats them as volatile anyway).
>
> Signed-off-by: Koakuma koachan@protonmail.com
>
> ---
> arch/sparc/Makefile | 4 ++--
> arch/sparc/vdso/Makefile | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
> index 757451c3ea1d..7318a8b452c3 100644
> --- a/arch/sparc/Makefile
> +++ b/arch/sparc/Makefile
> @@ -29,7 +29,7 @@ UTS_MACHINE :=3D sparc
> # versions of gcc. Some gcc versions won't pass -Av8 to binutils when you
> # give -mcpu=3Dv8. This silently worked with older bintutils versions but
> # does not any more.
> -KBUILD_CFLAGS +=3D -m32 -mcpu=3Dv8 -pipe -mno-fpu -fcall-used-g5 -fcall-=
used-g7
> +KBUILD_CFLAGS +=3D -m32 -mcpu=3Dv8 -pipe -mno-fpu
> KBUILD_CFLAGS +=3D -Wa,-Av8
>
> KBUILD_AFLAGS +=3D -m32 -Wa,-Av8
> @@ -45,7 +45,7 @@ export BITS :=3D 64
> UTS_MACHINE :=3D sparc64
>
> KBUILD_CFLAGS +=3D -m64 -pipe -mno-fpu -mcpu=3Dultrasparc -mcmodel=3Dmedl=
ow
> -KBUILD_CFLAGS +=3D -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compar=
e
> +KBUILD_CFLAGS +=3D -ffixed-g4 -ffixed-g5 -Wno-sign-compare
> KBUILD_CFLAGS +=3D -Wa,--undeclared-regs
> KBUILD_CFLAGS +=3D $(call cc-option,-mtune=3Dultrasparc3)
> KBUILD_AFLAGS +=3D -m64 -mcpu=3Dultrasparc -Wa,--undeclared-regs
> diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
> index 243dbfc4609d..e009443145af 100644
> --- a/arch/sparc/vdso/Makefile
> +++ b/arch/sparc/vdso/Makefile
> @@ -46,7 +46,7 @@ CFL :=3D $(PROFILING) -mcmodel=3Dmedlow -fPIC -O2 -fasy=
nchronous-unwind-tables -m64
> -fno-omit-frame-pointer -foptimize-sibling-calls \
> -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
>
> -SPARC_REG_CFLAGS =3D -ffixed-g4 -ffixed-g5 -fcall-used-g5 -fcall-used-g7
> +SPARC_REG_CFLAGS =3D -ffixed-g4 -ffixed-g5
>
> $(vobjs): KBUILD_CFLAGS :=3D $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUG=
INS_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
>
>
> --
> 2.45.2

Hmm, hello, is there anything else I should do for this patch
(and the series as a whole)?

