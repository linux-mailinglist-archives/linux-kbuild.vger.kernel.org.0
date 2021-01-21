Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372292FEFFA
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 17:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733045AbhAUQRC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 11:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732933AbhAUQQu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 11:16:50 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F311AC06174A;
        Thu, 21 Jan 2021 08:16:09 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id n2so5042572iom.7;
        Thu, 21 Jan 2021 08:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=a9iCtFUmnzGGIbS1P+ZeOeO6idkiYX7p0cUJy2173kY=;
        b=OFZX1TOcdb3B5ESJuTfEFaYcgQQFZhTMlfpW+5cR1QPoriPk6xfh65LivViF45KFlt
         cuJmm4cxwqAZAPp4+o1c6nSpiyjlM7YevO7kH6be4rfmtHkpRz2KjcpD3HTl7hwF9rcx
         zeeznGL7BWPwdZOV93Z3n25lO5i4uw+g4HG7+1HAYgHmr2vm/rw02cJROGEnMAKKvw8/
         DPEYDV6jGsSubdKDI0l8ajryDpj3O+Xw0GxMqhs/pZuxohx2A3iGsD0StOCdfsn1nbXh
         Muo7HXbUgdUYWxkMakDY8r8tiJkRcfs7ruXJ8vxSgswxAAUEDnFNiOGK1pqwyyaMfbS+
         9a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=a9iCtFUmnzGGIbS1P+ZeOeO6idkiYX7p0cUJy2173kY=;
        b=ATnY4wIlXoXuqgwBTS6CMun8ZlwI7sIsTZ/4uEa67883xizwanZh4xTqCjSLrR1s48
         Xcu42QA93bz0dfm+M1NEbrmBdaKq2MsMw+d8aKdhmsGqG2Atm5FPAOa5cSS43dsVXg1y
         Jc2uaubdjVEp8BbbXGowyO5T7f6qawv34H+EGr58u56B2rxZqpDkuQBaFO8wd/qV5J4p
         kc7CKuWhmvHokZYi0YEE/JPGRugihPudraDeQy0XKopNyXNbYMgk3+wXB8hWtTa4q6mZ
         hNFbPsXqrVtr0sETLTlsWwfzzmb+EJU0h2Zim9StWPAJMlZUsXgA4RSjyIPCJiUr8kKj
         vYXw==
X-Gm-Message-State: AOAM530op7Z9MCumTqQ5nVAlB1O5ohLlQ8urIe5DViLYu+gUA9VFLUJm
        Xsq7dzDzqr1QUmfw/VxvvhUW7EAM224kWKhOh5k=
X-Google-Smtp-Source: ABdhPJxyLc9l8AVtlxAb6nsWuOiEnw6L7M5mXAyncFsZ/zt0B7N8wO5wtZTjo1TSsU1szNOMouVOiysde20YA91Lqlw=
X-Received: by 2002:a5e:9b06:: with SMTP id j6mr138100iok.171.1611245769353;
 Thu, 21 Jan 2021 08:16:09 -0800 (PST)
MIME-Version: 1.0
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 21 Jan 2021 17:15:56 +0100
Message-ID: <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 5:01 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> Kconfig") removed ./scripts/clang-version.sh and moved its content to
> ./scripts/cc-version.sh.
>
> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches    F:    scripts/clang-version.sh
>
> The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> changes in ./scripts/clang-version.sh; as the file is removed, track
> changes in ./scripts/cc-version.sh instead now.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Good catch, Lukas.

As a tipp:
Next time you can pass '--subject-prefix="PATCH next-YYYYMMDD"' when
doing 'git format-patch ...' (or whatever you use to generate the
patch).

Cannot say if we can add a "Fixes:" tag with commit hash-id of
"kbuild: check the minimum compiler version in Kconfig" - this missed
that move.
Maybe Masahiro does a respin and can fold this into above commit?
That's not my decision.

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=for-next&id=6c8ad4427f6ea306a1eee951d684a41f517b5986



> ---
> applies cleanly on next-20210121
>
> Masahiro-san, please pick this quick fix-up patch.
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e5d7cf38ec82..aafbea806a82 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4355,8 +4355,8 @@ B:        https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
>  F:     include/linux/compiler-clang.h
> +F:     scripts/cc-version.sh
>  F:     scripts/clang-tools/
> -F:     scripts/clang-version.sh
>  F:     scripts/lld-version.sh
>  K:     \b(?i:clang|llvm)\b
>
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210121160115.4676-1-lukas.bulwahn%40gmail.com.
