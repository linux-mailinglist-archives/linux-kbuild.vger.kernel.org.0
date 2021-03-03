Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A364032C3B5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhCCX7h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 18:59:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388060AbhCCUsV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 15:48:21 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E592C06175F
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Mar 2021 12:47:41 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id r25so29499669ljk.11
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 12:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24KhvMDb+89hqpiv9wi+VawtF0GyMftFsFrma/aYUMs=;
        b=Zl/HI38KDrtJilTvcl7lr2IPBWLLsYYRmjGn0HjrQDShjMtfufPPc0aNfKypd3tsCB
         MwUl4k7OuvxKG7NRUAkkcAnqIXp11ShogUgX5SA75DOfZ2x2yqQWznNGVxTngeBgF4+9
         VM/KudWxxk5YLDV4xswMOM0fAPOizLrsuAq4jpCGVqsHCBKw8C/fVUCRg7zwxg5NJA9I
         10h0s9BjMo33yEUC+7u0+VoKHm7tegIGzJpxAkdaNqU5f87h5Adk+mclH6qw9EXScMFN
         qzavxTNjK5Zj3PY0Hsd8CVvncz3eW8LUwqDnh+6iqQZeet898rSFp813lLN3MBoOi3Wg
         +MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24KhvMDb+89hqpiv9wi+VawtF0GyMftFsFrma/aYUMs=;
        b=G9RnLcTVdcHmbt8/SrdL1PGpsSBnNFtPhN2G5gwnwbIuvReF5s+xtmwrHPYlA7EUKF
         g+gv/PGx24Sl2VYc/RsBUnIRmOB3n50NIKocsgSV69LI2A0v2AbNRUNvg/oxWFSc9ij4
         17vTeQZ6HG4NPyrjemYW5gOFAaRzol+ds1mrvPD1BLcbyOSRgxtszPwK1j1MOrv+4Vew
         kj9hwkVN+1QDgwvb6InrI/6aLMahT9Jq68huRyEj1N36vKX2uLei7ciWiDo6TB5kxA1R
         1fLzka2l/MYTW5a4xVOHrU804U4a+vSfSPwcaiL7GgnTlxr8eI1ClaNEN7D6fBgCcRkR
         sSsA==
X-Gm-Message-State: AOAM533ca9JbW7iLQb3CF2pFjQjnah7trQuqaZ2bDY16zuzJOb7Q9xdJ
        nLH+P/5wtsKm/qM4hKRK9b4VgTaBgdzzReLjc7i0cg==
X-Google-Smtp-Source: ABdhPJxUmbxkkFZEVJfN4risvm7ty621iogBEJK4xDuAzpBtw9T3FMlhTvd/n1j8jnPB6FV9BAAWk7topgvKtb5q7qg=
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr427625ljh.244.1614804459313;
 Wed, 03 Mar 2021 12:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org>
In-Reply-To: <20210303183333.46543-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 3 Mar 2021 12:47:27 -0800
Message-ID: <CAKwvOdkhZGv_q9vgDdYY44OrbzmMD_E+GL3SyOk-jQ0kdXtMzg@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: remove LLVM=1 test from HAS_LTO_CLANG
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+ Sami

On Wed, Mar 3, 2021 at 10:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This guarding is wrong. As Documentation/kbuild/llvm.rst notes, LLVM=1
> switches the default of tools, but you can still override CC, LD, etc.
> individually.
>
> BTW, LLVM is not 1/0 flag. If LLVM is not passed in, it is empty.

Do we have the same problem with LLVM_IAS?  LGTM otherwise, but wanted
to check that before signing off.

(Also, the rest of the patches in this series seem more related to
DWARFv5 cleanups; this patch seems orthogonal while those are a
visible progression).

>
> Non-zero return code is all treated as failure anyway.
>
> So, $(success,test $(LLVM) -eq 1) and $(success,test "$(LLVM)" = 1)
> works equivalently in the sense that both are expanded to 'n' if LLVM
> is not given. The difference is that the former internally fails due
> to syntax error.
>
>   $ test ${LLVM} -eq 1
>   bash: test: -eq: unary operator expected
>   $ echo $?
>   2
>
>   $ test "${LLVM}" -eq 1
>   bash: test: : integer expression expected
>   $ echo $?
>   2
>
>   $ test "${LLVM}" = 1
>   echo $?
>   1
>
>   $ test -n "${LLVM}"
>   $ echo $?
>   1
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 2bb30673d8e6..2af10ebe5ed0 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -632,7 +632,6 @@ config HAS_LTO_CLANG
>         def_bool y
>         # Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
>         depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
> -       depends on $(success,test $(LLVM) -eq 1)

IIRC, we needed some other LLVM utilities like llvm-nm and llvm-ar,
which are checked below. So I guess we can still support CC=clang
AR=llvm-ar NM=llvm-nm, and this check is redundant.

>         depends on $(success,test $(LLVM_IAS) -eq 1)
>         depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> --
> 2.27.0
>


--
Thanks,
~Nick Desaulniers
