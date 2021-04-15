Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B56360140
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 06:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhDOE7x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 00:59:53 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:55922 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbhDOE7w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 00:59:52 -0400
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 13F4xCDF013667;
        Thu, 15 Apr 2021 13:59:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13F4xCDF013667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618462753;
        bh=ht1f8yHf5q2jN0EbMW6shrGEQ2FtkebawKV6QqdYm9s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=z3jAFFPFnImSo6x/RxJZ5si1Rzh9NMQ0IbpSFJWQItx8lS0XeFxA0kqW4HpyqqurB
         kx/DW2gIGc6UCb7BS4RHIEi/EDuhEwYQV7Xt/u3zW628T1Tu5EkGlxSWAl8tYRbTOi
         pbUgLFiB/0rzb591/aPUXT96wR1N8RePcObMHhc0GuEcXw5nXEjmveXJvcSHB0DtCY
         ChwPZA00CuGgKg9XTyKq/J4seoKk7KpVHys8lD5FzYqA6lpkvG+wYpeuGxHDunhQnk
         ihM9HHnVJweW7wYBGWgnbnkkyq/4ME+tQmC2uvcuCzQIB3VqXNgyk5d20l+CtcMxdJ
         RjhH8OLX05RtA==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id y2so11380991plg.5;
        Wed, 14 Apr 2021 21:59:12 -0700 (PDT)
X-Gm-Message-State: AOAM531owx6Ga8LuhMfNH/15xPVcRrUcurfma5PJI37eeyP29xLImt+f
        8Hy779Z1L5s2B8sXRy0Tw3RN1h6YJEB5a2A85Vc=
X-Google-Smtp-Source: ABdhPJzqXO9OkbImfvAAHhsAgenGqmlkv/Ydd6svh8nfl2I1L/fspACA/bzbNglAPeifpWnV1Ri2XAe4frNQMML1i3A=
X-Received: by 2002:a17:90a:1056:: with SMTP id y22mr1695144pjd.153.1618462752092;
 Wed, 14 Apr 2021 21:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <YHdmNrKFp1HqkfVR@localhost.localdomain>
In-Reply-To: <YHdmNrKFp1HqkfVR@localhost.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Apr 2021 13:58:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNARXt=9-Jw+0dTRhUhkS+r8N6U+m+of5OPEtK7i1XpHzkQ@mail.gmail.com>
Message-ID: <CAK7LNARXt=9-Jw+0dTRhUhkS+r8N6U+m+of5OPEtK7i1XpHzkQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: redo fake deps at include/config/*.h
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 7:01 AM Alexey Dobriyan <adobriyan@gmail.com> wrote:
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


I am not sure about the impact of this change
given various file systems in the wild,
but this simplification is attractive.

With a quick search, I found a comment
'performance issues past 10,000' on ext2  [1]
but that may not be what we care about much...

[1]: https://webmasters.stackexchange.com/questions/99539/what-is-a-recommended-maximum-number-of-files-in-a-directory-on-your-webserver





> @@ -124,36 +124,12 @@ static void xprintf(const char *format, ...)
>         va_end(ap);
>  }
>
> -static void xputchar(int c)
> -{
> -       int ret;
> -
> -       ret = putchar(c);
> -       if (ret == EOF) {
> -               perror("fixdep");
> -               exit(1);
> -       }
> -}
> -
>  /*
>   * Print out a dependency path from a symbol name
>   */
>  static void print_dep(const char *m, int slen, const char *dir)
>  {
> -       int c, prev_c = '/', i;
> -
> -       xprintf("    $(wildcard %s/", dir);
> -       for (i = 0; i < slen; i++) {
> -               c = m[i];
> -               if (c == '_')
> -                       c = '/';
> -               else
> -                       c = tolower(c);
> -               if (c != '/' || prev_c != '/')
> -                       xputchar(c);
> -               prev_c = c;
> -       }
> -       xprintf(".h) \\\n");
> +       xprintf("    $(wildcard %s/%.*s) \\\n", dir, slen, m);



Since this function now contains just one line,
can you hard-code

    xprintf("    $(wildcard include/config/%.*s) \\\n", slen, m);

in use_config() ?



>  }
>
>  struct item {
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -130,19 +130,14 @@ static size_t depfile_prefix_len;
>  static int conf_touch_dep(const char *name)
>  {
>         int fd, ret;
> -       const char *s;
> -       char *d, c;
> +       char *d;
>
>         /* check overflow: prefix + name + ".h" + '\0' must fit in buffer. */
>         if (depfile_prefix_len + strlen(name) + 3 > sizeof(depfile_path))

Since you dropped the ".h" suffix,
please fix up this line.





Also, you can fix

  # changed, Kconfig touches the corresponding timestamp file
include/config/*.h.

in kernel/gen_kheaders.sh





>                 return -1;
>
>         d = depfile_path + depfile_prefix_len;
> -       s = name;
> -
> -       while ((c = *s++))
> -               *d++ = (c == '_') ? '/' : tolower(c);
> -       strcpy(d, ".h");
> +       strcpy(d, name);
>
>         /* Assume directory path already exists. */
>         fd = open(depfile_path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
> @@ -465,7 +460,7 @@ int conf_read_simple(const char *name, int def)
>                                          * Reading from include/config/auto.conf
>                                          * If CONFIG_FOO previously existed in
>                                          * auto.conf but it is missing now,
> -                                        * include/config/foo.h must be touched.
> +                                        * include/config/FOO must be touched.
>                                          */
>                                         conf_touch_dep(line + strlen(CONFIG_));
>                                 else



--
Best Regards
Masahiro Yamada
