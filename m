Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF4B19891
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 08:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfEJGqs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 02:46:48 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38302 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfEJGqs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 02:46:48 -0400
Received: by mail-vs1-f65.google.com with SMTP id v9so3002105vse.5;
        Thu, 09 May 2019 23:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+xWxilDOnu8Bu/PxtRMw20TWij1eUXAEr9rz33p/haM=;
        b=HqLjcZiMr6BdIT0CkJzU/VbC/CWxRxt6mOb+Xt2s1xdCJEv107mr2qnfQ9z3uTbJqR
         p6aBf0kEqK5YHgkJFrF9QYc8QZIMAlpZ1BPNe5GvXwHUZ2pDcWP5la1m46xxzsB7Kn4O
         i6/3DjFECGePDEzpqa2BS6rp+d0rl6fIMnX0/0TQcQ43TAMGQ9HEKGhQKuv/m6Iz6/e1
         sZ+3j6W2+sW0HbPNj0LSMGdaIPZfm76wPeVWa8A5g739hWneY4ws5XFA4b1kzTgfEO6G
         f1EmNP1OaZucWFPsKyML4ygGKu8sXz2VrHF3Q79bnsRmqQQkBbgKE79A92vS2yi+fZge
         BSig==
X-Gm-Message-State: APjAAAVj0+lFKMFtOuZtgAfYJnHMRLbo7KXsem2P28aPWIft+8pTd5Im
        jw6TtR+GUG3lCy17BYN+2YB9Q98/c6Mwc1evollrox3F
X-Google-Smtp-Source: APXvYqy/VAGQtxd4C1DFnWSsqd027UyDsztN5uRv5CFMfigNS41lNWQtv1HceDhXDnlJLkv8lz7UTWfcTOmsnj+txs0=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr1810974vsq.63.1557470806711;
 Thu, 09 May 2019 23:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190510061205.28753-1-yamada.masahiro@socionext.com> <20190510061205.28753-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190510061205.28753-2-yamada.masahiro@socionext.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 May 2019 08:46:35 +0200
Message-ID: <CAMuHMdVmgZjyGxz0F=Akz+3egFtGMppGg6TRAnRhd=KZv5ADdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the same
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Fri, May 10, 2019 at 8:14 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Kconfig updates the .config when it exits even if its content is
> exactly the same as before. Since its timestamp becomes newer than
> that of other build artifacts, additional processing is invoked,
> which is annoying.
>
> - syncconfig is invoked to update include/config/auto.conf, etc.
>
> - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
>   then vmlinux is relinked as well.
>
> If the .config is not changed at all, we do not have to even
> touch it. Just bail out showing "No change to .config".
>
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # configuration written to .config
>   #
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # No change to .config
>   #
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for your patch!

> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c

> @@ -888,6 +935,13 @@ int conf_write(const char *name)
>         fclose(out);
>
>         if (*tmpname) {
> +               if (is_same(name, tmpname)) {
> +                       conf_message("No change to %s", name);
> +                       unlink(tmpname);
> +                       sym_set_change_count(0);
> +                       return 0;
> +               }
> +
>                 snprintf(oldname, sizeof(oldname), "%s.old", name);
>                 rename(name, oldname);
>                 if (rename(tmpname, name))

This causes a semantic change for the meaning of ".config.old", which is
no longer updated if .config has not changed.
Hence its contents may no longer correspond to the previous config, but to
an arbitrary older version.

My workflow involves always running my own script "linux-oldconfig",
instead of "make oldconfig", so I immediately see what has changed:

    $ cat $(type -p linux-oldconfig)
    #!/bin/bash
    make ${0#*/linux-} && colordiff -u .config{.old,}

However, after your patch, "linux-oldconfig" keeps on showing the old
changes, while .config itself has not changed.  I guess other people
tracking .config changes are using a similar scheme.

One way to fix this is to rename tmpname to oldname if is_same() returns
true. However, this may have side effects for other people, as the
timestamp of .config.old will be changed.

Do you have a better solution?
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
