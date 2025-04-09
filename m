Return-Path: <linux-kbuild+bounces-6548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD46A82BFF
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 187C1171ED3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 16:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387A51E1A20;
	Wed,  9 Apr 2025 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/jgB6Gs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10B1D516C;
	Wed,  9 Apr 2025 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214914; cv=none; b=e5P00A0dmTU1b3Pbh+kni2YG1xswYdz8OPk8bOKIqlk6775NFIRY7aEQzIL/mv9dXlsIZu46WtvOqxvPF+s7EqaWciZ/+amRaDCHW/qr23qM4iEuqN7qt8Tar6DZieR7j1EjRzSackRM5WBzXLp83T8E/4ITepQioviuCdsE6KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214914; c=relaxed/simple;
	bh=UeISwS9y3lU/oQu7T7xyKZsM9KiV5qGEixeP6JETyEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWa9FgeQdCi5Idn70iyvrHojA1JsE0AHOgXZL8FxAx3lZ56Qti8+auxXYFtQr5iUfZo84kWC2wJFdJJzrcyyHqwOpJT6no4hiX6AdXEEcFerdiZm4xjPinfOS60IviId+XS0fnHLGQ/6TsM2xGe1PSpoLLhtvL2EX7UCrw+Slow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/jgB6Gs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F973C4CEF1;
	Wed,  9 Apr 2025 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214913;
	bh=UeISwS9y3lU/oQu7T7xyKZsM9KiV5qGEixeP6JETyEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n/jgB6Gsjv1i0qlLY1nBumLDo98W9dCINpuwbo/duD0w6nTdDewzI5cFEioHm2zoo
	 RYlHiq9ouIS7iDlrc4vWOpdCA2A6M06RB0d1G6CtkTKk9u5Iy2jqBhnvtUyCZ7y91F
	 8Z04d+/8kY5i8f2uQBGCcIdEV9HpRywc6MPeViv6oJ1IYFNVhMIEeZoeHa3U+R/vus
	 ulkcI77SaSR6wf+IWdfF9P7NbKRX4eKFC9tSZ3V5yhh8hLsCfNy16eMfWfH6Q3CaRi
	 AYo+jA9iCT+I4ChFdshLKonVCpj+a+YIOArQ6NyYS5Lhoa+NHpnwzqA+BrDLZOo8Nn
	 WtO+/V90GuWzA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso70850001fa.3;
        Wed, 09 Apr 2025 09:08:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/BvnjnnMC3Axk0OvzdeVPsR4QpmxeTVYuuAauSmwtyuqNveGyBUKRpCrJyD2BjkYd/Q9WYTpcdGj5d9wO@vger.kernel.org, AJvYcCX06HBICiQ1y0UWSUkXE23QX+itqq/RXDwWyPeMSWWrOwMTiKb+8emx2sD8+tmfsFEcKDeh2/hRzwwssi93@vger.kernel.org, AJvYcCXIB/xpZ8KDed9631lBZcheHjlXwU9R8gQ/G7gTGkOypDohgf28dnD2+9tHIfstxxiiWt3B40Y2dHuKOK2Pe7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/9LhAPahdLwf6NxjTg44l8joBqm137oLcMkC84WNMcnYcDPZ
	QTZLDXzuRUfBIDQSu2y4qaJt0gHHpXhb3KU6MoEckNahv54BfpJV7es8WfanyS1jSKKglPe9ff4
	t9U2dfv7Nnnqai2+ka8EgSCHiucg=
X-Google-Smtp-Source: AGHT+IH1f90QFFxZc7443QxPxjRfbyPZM2F/wtr8cixknUNRSj+QhdIqvEVXWa56LSQzmNQ3nhi5t+kOxBzbECfTATo=
X-Received: by 2002:a2e:bcc5:0:b0:30d:dad4:e06f with SMTP id
 38308e7fff4ca-30f44f4b784mr11569621fa.2.1744214911615; Wed, 09 Apr 2025
 09:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409160409.work.168-kees@kernel.org>
In-Reply-To: <20250409160409.work.168-kees@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 9 Apr 2025 18:08:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
X-Gm-Features: ATxdqUGTZiuSmGYhSGBrMgZkO_TFJf73mCS8XUbFOLk-qWt97OZAcKf2VyJwGh8
Message-ID: <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: Remove ARM_SSP_PER_TASK plugin
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Douglas Anderson <dianders@chromium.org>, Russell King <linux@armlinux.org.uk>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrew Davis <afd@ti.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Xin Li <xin3.li@intel.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Eric Biggers <ebiggers@google.com>, Yuntao Liu <liuyuntao12@huawei.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Dave Vasilevsky <dave@vasilevsky.ca>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 18:04, Kees Cook <kees@kernel.org> wrote:
>
> As part of trying to remove GCC plugins from Linux, drop the
> ARM_SSP_PER_TASK plugin. The feature is available upstream since GCC
> 12, so anyone needing newer kernels with per-task ssp can update their
> compiler[1].
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Xin Li <xin3.li@intel.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> ---
>  arch/arm/Kconfig                              |   3 +-
>  arch/arm/boot/compressed/Makefile             |   2 +-
>  scripts/Makefile.gcc-plugins                  |   6 -
>  scripts/gcc-plugins/Kconfig                   |   4 -
>  scripts/gcc-plugins/arm_ssp_per_task_plugin.c | 107 ------------------
>  5 files changed, 2 insertions(+), 120 deletions(-)
>  delete mode 100644 scripts/gcc-plugins/arm_ssp_per_task_plugin.c
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 835b5f100e92..6f037edf0f41 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1379,8 +1379,7 @@ config CC_HAVE_STACKPROTECTOR_TLS
>  config STACKPROTECTOR_PER_TASK
>         bool "Use a unique stack canary value for each task"
>         depends on STACKPROTECTOR && CURRENT_POINTER_IN_TPIDRURO && !XIP_DEFLATED_DATA
> -       depends on GCC_PLUGINS || CC_HAVE_STACKPROTECTOR_TLS
> -       select GCC_PLUGIN_ARM_SSP_PER_TASK if !CC_HAVE_STACKPROTECTOR_TLS
> +       depends on CC_HAVE_STACKPROTECTOR_TLS
>         default y
>         help
>           Due to the fact that GCC uses an ordinary symbol reference from
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index 945b5975fce2..d61369b1eabe 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -96,7 +96,7 @@ KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
>
>  ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
>              -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
> -            -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
> +            -I$(obj)
>  ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
>  asflags-y := -DZIMAGE
>
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 6da109d563a5..194122d969a8 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -36,12 +36,6 @@ ifdef CONFIG_GCC_PLUGIN_STACKLEAK
>  endif
>  export DISABLE_STACKLEAK_PLUGIN
>
> -gcc-plugin-$(CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK) += arm_ssp_per_task_plugin.so
> -ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
> -    DISABLE_ARM_SSP_PER_TASK_PLUGIN += -fplugin-arg-arm_ssp_per_task_plugin-disable
> -endif
> -export DISABLE_ARM_SSP_PER_TASK_PLUGIN
> -
>  # All the plugin CFLAGS are collected here in case a build target needs to
>  # filter them out of the KBUILD_CFLAGS.
>  GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index ba868d1eef3d..6b34ba19358d 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -36,8 +36,4 @@ config GCC_PLUGIN_LATENT_ENTROPY
>            * https://grsecurity.net/
>            * https://pax.grsecurity.net/
>
> -config GCC_PLUGIN_ARM_SSP_PER_TASK
> -       bool
> -       depends on GCC_PLUGINS && ARM
> -
>  endif
> diff --git a/scripts/gcc-plugins/arm_ssp_per_task_plugin.c b/scripts/gcc-plugins/arm_ssp_per_task_plugin.c
> deleted file mode 100644
> index 7328d037f975..000000000000
> --- a/scripts/gcc-plugins/arm_ssp_per_task_plugin.c
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -#include "gcc-common.h"
> -
> -__visible int plugin_is_GPL_compatible;
> -
> -static unsigned int canary_offset;
> -
> -static unsigned int arm_pertask_ssp_rtl_execute(void)
> -{
> -       rtx_insn *insn;
> -
> -       for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
> -               const char *sym;
> -               rtx body;
> -               rtx current;
> -
> -               /*
> -                * Find a SET insn involving a SYMBOL_REF to __stack_chk_guard
> -                */
> -               if (!INSN_P(insn))
> -                       continue;
> -               body = PATTERN(insn);
> -               if (GET_CODE(body) != SET ||
> -                   GET_CODE(SET_SRC(body)) != SYMBOL_REF)
> -                       continue;
> -               sym = XSTR(SET_SRC(body), 0);
> -               if (strcmp(sym, "__stack_chk_guard"))
> -                       continue;
> -
> -               /*
> -                * Replace the source of the SET insn with an expression that
> -                * produces the address of the current task's stack canary value
> -                */
> -               current = gen_reg_rtx(Pmode);
> -
> -               emit_insn_before(gen_load_tp_hard(current), insn);
> -
> -               SET_SRC(body) = gen_rtx_PLUS(Pmode, current,
> -                                            GEN_INT(canary_offset));
> -       }
> -       return 0;
> -}
> -
> -#define PASS_NAME arm_pertask_ssp_rtl
> -
> -#define NO_GATE
> -#include "gcc-generate-rtl-pass.h"
> -
> -#if BUILDING_GCC_VERSION >= 9000
> -static bool no(void)
> -{
> -       return false;
> -}
> -
> -static void arm_pertask_ssp_start_unit(void *gcc_data, void *user_data)
> -{
> -       targetm.have_stack_protect_combined_set = no;
> -       targetm.have_stack_protect_combined_test = no;
> -}
> -#endif
> -
> -__visible int plugin_init(struct plugin_name_args *plugin_info,
> -                         struct plugin_gcc_version *version)
> -{
> -       const char * const plugin_name = plugin_info->base_name;
> -       const int argc = plugin_info->argc;
> -       const struct plugin_argument *argv = plugin_info->argv;
> -       int i;
> -
> -       if (!plugin_default_version_check(version, &gcc_version)) {
> -               error(G_("incompatible gcc/plugin versions"));
> -               return 1;
> -       }
> -
> -       for (i = 0; i < argc; ++i) {
> -               if (!strcmp(argv[i].key, "disable"))
> -                       return 0;
> -
> -               /* all remaining options require a value */
> -               if (!argv[i].value) {
> -                       error(G_("no value supplied for option '-fplugin-arg-%s-%s'"),
> -                             plugin_name, argv[i].key);
> -                       return 1;
> -               }
> -
> -               if (!strcmp(argv[i].key, "offset")) {
> -                       canary_offset = atoi(argv[i].value);
> -                       continue;
> -               }
> -               error(G_("unknown option '-fplugin-arg-%s-%s'"),
> -                     plugin_name, argv[i].key);
> -               return 1;
> -       }
> -
> -       PASS_INFO(arm_pertask_ssp_rtl, "expand", 1, PASS_POS_INSERT_AFTER);
> -
> -       register_callback(plugin_info->base_name, PLUGIN_PASS_MANAGER_SETUP,
> -                         NULL, &arm_pertask_ssp_rtl_pass_info);
> -
> -#if BUILDING_GCC_VERSION >= 9000
> -       register_callback(plugin_info->base_name, PLUGIN_START_UNIT,
> -                         arm_pertask_ssp_start_unit, NULL);
> -#endif
> -
> -       return 0;
> -}
> --
> 2.34.1
>

