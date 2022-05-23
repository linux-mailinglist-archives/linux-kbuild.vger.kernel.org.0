Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B75531D4F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 May 2022 23:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiEWVEU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 May 2022 17:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiEWVET (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 May 2022 17:04:19 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB196C0CF
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2022 14:04:17 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u30so27623665lfm.9
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2022 14:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOT6/IEEvL647FHmiCg7MRICtIFsZAtUMIfvYbPx3SA=;
        b=TB/AO84lC0LITUBGehrw8rhOuiDSejBSA9Qz+lEc73w+ju8dHPmXn5PMLWT3SRdJrU
         suS0JTx8GWUPOYH/AS5OeqGcjMJNPJXACAtcFXCFsCXYe6Wbnv4pDhnB44c73UUzHCQ0
         PeCR2iNZ4GvbK+YZKJ3VW+i/zlDerIASKR9O3+qm/zq5vRzAmqvEVuPlRypYI/469BWA
         EN03DN0SpFnK9+5MrULChGKPma7zq6vsVSYZroWCVM3zKA5Mx1xJRPnT8a7cmvOAag+4
         ZdTyJdVFRW+/HnPRZy9TJdVxANnzklWvZyv8mPVgMxt+deT1r5U3HKxECduTDfkAer/M
         Q71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOT6/IEEvL647FHmiCg7MRICtIFsZAtUMIfvYbPx3SA=;
        b=qCMqd5+5Os+EOYoQmCqn/0uiTZN9FqAKS/wJLei6JcwiK+FQTjobraaMGmFyXL0ic2
         DR+fg3uBMcD/2dEDNyVOofBurzeXuTCKlDqHHGHByq9nosWZ+uWZ4MhkZJFWJsjzY94k
         l/f3nxuwnhO6cf+kJSmlKXfjCiAmCnRB7Dp3ZwhcKfJP31Ot2w9OM8StBpwh6vvhIKVz
         cnsnWd+pF3r6aJkYIzNNpp2nrCf3sd6FnNR3Ce5O9B6XNBsVPgnkGPRXq6dfleHJRgvf
         R6d6L1RLtvEqyr97bQ918ntSXY4zJjU8Wu4bta+wGxpYd4G+Xrzyw+DZCzzPAF4XpNb6
         5dXA==
X-Gm-Message-State: AOAM5328yW8csnXgOZuYkfT5dcYBlylmg8gALhZt5gg2KtgCJwGShp+C
        lgGB6N9vXYw8NxDMsU9HTeuosJ7SqRYN526JIAE0xQ==
X-Google-Smtp-Source: ABdhPJwiiG4XoO6s8TxJDH+8amPPG6CcR3JcQv0U+ZDwF04t01N4pXb7x0yQtfESBBKBxKqDAER8pmvL0qGIg+evkxM=
X-Received: by 2002:a05:6512:48e:b0:477:c024:1a1c with SMTP id
 v14-20020a056512048e00b00477c0241a1cmr17906274lfq.100.1653339855792; Mon, 23
 May 2022 14:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220522160117.599023-1-masahiroy@kernel.org>
In-Reply-To: <20220522160117.599023-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 23 May 2022 14:04:04 -0700
Message-ID: <CAKwvOdnTFvDKDr_tr5digM1HguSQw65Eq+TT=mhr_AUcVGVLpQ@mail.gmail.com>
Subject: Re: [PATCH] fixup! kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, llvm@lists.linux.dev,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, May 22, 2022 at 9:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I will squash this into
>
>   https://patchwork.kernel.org/project/linux-kbuild/patch/20220513113930.10488-3-masahiroy@kernel.org/
>
> Sedat Reported an error:
>
>   https://lore.kernel.org/linux-kbuild/CA+icZUWttwjhDNPO1VuVyiMoReH5e83nsYDd0rEoY8-Uwv6pHw@mail.gmail.com/T/#md82f561e348b7959b7270c33ac86fa3edb0d773a
>
> __used is needed to make the combination of
> CONFIG_MODVERSIONS and CONFIG_LTO_CLANG working.

Yep, vaguely reminiscent of
commit f3751ad0116f ("tracepoint: Mark __tracepoint_string's __used")

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  include/linux/export-internal.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
> index 77175d561058..c2b1d4fd5987 100644
> --- a/include/linux/export-internal.h
> +++ b/include/linux/export-internal.h
> @@ -10,7 +10,8 @@
>  #include <linux/compiler.h>
>  #include <linux/types.h>
>
> +/* __used is needed to keep __crc_* for LTO */
>  #define SYMBOL_CRC(sym, crc, sec)   \
> -       u32 __section("___kcrctab" sec "+" #sym) __crc_##sym = crc
> +       u32 __section("___kcrctab" sec "+" #sym) __used __crc_##sym = crc
>
>  #endif /* __LINUX_EXPORT_INTERNAL_H__ */
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
