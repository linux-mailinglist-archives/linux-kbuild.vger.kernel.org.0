Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66E670FE48
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 May 2023 21:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbjEXTKx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 May 2023 15:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234365AbjEXTKn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 May 2023 15:10:43 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5151419C
        for <linux-kbuild@vger.kernel.org>; Wed, 24 May 2023 12:10:41 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-623802d9bfdso839906d6.2
        for <linux-kbuild@vger.kernel.org>; Wed, 24 May 2023 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684955440; x=1687547440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h81XEzBPwR4bI9NqqVxiHNHCxTZ8a1gTVYdXg+UM5xQ=;
        b=BCkFJNEfqgC5o4MydkQjO1+VvUNTJJxl/2jIOyYf3Q031h+Jh/cKOcO4HR1pCebfEU
         XqOr+bjRo4im00dAadyUH54RrVp3c76JL2bj2MME1R4FLTIvYT5Bhlp30AWmGVfECOHt
         /9WZbU2YlqPbW9fAq1duV5Ho4uVvRKeGXfKsZ7mpjUJ1e1VAwCCzOBMmNlJevsaxrwVn
         LC5HiTiC/yu/oFTpdddUnMxd1Xahz8yUKj0OYw+ySZkCP5RhMVWYfH0y4Ikrqdj4NYhj
         fnJd7JzdWHY9Uty+/+fFX6Cj7Dj7kez55LA8qXBUeLTeAiWIaW8sGsXI+ADdBBniPjDP
         0sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684955440; x=1687547440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h81XEzBPwR4bI9NqqVxiHNHCxTZ8a1gTVYdXg+UM5xQ=;
        b=L3b04H2+VOuw1Up+16GFa/K6GH6vtu+4jsnq426tq+4DBV6ndsH10kWhhozsFBjxro
         +wOqTzwsppKZvmbhq4ZHL/bfcJWoptfBsxtHUONDaTnSbOuOgUqHN8VooRlZsa1yogac
         ru9xW99vaq8GQkcrHMP6+nXsyLIeRK4WiXoOviDrNDXSHUVKBiBZQV1/algtTLfjVYNO
         4USmUjMjT6JYKU5a9BRFh0AYeDlwf7pxYenbb0fTMi95omZOC14nVizQDnBXBYVy3wxu
         2g3YKKJMNZqf8mt+baZH7ADsT20kjkgroTwFtUH4WsNW4iOZ2SWO0Qb+siZhzC3uTlFr
         nRCg==
X-Gm-Message-State: AC+VfDx49efc015wKhxDZv7gHfs8lCyADJejSzghj1e9wWB/EHy6ugIC
        houk+gIY/e8TBx0VDzxUMT5+C7cxRkGt4DU560JSfkkVbZpLkU9uza27ig==
X-Google-Smtp-Source: ACHHUZ4PZykgO+qAt/GfVYRFXAXR9glmVwU0iD12ZrZiZ030lBrpghOBZTNusAA1GBGj9IHhm9gGjwRb0C2xhmLxQWg=
X-Received: by 2002:ad4:5f0b:0:b0:625:88f5:7c5f with SMTP id
 fo11-20020ad45f0b000000b0062588f57c5fmr14530999qvb.31.1684955440288; Wed, 24
 May 2023 12:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 24 May 2023 12:10:29 -0700
Message-ID: <CAKwvOdm6diEmc+utBNxQ4ftx3Ai2SD8q32TxRgeZ-rpGoL2Bjg@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: include targets not end with .o
To:     Hu Weiwen <huww98@outlook.com>
Cc:     llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, Hu Weiwen <sehuww@mail.scut.edu.cn>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 14, 2023 at 3:19=E2=80=AFAM Hu Weiwen <huww98@outlook.com> wrot=
e:
>
> From: Hu Weiwen <sehuww@mail.scut.edu.cn>

Hi Hu,
Sorry, for the delay. I'm usually faster to respond to patches. It was
my mistake this fell through the cracks, and thank you for the patch.

I received this email from <huww98@outlook.com>. Do you mind resending
with your signed off by tag set to the email address from which you
are sending patches?  This patch looks benign to me, but it makes me a
little uneasy when author !=3D sender.

Please also cc
- Masahiro Yamada <masahiroy@kernel.org>
- linux-kbuild@vger.kernel.org

As this would go in via the kbuild tree.

>
> Currently, we only extract commands for targets end with '.o'. But we

s/end/ending/


With this patch applies\d, I get the same word count for
compile_commands.json when running:
$ make LLVM=3D1 -j128 defconfig compile_commands.json

on my x86_64 host. Is that expected?  Is there a specific arch or set
of configs for which such .c files produce executables directly?

> also have many standalone executables built in-tree.
>
> Remove this restriction. And to avoid some false matching, exclude
> targets end with '.c' or '.h' when directly walking the directory.
>
> Signed-off-by: Hu Weiwen <sehuww@mail.scut.edu.cn>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 15ba56527acd..6e88c7e166fc 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -18,8 +18,8 @@ import sys
>  _DEFAULT_OUTPUT =3D 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL =3D 'WARNING'
>
> -_FILENAME_PATTERN =3D r'^\..*\.cmd$'
> -_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.c) *(;|$)'
> +_FILENAME_PATTERN =3D r'^\..*(?<!\.(c|h))\.cmd$'
> +_LINE_PATTERN =3D r'^savedcmd_[^ ]* :=3D (.* )([^ ]*\.c) *(;|$)'
>  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces .cm=
d
>  # files in a different format. Do not support it.
> --
> 2.25.1
>
>


--=20
Thanks,
~Nick Desaulniers
