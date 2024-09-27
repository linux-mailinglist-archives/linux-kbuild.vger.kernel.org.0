Return-Path: <linux-kbuild+bounces-3817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D19B988790
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2024 16:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D83C31F22417
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2024 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405581C0DF5;
	Fri, 27 Sep 2024 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpFybpCq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB21C0DF0;
	Fri, 27 Sep 2024 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727448757; cv=none; b=I2dwKsoUrzeC7s0sl1emKW7SxcTQ0M+SdmCkm88y8OyAPbChtAUuUyiD/q0jsrUBXN1WiiqqgsU0loXlLi48+2/3y7RzFmIfOgQ/BvXqC31D8x+l2lt9e5gPH35x/5iqFpQhgxBfz3JJzDZ0cXDWi7CxKv74URNM90DfQViY+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727448757; c=relaxed/simple;
	bh=gDwgLjsgEbVK6CAyiM/XC4tlQtgHp+sr8EE3XMvYS1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARSCLMulwsFYHpF/Wd0PZ/A5ISHTgWp7BLG0rS/+Ic61ZG6z4EQB/JcEOCPqiyrLuCEn4skjIff1okJaBfvIjHx5nsaqVIkkk/MTftDDMm0UZJIH4T6nDf9vrNyXAw0vr/DIj0wWSsGPfsQldyYAsIbzDXlc/WwSHzHLE1GYS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpFybpCq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FF5C4CED0;
	Fri, 27 Sep 2024 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727448756;
	bh=gDwgLjsgEbVK6CAyiM/XC4tlQtgHp+sr8EE3XMvYS1o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LpFybpCqnFA6+C6gS+W/DRPRA05bJjtJusc6ZI8dESfsW4Bn26AuZ8Mmx7ZReOECo
	 GrQonou4zP8OqRft0P7hCVeHkllH3eUvZIyVJRQhk1vR1vakq/a4yrLwwQ2CM4V3MT
	 kzwhNqksp/On5K2/zcOMg/p9jhDZK2qb2ept9NOUUPruT04Zj3UiAnjdrEF08uW0Fq
	 0OyBkYDV9u5ehoAG4KbwPlj2EfEXAyWrg1i0iLvg7pIKgMTKO0ScuSwnhZco1C2NUc
	 7FeuP8uxincskeUTOmfoR5s1PpJqG/1g02BW4SkgBLSne9rUyT+cGdmKDut3q9doBc
	 NHPtjtHXQ1YcA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so2872021e87.0;
        Fri, 27 Sep 2024 07:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaK1q82xZQWyAUFxfW77OehMEX3AM8K3BXG02Fb7JcQdhq4n74zIYkE70qMZEKJQSyT1UmTfUQyVsd@vger.kernel.org, AJvYcCWvkoh/tuoxSLeREdKJL6pug2qZ9nVK9K+eKlVFV79dxiWgNwaVq/iz9/rLaB5UhZIONsN2isnIZhWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSOvDtjSrLCElwuy/Knmh0Xetp6VdzViPMIYAxvsKPyO42lI+
	Lh8A3CY7PdlExbErCJqOR+TojY1AiU+DUhBg1034TgqzDPnNfyejmT9GzNoioFrA1FozaRgMZj1
	rtQ0prWiYkyYhGtu5tH5jWavLaFk=
X-Google-Smtp-Source: AGHT+IHb8xgqd7Gm6Y55ygBHuwhYVS4X0q4tFLNa0w8W2c5fHVscGYifd8lNeY6zB2uUsxl35QFzqU27pcJ8AY/skp0=
X-Received: by 2002:a05:6512:33d3:b0:535:6892:3be6 with SMTP id
 2adb3069b0e04-5389fc7fe55mr2285769e87.54.1727448755139; Fri, 27 Sep 2024
 07:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923075704.3567313-1-masahiroy@kernel.org>
In-Reply-To: <20240923075704.3567313-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Sep 2024 23:51:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrs18T74-+JOnLCPqP1-nJEnVaOAGOZVDOvxEH0y2_pg@mail.gmail.com>
Message-ID: <CAK7LNARrs18T74-+JOnLCPqP1-nJEnVaOAGOZVDOvxEH0y2_pg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: move non-boot built-in DTBs to .rodata section
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrea della Porta <andrea.porta@suse.com>, 
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Brendan Higgins <brendanhiggins@google.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 4:57=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Commit aab94339cd85 ("of: Add support for linking device tree blobs
> into vmlinux") introduced a mechanism to embed DTBs into vmlinux.
>
> Initially, it was used for wrapping boot DTBs in arch/*/boot/dts/, but
> it is now reused for more generic purposes, such as testing.
>
> Built-in DTBs are discarded because KERNEL_DTB() is part of INIT_DATA,
> as defined in include/asm-generic/vmlinux.lds.h.
>
> This has not been an issue so far because OF unittests are triggered
> during boot, as defined by late_initcall(of_unittest).
>
> However, the recent clk KUnit test additions have caused problems
> because KUnit can execute test suites after boot.
>
> For example:
>
>   # echo > /sys/kernel/debug/kunit/clk_register_clk_parent_data_device/ru=
n
>
> This command triggers a stack trace because built-in DTBs have already
> been freed.
>
> While it is possible to move such test suites from kunit_test_suites to
> kunit_test_init_section_suites, it would be preferable to avoid usage
> limitations.
>
> This commit moves non-boot built-in DTBs to the .rodata section. Since
> these generic DTBs are looked up by name, they do not need to be placed
> in the special .dtb.init.rodata section.
>
> Boot DTBs should remain in .dtb.init.rodata because the arch boot code
> generally does not know the DT name, thus it uses the __dtb_start symbol
> to locate it.
>
> This separation also ensures that the __dtb_start symbol references the
> boot DTB. Currently, the .dtb.init.rodata is a mixture of both boot and
> non-boot DTBs. The __dtb_start symbol must be followed by the boot DTB,
> but we currently rely on the link order (i.e., the order in Makefiles),
> which is very fragile.
>
> Fixes: 5c9dd72d8385 ("of: Add a KUnit test for overlays and test managed =
APIs")
> Fixes: 5776526beb95 ("clk: Add KUnit tests for clk fixed rate basic type"=
)
> Fixes: 274aff8711b2 ("clk: Add KUnit tests for clks registered with struc=
t clk_parent_data")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v3:
>   - Move to .rodata section instead of .init.rodata
>
>  scripts/Makefile.dtbs | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> index 46009d5f1486..3e81cca6f68a 100644
> --- a/scripts/Makefile.dtbs
> +++ b/scripts/Makefile.dtbs
> @@ -34,12 +34,14 @@ $(obj)/dtbs-list: $(dtb-y) FORCE
>  # Assembly file to wrap dtb(o)
>  # ----------------------------------------------------------------------=
-----
>
> +builtin-dtb-section =3D $(if $(filter arch/%, $(obj)),.dtb.init.rodata,.=
rodata)


For more precise matching, I will change as follows:


diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 3e81cca6f68a..8d56c0815f33 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -34,7 +34,7 @@ $(obj)/dtbs-list: $(dtb-y) FORCE
 # Assembly file to wrap dtb(o)
 # ------------------------------------------------------------------------=
---

-builtin-dtb-section =3D $(if $(filter arch/%, $(obj)),.dtb.init.rodata,.ro=
data)
+builtin-dtb-section =3D $(if $(filter arch/$(SRCARCH)/boot/dts%,
$(obj)),.dtb.init.rodata,.rodata)

 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_wrap_S_dtb =3D WRAP    $@



Applied to linux-kbuild/fixes.




> +
>  # Generate an assembly file to wrap the output of the device tree compil=
er
>  quiet_cmd_wrap_S_dtb =3D WRAP    $@
>        cmd_wrap_S_dtb =3D {                                              =
                 \
>                 symbase=3D__$(patsubst .%,%,$(suffix $<))_$(subst -,_,$(n=
otdir $*));      \
>                 echo '\#include <asm-generic/vmlinux.lds.h>';            =
               \
> -               echo '.section .dtb.init.rodata,"a"';                    =
               \
> +               echo '.section $(builtin-dtb-section),"a"';              =
               \
>                 echo '.balign STRUCT_ALIGNMENT';                         =
               \
>                 echo ".global $${symbase}_begin";                        =
               \
>                 echo "$${symbase}_begin:";                               =
               \
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

