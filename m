Return-Path: <linux-kbuild+bounces-3335-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258B969FCD
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 16:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97AEB1C20C0F
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 14:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA7428399;
	Tue,  3 Sep 2024 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwlKSK5E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D661CA6A1;
	Tue,  3 Sep 2024 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372307; cv=none; b=MnMZT5K0VhPE6d2VoWj0S5tGe0c1Mwtm8z7yeNcssDbD/Z3urGaJPB9OPUcQiL2xd9mJNwRomsJYOGaOuQjZKkCFVx5OX75urcFBzsFbXBYzDHF/5MapPel7Aj1mvrNMZnSUiRQ9FCFLygsyUzWGLfhKlpdAWR/l7l7t+i5dETA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372307; c=relaxed/simple;
	bh=BsrCTrBNZtP6Tj322oSAskAaur02xSr1bxYZEPRvQNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNmEnCOvmEEhwCqgQA81cUeCjIw8MZuvkXL7h7lmK26HV05Xj0zvJ8mpwRrWilN7v/jpAIsV38hLDBk73g8IDdxA+3fd5oGJsKc5dLUifQ2uTKYmQBvxQG/MpFniCX/MbOASh/ToKcER6RhyhUoSYrn4cGu2iQ/ynPklGqf1LcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwlKSK5E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACE3C4CEC7;
	Tue,  3 Sep 2024 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725372307;
	bh=BsrCTrBNZtP6Tj322oSAskAaur02xSr1bxYZEPRvQNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LwlKSK5ErajemkQ1KlZk+PEO093DEXhm55Ais/KtaVEe+G3BtR/+jE1Cts9scrxeK
	 58t+ZzcCZ80rDznylNm/yxpgjJbMGdwnOqOEq5bHZjjZ193LEMVdYrgnbhLxX3X0k1
	 N/+3OCJX+i07bgkTSildivRE6d1SGCCVs9s+M/RBVj4Z0L5p1rlXFt5eH5C6WPu0K5
	 xIMbR01ytLl3MRhvrFDJLXR35AF6MxOmL5YWCpVbzR0abzQLLdxZas5vTttmurMX3L
	 fbKQm5zpbM/4LfxuOoWjH/FzFiCxR6y+RhUEvPfCnDHSWHoq38ozWJXz/P2O0JmZYY
	 QiBiW7HNLBnpA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5344ab30508so5819597e87.0;
        Tue, 03 Sep 2024 07:05:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZLthdZ8nI2ys1VR3UuvBMHTroTXhflhE9QhKIkuM9hhkTueWdObyNjfPh0mjfx88hK4MEKL7bHscuA0M=@vger.kernel.org, AJvYcCVvZVmqaL9kyGGsp1ycx/mwoeQ0+tJX0zVP6mW0JgkYBitDnE2LpI8RqwD7/Fk/oOqszjcvsXB2eKcHosdi6Q==@vger.kernel.org, AJvYcCWtjf6RiblLw6YP1AtTgVbvWBgqsuGe+/lFs9qXdl8KCuyS8or5hf/mZkoxs/4aiGBzMgUHlXvDVYwArO2e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11kV7T5vEEjCqFZ27l/jI3BNsFEp6899JUXRevmuG4q2PY9SO
	yuGDB6OSEAglTKbwtMQ30SLnzlQF1UU72J6pwTRBg/GcTBaW7hLobV5dIBfG+8GfQb1CMA0fsKw
	7e0cMbV8EilyqjBVQ3g41mXJhphM=
X-Google-Smtp-Source: AGHT+IEl3stPqDMrvRRj2fwAJdMbwHVOrTU6HZ6qDm17MfN0Xhh+H8Y7LfJOTTRkVc+ORgP7+gCtUgz7kFNJW8gCUaM=
X-Received: by 2002:a05:6512:234a:b0:534:53d7:c97f with SMTP id
 2adb3069b0e04-5353ebdb303mr5808947e87.23.1725372305167; Tue, 03 Sep 2024
 07:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240901-modinfo-const-v2-1-ece53ca15075@weissschuh.net>
In-Reply-To: <20240901-modinfo-const-v2-1-ece53ca15075@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Sep 2024 23:04:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrtMzf4UG_kKL7c0E2=q8_Yh6j61-2F-f4VH0y9+vjug@mail.gmail.com>
Message-ID: <CAK7LNATrtMzf4UG_kKL7c0E2=q8_Yh6j61-2F-f4VH0y9+vjug@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: compile constant module information only once
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 2:56=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> Various information about modules is compiled into the info sections.
> For that a dedicated .mod.c file is generated by modpost for each module
> and then linked into the module.
> However most of the information in the .mod.c is the same for all
> modules, internal and external.
> Split the shared information into a dedicated source file that is
> compiled once and then linked into all modules.
>
> This avoids frequent rebuilds for all .mod.c files when using
> CONFIG_LOCALVERSION_AUTO because the local version ends up in .mod.c
> through UTS_RELEASE and VERMAGIC_STRING.
> The modules are still relinked in this case.
>
> The code is also easier to maintain as it's now in a proper source file
> instead of an inline string literal.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>


Applied to linux-kbuild. Thanks!


> ---
> Changes in v2:
> - Remove RFC status
> - Incorporate Masahiro's proposals
>   - Rename modinfo.o to .module-common.o
>   - Build a dedicated .module-common.o for external modules
> - Link to v1: https://lore.kernel.org/r/20240824-modinfo-const-v1-1-485f9=
c64b868@weissschuh.net
> ---
> Masahiro, feel free to add some attribution for yourself when applying.
> The new appraoch is pleasantly simpler.
> ---
>  scripts/Makefile.modfinal |  7 +++++--
>  scripts/mod/modpost.c     | 23 -----------------------
>  scripts/module-common.c   | 25 +++++++++++++++++++++++++
>  3 files changed, 30 insertions(+), 25 deletions(-)
>
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 306a6bb86e4d..6b1b72257b29 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -30,6 +30,9 @@ quiet_cmd_cc_o_c =3D CC [M]  $@
>  %.mod.o: %.mod.c FORCE
>         $(call if_changed_dep,cc_o_c)
>
> +$(extmod_prefix).module-common.o: $(srctree)/scripts/module-common.c FOR=
CE
> +       $(call if_changed_dep,cc_o_c)
> +
>  quiet_cmd_ld_ko_o =3D LD [M]  $@
>        cmd_ld_ko_o +=3D                                                  =
 \
>         $(LD) -r $(KBUILD_LDFLAGS)                                      \
> @@ -54,13 +57,13 @@ if_changed_except =3D $(if $(call newer_prereqs_excep=
t,$(2))$(cmd-check),      \
>         printf '%s\n' 'savedcmd_$@ :=3D $(make-cmd)' > $(dot-target).cmd,=
 @:)
>
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -%.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODUL=
ES),$(KBUILD_BUILTIN),vmlinux) FORCE
> +%.ko: %.o %.mod.o $(extmod_prefix).module-common.o scripts/module.lds $(=
and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
>         +$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>         +$(if $(newer-prereqs),$(call cmd,btf_ko))
>  endif
>
> -targets +=3D $(modules:%.o=3D%.ko) $(modules:%.o=3D%.mod.o)
> +targets +=3D $(modules:%.o=3D%.ko) $(modules:%.o=3D%.mod.o) $(extmod_pre=
fix).module-common.o
>
>  # Add FORCE to the prerequisites of a target to force it to be always re=
built.
>  # ----------------------------------------------------------------------=
-----
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index c8cd5d822bb6..107393a8c48a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1755,26 +1755,9 @@ static void check_modname_len(struct module *mod)
>  static void add_header(struct buffer *b, struct module *mod)
>  {
>         buf_printf(b, "#include <linux/module.h>\n");
> -       /*
> -        * Include build-salt.h after module.h in order to
> -        * inherit the definitions.
> -        */
> -       buf_printf(b, "#define INCLUDE_VERMAGIC\n");
> -       buf_printf(b, "#include <linux/build-salt.h>\n");
> -       buf_printf(b, "#include <linux/elfnote-lto.h>\n");
>         buf_printf(b, "#include <linux/export-internal.h>\n");
> -       buf_printf(b, "#include <linux/vermagic.h>\n");
>         buf_printf(b, "#include <linux/compiler.h>\n");
>         buf_printf(b, "\n");
> -       buf_printf(b, "#ifdef CONFIG_UNWINDER_ORC\n");
> -       buf_printf(b, "#include <asm/orc_header.h>\n");
> -       buf_printf(b, "ORC_HEADER;\n");
> -       buf_printf(b, "#endif\n");
> -       buf_printf(b, "\n");
> -       buf_printf(b, "BUILD_SALT;\n");
> -       buf_printf(b, "BUILD_LTO_INFO;\n");
> -       buf_printf(b, "\n");
> -       buf_printf(b, "MODULE_INFO(vermagic, VERMAGIC_STRING);\n");
>         buf_printf(b, "MODULE_INFO(name, KBUILD_MODNAME);\n");
>         buf_printf(b, "\n");
>         buf_printf(b, "__visible struct module __this_module\n");
> @@ -1792,12 +1775,6 @@ static void add_header(struct buffer *b, struct mo=
dule *mod)
>         if (!external_module)
>                 buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
>
> -       buf_printf(b,
> -                  "\n"
> -                  "#ifdef CONFIG_MITIGATION_RETPOLINE\n"
> -                  "MODULE_INFO(retpoline, \"Y\");\n"
> -                  "#endif\n");
> -
>         if (strstarts(mod->name, "drivers/staging"))
>                 buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
>
> diff --git a/scripts/module-common.c b/scripts/module-common.c
> new file mode 100644
> index 000000000000..12fbc6d3aae8
> --- /dev/null
> +++ b/scripts/module-common.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/module.h>
> +/*
> + * Include build-salt.h after module.h in order to
> + * inherit the definitions.
> + */
> +#define INCLUDE_VERMAGIC
> +#include <linux/build-salt.h>
> +#include <linux/elfnote-lto.h>
> +#include <linux/vermagic.h>
> +
> +#ifdef CONFIG_UNWINDER_ORC
> +#include <asm/orc_header.h>
> +ORC_HEADER;
> +#endif
> +
> +BUILD_SALT;
> +BUILD_LTO_INFO;
> +
> +MODULE_INFO(vermagic, VERMAGIC_STRING);
> +
> +#ifdef CONFIG_MITIGATION_RETPOLINE
> +MODULE_INFO(retpoline, "Y");
> +#endif
>
> ---
> base-commit: 9f18baf3dd656e7ca166038d51e0b54a892d87db
> change-id: 20240824-modinfo-const-6f0d67e2b301
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>


--=20
Best Regards
Masahiro Yamada

