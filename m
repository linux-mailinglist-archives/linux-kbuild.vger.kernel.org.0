Return-Path: <linux-kbuild+bounces-4730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E09D2DF0
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 19:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036BC1F231FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 18:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63581D2F6E;
	Tue, 19 Nov 2024 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmAP0D9b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1871D1F7B;
	Tue, 19 Nov 2024 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732040953; cv=none; b=n5x3qkYm0EXW//JDm/rqUw2qxt9p6Y9Bzfr1lKLvPfp2WKY1ovBIulfZ/E/8U4G3GbPl/GTznyVEqrh5RETN1H67q5IoKnexFGrAU38SIyRZoVwRM/xK6gTQCJ/S1AraZsaOiB26Cs6W0u9NmPZ2Sv25WoE6g2+ese/QE/Ggqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732040953; c=relaxed/simple;
	bh=TTj+vZZdfB8rxh2YToWj/klGJUfgQXrP/OP72nW66kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFgx/ZzIrSpycuoG7wEYYowIloEcmpiCvWzoFeOpyqcZL/+D1Lc9hubkZhyEAqWmvWuOsvT/cna3cYsr20doRmfXq6IzFl7QK4MeLev7hQkElhQ8tiwTTlSZHrW9v6Q6dbk3TOEpRkkYsjVhdXA0ogwoHsDM9OsDhT28LskXoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmAP0D9b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4987DC4CECF;
	Tue, 19 Nov 2024 18:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732040953;
	bh=TTj+vZZdfB8rxh2YToWj/klGJUfgQXrP/OP72nW66kc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JmAP0D9bodSrPMPF2+lF5CV8lpTB/8CmH6vzqLpB6RmdyzEwB2H9JJzJ7Is4YJx0T
	 g0NAMrcnrxxippB1zXFKhXAypV0VAyaAr4IntfrpVFNQdEtgDKqKjLxfj4sNPAPtDW
	 EM0YZbPdJ9OVC1SFO9sCLp9hU8Z30DbDXg6LFA80+crg39CEwpiiaqHaK+iu7JH0LS
	 ibZqnRNJ4jR+ADR8BLE6oDL39bSaGVfqf1nt/QhDiR7ASbrVjoKOo5wv4AbY9DbApp
	 f+aJDpGF51XYCHpw0Q1Tp4+XdlBWXOxot3ohYcWw1DJqWH8YkAYw9uHUBAqbeZrmhh
	 0L8Sf7rwY802Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e8607c2aso1513162e87.3;
        Tue, 19 Nov 2024 10:29:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhZmS2ISuh+vIrbU13mgoqqZXoavTaZZl6A58FjiwXXp8XD0bTp5wEe7cx9hV9xL0SzL8W4vvQuJPmphr7@vger.kernel.org, AJvYcCXewGQd74JJVxN8LkP5ULPKEBdi8oy5E2oPZDYEPfHZloy6xY/FVdB/R0jPu6Hh550eG/Us8HSLf0u8YBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwROZUh68zaKxW00Ku6Gmj01HsJG4uvJoBZpA6K1W+5aE5mTPTX
	f0UAmydDRjHVJwOSHvHdsn7wCSYOjRgmeFZL1k0aQaUjlwy1i5D20FwXAgnLJ5t0s9RgVAp/Jkb
	4Iy/t2YrGCijtl7dWRBLriTo4ITk=
X-Google-Smtp-Source: AGHT+IHh6HKLV06Ba1w1Oh3pUTp9dIChy3W+yfKbnNErDJCOKorTiEZ/VyTjinpdcmd3PG7x1DYEblusv0+yw/e4Dkk=
X-Received: by 2002:a05:6512:1313:b0:53d:a000:10e5 with SMTP id
 2adb3069b0e04-53dab3b173dmr7835401e87.46.1732040951963; Tue, 19 Nov 2024
 10:29:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X> <8734joj5gn.fsf@gentoo.org>
 <20241119041550.GA573925@thelio-3990X> <87r077j1fa.fsf@gentoo.org> <20241119044724.GA2246422@thelio-3990X>
In-Reply-To: <20241119044724.GA2246422@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 20 Nov 2024 03:28:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6DZkbf6AM7kthPuUE_=ZPaaBPoP0UtvuF=6ijrzUPgQ@mail.gmail.com>
Message-ID: <CAK7LNAS6DZkbf6AM7kthPuUE_=ZPaaBPoP0UtvuF=6ijrzUPgQ@mail.gmail.com>
Subject: Re: Build failure with GCC 15 (-std=gnu23)
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sam James <sam@gentoo.org>, Kostadin Shishmanov <kostadinshishmanov@protonmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arnd@arndb.de, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 1:47=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, Nov 19, 2024 at 04:24:41AM +0000, Sam James wrote:
> > This is the conclusion I just reached, although I'm struggling to figur=
e
> > out a nice place to put it without sprinkling it all over the place. I'=
m
> > inclined to wait until kbuild folks weigh in so I don't do a lot of
> > (trivial, but tedious) work that needs changing.
>
> Sure. Masahiro, do you have any thoughts here? You can see the beginning
> of the thread at [1].
>
> I think the diff below would be a good first patch in a series that adds
> it to every other place that needs it. As you noticed, it probably makes
> sense to add it to most places that have CLANG_FLAGS, as that is a good
> indicator that KBUILD_CFLAGS is not being used properly in those spots.

I do not think this would solve the issue.

The attached diff will be useful when we bump -std=3Dgnu* next time;
we would only need to change the single line.
However, this kind of change does not occur quite often.
Anyway, we would do "git grep std=3Dgnu11" to make sure there is no left-ov=
er.

It is not helpful to detect the reported issue in
drivers/firmware/efi/libstub/Makefile.

Some Makefile overriding KBUILD_CFLAGS would forget to add
$(CSTD_FLAG), for the same reason as they would forget to add
-std=3Dgnu11.









> > As a hack, I've injected it into CLANG_FLAGS locally for now as it
> > happens to appear in all the right places ;)
>
> :) exactly why I am quite familiar with this issue...
>
> [1]: https://lore.kernel.org/4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR=
4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=3D@protonma=
il.com/
>
> Cheers,
> Nathan
>
> diff --git a/Makefile b/Makefile
> index 68a8faff2543..33cc6bcf39b5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -416,6 +416,8 @@ export KCONFIG_CONFIG
>  # SHELL used by kbuild
>  CONFIG_SHELL :=3D sh
>
> +CSTD_FLAG :=3D -std=3Dgnu11
> +
>  HOST_LFS_CFLAGS :=3D $(shell getconf LFS_CFLAGS 2>/dev/null)
>  HOST_LFS_LDFLAGS :=3D $(shell getconf LFS_LDFLAGS 2>/dev/null)
>  HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS 2>/dev/null)
> @@ -437,7 +439,7 @@ HOSTRUSTC =3D rustc
>  HOSTPKG_CONFIG =3D pkg-config
>
>  KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prototype=
s \
> -                        -O2 -fomit-frame-pointer -std=3Dgnu11
> +                        -O2 -fomit-frame-pointer $(CSTD_FLAG)
>  KBUILD_USERCFLAGS  :=3D $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
>  KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
>
> @@ -545,7 +547,7 @@ LINUXINCLUDE    :=3D \
>  KBUILD_AFLAGS   :=3D -D__ASSEMBLY__ -fno-PIE
>
>  KBUILD_CFLAGS :=3D
> -KBUILD_CFLAGS +=3D -std=3Dgnu11
> +KBUILD_CFLAGS +=3D $(CSTD_FLAG)
>  KBUILD_CFLAGS +=3D -fshort-wchar
>  KBUILD_CFLAGS +=3D -funsigned-char
>  KBUILD_CFLAGS +=3D -fno-common
> @@ -589,7 +591,7 @@ export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE=
 RESOLVE_BTFIDS LEX YACC AW
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_=
MODULE
> -export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS
> +export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS CSTD_FLAG
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_L=
DFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32=
/Makefile
> index 25a2cb6317f3..5f9d5c38ed9e 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -65,7 +65,7 @@ VDSO_CFLAGS +=3D -Wall -Wundef -Wstrict-prototypes -Wno=
-trigraphs \
>                 -fno-strict-aliasing -fno-common \
>                 -Werror-implicit-function-declaration \
>                 -Wno-format-security \
> -               -std=3Dgnu11
> +               $(CSTD_FLAG)
>  VDSO_CFLAGS  +=3D -O2
>  # Some useful compiler-dependent flags from top-level Makefile
>  VDSO_CFLAGS +=3D $(call cc32-option,-Wno-pointer-sign)
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 5b773b34768d..d5c851dd0653 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -47,7 +47,7 @@ endif
>
>  # How to compile the 16-bit code.  Note we always compile for -march=3Di=
386;
>  # that way we can complain to the user if the CPU is insufficient.
> -REALMODE_CFLAGS        :=3D -std=3Dgnu11 -m16 -g -Os -DDISABLE_BRANCH_PR=
OFILING -D__DISABLE_EXPORTS \
> +REALMODE_CFLAGS        :=3D $(CSTD_FLAG) -m16 -g -Os -DDISABLE_BRANCH_PR=
OFILING -D__DISABLE_EXPORTS \
>                    -Wall -Wstrict-prototypes -march=3Di386 -mregparm=3D3 =
\
>                    -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
>                    -mno-mmx -mno-sse $(call cc-option,-fcf-protection=3Dn=
one)



--
Best Regards
Masahiro Yamada

