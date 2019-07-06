Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2181961126
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 16:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfGFOlA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jul 2019 10:41:00 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53895 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfGFOlA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:41:00 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x66EemA6006364;
        Sat, 6 Jul 2019 23:40:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x66EemA6006364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562424049;
        bh=qtdmi/y2/anS4onfqEbPrVwSfRgQ91h/dUmwEkckYUg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DwKIXNOLArdbTpJxDJaqDTLAG7WNTDH+1iKwOWFkYB5R987yHLCzP6UKBoyZXLQx0
         Q4JiWrhOGE82UX04AlZ1MAwMJZ3VDlWVSFlcL5QYeb11oGbJie8EHm2GvSK1yFOfqI
         dqsfaGYKwsg0kazoTNW5EVjza3dwEcOy1B9GgGf8G+Tu1K08+z2EHBHWUVh1YcoK6D
         s2BlMuQbFmd+k407dH3F7hBBANnWeMRs8F3Y8tkyEwLoel3GJXe6bXttlbzYTNi5Xc
         Nvcxmn+rfqhPAT6J1jHXURp3BBdz8gTrGpSOrhifaxyLBVZVVZl48H9bIbBS2NM1ue
         TxUZ5WjYEABvw==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id j21so3231188uap.2;
        Sat, 06 Jul 2019 07:40:49 -0700 (PDT)
X-Gm-Message-State: APjAAAUyINZaO19Z58F6erOnpdLEze5AR4wHCsMGhAT8GVXYPYHsRmdG
        XwDTAB9El3Igmc5+lOdkUjxhKNFjnbM+HRiMr7Y=
X-Google-Smtp-Source: APXvYqw5MhAlIP4BC6xpa4NyfVHzHK/0jOkR+iAbu4dR1Bn0/5wqi66Q8cSrUkXtvdS9OTF8bvAZUblB4TzmQFtm7bg=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr5144978uaf.95.1562424048297;
 Sat, 06 Jul 2019 07:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190625065419.26324-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190625065419.26324-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 6 Jul 2019 23:40:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNATR4xpKtUrufX=82qHHheG2HppwjJ1QQAre7=PvPOZLvw@mail.gmail.com>
Message-ID: <CAK7LNATR4xpKtUrufX=82qHHheG2HppwjJ1QQAre7=PvPOZLvw@mail.gmail.com>
Subject: Re: [PATCH v2] fixdep: check return value of printf() and putchar()
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 25, 2019 at 3:54 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When there is not enough space on your storage device, the build will
> fail with 'No space left on device' error message.
>
> The reason is obvious from the message, so you will free up some disk
> space, then you will resume the build.
>
> However, sometimes you may still see a mysterious error message:
>
>   unterminated call to function 'wildcard': missing ')'.
>
> If you run out of the disk space, fixdep may end up with generating
> incomplete .*.cmd files.
>
> For example, if the disk shortage occurs while fixdep is running
> print_dep(), the .*.cmd might be truncated like this:
>
>    $(wildcard include/config/
>
> When you run 'make' next time, this broken .*.cmd will be included,
> then GNU Make will terminate parsing since it is a wrong syntax.
>
> Once this happens, you need to run 'make clean' or delete the broken
> .*.cmd file manually.
>
> Even if you do not see any error message, the .*.cmd files after any
> error could be potentially incomplete, and unreliable. You may miss
> the re-compilation due to missing header dependency.
>
> If printf() cannot output the string for disk shortage or whatever
> reason, it returns a negative value, but currently fixdep does not
> check it at all. Consequently, fixdep *successfully* generates a
> broken .*.cmd file. Make never notices that since fixdep exits with 0,
> which means success.
>
> Given the intended usage of fixdep, it must respect the return value
> of not only malloc(), but also printf() and putchar().
>
> This seems a long-standing issue since the introduction of fixdep.
>
> In old days, Kbuild tried to provide an extra safety by letting fixdep
> output to a temporary file and renaming it after everything is done:
>
>   scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
>   rm -f $(depfile);                                                    \
>   mv -f $(dot-target).tmp $(dot-target).cmd)
>
> It did not avoid the current issue; fixdep created a truncated tmp file
> reporting success, so the broken tmp would be renamed to a .*.cmd file.
>
> By propagating the error code to the build system, this problem should
> be solved because:
>
> [1] Since commit 9c2af1c7377a ("kbuild: add .DELETE_ON_ERROR special
>     target"), Make will delete the target automatically on any failure
>     in the recipe.
>
> [2] Since commit 392885ee82d3 ("kbuild: let fixdep directly write to
>     .*.cmd files"), .*.cmd file is included only when the corresponding
>     target already exists.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


> Changes in v2:
>  - Add prror()
>
>  scripts/basic/fixdep.c | 51 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index facbd603adf6..4ac973f2dc8c 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -99,6 +99,7 @@
>  #include <unistd.h>
>  #include <fcntl.h>
>  #include <string.h>
> +#include <stdarg.h>
>  #include <stdlib.h>
>  #include <stdio.h>
>  #include <ctype.h>
> @@ -109,6 +110,36 @@ static void usage(void)
>         exit(1);
>  }
>
> +/*
> + * In the intended usage of this program, the stdout is redirected to .*.cmd
> + * The return value of printf() and putchar() must be checked to catch any
> + * error like "No space left on device".
> + */
> +static void xprintf(const char *format, ...)
> +{
> +       va_list ap;
> +       int ret;
> +
> +       va_start(ap, format);
> +       ret = vprintf(format, ap);
> +       if (ret < 0) {
> +               perror("fixdep");
> +               exit(1);
> +       }
> +       va_end(ap);
> +}
> +
> +static void xputchar(int c)
> +{
> +       int ret;
> +
> +       ret = putchar(c);
> +       if (ret == EOF) {
> +               perror("fixdep");
> +               exit(1);
> +       }
> +}
> +
>  /*
>   * Print out a dependency path from a symbol name
>   */
> @@ -116,7 +147,7 @@ static void print_dep(const char *m, int slen, const char *dir)
>  {
>         int c, prev_c = '/', i;
>
> -       printf("    $(wildcard %s/", dir);
> +       xprintf("    $(wildcard %s/", dir);
>         for (i = 0; i < slen; i++) {
>                 c = m[i];
>                 if (c == '_')
> @@ -124,10 +155,10 @@ static void print_dep(const char *m, int slen, const char *dir)
>                 else
>                         c = tolower(c);
>                 if (c != '/' || prev_c != '/')
> -                       putchar(c);
> +                       xputchar(c);
>                 prev_c = c;
>         }
> -       printf(".h) \\\n");
> +       xprintf(".h) \\\n");
>  }
>
>  struct item {
> @@ -324,13 +355,13 @@ static void parse_dep_file(char *m, const char *target)
>                                  */
>                                 if (!saw_any_target) {
>                                         saw_any_target = 1;
> -                                       printf("source_%s := %s\n\n",
> -                                              target, m);
> -                                       printf("deps_%s := \\\n", target);
> +                                       xprintf("source_%s := %s\n\n",
> +                                               target, m);
> +                                       xprintf("deps_%s := \\\n", target);
>                                 }
>                                 is_first_dep = 0;
>                         } else {
> -                               printf("  %s \\\n", m);
> +                               xprintf("  %s \\\n", m);
>                         }
>
>                         buf = read_file(m);
> @@ -353,8 +384,8 @@ static void parse_dep_file(char *m, const char *target)
>                 exit(1);
>         }
>
> -       printf("\n%s: $(deps_%s)\n\n", target, target);
> -       printf("$(deps_%s):\n", target);
> +       xprintf("\n%s: $(deps_%s)\n\n", target, target);
> +       xprintf("$(deps_%s):\n", target);
>  }
>
>  int main(int argc, char *argv[])
> @@ -369,7 +400,7 @@ int main(int argc, char *argv[])
>         target = argv[2];
>         cmdline = argv[3];
>
> -       printf("cmd_%s := %s\n\n", target, cmdline);
> +       xprintf("cmd_%s := %s\n\n", target, cmdline);
>
>         buf = read_file(depfile);
>         parse_dep_file(buf, target);
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
