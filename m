Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3197E1525A5
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2020 05:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgBEEms (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Feb 2020 23:42:48 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51574 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgBEEms (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Feb 2020 23:42:48 -0500
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0154giSx014546;
        Wed, 5 Feb 2020 13:42:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0154giSx014546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580877764;
        bh=6CPRqOD/Fe7zoq1RGimJL9B88AgPymJVLA5R5fTkxsc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zHHB/p6KmM0Kk6RP1vVPyCTW1hHBx0Vo9nCpLCtpaDHuCGacAbM8PLprep1c879Hz
         W2iYS9jHiZMfjIBLgAAaPonzUCmX8jDNoV54W62IiF57f0CfwcpgEl+io4ecX2b4QI
         pHoKd/ABAo9RqNH4WjRMZo1YB1y1qV6k074SKsJYWXO44Njrsj7dHAnD6r9KlmLwDz
         W0YZETUkjPf/Z920ZtMaTrmCDagISAhVcDevy0QuyM2Ufl83+L0iFbDdGG4Ce2pMZf
         FrTfmvZqrxjF4plzs07j3D3fGOBsLgkw7Zdn+yBtfgREyTx7Odnw7V3Q5u/0lKlFjH
         hvgI2+Rj1jCvw==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id o42so368713uad.10;
        Tue, 04 Feb 2020 20:42:44 -0800 (PST)
X-Gm-Message-State: APjAAAX7ZbF9w1CYxaU2mExOwMrY4GxvCnZ3DGwA4caPw6pl7Erlppnf
        2POka23Rra4i7VJhfMwWPqFeL18dn2Vm88WA48Y=
X-Google-Smtp-Source: APXvYqxcekY6tR906J3p0JD4gnkPGtQ9DyvPxOsISnJIV+Cw5/8zojyJV8B6RF3T6mUxbEfJQ5YSNrfZEb4mu614T60=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr19620371uay.25.1580877763433;
 Tue, 04 Feb 2020 20:42:43 -0800 (PST)
MIME-Version: 1.0
References: <ced8ab1c-9c35-c7b0-6b9e-bcee7ffdf469@i-love.sakura.ne.jp>
 <CAK7LNATNY1oP5XgFH3+fuUU=Z7pEz7Sqz0vKCzvhM4Kem7RkOg@mail.gmail.com> <202002040408.01448ioc013868@www262.sakura.ne.jp>
In-Reply-To: <202002040408.01448ioc013868@www262.sakura.ne.jp>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 5 Feb 2020 13:42:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATD1p6KDYNLYmb+UZpVNOaLdFEp-QRm1waDX_v-sSZ1=w@mail.gmail.com>
Message-ID: <CAK7LNATD1p6KDYNLYmb+UZpVNOaLdFEp-QRm1waDX_v-sSZ1=w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Invalidate all symbols after changing to y or m.
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Tue, Feb 4, 2020 at 1:09 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Since commit 89b9060987d98833 ("kconfig: Add yes2modconfig and
> mod2yesconfig targets.") forgot to clear SYMBOL_VALID bit after
> changing to y or m, these targets did not save the changes.
> Call sym_clear_all_valid() so that all symbols are revalidated.
>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>


My previous comment:
"sym_add_change_count(1); seems the convention way
to inform kconfig of some options being updated."
was misleading. Sorry.


conf_write() skips symbol invalidation
when conf_get_change() returns non-zero value.

        if (!conf_get_changed())
                sym_clear_all_valid();

I do not know why this if-conditional exists here...

Anyway, this patch fixes the issue.

Applied. Thanks.



> ---
>  scripts/kconfig/confdata.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 11f6c72c2eee..aa70360f27c1 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -1331,9 +1331,8 @@ void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
>
>         for_all_symbols(i, sym) {
>                 if (sym_get_type(sym) == S_TRISTATE &&
> -                   sym->def[S_DEF_USER].tri == old_val) {
> +                   sym->def[S_DEF_USER].tri == old_val)
>                         sym->def[S_DEF_USER].tri = new_val;
> -                       sym_add_change_count(1);
> -               }
>         }
> +       sym_clear_all_valid();
>  }
> --
> 2.11.0
>


-- 
Best Regards
Masahiro Yamada
