Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1DF7112E1
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 19:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbjEYRxG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 13:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjEYRxF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 13:53:05 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B0B97
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 10:53:04 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-62576fa52b4so196146d6.0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685037183; x=1687629183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdra5C26nmtDmbzfhsM6rsW7kbk3HhU5ZzpoiqFVz8s=;
        b=w7hPwYO2CnizHI6SW0dJYSPpTISVmg+j9Ov661VPQR+oFjFxWBozvgP7KQi4U9soUA
         BjVZxUuBuT9C+no73livcBJoR3Q7TFdN3XGcIbWEZrw0a6ChLEsagL/ziA1ZSB6FrDkg
         AEQcKXQ+MFal57d6QZkizu/w+AYRZ+z70vjQx3FwlZA9oT/D6zx1V251J/rJxsBMmDy3
         Z5sO92H6R/UTSq6vZwaLsYktCHCBEjkTZpNIrPk+hwCnYpz7x+daoE5FwwKkiiNNk+Zn
         ZSOwdM9caAO36XEpKoTx8xUWw18ZPH1cZ1PRSYTa9SSJ5F839qALqD74Rif+m0B+Cozt
         ALOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685037183; x=1687629183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdra5C26nmtDmbzfhsM6rsW7kbk3HhU5ZzpoiqFVz8s=;
        b=AM+4xpwRmqYLvjsBVlT8k3aGR2PjDcohCuRBH4wD/dEYkhaGGMgRrudlxJP7dO8vyL
         uaFQo8gyGS/aAk3PZdAdYlJzKsOUbFTFgDZ3+uE2MiD1xvkZ964w0DPb2FDKWMdkn4zj
         TJroF38sj3mqUuzJEEbI1/ycz5KI16/xbOh+tBZtJHVi5Az+CY/64/TlKK4CmdoYHE5T
         zXOxGlu5Jl/KXi4pWUPCeCmJnjG3hQ/ub0XEZTGcwVjOyHgjPQjqDg56c2gzw1MnsHeB
         dUHhWXTnW/1lBaY7us51077NKh2M4VFb6EUbinfFczjHdsCaf1u8YRkbt5KIgCawKl1k
         FaCg==
X-Gm-Message-State: AC+VfDz2Bb3Zibc9D9l25ji5OWyJYproPIvtIRHDZzq5vHpUHc2fBcYa
        d4fLIwCFbZGPe0PyE4R9O0kGAd8fKpkqqMYrL7OQJYDY9TP2iYzfoVU=
X-Google-Smtp-Source: ACHHUZ4qcagdmfRsxcWn5TiqMIBPASOWq16vMcMs4dVE7HQDdzGrzKGTg1QlIOmHPXm6cidIpLiK73gs6qEko+tI5M0=
X-Received: by 2002:ad4:5def:0:b0:5f1:606b:a9ca with SMTP id
 jn15-20020ad45def000000b005f1606ba9camr1595236qvb.37.1685037183488; Thu, 25
 May 2023 10:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-12-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-12-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 25 May 2023 10:52:52 -0700
Message-ID: <CAKwvOdnni+fQzk51YpnqWwLOo_ZKqwNdj0POkfVB6oRcLufHGQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/20] ia64,export.h: replace EXPORT_DATA_SYMBOL* with EXPORT_SYMBOL*
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
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

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> With the previous refactoring, you can always use EXPORT_SYMBOL*.
>
> Replace two instances in ia64, then remove EXPORT_DATA_SYMBOL*.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  arch/ia64/kernel/head.S      | 2 +-
>  arch/ia64/kernel/ivt.S       | 2 +-
>  include/asm-generic/export.h | 3 ---
>  3 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/ia64/kernel/head.S b/arch/ia64/kernel/head.S
> index f22469f1c1fc..c096500590e9 100644
> --- a/arch/ia64/kernel/head.S
> +++ b/arch/ia64/kernel/head.S
> @@ -170,7 +170,7 @@ RestRR:                                              =
                                       \
>         __PAGE_ALIGNED_DATA
>
>         .global empty_zero_page
> -EXPORT_DATA_SYMBOL_GPL(empty_zero_page)
> +EXPORT_SYMBOL_GPL(empty_zero_page)
>  empty_zero_page:
>         .skip PAGE_SIZE
>
> diff --git a/arch/ia64/kernel/ivt.S b/arch/ia64/kernel/ivt.S
> index d6d4229b28db..7a418e324d30 100644
> --- a/arch/ia64/kernel/ivt.S
> +++ b/arch/ia64/kernel/ivt.S
> @@ -87,7 +87,7 @@
>
>         .align 32768    // align on 32KB boundary
>         .global ia64_ivt
> -       EXPORT_DATA_SYMBOL(ia64_ivt)
> +       EXPORT_SYMBOL(ia64_ivt)
>  ia64_ivt:
>  ////////////////////////////////////////////////////////////////////////=
/////////////////
>  // 0x0000 Entry 0 (size 64 bundles) VHPT Translation (8,20,47)
> diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
> index 0ae9f38a904c..570cd4da7210 100644
> --- a/include/asm-generic/export.h
> +++ b/include/asm-generic/export.h
> @@ -8,7 +8,4 @@
>   */
>  #include <linux/export.h>
>
> -#define EXPORT_DATA_SYMBOL(name)       EXPORT_SYMBOL(name)
> -#define EXPORT_DATA_SYMBOL_GPL(name)   EXPORT_SYMBOL_GPL(name)
> -
>  #endif
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
