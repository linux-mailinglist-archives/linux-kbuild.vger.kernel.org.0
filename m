Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC98520425
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 May 2022 20:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240019AbiEISJv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 May 2022 14:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239975AbiEISJt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 May 2022 14:09:49 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FB1517FC
        for <linux-kbuild@vger.kernel.org>; Mon,  9 May 2022 11:05:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id g16so18044684lja.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 May 2022 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AN921NaxNkeCgd+/kg15uAVOqAqbEenfNO325PUsS6k=;
        b=cdkkVkNwsvU59Cj0woYu6dSdwau5E9ePg+8kIJ1M1Frwv+LedGaW6DLtMwkXpMZL2B
         r7hFwQ3ahDz+IJdG4IjbhLPOcTwEoyXCnRmAW2WdhUgxhcdRUNGXAuadJ4tWcsACiMSL
         D+ZDP9Q++d5BAfIHETxhJRtnfnDfJwFx7k8npnx59zIQ50VN28X5Urs8CGSBmjf10Azm
         KbxvSubWCFWIqArNH+Eap4Ab+N6ITHlwC+yZnZQK/CX+oo0khGclKQwTivaiOeVCWJ1F
         QPgepFDot07kcqaOrupthXZjZwE3bspAHq+AIGDvC0XPGQqrRHf5JYMmMeJ86QLYBcxh
         6SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AN921NaxNkeCgd+/kg15uAVOqAqbEenfNO325PUsS6k=;
        b=qbsndPnCp7yuZv167ItVT+1jjF1NWWMRxPDQoBJN68NmyoR9lcmbBcWioLtRwQJyAT
         sbZaAMJvha50SHQ35gIHaD+3eHJo9+hX+GG+ZPjAS9ubeM6D3qQVqOpPeHxPC443qpV4
         6vUSfC5aG3c6QDjawnO0Of0+fEwfdfu/PIKP9VAeQ1w5sM5F9hz5IpO1BXUeUrX/a3iB
         yBnyWZB93mElk2zpM6SP1cCNl/Zrj1fXShBMznDqDJWvZ1IRICDEcg4WE0gt+OMc8lUG
         17RUhAn4vrb7sBCC458y7sEdORcC82gda4MRrbkIII/mM3IiXWD007QAR+NgnJBQSAH4
         bgfA==
X-Gm-Message-State: AOAM53079nSPF0g9M5zr0sx6ZYjQY4yfie9SUgYBsV/MNYD0lTBGQL3x
        6wrwZ8TvhiNvxKmKAWuQFlBSnDqFu30z11haj14jhA==
X-Google-Smtp-Source: ABdhPJwPwqycR8l/3eeVmCel1hLEu82x6SiaXLmDlHX2zoI+YX9jdJy+XCg/b2Ed5906efBN4BZfCg1kx4JD8JBVFLI=
X-Received: by 2002:a05:651c:552:b0:250:5c23:d0f2 with SMTP id
 q18-20020a05651c055200b002505c23d0f2mr11376317ljp.239.1652119550281; Mon, 09
 May 2022 11:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-11-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-11-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 May 2022 11:05:38 -0700
Message-ID: <CAKwvOdkhcJB8Bnrt51siRefWe+ZSvHagCs2G011PzkkrD3cxQw@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] kbuild: check static EXPORT_SYMBOL* by script
 instead of modpost
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
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

On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> diff --git a/scripts/check-local-export b/scripts/check-local-export
> new file mode 100755
> index 000000000000..d1721fa63057
> --- /dev/null
> +++ b/scripts/check-local-export
> @@ -0,0 +1,48 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (C) 2022 Masahiro Yamada
> +
> +set -e
> +set -o pipefail
> +
> +declare -A symbol_types
> +declare -a export_symbols
> +
> +exit_code=0
> +
> +while read value type name
> +do
> +       # to avoid error for clang LTO; $name may be empty
> +       if [[ $value = -* && -z $name ]]; then
> +               continue
> +       fi
> +
> +       # The first field (value) may be empty. If so, fix it up.
> +       if [[ -z $name ]]; then
> +          name=${type}
> +          type=${value}
> +       fi

Consider adding examples of output from NM as comments where you're
handling special cases.

Aren't BOTH from LTO?  The first case is:

---------------- T strncpy

while the second is

                 U strncpy

IIUC?

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
