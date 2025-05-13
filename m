Return-Path: <linux-kbuild+bounces-7094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED4AB5752
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 16:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A01FB169C3F
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 14:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148051B2194;
	Tue, 13 May 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpudO2y8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43271AF0A7
	for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147147; cv=none; b=q/EiaS8WSFsjdTNXWwulpSp19qDwOB5q2IOcBfj1vOzL+v6MA/8wB063IhQmbm4+XO2zQkCWP+/tjdI+mXgHv1lYC6+eR27s6XAFp+DAmtv4mTvKrxb7k8yS7K64XBb5yYpGvpcgUH/yccAoVEdNm8ZVDQMNr3qnxF/k13bVnSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147147; c=relaxed/simple;
	bh=BFeP1d5kh0IR1RuTn3H/klwzxZV7RjEJ82t7QxBUhvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pws5nFsbSSIU9k90l8cf/rYriThEaI9DNMCoOrxbr5DVcyBLaCKLLRnWddtrlTRfyZWBEpM7Ux5NrGd/CiBHrzaU8mILvkIC1BmNphE1y2FLycrmGDNbxQea/AZbBvC3KMlkb0YJbrPKIRbBY74tuA0M+t+hsfl7twkCYWv+xLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpudO2y8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00B1C4CEE4
	for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147146;
	bh=BFeP1d5kh0IR1RuTn3H/klwzxZV7RjEJ82t7QxBUhvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UpudO2y84JoSCWBptmNodloeTPdADrdqjznUUg0Fxx2grnfThXGe9s3uJnvhk1Pa2
	 tohdxiozG45AKFemPwQzUWFpX3yRFtwxEy6673nA597qEQu5TZs5FVAtfikS7ZRVfu
	 Dsmd5UCbX0Qawzo6nDy/kpJqBx1YZE4Zk1Vc5dJHy05uvOPFJEMX9G8vDhHroihZ4T
	 2nIBF1D1nO6fIqovchmbT2TbnL64L+F2MonEA68gmnMzSdL6n5bQ2pc7omix9klp45
	 qPUuRex81l596t3vQC3QFtFkAGWF/oxmdAGWY929HkrC9KOBO31nizyOBbdWpisDjj
	 GroCsnvNxJWow==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54fc36323c5so5211770e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 07:39:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy88OPrge2bvtvgoHjDtK+ZFTllw1Fu1Lpukc7giF/z85ExN4gb
	NL4EiJEWJQfzxYxEtFVf/WXruf8k4+Slln02qXaIJ03L5pSK4zF1taFBNRFvMDiR8OGq4e5jtDB
	p4WKmwCJEe6lgFISi2Cet8y2nNOg=
X-Google-Smtp-Source: AGHT+IHuiOemV0KkmjUuG7Dx0ImsieEtaKFTjM5OwPxCIUvQqCqERXahhgUYRcufHBbDOxL1JJ9gmAna4f2Ro/Cxvj4=
X-Received: by 2002:a05:6512:3191:b0:54f:bdbb:1dc1 with SMTP id
 2adb3069b0e04-550d0bfae0dmr1274279e87.18.1747147145470; Tue, 13 May 2025
 07:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513040409.147881-1-vince@underview.tech>
In-Reply-To: <20250513040409.147881-1-vince@underview.tech>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 May 2025 23:38:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQw0KH-yaGTYi7Efy-NpkYuC8qyMfB04pq2DkS6FTQkeg@mail.gmail.com>
X-Gm-Features: AX0GCFtV3uzT6AtNev7ESNpSq8eXHsHS3gNa8C9mOmHxb2d7JEQ07uU07mcB1dQ
Message-ID: <CAK7LNAQw0KH-yaGTYi7Efy-NpkYuC8qyMfB04pq2DkS6FTQkeg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
To: Vincent Davis Jr <vince@underview.tech>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 1:04=E2=80=AFPM Vincent Davis Jr <vince@underview.t=
ech> wrote:
>
> When running
>
> make -C \
> "${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
> modules_prepare

This is not the correct way to build an external module.
Do not run modules_prepare.




> Issue that are encountered include
>
> make -f ./Makefile syncconfig
> make -f ./scripts/Makefile.build obj=3Dscripts/basic
>    92 | #include <sys/types.h>
>       |          ^~~~~~~~~~~~~
> compilation terminated.
>
> ld: cannot find Scrt1.o: No such file or directory
> ld: cannot find crti.o: No such file or directory
> ld: cannot find crtbeginS.o: No such file or directory
> ld: cannot find -lgcc: No such file or directory
> ld: cannot find -lgcc_s: No such file or directory
> ld: cannot find -lc: No such file or directory
> ld: cannot find -lgcc: No such file or directory
> ld: cannot find -lgcc_s: No such file or directory
> ld: cannot find crtendS.o: No such file or directory
> ld: cannot find crtn.o: No such file or directory
>
> Solved by setting KCFLAGS as the yocto project SDK
> KCFLAGS is set to --sysroot=3D"${SDKTARGETSYSROOT}".
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 64c514f4bc19..bbe7b0503841 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -459,7 +459,7 @@ HOSTRUSTC =3D rustc
>  HOSTPKG_CONFIG =3D pkg-config
>
>  KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prototype=
s \
> -                        -O2 -fomit-frame-pointer -std=3Dgnu11
> +                        -O2 -fomit-frame-pointer -std=3Dgnu11 $(KCFLAGS)


Sorry, I do not understand what you are trying to achieve.

KCFLAGS is meant to specify compiler flags for the kernel-space,
not userspace host programs.




>  KBUILD_USERCFLAGS  :=3D $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
>  KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
>
> @@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS :=3D -Wall -O2 $(HOST_LFS_CFLAGS)=
 $(HOSTCXXFLAGS) \
>                        -I $(srctree)/scripts/include
>  KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
> -KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> +KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAGS)
>  KBUILD_HOSTLDLIBS   :=3D $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>  KBUILD_PROCMACROLDFLAGS :=3D $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDFLA=
GS))
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

