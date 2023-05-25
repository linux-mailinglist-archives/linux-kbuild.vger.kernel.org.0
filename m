Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2527112CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 19:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbjEYRvC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 13:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjEYRvB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 13:51:01 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327F8194
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 10:51:00 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-75b0b2d0341so123844985a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685037059; x=1687629059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APQzClxOrkiKwIaJfNBMCzDJwzDQYkEl3LkeYVXz6OE=;
        b=ypuCtnKJJb9+dUuovuBEL9ReJOpJk1Ci8EfJeimiDv0YHTx2OvbydH6SIy3NBRGKlb
         KTmTcVjY3LKWXqoXvRHOQkxPC9N/Oiz/0Fmkb8st3SXn4yRcMjjjxlGWFDHEvI3c/T8N
         JEi8IE9dg20MFjanwby4K1NSqgA4/+RzaRncx8t5lHG5u++j/x0qlnnxGNyoyYVuxHlT
         xpCM0Sp19eRYXrIzA1ZFYCRbvijoWJKYlQ5HSVAvC51lVzxPERIzhhtHHz2gMd3FJ5+t
         YbjF3xrlzrM9mirkyhk+GBoG4bGJf9Z6W5b53afB8Ftc5L16pM7rglv4czUVYf+oqM4B
         pogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685037059; x=1687629059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APQzClxOrkiKwIaJfNBMCzDJwzDQYkEl3LkeYVXz6OE=;
        b=H6Srne1INEgJMuIcXQUP7G6zYT8SjqQEtzHoS7YftblDCzyj/5ZGjsEK5XtqgX4ot5
         dAIsDM1yDB4N0jJg3N1LhYCCvZr7yk8dzlsqvc2C9AZiDzkF2Z4sHhMj89dvjjjNPa5X
         u+tqZ3Js708AUCcO/CpSWHJoIWOHmv0VPdyNWFfwUqLH+rN9A7KSc9y1uC7Fq5V2nfRx
         l0jzBfvSi/VE0ggIpH8Jva/bSl6MrssFWCabTEc+ipHSsKa58+MthxXNksbK4mXjI4y5
         Lac8r80JT/mxXBdNuYvmapHrCoKPhUbNEfyLBOjDzbJN6FW8c0SRskr51Z32zohgxQnt
         ZeOQ==
X-Gm-Message-State: AC+VfDxxEwmBwaWrHMDAhAqDNCJL6yi+E2ooX0JP1gqt5vTKNd73j8Fr
        cPgAteGP7GfpMBw8LRo82m27kxg+iQ3vlNkmhpZe0Q==
X-Google-Smtp-Source: ACHHUZ6cUlmb1Ba3ueZ/KpfpZaeOkyokK2YB4I45LYrfaNQwcVv/iOgRs/xtsRO9ZtVq2t8erNXx0FR0uEnu9Z6HX9k=
X-Received: by 2002:a05:6214:2a4a:b0:625:88f5:7c5f with SMTP id
 jf10-20020a0562142a4a00b0062588f57c5fmr2416414qvb.31.1685037059091; Thu, 25
 May 2023 10:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-11-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-11-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 25 May 2023 10:50:48 -0700
Message-ID: <CAKwvOdmZmtu4j11s3VKgcoK7riu=+QmXpcw1GuvG9vf-A=EWrQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/20] kbuild: generate KSYMTAB entries by modpost
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing
> CONFIG_MODULE_REL_CRCS") made modpost output CRCs in the same way
> whether the EXPORT_SYMBOL() is placed in *.c or *.S.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Patch LGTM, but two questions, below.

> diff --git a/arch/um/os-Linux/user_syms.c b/arch/um/os-Linux/user_syms.c
> index 9b62a9d352b3..0b3a82aedbfa 100644
> --- a/arch/um/os-Linux/user_syms.c
> +++ b/arch/um/os-Linux/user_syms.c
> @@ -38,10 +38,15 @@ EXPORT_SYMBOL(vsyscall_end);
>  #endif
>
>  /* Export symbols used by GCC for the stack protector. */
> -extern void __stack_smash_handler(void *) __attribute__((weak));
> +/*
> + * REVISIT:
> + *   ARCH=3Dum cannot enable CONFIG_STACKPROTECTOR because
> + *   'select HAVE_STACKPROTECTOR' is missing. Is this already broken?

^ Is there something better we can do here?

Maybe this code should be deleted first?

> diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
> index 5e4b1f2369d2..0ae9f38a904c 100644
> --- a/include/asm-generic/export.h
> +++ b/include/asm-generic/export.h
> @@ -3,86 +3,12 @@
>  #define __ASM_GENERIC_EXPORT_H
>
>  /*
> - * This comment block is used by fixdep. Please do not remove.

^ Sounds ominous. What are the implications of removing this comment block?


--=20
Thanks,
~Nick Desaulniers
