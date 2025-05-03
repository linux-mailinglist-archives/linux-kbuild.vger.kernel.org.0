Return-Path: <linux-kbuild+bounces-6903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1735AA7EC3
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 08:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDE81B63F6F
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 06:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AD01A2381;
	Sat,  3 May 2025 06:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qigHuDaL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC71993A3;
	Sat,  3 May 2025 06:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746252783; cv=none; b=iWq1P2PRp1LDlr5LYFJsMyKdcLpOGSiuwcUb/T9ZFKYGTPBONckzBEhxkBT0Tqpm9gzRCmowHs9vq+Tr8+cEG3dQ0Atd8Q4ao9EnyxR/ctwy9qmKW/UH8U8NQ/AAhdlBmwAICLupteoAGucysAv/uW1z/pvUF/EL1ZrH4IH8YBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746252783; c=relaxed/simple;
	bh=NaQZ7bbv79mG6P+jkuEVPApfvGx/xtNmR1UQ1YJDtMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jekWCPQ1nIzolNnl5rnpAEcfs/ZZIYuq70ZWRjt7NJnzqmO2e/SwgMm+qHtYi72bGBtyu9xnNdkvlSDgzsjwxYsKz9gjTp9rPssOzg90X7X9FBGFS3yCY7J/S1v9eHd4FCdiVcElY3NmaJBXR7AgYLX6BEPg6Phkr8r+LbZgnlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qigHuDaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A97BC4CEF1;
	Sat,  3 May 2025 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746252782;
	bh=NaQZ7bbv79mG6P+jkuEVPApfvGx/xtNmR1UQ1YJDtMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qigHuDaLq5DGGtMVLjtwRDUf7PPky2auXx+kObP18wvHNCVY4q/nCHnHrTEv5hUfC
	 sQo+5dffCaUNFRpap6rxH7bom7ddwL1qZtH9Q9E5Lmk0yhRjkiNUJ8V0uONF6Azajj
	 qGqXHjJsC0ZP/0Dp/kNyf44fj/w7Oe1ATMlU8fCGu4gkhpJENDHNYMg3Wqr1FBNnuh
	 bL94zT/Hn20IiXxf3OwzlZVB3swn6OgB5byWaquJvFu7EBY+TMau4BPoOkBIqOc4WZ
	 G30NDn255J0Tz3lEW4hhg0eFn4NgjoJvYxFWzcA79ZXb9tpFz/ku8HhoDvzeoN7TZH
	 +VwAaPs4eOJqQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30de488cf81so26266931fa.1;
        Fri, 02 May 2025 23:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2Xniu/2+bYWZFGfvgxx6G0sX+KqSpqPzlPEIlj6dS0qh07mFrFOs/yEwihwtI4VCNKmEDMrfvxGQim4Nz@vger.kernel.org, AJvYcCW0OGo0941IC7/63UxpvMsPMZaJXmD7RkIvSIy65ANAtHF7df+TNccWJ6O3RGxu/EPKXkEqG6pn37Jib2ua@vger.kernel.org, AJvYcCXLU6uKE7qVZrYC8z0A1Jo+2oQZJbcw3sWZ5ErMuWomfZh8M+5SaA5JZKxPNjtOUQ5MS46ckQMoKQ6YPIkqV/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsR+9/4kY/sldyQ+PaobJK620E8EsHmqzycZ9vcokdMPVnApfQ
	vtoURU2buJ+0CTLehaB1sqzCyTZqI4dRhYe7GziirdGT6IAysLDhDs1OmWMlcL1zSF3cYRi4AzC
	K4dCiC3VyLrv3jdOQ1X8xkm7xEo0=
X-Google-Smtp-Source: AGHT+IHs+9+uKWMML3785NkqOrGSNqHHn/CseeK7TkqnuzI1WriQXi9bnCO1cjchwLaDIvxI94Ddg12T61K2M2peG6c=
X-Received: by 2002:a05:6512:3c98:b0:54e:8fbb:8f0 with SMTP id
 2adb3069b0e04-54eb2418f82mr329651e87.1.1746252780980; Fri, 02 May 2025
 23:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502224512.it.706-kees@kernel.org> <20250502225416.708936-1-kees@kernel.org>
In-Reply-To: <20250502225416.708936-1-kees@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 May 2025 15:12:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNATs4uHnNHgESXcUEjpONZra=GvkuHMaDwsx0hbyUGY99w@mail.gmail.com>
X-Gm-Features: ATxdqUH1iIL3mgv0unyzF1cI5PCLwIrui50f8zRG3vA14o59y1H3vTcwLXDcJy0
Message-ID: <CAK7LNATs4uHnNHgESXcUEjpONZra=GvkuHMaDwsx0hbyUGY99w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gcc-plugins: Force full rebuild when plugins change
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 7:54=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> There was no dependency between the plugins changing and the rest of the
> kernel being built. Enforce this by including a synthetic header file
> when using plugins, that is regenerated any time the plugins are built.
>
> This cannot be included via '-include ...' because Makefiles use the
> "filter-out" string function, which removes individual words. Removing
> all instances of "-include" from the CFLAGS will cause a lot of
> problems. :)
>
> Instead, use -I to include the gcc-plugins directory, and depend on the
> new -DGCC_PLUGINS_ENABLED flag to include the generated header file via
> include/linux/compiler-version.h, which is already being used to control
> full rebuilds. The UM build requires that the -I be explicitly added.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: <linux-hardening@vger.kernel.org>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  arch/um/Makefile                 | 1 +
>  include/linux/compiler-version.h | 4 ++++
>  scripts/Makefile.gcc-plugins     | 2 +-
>  scripts/gcc-plugins/Makefile     | 8 ++++++++
>  4 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 1d36a613aad8..8cc0f22ebefa 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -72,6 +72,7 @@ USER_CFLAGS =3D $(patsubst $(KERNEL_DEFINES),,$(patsubs=
t -I%,,$(KBUILD_CFLAGS))) \
>                 $(ARCH_INCLUDE) $(MODE_INCLUDE) $(filter -I%,$(CFLAGS)) \
>                 -D_FILE_OFFSET_BITS=3D64 -idirafter $(srctree)/include \
>                 -idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__ =
\
> +               -I$(objtree)/scripts/gcc-plugins \
>                 -include $(srctree)/include/linux/compiler-version.h \
>                 -include $(srctree)/include/linux/kconfig.h
>
> diff --git a/include/linux/compiler-version.h b/include/linux/compiler-ve=
rsion.h
> index 573fa85b6c0c..08943df04ebb 100644
> --- a/include/linux/compiler-version.h
> +++ b/include/linux/compiler-version.h
> @@ -12,3 +12,7 @@
>   * and add dependency on include/config/CC_VERSION_TEXT, which is touche=
d
>   * by Kconfig when the version string from the compiler changes.
>   */
> +
> +#ifdef GCC_PLUGINS_ENABLED
> +#include "gcc-plugins-deps.h"
> +#endif
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 5b8a8378ca8a..468bb8faa9d1 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -38,7 +38,7 @@ export DISABLE_STACKLEAK_PLUGIN
>
>  # All the plugin CFLAGS are collected here in case a build target needs =
to
>  # filter them out of the KBUILD_CFLAGS.
> -GCC_PLUGINS_CFLAGS :=3D $(strip $(addprefix -fplugin=3D$(objtree)/script=
s/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> +GCC_PLUGINS_CFLAGS :=3D $(strip $(addprefix -fplugin=3D$(objtree)/script=
s/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y)) -I$(objtree)/scrip=
ts/gcc-plugins -DGCC_PLUGINS_ENABLED


This still relies on no-space after the -I option.



>  export GCC_PLUGINS_CFLAGS
>
>  # Add the flags to the build!
> diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
> index 320afd3cf8e8..24671d39ec90 100644
> --- a/scripts/gcc-plugins/Makefile
> +++ b/scripts/gcc-plugins/Makefile
> @@ -66,3 +66,11 @@ quiet_cmd_plugin_cxx_o_c =3D HOSTCXX $@
>
>  $(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
>         $(call if_changed_dep,plugin_cxx_o_c)
> +
> +quiet_cmd_gcc_plugins_updated =3D UPDATE  $@
> +      cmd_gcc_plugins_updated =3D echo '/* $^ */' > $(obj)/gcc-plugins-d=
eps.h

I think 'touch' should be enough.

If some plugins are disabled, it is detected by the normal if_changed rule.


> +
> +$(obj)/gcc-plugins-deps.h: $(plugin-single) $(plugin-multi) FORCE
> +       $(call if_changed,gcc_plugins_updated)
> +
> +always-y +=3D gcc-plugins-deps.h
> --
> 2.34.1
>


I think it is simpler to place the header
in include/generated/.

I attached my suggestion below:










diff --git a/arch/um/Makefile b/arch/um/Makefile
index 8cc0f22ebefa..1d36a613aad8 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -72,7 +72,6 @@ USER_CFLAGS =3D $(patsubst
$(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
                $(ARCH_INCLUDE) $(MODE_INCLUDE) $(filter -I%,$(CFLAGS)) \
                -D_FILE_OFFSET_BITS=3D64 -idirafter $(srctree)/include \
                -idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__ \
-               -I$(objtree)/scripts/gcc-plugins \
                -include $(srctree)/include/linux/compiler-version.h \
                -include $(srctree)/include/linux/kconfig.h

diff --git a/include/linux/compiler-version.h b/include/linux/compiler-vers=
ion.h
index 08943df04ebb..ea3d533dc04a 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -14,5 +14,5 @@
  */

 #ifdef GCC_PLUGINS_ENABLED
-#include "gcc-plugins-deps.h"
+#include <generated/gcc-plugins-deps.h>
 #endif
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 67b045a66157..f9b51c2c2158 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -44,7 +44,7 @@ export DISABLE_ARM_SSP_PER_TASK_PLUGIN

 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
-GCC_PLUGINS_CFLAGS :=3D $(strip $(addprefix
-fplugin=3D$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y))
$(gcc-plugin-cflags-y)) -I$(objtree)/scripts/gcc-plugins
-DGCC_PLUGINS_ENABLED
+GCC_PLUGINS_CFLAGS :=3D $(strip $(addprefix
-fplugin=3D$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y))
$(gcc-plugin-cflags-y)) -DGCC_PLUGINS_ENABLED
 export GCC_PLUGINS_CFLAGS

 # Add the flags to the build!
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 24671d39ec90..b354c0f9f66d 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -67,10 +67,10 @@ quiet_cmd_plugin_cxx_o_c =3D HOSTCXX $@
 $(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
        $(call if_changed_dep,plugin_cxx_o_c)

-quiet_cmd_gcc_plugins_updated =3D UPDATE  $@
-      cmd_gcc_plugins_updated =3D echo '/* $^ */' > $(obj)/gcc-plugins-dep=
s.h
+quiet_cmd_gcc_plugins_updated =3D TOUCH   $@
+      cmd_gcc_plugins_updated =3D touch $@

-$(obj)/gcc-plugins-deps.h: $(plugin-single) $(plugin-multi) FORCE
+$(obj)/../../include/generated/gcc-plugins-deps.h: $(plugin-single)
$(plugin-multi) FORCE
        $(call if_changed,gcc_plugins_updated)

-always-y +=3D gcc-plugins-deps.h
+always-y +=3D ../../include/generated/gcc-plugins-deps.h




--
Best Regards
Masahiro Yamada

