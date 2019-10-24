Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 989DBE39AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2019 19:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436828AbfJXRTv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Oct 2019 13:19:51 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43878 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJXRTv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 13:19:51 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x9OHJbrG029697;
        Fri, 25 Oct 2019 02:19:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x9OHJbrG029697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571937578;
        bh=DlpkDkxXeKbgR2DHSEx3AUMoib2vy4hBWPIAznudXf8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H8ENO7RKg6EbUGZknowVJtamq0P5Q7ivuNtSHSXZdGJe0T/KzuFPFOENhjV3YO8xa
         i+hbe6QP5Rib4o7cu4NfQg7u3Xqwx5FKg7e/++B9y/UabCOjYS8PGFgtmQCZWAa31K
         R7Jr5TvqzZIJhhMT9mX6J5NiTG/pT2fY6ElQFBRtWh3AmhWHCHZ9kzgy9xgNjiWu3q
         +dJVUtaUpQzVllUpu56Dmx+PiL+biYPR486iVuxgrgJZquzz59e8n/PYNuuK8mgEZt
         I1upJPtaoqhYhRG3bOELOZ4UrHZRNc52qI72Ienp+nc/97Xu8aOtnRnU1txaqaCMe9
         I84cm7QrZwYrQ==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id n41so7414057uae.2;
        Thu, 24 Oct 2019 10:19:38 -0700 (PDT)
X-Gm-Message-State: APjAAAUAW6p2qkm6fU5znuXaMkeotj40XGQStxZ/zKjm0eRaVjHMpt7P
        9AFnIlH87k6CS6qzjTs5mZ7lGilCU8ZAlNme/AY=
X-Google-Smtp-Source: APXvYqy7ygJTkJ0TuphWgLteXUVtW6G5+mQPoJbbiA1ve7Oa6rV04LSG4Y/9ComVdRHa535GRyTPlayRennJLzvHOAs=
X-Received: by 2002:ab0:59ed:: with SMTP id k42mr9572261uad.25.1571937577071;
 Thu, 24 Oct 2019 10:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191008120556.4263-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191008120556.4263-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 25 Oct 2019 02:19:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNASzbrE=QZiOqQnV8EpyGpfRhqmGOkCAqdAahdM66crqXA@mail.gmail.com>
Message-ID: <CAK7LNASzbrE=QZiOqQnV8EpyGpfRhqmGOkCAqdAahdM66crqXA@mail.gmail.com>
Subject: Re: [PATCH 1/5] kheaders: remove unneeded 'cat' command piped to
 'head' / 'tail'
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 8, 2019 at 9:06 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The 'head' and 'tail' commands can take a file path directly.
> So, you do not need to run 'cat'.
>
>   cat kernel/kheaders.md5 | head -1
>
> ... is equivalent to:
>
>   head -1 kernel/kheaders.md5
>
> and the latter saves forking one process.
>
> While I was here, I replaced 'head -1' with 'head -n 1'.
>
> I also replaced '==' with '=' since we do not have a good reason to
> use the bashism.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>
>  kernel/gen_kheaders.sh | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index aff79e461fc9..8aa6d3c37ba7 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -41,10 +41,10 @@ obj_files_md5="$(find $dir_list -name "*.h"                    |
>  this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
>  if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
>  if [ -f kernel/kheaders.md5 ] &&
> -       [ "$(cat kernel/kheaders.md5|head -1)" == "$src_files_md5" ] &&
> -       [ "$(cat kernel/kheaders.md5|head -2|tail -1)" == "$obj_files_md5" ] &&
> -       [ "$(cat kernel/kheaders.md5|head -3|tail -1)" == "$this_file_md5" ] &&
> -       [ "$(cat kernel/kheaders.md5|tail -1)" == "$tarfile_md5" ]; then
> +       [ "$(head -n 1 kernel/kheaders.md5)" = "$src_files_md5" ] &&
> +       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$obj_files_md5" ] &&
> +       [ "$(head -n 3 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
> +       [ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
>                 exit
>  fi
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
