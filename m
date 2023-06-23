Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB6C73BD37
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 18:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbjFWQww (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 12:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjFWQwl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 12:52:41 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302FE2969
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 09:52:40 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-62f2b068ba4so7051996d6.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687539159; x=1690131159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvDD70EfgKKb2T0PMEOiIeKl/5XEghNuRS0dwmrmHco=;
        b=Qy05BsLfj+WBYkdgrGWb9VBYQ5m+HxVaLFz5WcI7qfgagHahWVymgtmku3jMvC371S
         G53c+YlybCdhISIN+SdNRPQbH++Jov39YcYFhTAYyiO1JO4+PMeGo6ldpnmLjTfGo5VC
         ToBbbeP/7GUeZMPSGH3nQ9OsOGnB+PMZCYuKaCJ6RyT3qCHAEu17/cWtJq5rlYxc8n0Z
         yXRg8OMaHKL6QaD4oHE67UIKbkdhqcrDvFNVYmZvNvKHbw/hVVltyGJsWGRYH21eCUrU
         O+93tGccodGvME6XhBZkgoTOeyWL0zBu+JklecNtMzlx1MHYRq19+yLFmCxknN/bYHCw
         FgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687539159; x=1690131159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvDD70EfgKKb2T0PMEOiIeKl/5XEghNuRS0dwmrmHco=;
        b=bvoePD/kRCLbFfW9SLZYAZ5dXLR7XPXZKlyHagQ7mydA+DoNuKq3fhYgWAEUJjhIB3
         RHGomp55YqDLlFxsJv60zqC+QL5oeKsToMNJWnXETmTd3yI/eUWnBnQTnmXOnVfOj5/I
         kmhFZW8s+q9O0w5wbjuDKJsCLnxDxTJpAog1R2Cgq7F5dW2DdKjrBpVgSN+9Xv5glsfS
         ExTmnewEM7esRscvuWPEPWVqthvG+pBtl9+LO9+MGG45rfQdEIMh9igKz1T8kAIR/3iP
         FsbneOrG0qodPXv7npyJRJjySawVQEhXnnOGJau7CK0GOhYYS+aM0rzjQ2Srdmb6KNTh
         fs2A==
X-Gm-Message-State: AC+VfDw2ITmag/tC4rqCeuvrjycQQsvC6ihyOKrOmNzNh3z6DCDV7NYV
        xwFifMLFpceFvZXxW4ceLSSNC+qn/CMaUGSnxvuhLw==
X-Google-Smtp-Source: ACHHUZ6s9WIYCreCT4T/wFXItf/JVraCr7eKtgc0c1aKOM7YNwMs2IdQ9w5aaTr8eYo53MeSlCH4fj5aI4/NFDzrSS0=
X-Received: by 2002:a05:6214:23ca:b0:625:83ab:8a42 with SMTP id
 hr10-20020a05621423ca00b0062583ab8a42mr24076302qvb.46.1687539159150; Fri, 23
 Jun 2023 09:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230623134351.1898379-1-kernel@xen0n.name> <20230623134351.1898379-10-kernel@xen0n.name>
In-Reply-To: <20230623134351.1898379-10-kernel@xen0n.name>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 23 Jun 2023 09:52:28 -0700
Message-ID: <CAKwvOdmJmdB3sCviTFyjdN8DWe_C0ncspEhJsXs8dzY+OdA8HQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] LoongArch: Mark Clang LTO as working
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        WANG Rui <wangrui@loongson.cn>, Xi Ruoyao <xry111@xry111.site>,
        loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
        WANG Xuerui <git@xen0n.name>
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

On Fri, Jun 23, 2023 at 6:44=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Confirmed working with QEMU system emulation.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

Untested though.

> ---
>  arch/loongarch/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index c8e4f8b03c55..7c5d562b2623 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -51,6 +51,8 @@ config LOONGARCH
>         select ARCH_SUPPORTS_ACPI
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_HUGETLBFS
> +       select ARCH_SUPPORTS_LTO_CLANG
> +       select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select ARCH_SUPPORTS_NUMA_BALANCING
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF
> --
> 2.40.0
>
>


--=20
Thanks,
~Nick Desaulniers
