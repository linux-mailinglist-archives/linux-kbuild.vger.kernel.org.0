Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52EFA254CFE
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Aug 2020 20:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgH0SZs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Aug 2020 14:25:48 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44002 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgH0SZr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Aug 2020 14:25:47 -0400
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07RIPRPs027703;
        Fri, 28 Aug 2020 03:25:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07RIPRPs027703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598552727;
        bh=L2QfmaAwnwA4hoiO89ZgINUlMqkWy7n6tRHAxYPu1fM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xTkHOyq3cJ/fnKhHkO8g7qNjDOSj4XPlmL9h6hkeGTAuI+SLcarBbvGKtE4Isr5Vo
         rA59oYNmG45/0ghyRaMpaWDpx9nbIpnRFY8AWzeE0OqMEKJEqafMvlwnJlMn3ZPtgf
         7WXDAT23cchRglpI4KH51wo3rMWDGkDOR2iuL2TJTuGT83WyfeCBK/pTvt/89+WgQL
         gJbx4Z8htIEPzT6jQJ4YUBHUY/rhhOqgca9lEACCik908Ds1JBYz7c0Ty/WYEIB/Rg
         406rynBnQbqGt+BMm32FTCXZF0WFYFN8PJUEI9gmC6q/oOwmMrrqsFd1Tn6j9lNSfp
         Tg44+Sg/0Jexg==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id 17so4146073pfw.9;
        Thu, 27 Aug 2020 11:25:27 -0700 (PDT)
X-Gm-Message-State: AOAM530jSBs3bHQQJTv9zodt62iLJEfNgcF33BgJEmOBHV21eZ+cXCJG
        GYTew5i/NwbC7/1ggnoChVujz4Azlq3VCxr7tUk=
X-Google-Smtp-Source: ABdhPJweNgFBGUD7xENRLq6vkx3u8aXYAxv8Zh27iS33Ltucpdk986dIvAZ2MdzkT2akYEO8uOhq0eHYJl8S8d3ojwo=
X-Received: by 2002:a63:e018:: with SMTP id e24mr15142537pgh.175.1598552726619;
 Thu, 27 Aug 2020 11:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200826191555.3350406-1-ndesaulniers@google.com>
In-Reply-To: <20200826191555.3350406-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Aug 2020 03:24:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqUV48aNW2NGN7gz_oMo_3kZ+mbbiq2nGsfnQR=oEHAg@mail.gmail.com>
Message-ID: <CAK7LNATqUV48aNW2NGN7gz_oMo_3kZ+mbbiq2nGsfnQR=oEHAg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: add minimum clang/llvm version
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 27, 2020 at 4:16 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Based on a vote at the LLVM BoF at Plumbers 2020, we decided to start
> small, supporting just one formal upstream release of LLVM for now.
>
> We can probably widen the support window of supported versions over
> time.  Also, note that LLVM's release process is different than GCC's.
> GCC tends to have 1 major release per year while releasing minor updates
> to the past 3 major versions.  LLVM tends to support one major release
> and one minor release every six months.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * fix typo, as per Will.
> * add link to getting LLVM, as per Nathan.
> * collect tags.
>
>  Documentation/kbuild/llvm.rst     |  4 ++++
>  Documentation/process/changes.rst | 15 +++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 2aac50b97921..3f10a9c47551 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -1,3 +1,5 @@
> +.. _kbuild_llvm:
> +
>  ==============================
>  Building Linux with Clang/LLVM
>  ==============================
> @@ -73,6 +75,8 @@ Getting Help
>  - `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
>  - `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
>
> +.. _getting_llvm:
> +
>  Getting LLVM
>  -------------
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index ee741763a3fc..dac17711dc11 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -30,6 +30,7 @@ you probably needn't concern yourself with pcmciautils.
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================
>  GNU C                  4.9              gcc --version
> +Clang/LLVM (optional)  10.0.1           clang --version


Just playing a nitpick:
Supporting Clang makes GCC optional, so now
"GNU C (optional)"

:-)


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


--
Best Regards
Masahiro Yamada
