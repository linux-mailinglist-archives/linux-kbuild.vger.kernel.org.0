Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5163E5038
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Aug 2021 02:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbhHJAG4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Aug 2021 20:06:56 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64272 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhHJAGz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Aug 2021 20:06:55 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 17A06GrM027165;
        Tue, 10 Aug 2021 09:06:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 17A06GrM027165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628553977;
        bh=xHNISeRMlTiEcgni+JyLJx7pYa/VEYClQ3P0qFmQuz8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iFsLPq8Wac7JCZvN6O8cXOq74M4UKNp7aYvSGvN/Or69nTwQtLoFI0PZJp1lhOEm6
         3EPytVbPWGQtdoIyDS6WqQOSg4+wPOCfQeatCpVyPxap+ABf0Sp2t1ctrTuexCu38n
         lbjFQqBGQLwXvRwfXrV6Zh0cEDZgXTnFoXF7gzmzSU8nxl+mndfYXJI05ACLil7Lss
         XzPOHP2pHurtB+ly5Wz5453JXJlVcIm5zYue/JSthFnG73l6mZa/x4zrTKnGMTaR4v
         /aCL3/UNqZW3Xk/5WC/QRwvd5oYeB8FYj1t5fgLGrRpFhKkTlrUn9VUV1wvMInpa6l
         VGZu06woRWJWw==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso1321612pjb.1;
        Mon, 09 Aug 2021 17:06:16 -0700 (PDT)
X-Gm-Message-State: AOAM532hZe9C1Gr0Ztm/FThXyLjei+qqIL6eHGMXIUOMgpeN7jNNBn5i
        tqqFzNk82eBqAMBHwtsvG64AL8PKbacfYcbRITI=
X-Google-Smtp-Source: ABdhPJwCCUVvtcdYhxxkbN22dZbAQ1dVfkUUOwJIXgxGyQquPxQC+2RFV8n/Phq1rJho4mk94aueK+S6LfbtMXdFoYs=
X-Received: by 2002:aa7:8e56:0:b029:3cd:c2ec:6c1c with SMTP id
 d22-20020aa78e560000b02903cdc2ec6c1cmr1422755pfr.80.1628553976079; Mon, 09
 Aug 2021 17:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
In-Reply-To: <20210802183910.1802120-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 10 Aug 2021 09:05:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQqVNpDkcj4ziyT_nimNHdusp862-t2y068SUtHr2xfaw@mail.gmail.com>
Message-ID: <CAK7LNAQqVNpDkcj4ziyT_nimNHdusp862-t2y068SUtHr2xfaw@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] infer --target from SRCARCH for CC=clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 3, 2021 at 3:39 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given ARCH.
>
> Instead, let's infer --target from SRCARCH, and move some flag handling into a
> new file included from the top level Makefile.


Series, applied to linux-kbuild.
Thanks.



> Changes v5 -> v6:
> * Use indirection as per Linus.
> * Change hexagon triple to use -musl rather than -gnu. glibc doesn't
>   have support for hexagon, and hexagon-linux-musl is the triple we use
>   in CI.
>   https://github.com/ClangBuiltLinux/continuous-integration2/blob/d659897d1700894d67feb64fe28e298da399a287/generator.yml#L53
> * Pick up Fangrui's RB.
> * Reorder use of Env vars in documentation to use command line
>   parameters instead, for consistency.
>
> Changes v4 -> v5:
> * Include previously missing first patch!
>
> Changes v3 -> v4:
> * Remove the requirement that LLVM_IAS=1 be set, as per Masahiro.
> * Remove the Documentation/ change from patch 2, as per Masahiro and
>   Nathan.
> * Add Documentation/ change as patch 3, from Masahiro.
> * Reword commit message of patch 2, as per Nathan.
> * Change patch 2 oneline to refer to --target and CC=clang (not
>   CROSS_COMPILE).
> * Carry Arnd's and Nathan's AB/RB/TB tags, confirmed ok on IRC+discord.
>
> Changes v2 -> v3:
> * Remove requirement that LLVM=1 be set. Instead, if building with just
>   CC=clang LLVM_IAS=1 instead of LLVM=1 LLVM_IAS=1, you should use
>   LD=ld.lld explicitly, or LD=aarch64-linux-gnu-ld. (As per Masahiro)
>   Example:
>
>   $ ARCH=arm64 make CC=clang LLVM_IAS=1 LD=ld.lld OBJCOPY=llvm-objcopy \
>     STRIP=llvm-strip -j72 defconfig all
>
>   (It's still preferable to use LLVM=1 IMO, but this is maximally
>   flexible.)
> * Change oneliner from LLVM=1 to CC=clang.
> * Update Docs slightly.
>
> Changes v1 -> v2:
> * patch 1/2 untouched.
> * Fix typos in commit message as per Geert and Masahiro.
> * Use SRCARCH instead of ARCH, simplifying x86 handling, as per
>   Masahiro. Add his sugguested by tag.
> * change commit oneline from 'drop' to 'infer.'
> * Add detail about explicit host --target and relationship of ARCH to
>   SRCARCH, as per Masahiro.
>
> Nick Desaulniers (3):
>   Makefile: move initial clang flag handling into scripts/Makefile.clang
>   Makefile: infer --target from ARCH for CC=clang
>   Documentation/llvm: update CROSS_COMPILE inferencing
>
>  Documentation/kbuild/llvm.rst | 19 ++++++++++++++++++-
>  MAINTAINERS                   |  1 +
>  Makefile                      | 15 +--------------
>  scripts/Makefile.clang        | 35 +++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+), 15 deletions(-)
>  create mode 100644 scripts/Makefile.clang
>
>
> base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
> --
> 2.32.0.554.ge1b32706d8-goog
>


-- 
Best Regards
Masahiro Yamada
