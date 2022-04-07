Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDCD74F865F
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Apr 2022 19:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236889AbiDGRkt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Apr 2022 13:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbiDGRks (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Apr 2022 13:40:48 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089841B931B
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Apr 2022 10:38:47 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s17so449122ljp.8
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Apr 2022 10:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DqcV7WGARFZ/ffRCyb5YkL9dW7CWUKGQ9qWgIaBP89g=;
        b=rmw47Rp6LjyE/7b5dpBSuCrYCvciGjeqiD6bEHNgNq+l1RWeFTl00/0A92THJqCbAf
         +KwzU+VLnFD/Z71HZbfLHG4WorkONaDM+8ZpUbxGyP3OqLl+nHcZRI2Pb5sMsh/ls/6k
         POAAQsZgyylfPdpKOYADA2pDww5E8S4GZRUwurwJNMRazL9zaZNNTfZ0YBZPB90UqAWR
         y0hslM2ZSk5LOez6PrkFgPrctMIZpl8w54YeGZk6vKcCLT9qe+bmvNP7igmWy72DFbO0
         5TL934XIcNGeA/r1JaYPM9uAtASIBYyl1cVno7etcOFmCBb4uktrcoGaKlqcdvfhSpns
         +APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DqcV7WGARFZ/ffRCyb5YkL9dW7CWUKGQ9qWgIaBP89g=;
        b=iZkKPeA+cq6FPWxcynNt4bA0GFPICH5AHcPcu+seKaKYup42xm+vXZjapjQefUC5JR
         ipYZphh5wCEo4uCmPsoFJJWfG9Hjx4cP6VuBQYvM55iUDc8JjUDNpSt/9vg7cBOP+ApL
         bpA3gPqR5qE7L+xlEPKdu7z4opyrEti4kGxcCtcNNzfoF/gdgubD6fGRUhnSDh/owLw8
         NRBDmSDGihRFifPMz8If0jvpag7LtPYGRtPaa8rvH/TNKREjkIq1rXEEMZxEYe7yElHM
         NRwlVMiWETotqOkmmyTggV6AiIeGiusA2TrDNRG3mFfT0NXCSj6LyoRWH1eruKCUxTTT
         xOgg==
X-Gm-Message-State: AOAM531YZIIea2gW0Hy/ueNf0l/WEBWzLrXNFSwYU4hB938L+onmn02R
        52YHN74wCgzaGp+UYsn3FG3AtEBItlUhLkJ2iXSrtib7CGc=
X-Google-Smtp-Source: ABdhPJyzJHwGpQQsGu9sCrGwCnvvz5UowKYDszfDvjvyB7k4rx0xoF5u9NiSMJf8/kvFr7M28mMrVh9XNfpv6t/0ggw=
X-Received: by 2002:a2e:8859:0:b0:249:83e5:9f9b with SMTP id
 z25-20020a2e8859000000b0024983e59f9bmr5022907ljj.165.1649353125074; Thu, 07
 Apr 2022 10:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220406153023.500847-1-masahiroy@kernel.org> <20220406153023.500847-4-masahiroy@kernel.org>
In-Reply-To: <20220406153023.500847-4-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 7 Apr 2022 10:38:33 -0700
Message-ID: <CAKwvOd=PTcAQP9b3wHY=95ESXVQjhwcHrNg5EqC0N5FVUKOJjw@mail.gmail.com>
Subject: Re: [PATCH 3/7] kbuild: reuse real-search to simplify cmd_mod
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 6, 2022 at 8:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The first command in cmd_mod is similar to the real-search macro.
> Reuse it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index f15c245dc17e..857329844789 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -306,7 +306,7 @@ $(obj)/%.prelink.o: $(obj)/%.o FORCE
>  endif
>
>  cmd_mod = { \
> -       echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
> +       echo $(addprefix $(obj)/, $(call real-search, $*.o, .o, -objs -y -m)); \
>         $(undefined_syms) echo; \
>         } > $@
>
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
