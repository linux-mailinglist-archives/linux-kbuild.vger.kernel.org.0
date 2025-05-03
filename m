Return-Path: <linux-kbuild+bounces-6904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE9AA7EC6
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 08:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 097CD1B63E8D
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 06:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058751A2381;
	Sat,  3 May 2025 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7KyF4ZB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2571993A3;
	Sat,  3 May 2025 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746252825; cv=none; b=Diu2kMAWJ5EknqXgUf5Q7nBpkmACmlpjen5ntvxt7EfhUszOGr8Nq3feUzAIrkFeOkzZGmoBInMPZVkAS5EYs/7vuilPga8uYwS3Qg4Bm1i16cpLV5HVjcFLJe9gpmtZofO3kCR69T00eyw1G0ys1ylfzZKYp2dgRT4SvK8UG9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746252825; c=relaxed/simple;
	bh=2U2wL8Pi543SbcmyoJldkSSWk5buF2ORkxSTsHb5ZcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=if9AV2UBTKmJM1HOkDALJkBB83O595Z9yUcPIILKcxNwxPkVU41QTiQCdL8cGNDBDDH0bfgKSJI3sDUDCqvRoW0KZHEIQ+v7JqgvSxc47CcMIBs2w4pqvMRan3jdl0rO2CdqgzUeghcPE1DFNcXa+eLNuyOB5E8Jnty01d/PRI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7KyF4ZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F60CC4AF0E;
	Sat,  3 May 2025 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746252824;
	bh=2U2wL8Pi543SbcmyoJldkSSWk5buF2ORkxSTsHb5ZcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n7KyF4ZB1M1lW25+vAIiKOWa09Mp70QwKyPuOJaenwL4jYrAa7brkFXoY55paxX/S
	 S6D2fuQJHjAY+2LuyUyc4cEWlGplX8lv+JrkhC4tx0ZGoJ+aaokTr88s/8gkixj9ds
	 /ypkQo4zOAh5Sa6nDZxov+6sfIOruc4Y7a0o3IhqMU+PPQL8vwghGbJiRQSlmYTMm9
	 XhVW1PrQb6Nn2sAlPtiszxDafC1xVutFBh6nkIJfO/1wh+hE+tePFIKX2Iws2X/BQK
	 DYDCCl32TsMnAupJIbXzU+rEJhp4XGd+Z11U3p6y04AtEDNaD9Hfu567RE1PuvWBAK
	 7Bw7Cg2P4e4GA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so3256840e87.1;
        Fri, 02 May 2025 23:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJIRGTxw+4ySma/C56dLwp8A1caaoaVEmc1SPL80wyhDq/0CJWntXXfIC+ece04eW2GmqZC1cKsTEHwIUt@vger.kernel.org, AJvYcCUZGNU9g+2d+k6DUasS4epuE0iaZ05kqmyTKH0QUlFnMAqURJdgJlXPQg28G5DmnZU47Q2+GfrWkQsXELHg@vger.kernel.org, AJvYcCWmse9ZnEoCFUuZITEsIGj3ilufSOf5apzS/LQnH7GDA5zLbHHUmHKlT8t4VFfqDQ3kwP/7QxkXJ20rORPZ2V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLf2+KxVGPnKnR+ZPna07LMoGdPOStQYsK9F00jAKcnLHwqmV
	cSWiORaEzcMrWTPIAh54ohi6yh1eiML8IR7T18ughi+PeC55RrmrljCfWe4f9xmx11XsNN5XTOU
	xqKzJYcrnFySWOtW7H21yGoAkxjw=
X-Google-Smtp-Source: AGHT+IHDMQa+oNCs5qON+sDDzQNEJC5z9iOjeQOtZXdg5euKKxFYjlqPHELLj7u3v7dizjxFZqmOgZF1dJh6ss58uGc=
X-Received: by 2002:a05:6512:3f1c:b0:549:7d6e:fe84 with SMTP id
 2adb3069b0e04-54eac2433c8mr1283219e87.53.1746252823032; Fri, 02 May 2025
 23:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502224512.it.706-kees@kernel.org> <20250502225416.708936-2-kees@kernel.org>
In-Reply-To: <20250502225416.708936-2-kees@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 May 2025 15:13:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDbxc+3HQ6zoSk9t-Lkf4MSNmEUN6S5EqoVWnBQw_K6g@mail.gmail.com>
X-Gm-Features: ATxdqUF76dt_7gcYn_ksSKtSA5fymBjXQ0TBB0SjwOyXw1Ac63YqHHphqbqToKc
Message-ID: <CAK7LNATDbxc+3HQ6zoSk9t-Lkf4MSNmEUN6S5EqoVWnBQw_K6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] randstruct: Force full rebuild when seed changes
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-kbuild@vger.kernel.org, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 7:54=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> While the randstruct GCC plugin was being rebuilt if the randstruct
> seed changed, Clangs build did not notice the change. Include the hash
> header directly so that it becomes a universal build dependency and full
> rebuilds will happen if it changes.
>
> Since we cannot use "-include ..." as the randstruct flags are removed
> via "filter-out" (which would cause all instances of "-include" to be
> removed), use the existing -DRANDSTRUCT to control the header inclusion
> via include/linux/compiler-version.h. Universally add a -I for the
> scripts/basic directory, where header exists. The UM build requires that
> the -I be explicitly added.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  Makefile                         |  1 +
>  arch/um/Makefile                 |  1 +
>  include/linux/compiler-version.h |  3 +++
>  include/linux/vermagic.h         |  1 -
>  scripts/basic/Makefile           | 11 ++++++-----
>  5 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5aa9ee52a765..cef652227843 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -567,6 +567,7 @@ LINUXINCLUDE    :=3D \
>                 -I$(objtree)/arch/$(SRCARCH)/include/generated \
>                 -I$(srctree)/include \
>                 -I$(objtree)/include \
> +               -I$(objtree)/scripts/basic \


Now you are adding random header search paths everywhere.
This is very hacky.


I recommend keeping <generated/randstruct_hash.h>

Then,  -I$(objtree)/scripts/basic is unneeded.


>                 $(USERINCLUDE)
>
>  KBUILD_AFLAGS   :=3D -D__ASSEMBLY__ -fno-PIE
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 8cc0f22ebefa..38f6024e75d7 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -73,6 +73,7 @@ USER_CFLAGS =3D $(patsubst $(KERNEL_DEFINES),,$(patsubs=
t -I%,,$(KBUILD_CFLAGS))) \
>                 -D_FILE_OFFSET_BITS=3D64 -idirafter $(srctree)/include \
>                 -idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__ =
\
>                 -I$(objtree)/scripts/gcc-plugins \
> +               -I$(objtree)/scripts/basic \
>                 -include $(srctree)/include/linux/compiler-version.h \
>                 -include $(srctree)/include/linux/kconfig.h
>
> diff --git a/include/linux/compiler-version.h b/include/linux/compiler-ve=
rsion.h
> index 08943df04ebb..05d555320a0f 100644
> --- a/include/linux/compiler-version.h
> +++ b/include/linux/compiler-version.h
> @@ -16,3 +16,6 @@
>  #ifdef GCC_PLUGINS_ENABLED
>  #include "gcc-plugins-deps.h"
>  #endif
> +#ifdef RANDSTRUCT
> +#include "randstruct_hash.h"
> +#endif
> diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
> index 939ceabcaf06..335c360d4f9b 100644
> --- a/include/linux/vermagic.h
> +++ b/include/linux/vermagic.h
> @@ -33,7 +33,6 @@
>  #define MODULE_VERMAGIC_MODVERSIONS ""
>  #endif
>  #ifdef RANDSTRUCT
> -#include <generated/randstruct_hash.h>
>  #define MODULE_RANDSTRUCT "RANDSTRUCT_" RANDSTRUCT_HASHED_SEED
>  #else
>  #define MODULE_RANDSTRUCT
> diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
> index dd289a6725ac..31637ce4dc5c 100644
> --- a/scripts/basic/Makefile
> +++ b/scripts/basic/Makefile
> @@ -8,9 +8,10 @@ hostprogs-always-y     +=3D fixdep
>  # before running a Clang kernel build.
>  gen-randstruct-seed    :=3D $(srctree)/scripts/gen-randstruct-seed.sh
>  quiet_cmd_create_randstruct_seed =3D GENSEED $@
> -cmd_create_randstruct_seed =3D \
> -       $(CONFIG_SHELL) $(gen-randstruct-seed) \
> -               $@ $(objtree)/include/generated/randstruct_hash.h
> -$(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
> +      cmd_create_randstruct_seed =3D $(CONFIG_SHELL) $(gen-randstruct-se=
ed) \
> +               $(obj)/randstruct.seed $(obj)/randstruct_hash.h
> +
> +$(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) =
FORCE
>         $(call if_changed,create_randstruct_seed)


This is wrong.


$(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) FOR=
CE
         $(call if_changed,create_randstruct_seed)

is equivalent to:

$(obj)/randstruct_hash.h: $(gen-randstruct-seed) FORCE
         $(call if_changed,create_randstruct_seed)

$(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
         $(call if_changed,create_randstruct_seed)


So, this rule is executed twice; for randstruct_hash.h and for randstruct.s=
eed

randstruct_hash.h and randstruct.seed will contain different hash values.

I recommend keeping the current code.













--
Best Regards
Masahiro Yamada

