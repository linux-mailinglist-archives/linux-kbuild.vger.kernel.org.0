Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7FF318AFB
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 15:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfEINtq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 09:49:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44658 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfEINtq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 09:49:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id c5so3136630wrs.11;
        Thu, 09 May 2019 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=8aNzdQydgV0JN9gnkWZdb88bayQRUcesogfi+tTCa+o=;
        b=h2IuBIh9sVN4Qk734XE4pCs2s3fXTu5EznMO8OeK4fp5LkdDiCrCob9MVlz03u/5eR
         ns7aUv+WMwGkYI2Nby9sxPR9hTElKEbxCGT/yrmMdU+TkHYD+FJTfEtDFAn2lEfySWUl
         t635ENJ0TIf8eCvMr/26VMKjEdwCLXUEkiPS9mFRx0nP5n9oFDy9cyjJ6MZqyj6TWoib
         tvUJZbiqzAdDfMJcrUD4uadVIOCEk8BFByad2aYuGtDY1WeIqI3a66+TwJa7QVXZQPfn
         2CsGadYT2FOBf/Y692nKkz0T9IVQV7dxYGcBHhEx2Fm8KWn0yda7TYKIdtyTwh9lU7xl
         siMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=8aNzdQydgV0JN9gnkWZdb88bayQRUcesogfi+tTCa+o=;
        b=plL/KpBhctD/Dkf5g48i4scWjtOt+r4+p97692urZWGgJBdBK06tpaMOBKxDkHWVed
         GYlvnDg89LCv4lnHC1woYsYj+2/bP/VW/l2CeRFVFTVSfe8utAggE0AcLFxNHfWUvbUO
         3ZIEkoMReywj5GPI6NujTQln2Tc/edXSItoT8h9KawdL79owkAnZTpJv6KiYsuVuV1Ce
         TPino3u5YnU2tIyLEK+RCvuIWWoAGc84PCQ0w5P7GBqGEk+E2bp6vrnxE1EpzCudWABl
         ETiA32G+7+DhG1+ONYmgz5/1pFLh43AkZKIrDjrJ4x+PcBVdpV9jsK4mHNy4DT90ps2b
         n2AA==
X-Gm-Message-State: APjAAAXewaF9OfUdT4TI2RBe6tXLi9ADJecre4/ef3QUBFbUMv7iWV69
        ZtRo3ES4GsPp3c5MnQZ4csOkIeYXY8341ph+LoU=
X-Google-Smtp-Source: APXvYqxMO6zIdBnRmjRHXwSKDiGcHF9gWqucB+hpEEiKv/rwzlDTHfCZ0iKt4ucN2JYEyfTifAX//A/v4syk8eV/6+g=
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr3361338wrj.66.1557409784452;
 Thu, 09 May 2019 06:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
 <20190509114824.25866-1-natechancellor@gmail.com>
In-Reply-To: <20190509114824.25866-1-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 9 May 2019 15:49:32 +0200
Message-ID: <CA+icZUUN7cVXnkUv9DzYC7voys_CS=DJDm19EeYSWPyQwVdXVw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 1:49 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is no longer a valid option in clang, it was removed in 3.5, which
> we don't support.
>
> https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4
>

Cool.

Can you test with -mglobal-merge (inverted -mno-global-merge) which is
default for Clang?
I could build, link and boot with my llvm-toolchain (incl. lld-9) on x86-64.

Maybe this is also no more needed?

Thanks.

- Sedat -

> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Let me know if you want this incremental to your patch. I figured it
> made more sense to remove this then do the cc-option/cc-disable-warning
> removal because it will simplify the commit message.
>
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index d24f5a8009ee..e4788eb2c9b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -740,7 +740,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>  # See modpost pattern 2
>  KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> -KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
>  else
>
>  # These warnings generated too much noise in a regular build.
> --
> 2.21.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509114824.25866-1-natechancellor%40gmail.com.
> For more options, visit https://groups.google.com/d/optout.
