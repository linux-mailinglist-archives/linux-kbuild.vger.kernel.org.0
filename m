Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143CC15A481
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 10:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgBLJVc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 04:21:32 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59506 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbgBLJVb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 04:21:31 -0500
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01C9LI33008124;
        Wed, 12 Feb 2020 18:21:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01C9LI33008124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581499279;
        bh=iYzD7pdsLyiDZ36c5d6tg+M16G3Z0A4Qkle2y21WmO4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MEkMO8qWqvGOB6YbA98tAicKNmVYCmEEF0+jvnZcP9vwWz5Z/XT1+Xds25vCvvshA
         5zE/p5kLAorYZHqVYD3jmzJ4w1LdUJ19ZmdnBjhI+wpKbN7Bxewt9kHhIeqvk2oXrO
         csk23G4fdJ9OyKsaInvXj3jS8QpaPywXcU7+J7r6IuUY/0vjSNO86L3UEQPL5+fyO0
         McohvztsbamEnjn7UDDplfhbzJYR+CcDXCwrjntBrOdcqrs7GGjA50LIRmMtMwfqzN
         uaV/zXL/Owwfi5xlN8GBD3pk4VFGr3t+TJJ02HiOQsYBWTqIf1HbBpz+bD+r8Fmr66
         p3qp8l6RgZaIg==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id w15so607239uap.0;
        Wed, 12 Feb 2020 01:21:19 -0800 (PST)
X-Gm-Message-State: APjAAAXrZYjw0vBK9T4UBABLZ00khLEbbLJ7rX/aVG4l0NH8cb3RVZjv
        w8bauO4iyAnt9uq08LyBp1GdEUTGMrZMBPF6PiI=
X-Google-Smtp-Source: APXvYqy0urxDpzGsbsHT8k8GTdNCXZuHMc0izqqATD6WqiS7hOqQJCh10Wqi+8y2ehLGEvej4sCWBmfUkqTYRP0+RJ8=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr3947693uap.95.1581499278141;
 Wed, 12 Feb 2020 01:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20200210161852.842-1-masahiroy@kernel.org>
In-Reply-To: <20200210161852.842-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 12 Feb 2020 18:20:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLCAnrtqR8vv=jWiDcODGchMekOGMbSNvEQtnb3JqTDQ@mail.gmail.com>
Message-ID: <CAK7LNATLCAnrtqR8vv=jWiDcODGchMekOGMbSNvEQtnb3JqTDQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 11, 2020 at 1:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> scripts/kallsyms crashes because memcpy() writes one more byte than
> allocated.
>
> Fixes: 8d60526999aa ("scripts/kallsyms: change table to store (strcut sym_entry *)")
> Reported-by: youling257 <youling257@gmail.com>
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied.
I will send a pull request shortly
because many people are tripping over this bug.




>  scripts/kallsyms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index a566d8201b56..0133dfaaf352 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -210,7 +210,7 @@ static struct sym_entry *read_symbol(FILE *in)
>
>         len = strlen(name) + 1;
>
> -       sym = malloc(sizeof(*sym) + len);
> +       sym = malloc(sizeof(*sym) + len + 1);
>         if (!sym) {
>                 fprintf(stderr, "kallsyms failure: "
>                         "unable to allocate required amount of memory\n");
> @@ -219,7 +219,7 @@ static struct sym_entry *read_symbol(FILE *in)
>         sym->addr = addr;
>         sym->len = len;
>         sym->sym[0] = type;
> -       memcpy(sym_name(sym), name, len);
> +       strcpy(sym_name(sym), name);
>         sym->percpu_absolute = 0;
>
>         return sym;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
