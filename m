Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C985D72A564
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jun 2023 23:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbjFIVea (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 17:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjFIVe3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 17:34:29 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCE93A8C
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 14:34:23 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-786e8de85c1so681324241.1
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jun 2023 14:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686346463; x=1688938463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FN7hLjtGJs/FHfbPpMcVi+yulUaow7LlgvAA4nlJ4w=;
        b=nEu1dhFS/KtCJDrV9IiJxcofM8hEfF4Yh5M0CT2zPHVw9p7uUR+7X/q+mO6or7fg13
         4t7MKvtxOxBkMp5q/90V9gqNpWv1osewkly9NgAjG5a1ItSAmVgHV2n8YVrtPhcAXD5q
         72F1aUSJMkn/Y3AVYE285NL+5fLG8+LsviR916j9pE1rH3qij9/lZz9WPTdYRMAnq2fW
         hZ/LW+QC9IpHjVAUBIDkxh+GVJE1iZIVL97D09Giiu602q/C0/4cadJhK2FD9464X0US
         ulBD/w4ikCH5vDRva0aLIgzmVPlCcwcYDJvwosSoZyyd1JtOdRWNUxvMdNWGMFqZRzcz
         2mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686346463; x=1688938463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FN7hLjtGJs/FHfbPpMcVi+yulUaow7LlgvAA4nlJ4w=;
        b=fj+2b6Ab8vMAAcmmZnYZu+E47/AcOuMUNvTu6B+e02gSr+XCfHqGxsL9L+9njUnGTH
         yjY07tyJAGr9R1tcGEb2g2ibnhmAy1W/8BPTBpw4S6VQXDMdKDzS9KxBmJ2Q8FqaOmXJ
         IyIGeTlcSfMnBpAFgamWMstlzF4F1bu1P4WM6/iKTGxx48IT1LOSpOC49cwah3n9prHl
         /QxiV7tvI8AfNgKinq3yPaakT8Mw29zABTmI+Yy08av8xpiFWTFXNFmcY440fusHQsxN
         u8d6Ugv9rlEOT4UN3RYDBflHROfO5oq87X8YYVp+TRNK7KUem3IJ+4kXh7JanBS/fR88
         Zsvw==
X-Gm-Message-State: AC+VfDxCzDgmfisWdZ3b70swFFIshFzcU7lyQbXQJxZi6fxVIydgHfsp
        snlGpjtvfZMZnPTyRppyUbMKsG5I4M1HJIdXyHnQ25ooB5B6d7YR1rY=
X-Google-Smtp-Source: ACHHUZ5dZIj+NcWZhmKd0sqgT54E3562rWqntSqlVozz38btjF3YrZvwyqmTlR6qel9ulhipKI5BX2tu1ca7p0SoSoA=
X-Received: by 2002:a67:b408:0:b0:43b:402c:adfa with SMTP id
 x8-20020a67b408000000b0043b402cadfamr1046504vsl.19.1686346462660; Fri, 09 Jun
 2023 14:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230608142428.256985-1-masahiroy@kernel.org> <20230608142428.256985-12-masahiroy@kernel.org>
In-Reply-To: <20230608142428.256985-12-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 9 Jun 2023 14:29:05 -0700
Message-ID: <CAKwvOdkZUmfUtO=uL9JgoJjeto28HNCQ-i7FT1Oy_C+mtNz-Dg@mail.gmail.com>
Subject: Re: [PATCH v7 11/11] linux/export.h: rename 'sec' argument to 'license'
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 8, 2023 at 7:24=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Now, EXPORT_SYMBOL() is populated in two stages. In the first stage,
> all of EXPORT_SYMBOL/EXPORT_SYMBOL_GPL go into the same section,
> .export_symbol.
>
> 'sec' does not make sense any more. Rename it to 'license'.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v7:
>  - New patch
>
>  include/linux/export.h | 8 ++++----
>  include/linux/pm.h     | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/export.h b/include/linux/export.h
> index fed2e5717461..b411fdb88720 100644
> --- a/include/linux/export.h
> +++ b/include/linux/export.h
> @@ -46,11 +46,11 @@ extern struct module __this_module;
>   * be reused in other execution contexts such as the UEFI stub or the
>   * decompressor.
>   */
> -#define __EXPORT_SYMBOL(sym, sec, ns)
> +#define __EXPORT_SYMBOL(sym, license, ns)
>
>  #elif defined(__GENKSYMS__)
>
> -#define __EXPORT_SYMBOL(sym, sec, ns)  __GENKSYMS_EXPORT_SYMBOL(sym)
> +#define __EXPORT_SYMBOL(sym, license, ns)      __GENKSYMS_EXPORT_SYMBOL(=
sym)
>
>  #elif defined(__ASSEMBLY__)
>
> @@ -67,9 +67,9 @@ extern struct module __this_module;
>  #endif /* CONFIG_MODULES */
>
>  #ifdef DEFAULT_SYMBOL_NAMESPACE
> -#define _EXPORT_SYMBOL(sym, sec)       __EXPORT_SYMBOL(sym, sec, __strin=
gify(DEFAULT_SYMBOL_NAMESPACE))
> +#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, __s=
tringify(DEFAULT_SYMBOL_NAMESPACE))
>  #else
> -#define _EXPORT_SYMBOL(sym, sec)       __EXPORT_SYMBOL(sym, sec, "")
> +#define _EXPORT_SYMBOL(sym, license)   __EXPORT_SYMBOL(sym, license, "")
>  #endif
>
>  #define EXPORT_SYMBOL(sym)             _EXPORT_SYMBOL(sym,)
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index aabb6bd8f89e..1810d776e84a 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -375,14 +375,14 @@ const struct dev_pm_ops name =3D { \
>  }
>
>  #ifdef CONFIG_PM
> -#define _EXPORT_DEV_PM_OPS(name, sec, ns)                              \
> +#define _EXPORT_DEV_PM_OPS(name, license, ns)                          \
>         const struct dev_pm_ops name;                                   \
> -       __EXPORT_SYMBOL(name, sec, ns);                                 \
> +       __EXPORT_SYMBOL(name, license, ns);                             \
>         const struct dev_pm_ops name
>  #define EXPORT_PM_FN_GPL(name)         EXPORT_SYMBOL_GPL(name)
>  #define EXPORT_PM_FN_NS_GPL(name, ns)  EXPORT_SYMBOL_NS_GPL(name, ns)
>  #else
> -#define _EXPORT_DEV_PM_OPS(name, sec, ns)                              \
> +#define _EXPORT_DEV_PM_OPS(name, license, ns)                          \
>         static __maybe_unused const struct dev_pm_ops __static_##name
>  #define EXPORT_PM_FN_GPL(name)
>  #define EXPORT_PM_FN_NS_GPL(name, ns)
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
