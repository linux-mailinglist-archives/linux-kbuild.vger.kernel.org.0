Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649A3632D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 10:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfGIIbG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 04:31:06 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40031 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfGIIbG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 04:31:06 -0400
Received: by mail-oi1-f195.google.com with SMTP id w196so14739158oie.7;
        Tue, 09 Jul 2019 01:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yPz8Wrc9scfbvUYSoeH3P5XkfDp5IV5bPUgpQapxuj0=;
        b=IIQlBN5LDRNO2wWAUYgrNtmYB37gmiiJzvcJuLr6naF6gGXgXLSyJKRtxJIA4JZknh
         eD+AACRyxsRrT9rZ57l8R0Jixn/mHcy8ct/LRAD+RZxlkbNoFFWg59PrqZdUNFpqUe8G
         eJnVfxx4VpqxytvOyW8afn9CoRqlS6EYLR+oBtVKc0A1h/7ouG9tu51X6KozyhJksKME
         xL0LZTRLii6WNDQUWlh6fidaoG2OAs6K0v+zN8RQ7L8ZJtfofB6adzGiJbhxnNP4DWqE
         IoS0Xiq1l1fYA0jkpN2mjNQQv1g2LstaI0wywzz1lcJ7z/7o8p6wBM5jo9JAu0Pq7om+
         FyCA==
X-Gm-Message-State: APjAAAXvaVYA4cNH/uxsVcnI3QKfB1izf5KNqcvzFEgIJBuIvmJCNILD
        LWb17wMtBaqjaqS8R2vCX6aAneUYJrvjrIKz2IM=
X-Google-Smtp-Source: APXvYqyKI0T8msqU4zRnkOtnk4CuiAuhybApyJo3IIAbQep1kB5/rzz1YGjuq/OVF9u3ux3cgEea7Yq6VJBy4ugZ8A4=
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr970498oif.131.1562661065479;
 Tue, 09 Jul 2019 01:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <1554633831-10303-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1554633831-10303-1-git-send-email-yamada.masahiro@socionext.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Jul 2019 10:30:53 +0200
Message-ID: <CAMuHMdUH46_yvYc840uvMoOOqXuU3mDOjaT65vZ=6WKGq7-Kqg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check arch/$(SRCARCH)/include/generated before
 out-of-tree build
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Sun, Apr 7, 2019 at 12:45 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> After cross-compiling the kernel, "make mrproper" should be executed
> with the proper ARCH= option. Otherwise, stale objects will remain
> under arch/$(SRCARCH)/.
>
> One bad scenario is like this:
>
>   $ make ARCH=arm defconfig all   # cross-compile the kernel for arm
>   $ make mrproper                 # mrproper for host-arch (i.e. x86)
>   $ make ARCH=arm O=build_dir defconfig all
>
> If you miss ARCH= for mrproper and cross-compile the kernel with O=
> and ARCH= options, Kbuild will happily start to build, but may fail
> due to stale objects in the srctree.
>
> If $(srctree)/arch/$(SRCARCH)/include/generated/ exists, let's stop
> the out-of-tree build. To detect this, mrproper should clean only
> arch/$(SRCARCH)/include/generated/.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 10643c3..17945ce 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1091,7 +1091,9 @@ PHONY += prepare archprepare prepare1 prepare3
>  prepare3: include/config/kernel.release
>  ifneq ($(srctree),.)
>         @$(kecho) '  Using $(srctree) as source for kernel'
> -       $(Q)if [ -f $(srctree)/.config -o -d $(srctree)/include/config ]; then \
> +       $(Q)if [ -f $(srctree)/.config -o \
> +                -d $(srctree)/include/config -o \
> +                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
>                 echo >&2 "  $(srctree) is not clean, please run 'make mrproper'"; \
>                 echo >&2 "  in the '$(srctree)' directory.";\

This took me a bit to find out what was wrong...

Usually I don't run "make mrproper", as it removes files I may want to
keep (e.g. tags).  Hence I ran "git ls-files -o | grep m68k | xargs rm"
(I usually build in separate output directories), confirmed with "git
ls-files -o" there were no remaining build artefacts, and was surprised
to discover I still got the error message above?!?

Apparently arch/m68k/include/generated was still present, but as "git
ls-files -o" only shows files, not directories, it was not listed.
Perhaps the directory checks above can be changed to directory exists
_and_ is not empty?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
