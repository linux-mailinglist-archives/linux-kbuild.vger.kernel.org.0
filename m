Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9DD52083B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 May 2022 01:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbiEIXRp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 May 2022 19:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiEIXRo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 May 2022 19:17:44 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A212A3BF3
        for <linux-kbuild@vger.kernel.org>; Mon,  9 May 2022 16:13:48 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2ec42eae76bso161588127b3.10
        for <linux-kbuild@vger.kernel.org>; Mon, 09 May 2022 16:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oazinpgomaqUG0jSYMm8ubizFPTzpD9YluLXTH1Uf+8=;
        b=f6fWCk6p41OZaY/aYptJIOS/H7gQoR2LQU/vFrk5Gn4NSNwuGdiZDiDStk7AbG3yZD
         IKBXb4w884/50UAgGFMYKZ1TW7UWPSrJsR6aU/0xVkQloWI1gv9dqJSDbnU+7ZRlaq+H
         5q6FzLE9Jch5W51SjYRwMzmvNSaAVh59pmK1la7G6Ce7QS8+phGNXM1poUTxBJEghkkL
         rkNzGIHiR6cg7h2j0E68I08LETn6PDCH3Bk2j2CtnK3mFxMH+qkZYlQ5Mbk0pgP96vbx
         k86u84TYrd/iZlrt9edUpHqGeZQt6sH9DbxxljCpeCMl8DqbX8Q9LTMC9vVENf9lnOH2
         8xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oazinpgomaqUG0jSYMm8ubizFPTzpD9YluLXTH1Uf+8=;
        b=jod83FUXlth0B3bwfrAJwqnCvHwzpHp76Z/tdeGTYorqociwv5Yq0UypoRr43gaRPa
         /GlR/L5Ewl/EMrpkTWkS8wZdFOKqQxf7MOCZBtOY/w3MZbZCKodWb/ZwdzclvZEA/pUP
         Qw8nk5556QzGzB8kMMQOdGe+FC6qpemEg3qnYgrOa1OX7KHlhxFxdRyr0szoSdg54Asa
         8o2G8Cjg77H6upJuTj6s0+S4dcIjt+r4Pc8CAHoKsMNYMBr9t/ftKmKYKdmIW66yd/Ts
         LN666Qi4WcvDpsC6AZeeB4Po2grlPv2x0/Wdzfww9SQ/wUqQ+hwFmiL37GBtYnMwuMLG
         YuhA==
X-Gm-Message-State: AOAM531MnjyC3JARQO6+Kmy8t3N2zAF/JsgdfsqHehC2hLH77z6uoGFy
        gGceo0WvwdgTvNSH3btGAv3Hf1oFX5G6pD5rdNWKgw==
X-Google-Smtp-Source: ABdhPJxssHqsbnbsTj81I2dSgjtFlZace94GadSqyvpd5jqz1pk64Y4lHyhr+1TXl7QDxSK2F5OuNrrpLo+K4Kc2AN8=
X-Received: by 2002:a81:1108:0:b0:2f7:bf11:3fb9 with SMTP id
 8-20020a811108000000b002f7bf113fb9mr17011668ywr.305.1652138027673; Mon, 09
 May 2022 16:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-10-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-10-masahiroy@kernel.org>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 9 May 2022 16:13:11 -0700
Message-ID: <CABCJKudnbTS=_2WgX63xb_3oCwt_6jwotqfoV5wSjkmfjuUJZQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] kbuild: do not create *.prelink.o for Clang LTO
 or IBT
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When CONFIG_LTO_CLANG=y, additional intermediate *.prelink.o is created
> for each module. Also, objtool is postponed until LLVM bitcode is
> converted to ELF.
>
> CONFIG_X86_KERNEL_IBT works in a similar way to postpone objtool until
> objects are merged together.
>
> This commit stops generating *.prelink.o, so the build flow will look
> the same with/without LTO.
>
> The following figures show how the LTO build currently works, and
> how this commit is changing it.
>
> Current build flow
> ==================
>
>  [1] single-object module
>
>                                       $(LD)
>            $(CC)                     +objtool              $(LD)
>     foo.c --------------------> foo.o -----> foo.prelink.o -----> foo.ko
>                            (LLVM bitcode)        (ELF)       |
>                                                              |
>                                                  foo.mod.o --/
>
>  [2] multi-object module
>                                       $(LD)
>            $(CC)         $(AR)       +objtool               $(LD)
>     foo1.c -----> foo1.o -----> foo.o -----> foo.prelink.o -----> foo.ko
>                            |  (archive)          (ELF)       |
>     foo2.c -----> foo2.o --/                                 |
>                 (LLVM bitcode)                   foo.mod.o --/
>
>   One confusion is foo.o in multi-object module is an archive despite of
>   its suffix.
>
> New build flow
> ==============
>
>  [1] single-object module
>
>   Since there is only one object, we do not need to have the LLVM
>   bitcode stage. Use $(CC)+$(LD) to generate an ELF object in one
>   build rule. When LTO is disabled, $(LD) is unneeded because $(CC)
>   produces an ELF object.
>
>            $(CC)+$(LD)+objtool             $(LD)
>     foo.c ------------------------> foo.o -------> foo.ko
>                                     (ELF)    |
>                                              |
>                                  foo.mod.o --/
>
>  [2] multi-object module
>
>   Previously, $(AR) was used to combine LLVM bitcode into an archive,
>   but there was no technical reason to do so.
>   This commit just uses $(LD) to combine and convert them into a single
>   ELF object.
>
>                             $(LD)
>             $(CC)          +objtool        $(LD)
>     foo1.c -------> foo1.o -------> foo.o -------> foo.ko
>                               |     (ELF)    |
>     foo2.c -------> foo2.o ---/              |
>                 (LLVM bitcode)   foo.mod.o --/
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Looks good, thanks for cleaning this up!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
