Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3212258D0B
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2019 23:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfF0VaT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Jun 2019 17:30:19 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43323 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfF0VaT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Jun 2019 17:30:19 -0400
Received: by mail-pl1-f194.google.com with SMTP id cl9so1957631plb.10
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Jun 2019 14:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3YW+2jcLgYN4oaHRnnDv11W/CoBacLZ8zMmJkEioDc=;
        b=HHIbNAl2DMs1IW6sciIhs6PFHnrTCBjgCkjuj06Oo0rz7KROq+01ZEgs3EYfCyWt9g
         X/fOp37LHF3JlyHWre/fn05fWjbJ+DoE+W8AGoNZ/FLVyYFSwD3xRbSzphAvXyus91nC
         ZAte9fqAIHU303twh6upCBqPVo0LL6sWpZklezw/L/+AysyP8a6XojjW6NPUBwIPDg2/
         26cx/z1HcStpgO4xq2HuKcVsTmA/vrfVz4yHnaApiXWr8j6I0Ix9Z1yGXMiJT+yc14dN
         SqAyl2meWSIQU1nFR2GIjLS0O8pnZFp+eKLZFRQvHd0PAL0Jk3BzNjBnKFADnOOatin4
         kzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3YW+2jcLgYN4oaHRnnDv11W/CoBacLZ8zMmJkEioDc=;
        b=jYbNeOpN5OWx5ecLzGEH+kvFq2u6KlPrpbqYvXL6EuOMeqm0es/qdzTKvLDnuZ27mf
         g2GPHrU8T8Y2vORh+1zZzCEzuwOFDG2x4DDqzlKHGVxtXAxOe7tcUqFlnD4zltX0a+vt
         pMvZkn1EGIASNcZ7G08zE7Wg0RM0hRS7wMEcjRuvLcEz+zGJUmXBkHTRPAXO44liaHSJ
         UF8MeTAyqPCwRX88EI5YhLiDEWSi05mxNNMBUYBNuCq/hhexpeBBvmB8Xa0SSBAIluzp
         uQB9b8HRb/nKdXpsy2uuQu4rvfpU2GR2XJiBoi+0gwnrXhFLH4DS53AZqLNdZrM2yuXT
         CSag==
X-Gm-Message-State: APjAAAVpn1FOFHqaEaCxcUJTtDtoh1Yua2aF9lxEzMrojXM+rANW+0y0
        EyqThf0Xm9m1zt+z7jjv+ewLWdjb2ZFrV5vV3HkLHg==
X-Google-Smtp-Source: APXvYqyUPXnMqtFiZgEBNqGmZ1gbO1OGNJO0ge+IQZz6/jmXf6xraTK3+4sqd1/0kiqwzcG31BNkPRvjuAuBYiOV/sg=
X-Received: by 2002:a17:902:4aa3:: with SMTP id x32mr6831689pld.119.1561671017667;
 Thu, 27 Jun 2019 14:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190627191448.110756-1-natechancellor@gmail.com>
In-Reply-To: <20190627191448.110756-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 27 Jun 2019 14:30:06 -0700
Message-ID: <CAKwvOdkmacZ0Pu+KcmHb+-e4x0DZs1=FfAKHSo-2xf9LWtknAQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add ability to test Clang's integrated assembler
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Dmitry Golovin <dima@golovin.in>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 27, 2019 at 12:15 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> There are some people interested in experimenting with Clang's
> integrated assembler. To make it easy to do so without source
> modification, allow the user to specify 'AS=clang' as part of the
> make command to avoid adding '-no-integrated-as' to the {A,C}FLAGS.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/577
> Suggested-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 5102b2bbd224..d77481129339 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -527,7 +527,9 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> +ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
>  CLANG_FLAGS    += -no-integrated-as
> +endif

This is a nice suggestion and solution.  Thanks Dima and Nathan.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
