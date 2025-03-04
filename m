Return-Path: <linux-kbuild+bounces-5960-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FC7A4ECBB
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 20:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92D50169E75
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 19:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DC8259CB5;
	Tue,  4 Mar 2025 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATlmuVYr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC07253347;
	Tue,  4 Mar 2025 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741115070; cv=none; b=WksEtqWzmT9KoLcXjrpZR7o6GIkkTFpaa/cu2TSnJPp4MiwjQU2R1Apa+NQEbdr+UNLj7Vte2F7+uq659YV9Qw9Xv25Sl7w6HAl4h1wd8Llxh897hLKJ4zw2lt149tdD22JCiUo+0z+3CvKdm99DcGY4SgJYAotzlLV5NVX28UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741115070; c=relaxed/simple;
	bh=Qn9S4+V/97GfF3eFipo304AU6RxOjXrFfbihFVbAP94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnvkBngTx7TioNeXYjkE8eM2Afhl/GIDAKrU/Fo69H3JQ8xTehIDek4zTITT9JmdIcrsTlLsfBUPmpHAm14f9Q+GW1/sUJoXD1HHrw3Mp7y0F/xtijEaVjcP0VqFofqpbMsaykqdxTxFWpaO4r+u+n2u22LbaOGZA8pKldj7tRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATlmuVYr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1B7C4CEE8;
	Tue,  4 Mar 2025 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741115070;
	bh=Qn9S4+V/97GfF3eFipo304AU6RxOjXrFfbihFVbAP94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ATlmuVYr87M1pgs/yT1CaSYvsj4kyKYlB3VQMMXsC2aWYj67Cdzz9NbEXM54f/TYJ
	 R+zu0a73Hh3QQ02Vlrsj+rvOhoEpTfyuxYE/ujo682tOAPJMyeW8wWSNfjVh32/4gd
	 rD9vz5xt+/ZLxRGMzF6PsTMZlVIgtE+VW1x588tx6RFVMLMG4dcQlVc8V482kcW8UG
	 tWia6uqUujvAIArFI3mGTh1hiOkTGCcvIdz7q29mr+GDzNf2gHJoNP39Q2CG50VA3q
	 pfALpMwXSQNYUmkezcsSCJ30TItd1Fz981UE1fAAtuLF7FY5uxNYjG9EGPJV5wGnbm
	 qyRuiUNj66XAQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549662705ffso3060005e87.0;
        Tue, 04 Mar 2025 11:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxi5tVFh0IDiYP8B1lV3/OWtUw99T2Cp1JVc7waXi26V3AMYa7IDd9KlRRueW9p9Mep8Y1Rglp@vger.kernel.org, AJvYcCXE+vFrkxYzO1vRNz/s2HLTu8yWgD5ura2AAzHjqb7QR5MQnrUq/VnJaTF/3/rZ9GUGAnoI2U9YwoNb73E=@vger.kernel.org, AJvYcCXGkJ4gq8vzLNJMW5SY8TS22xb6CZul23t0qUyZtv+cN4WqPCfCmCUeA2VabqPvfOWFvPQa0cUNXUXeJ0Ft@vger.kernel.org
X-Gm-Message-State: AOJu0YyzUmaUGBG6j7xltysUOpveHJjUmVTyxnTfIL4a+3gy/KJbYWZ0
	fxQzft5pFGO1WxScx6LmkzFPvMPmkL9N9Emne+P//DUpLlRDY8BeRT227Kt/i9siurIcNK7EvrP
	LbBh0RoRldQF64elkzVciMN2/72E=
X-Google-Smtp-Source: AGHT+IGpQbtm58WHCyoUrOTWmhWSWXoTW1SjSCbDYNUUDn/O7H6EdSr/JG96ZlnKCyZZJuOlu+UPpWaQ113YGzdow/A=
X-Received: by 2002:a05:6512:2807:b0:545:4b0:3dce with SMTP id
 2adb3069b0e04-5497d3304e6mr103775e87.1.1741115068559; Tue, 04 Mar 2025
 11:04:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-kbuild-userprog-fixes-v2-1-4da179778be0@linutronix.de>
In-Reply-To: <20250217-kbuild-userprog-fixes-v2-1-4da179778be0@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 5 Mar 2025 04:03:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATc-a0CP_tXqwpuCmLLMHAhqnx40Dg5ouUACAdVFpHarw@mail.gmail.com>
X-Gm-Features: AQ5f1JqwhglpY45o1CvWGoVnnF4T9ViEX1OZhwj_NTTO7J3MsENWkja9EDuvu_A
Message-ID: <CAK7LNATc-a0CP_tXqwpuCmLLMHAhqnx40Dg5ouUACAdVFpHarw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: userprogs: use correct lld when linking
 through clang
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 4:28=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The userprog infrastructure links objects files through $(CC).
> Either explicitly by manually calling $(CC) on multiple object files or
> implicitly by directly compiling a source file to an executable.
> The documentation at Documentation/kbuild/llvm.rst indicates that ld.lld
> would be used for linking if LLVM=3D1 is specified.
> However clang instead will use either a globally installed cross linker
> from $PATH called ${target}-ld or fall back to the system linker, which
> probably does not support crosslinking.
> For the normal kernel build this is not an issue because the linker is
> always executed directly, without the compiler being involved.
>
> Explicitly pass --ld-path to clang so $(LD) is respected.
> As clang 13.0.1 is required to build the kernel, this option is available=
.
>
> Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace progr=
ams")
> Cc: stable@vger.kernel.org # needs wrapping in $(cc-option) for < 6.9
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---

Applied to linux-kbuild/fixes.
Thanks.

> Reproducer, using nolibc to avoid libc requirements for cross building:
>
> $ tail -2 init/Makefile
> userprogs-always-y +=3D test-llvm
> test-llvm-userccflags +=3D -nostdlib -nolibc -static -isystem usr/ -inclu=
de $(srctree)/tools/include/nolibc/nolibc.h
>
> $ cat init/test-llvm.c
> int main(void)
> {
>         return 0;
> }
>
> $ make ARCH=3Darm64 LLVM=3D1 allnoconfig headers_install init/
>
> Validate that init/test-llvm builds and has the correct binary format.
> ---
> Changes in v2:
> - Use --ld-path instead of -fuse-ld
> - Drop already applied patch
> - Link to v1: https://lore.kernel.org/r/20250213-kbuild-userprog-fixes-v1=
-0-f255fb477d98@linutronix.de
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 96407c1d6be167b04ed5883e455686918c7a75ee..b41c164533d781d010ff8b252=
2e523164dc375d0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1123,6 +1123,11 @@ endif
>  KBUILD_USERCFLAGS  +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CPPFLA=
GS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CPPFLA=
GS) $(KBUILD_CFLAGS))
>
> +# userspace programs are linked via the compiler, use the correct linker
> +ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
> +KBUILD_USERLDFLAGS +=3D --ld-path=3D$(LD)
> +endif
> +
>  # make the checker run with the right architecture
>  CHECKFLAGS +=3D --arch=3D$(ARCH)
>
>
> ---
> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
> change-id: 20250213-kbuild-userprog-fixes-4f07b62ae818
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
>


--=20
Best Regards
Masahiro Yamada

