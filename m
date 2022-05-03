Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63BC2519093
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 May 2022 23:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243098AbiECVrT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 May 2022 17:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243094AbiECVrS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 May 2022 17:47:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597CD41625
        for <linux-kbuild@vger.kernel.org>; Tue,  3 May 2022 14:43:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t25so32487914lfg.7
        for <linux-kbuild@vger.kernel.org>; Tue, 03 May 2022 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C756m5N+PAgQRKxR49lEWlxtJ+9ZyoDvXSPO8NFP/os=;
        b=e0s9a83f4XxcDt4qv0Yq1NGegacSoMfk1kUMm4iSF83ip1Tf+H2yXLO9VDCeKV7C4c
         /8Fmu1KMTzgp6siIjz8JWGnr3cdCc8kiVoE5MzTOiLMNsIhmDYLoE5F97ElfwQKZOrcW
         OEhiqQJIZE73f1Aiyi7UfXo/aixlTJlwy22uL5drkN77lnAKcv8aBj1f8PWsKA0vcKKn
         RcBS9VX50JEaj+xuhLkaBUifaAVgRauwnUb4L3k2gBQukgd93q3BQ/3OdSnKWPkanfqn
         mgpAkATGRsyCTEZkwnyUNdbSJetOKwkzvx95wVmWpYQqq6YyZYOAQmE1eJR+hTcPA08/
         lSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C756m5N+PAgQRKxR49lEWlxtJ+9ZyoDvXSPO8NFP/os=;
        b=gjPDBCrqXpE+ABNRNqt++cCsIZk+vgEyUUVLxU6+hhf16LDx/H+RrSSj+h8S9SrHWD
         9Z0Ts9vqNwyCkEyg3BZyIo9ja++eFUzA5FQmkh11BT4HekruicAfgfT2aAlyzckv3alp
         Z2KpvOUOgBKSun5Q9F36f9VDfme/qEchfXBrgx4VZGQa5Zq31GT/KxQgB/rnpj5HiWUF
         gWJy3elWVxklxMh+EAkusNgX6Sy/pz55VK4K0goYuQubLaasnHauYHiUskypDBKzEgYo
         Cjw41RBMu5orCxXuI9G11G3nVfXi4liIrLoAoudM1IaUOF84nMBIXXcB1lKR7niSsdCV
         KRQg==
X-Gm-Message-State: AOAM533S55dDeVKNMwMPjrZBMZVxek5YL5LXGQg/2GwbLxhZaP+HdIgM
        /XpjT7BAs49/Mr/bYfAyw4mYj6V1wg9r9ZXv2g6CHw==
X-Google-Smtp-Source: ABdhPJxlgenGdZiH7n9vBibI6qkAxNk/xO71M6pNC8Y64omRpD6gBOoI9tnHyN+y+6OlRQe66kztnErFQ3ZDPAGTT9I=
X-Received: by 2002:a05:6512:1150:b0:473:bdf0:6267 with SMTP id
 m16-20020a056512115000b00473bdf06267mr179381lfg.87.1651614218457; Tue, 03 May
 2022 14:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220501084032.1025918-1-masahiroy@kernel.org> <20220501084032.1025918-2-masahiroy@kernel.org>
In-Reply-To: <20220501084032.1025918-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 May 2022 14:43:26 -0700
Message-ID: <CAKwvOdkuWSBShjA2uQEYj5Puyn0bJLdK1JE9Y-P+q9uxNk1A5w@mail.gmail.com>
Subject: Re: [PATCH v2 01/26] modpost: use bool type where appropriate
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
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

On Sun, May 1, 2022 at 1:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 96d6b3a16ca2..7ccfcc8899c1 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -1,4 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +#include <stdbool.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <stdarg.h>
> @@ -111,11 +112,10 @@ struct module {
>         struct module *next;
>         int gpl_compatible;
>         struct symbol *unres;
> -       int from_dump;  /* 1 if module was loaded from *.symvers */
> -       int is_vmlinux;
> -       int seen;
> -       int has_init;
> -       int has_cleanup;
> +       bool from_dump;         /* true if module was loaded from *.symvers */
> +       bool is_vmlinux;
> +       bool seen;
> +       bool has_init, has_cleanup;

Consider keeping these on separate lines. Either way:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
