Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4B212288A
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 11:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfLQKVv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 05:21:51 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32844 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfLQKVu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 05:21:50 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id xBHALS5P006121;
        Tue, 17 Dec 2019 19:21:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xBHALS5P006121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576578089;
        bh=9AVqNVwy4Es+S+p9hplMl9r61nXCqDt523hIMebfq1E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PMre/qKj+ZWusxltuueMOpTZepF6gb1u+weP808yPVRoVqkca8Ks6SlPWPc9yVRsk
         haiO+lk8oWtVn2a50Nr35iZ6dkl/ZLD1S0kq38Y8bgVxymmXGeCMilPVq2xYYkXj2h
         Zm70dz59eotJ9KxcPN1C9dlO+1NZo0PJm8vQeadj0idIhbkRjjVlNVr9557zvAmI4f
         C6Du1TtjIT6OekkzGMoSRQDSYs+jKXqjiR1/9HDwWMWSXgN5a3qYMV6+lJbUGuqq5C
         GXrkrO24084iKVB6A2KNUx4Lg2K8tgKuz6mp2DoKvcM828wkW0S7ob3d7JWNGNFekH
         hDT8We5RndWlg==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id i78so2519202vke.0;
        Tue, 17 Dec 2019 02:21:29 -0800 (PST)
X-Gm-Message-State: APjAAAUjfomv3ShL3R0Yqcd4lhH6Ke0ZUPFd0Uo+pAc0K/wuTfQNEg5u
        vC7BBXeuRWi/ptJzbnWmjd4NQ6/bdZVi3QI6J7Y=
X-Google-Smtp-Source: APXvYqyxhqLd0jmKjhPYPvFRleqdFANg0jNp9RGDF9A7B/pR95Q24+2OcgrbTiaFQ/ECYIxy5NqaPG3ZUBLwu1u0NN0=
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr2708835vkc.12.1576578088101;
 Tue, 17 Dec 2019 02:21:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575879069.git.tommyhebb@gmail.com> <2f42719235f9250ed10209982543f99f4fd41d61.1575879069.git.tommyhebb@gmail.com>
In-Reply-To: <2f42719235f9250ed10209982543f99f4fd41d61.1575879069.git.tommyhebb@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Dec 2019 19:20:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8+y8HD9Kui-nVXL=fHkTeUVnEqDrTtLniWZBULFvu2A@mail.gmail.com>
Message-ID: <CAK7LNAT8+y8HD9Kui-nVXL=fHkTeUVnEqDrTtLniWZBULFvu2A@mail.gmail.com>
Subject: Re: [PATCH 2/4] kconfig: don't crash on NULL expressions in expr_eq()
To:     Thomas Hebb <tommyhebb@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 9, 2019 at 5:19 PM Thomas Hebb <tommyhebb@gmail.com> wrote:
>
> NULL expressions are taken to always be true, as implemented by the
> expr_is_yes() macro and by several other functions in expr.c. As such,
> they ought to be valid inputs to expr_eq(), which compares two
> expressions.
>
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> ---

I applied this patch.
I fixed up the block comment style. Thanks.


diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 8284444cc3fa..9f1de58e9f0c 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -254,8 +254,10 @@ static int expr_eq(struct expr *e1, struct expr *e2)
 {
        int res, old_count;

-       /* A NULL expr is taken to be yes, but there's also a different way to
-        * represent yes. expr_is_yes() checks for either representation. */
+       /*
+        * A NULL expr is taken to be yes, but there's also a different way to
+        * represent yes. expr_is_yes() checks for either representation.
+        */
        if (!e1 || !e2)
                return expr_is_yes(e1) && expr_is_yes(e2);





>  scripts/kconfig/expr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 77ffff3a053c..8284444cc3fa 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -254,6 +254,11 @@ static int expr_eq(struct expr *e1, struct expr *e2)
>  {
>         int res, old_count;
>
> +       /* A NULL expr is taken to be yes, but there's also a different way to
> +        * represent yes. expr_is_yes() checks for either representation. */
> +       if (!e1 || !e2)
> +               return expr_is_yes(e1) && expr_is_yes(e2);
> +
>         if (e1->type != e2->type)
>                 return 0;
>         switch (e1->type) {
> --
> 2.24.0
>


-- 
Best Regards
Masahiro Yamada
