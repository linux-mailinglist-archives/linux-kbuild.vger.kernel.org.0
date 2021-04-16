Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED21361999
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 08:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhDPF6f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 01:58:35 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49799 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234886AbhDPF6e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 01:58:34 -0400
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 13G5vnmI005270;
        Fri, 16 Apr 2021 14:57:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13G5vnmI005270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618552670;
        bh=a6/lBw9r9bpA1Vccp2oZ0i35WaRdD2qrDrk08q10hKw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SMr93keC4nQVX3BE5gMfqQyJmRKKrzFULHYVbr+uD+fe8b/1d05szywgVrJJtcsb4
         Hghv/lwJZrMZWat3Q3sUzDq0Pn6PrqaK4dJoGy7FZW4F4JyL7no9PN3jTON6EPeNJ0
         IseV/hSOCB23Wmcz24R6OHBs+2OfjMpFJhZSqY7uUNDPPv9o1SIEYbCdgi3xH+xQ10
         XzFMyAdjbmJsiCq+GeLGE89aGwLTWglKdHKsGg7JA4rcJ0O36r2WnYi5GbGvITRb7e
         DkKfcuS0V4J0XWyqBJRQf2qQVFy61A+VxDVmsx4o1r7MEVdz6ze39wyAp2ZlG4M/ta
         R+JuK+ppaPQqQ==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id b26so12500211pfr.3;
        Thu, 15 Apr 2021 22:57:50 -0700 (PDT)
X-Gm-Message-State: AOAM533DgnSwcwUd+8agF8Lm1avFhEceckBYC3KaE3n8QAP7hK6rpxdR
        TRpDFnqwrO913KqzDsBYSlrSVg4tv8hDRnv9uII=
X-Google-Smtp-Source: ABdhPJxNaycHQRe7kMWSFZ+K0ZxWYsWhsZBfhUVtA9I6sa+tgyIYdX2mZjJ7ubSJHRlO5W/o05oG8gmQ0MmLRnfOVZU=
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr6359483pfr.76.1618552669389; Thu, 15 Apr
 2021 22:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <YHdmNrKFp1HqkfVR@localhost.localdomain> <CAK7LNARXt=9-Jw+0dTRhUhkS+r8N6U+m+of5OPEtK7i1XpHzkQ@mail.gmail.com>
 <YHh5h7s52/Lqzlkn@localhost.localdomain>
In-Reply-To: <YHh5h7s52/Lqzlkn@localhost.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 16 Apr 2021 14:57:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTEhRtmFtCEA9JM9fqWmu2wcxPoGCJC4U8eofJibNUPQ@mail.gmail.com>
Message-ID: <CAK7LNARTEhRtmFtCEA9JM9fqWmu2wcxPoGCJC4U8eofJibNUPQ@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: redo fake deps at include/config/*.h
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 2:36 AM Alexey Dobriyan <adobriyan@gmail.com> wrote=
:
>
> Make include/config/foo/bar.h fake deps files generation simpler.
>
> * delete .h suffix
>         those aren't header files, shorten filenames,
>
> * delete tolower()
>         Linux filesystems can deal with both upper and lowercase
>         filenames very well,
>
> * put everything in 1 directory
>         Presumably 'mkdir -p' split is from dark times when filesystems
>         handled huge directories badly, disks were round adding to
>         seek times.
>
>         x86_64 allmodconfig lists 12364 files in include/config.
>
>         ../obj/include/config/
>         =E2=94=9C=E2=94=80=E2=94=80 104_QUAD_8
>         =E2=94=9C=E2=94=80=E2=94=80 60XX_WDT
>         =E2=94=9C=E2=94=80=E2=94=80 64BIT
>                 ...
>         =E2=94=9C=E2=94=80=E2=94=80 ZSWAP_DEFAULT_ON
>         =E2=94=9C=E2=94=80=E2=94=80 ZSWAP_ZPOOL_DEFAULT
>         =E2=94=94=E2=94=80=E2=94=80 ZSWAP_ZPOOL_DEFAULT_ZBUD
>
>         0 directories, 12364 files
>
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>
>  include/linux/compiler-version.h |    2 +-
>  init/Kconfig                     |    2 +-
>  kernel/gen_kheaders.sh           |    2 +-
>  scripts/Makefile.build           |    4 ++--
>  scripts/basic/fixdep.c           |   39 ++++----------------------------=
-------
>  scripts/kconfig/confdata.c       |   15 +++++----------
>  6 files changed, 14 insertions(+), 50 deletions(-)
>
> --- a/include/linux/compiler-version.h
> +++ b/include/linux/compiler-version.h
> @@ -9,6 +9,6 @@
>   * This header exists to force full rebuild when the compiler is upgrade=
d.
>   *
>   * When fixdep scans this, it will find this string "CONFIG_CC_VERSION_T=
EXT"
> - * and add dependency on include/config/cc/version/text.h, which is touc=
hed
> + * and add dependency on include/config/CC_VERSION_TEXT, which is touche=
d
>   * by Kconfig when the version string from the compiler changes.
>   */
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -21,7 +21,7 @@ config CC_VERSION_TEXT
>
>           - Ensure full rebuild when the compiler is updated
>             include/linux/compiler-version.h contains this option in the =
comment
> -           line so fixdep adds include/config/cc/version/text.h into the
> +           line so fixdep adds include/config/CC_VERSION_TEXT into the
>             auto-generated dependency. When the compiler is updated, sync=
config
>             will touch it and then every file will be rebuilt.
>
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -36,7 +36,7 @@ all_dirs=3D"$all_dirs $dir_list"
>  #
>  # When Kconfig regenerates include/generated/autoconf.h, its timestamp i=
s
>  # updated, but the contents might be still the same. When any CONFIG opt=
ion is
> -# changed, Kconfig touches the corresponding timestamp file include/conf=
ig/*.h.
> +# changed, Kconfig touches the corresponding timestamp file include/conf=
ig/*.
>  # Hence, the md5sum detects the configuration change anyway. We do not n=
eed to
>  # check include/generated/autoconf.h explicitly.
>  #
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -238,8 +238,8 @@ endif # CONFIG_STACK_VALIDATION
>
>  # Rebuild all objects when objtool changes, or is enabled/disabled.
>  objtool_dep =3D $(objtool_obj)                                   \
> -             $(wildcard include/config/orc/unwinder.h          \
> -                        include/config/stack/validation.h)
> +             $(wildcard include/config/ORC_UNWINDER            \
> +                        include/config/STACK_VALIDATION)
>
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>  cmd_gen_ksymdeps =3D \
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -34,7 +34,7 @@
>   * the config symbols are rebuilt.
>   *
>   * So if the user changes his CONFIG_HIS_DRIVER option, only the objects
> - * which depend on "include/config/his/driver.h" will be rebuilt,
> + * which depend on "include/config/HIS_DRIVER" will be rebuilt,
>   * so most likely only his driver ;-)
>   *
>   * The idea above dates, by the way, back to Michael E Chastain, AFAIK.
> @@ -74,7 +74,7 @@
>   *
>   * and then basically copies the .<target>.d file to stdout, in the
>   * process filtering out the dependency on autoconf.h and adding
> - * dependencies on include/config/my/option.h for every
> + * dependencies on include/config/MY_OPTION for every
>   * CONFIG_MY_OPTION encountered in any of the prerequisites.
>   *
>   * We don't even try to really parse the header files, but
> @@ -124,38 +124,6 @@ static void xprintf(const char *format, ...)
>         va_end(ap);
>  }
>
> -static void xputchar(int c)
> -{
> -       int ret;
> -
> -       ret =3D putchar(c);
> -       if (ret =3D=3D EOF) {
> -               perror("fixdep");
> -               exit(1);
> -       }
> -}
> -



Applied to linux-kbuild.

I just found one more minor thing to fix up.

fixdep no longer calls putchar(), so I squashed the following:




diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 5bee6a80992f..44e887cff49b 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -107,8 +107,8 @@ static void usage(void)

 /*
  * In the intended usage of this program, the stdout is redirected to .*.c=
md
- * files. The return value of printf() and putchar() must be checked to ca=
tch
- * any error, e.g. "No space left on device".
+ * files. The return value of printf() must be checked to catch any error,
+ * e.g. "No space left on device".
  */
 static void xprintf(const char *format, ...)
 {




--=20
Best Regards
Masahiro Yamada
