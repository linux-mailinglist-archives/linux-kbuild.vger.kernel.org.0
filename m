Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A726B15AC8F
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 17:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgBLQBT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 11:01:19 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:51212 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLQBT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 11:01:19 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01CG16c2028562;
        Thu, 13 Feb 2020 01:01:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01CG16c2028562
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581523267;
        bh=jgMnyQ6e7taMrN8XKE/t9JYcKQ9mse0rEF0i3IfkYKI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1S/cJkKlAJeh6h10+kNdwwLm0alsFbhhpDuomD82uTqxwpUKjdBo7bm0tNu9IGuoR
         g8BIDCNcwQLG0olfosqKhqO/yKiwf3SuVv7stCSJN6/DHSFx2uRrVhIkCdryOwoWn1
         HFppgDq56bfFdTTGiRhQrG80amOnb9QXeHuS4x8Y8WLMAAhyu8PCW7ayMoCtYYgnkq
         t7jBrXGu2a+jtv7R7BBUQV/7Taut6eLx2L3GxW6maCmKoCqexmTIPQp0j/M5viYe3Z
         HAWFgyY9nWXMsprQ79jocZOxGwdQVIvGQY6+l6QnZntu7kgymQLQYnIhXVjvx4y1pw
         TU+gCky17Qf9g==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id l6so1029876uap.13;
        Wed, 12 Feb 2020 08:01:07 -0800 (PST)
X-Gm-Message-State: APjAAAXNvxrWfaQwpqWgZhV8KHJDfDT2Yh96r1cvseUlUdaijGnJ37ND
        qob6GdI43GhDlCn3mBnJBYnbl7UB2Zz74slZp20=
X-Google-Smtp-Source: APXvYqyKzqwHthQ8w1eAIJMmKLc+sLNIsGW9LHJ8gcgtKMBHGIwfbGI0e0E8i/00XA5LhyKz8e3B92sv5418kTN4DdA=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr7016799uau.109.1581523266111;
 Wed, 12 Feb 2020 08:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20200210200634.950-1-masahiroy@kernel.org>
In-Reply-To: <20200210200634.950-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 13 Feb 2020 01:00:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYsNcdL8L_do7McOKf1sJJRvBbMS_wQeU-HefYJnfU3Q@mail.gmail.com>
Message-ID: <CAK7LNASYsNcdL8L_do7McOKf1sJJRvBbMS_wQeU-HefYJnfU3Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix mismatch between .version and include/generated/compile.h
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 11, 2020 at 5:06 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 56d589361572 ("kbuild: do not create orphan built-in.a or
> obj-y objects"), scripts/link-vmlinux.sh does nothing when descending
> into init/.
>
> Once the version number becomes out of sync between .version and
> include/generated/compile.h, it is not self-healing.
>
> [How to reproduce]
>
>  $ echo 100 > .version
>  $ make
>
> You will see the number in the .version is always bigger than that in
> compile.h by one. After this, every time you run 'make', the vmlinux is
> re-linked even when none of source files is updated.
>
> Fixes: 56d589361572 ("kbuild: do not create orphan built-in.a or obj-y objects")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied.


>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 1919c311c149..dd484e92752e 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -239,7 +239,7 @@ else
>  fi;
>
>  # final build of init/
> -${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
> +${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
>
>  #link vmlinux.o
>  info LD vmlinux.o
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
