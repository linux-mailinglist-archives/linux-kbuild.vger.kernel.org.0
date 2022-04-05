Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1DF4F4F3C
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Apr 2022 03:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1454722AbiDFAn0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Apr 2022 20:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457640AbiDEQXy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 12:23:54 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D25F99EEB
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Apr 2022 09:21:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a30so17731569ljq.13
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Apr 2022 09:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vp1rKhW9xVfHaAk1bIcVHB9UucHbWp+Gn42oU0LRglU=;
        b=ggFQtYxL98uH1FVRJXq9oNgXvUh7G5864YICyxdISp6UW19aXb07z9VuR5PMLBY9J7
         1ui4V2QkWdkQ8b+SvbpnoVGwCd1Xm02G2YDLHM6A4pqxne0L5WoMoFMYuZgLcRqLJjkC
         uKq28daKE3d0BLTdAnyJv5iAaRu+NZxP204AOOf+LazUkzaZw+bEcHptjluNHTEJ+2NS
         su+sVW++A74Gk3/Yxi+n1rFG80u7M/hcS4c9qCh+3iguKOYC7ufS0mmLaXLHxq4XsL8B
         44aqeMZIWPQhhm1dPwhh1WyO8HMOfWgERO26dW/LEqO5oepBnpNLwGozUUlZu05Xo5Sm
         V/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vp1rKhW9xVfHaAk1bIcVHB9UucHbWp+Gn42oU0LRglU=;
        b=ipr1bi/xZDdszpCumNHwC3Bx7gvZy9HNnfC97qPxdvTCEnP7tMk0GDDixdNjlxhjKr
         vq6qmslnJyltUqmYBDJj1hrX5xESgV7zC1JY2qfStCh84u8lgBIVeVc0A1J2aeEeApyg
         0ZM3MpSSNDYWgzZNr9bZUmarTYDuQ9Brgzp4spe5et7dVP6WUdI4UMc3IbFj6wYMcypn
         m2NK6l+Vjh6g/eQbqKxMVW07imixa2AutLAk/hJpVNulfvzWTwiX2aK+eOIhStbXpALZ
         mfaml+hP7HQ6Zg4V55Yi6U6uFDZ0OBb1u6eTkNOLpdcy2hLF50o4OGbHkY4g8InGPywb
         GJLw==
X-Gm-Message-State: AOAM531cNSlSituxVdyb6TD8B1EdOUMOpMEFVJ8MJlHi8MUI7eFIviZl
        VvqtIbjKF03wmY/Nu7E2Jee/ABCdw6b1lBPijCsZqSKfsXjTaA==
X-Google-Smtp-Source: ABdhPJyrxb/EGFbBM6TVvfBKSHKHKzPwAFDSG4hhB1aZNQj7iew86HRktdhcL2l9aehOjQKObYiAlmHTMTw1SQCBzbw=
X-Received: by 2002:a2e:611a:0:b0:249:83e5:9f9b with SMTP id
 v26-20020a2e611a000000b0024983e59f9bmr2738675ljb.165.1649175713574; Tue, 05
 Apr 2022 09:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220405113359.2880241-1-masahiroy@kernel.org> <20220405113359.2880241-6-masahiroy@kernel.org>
In-Reply-To: <20220405113359.2880241-6-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 5 Apr 2022 09:21:42 -0700
Message-ID: <CAKwvOdn7DAR5ct+sGaXynLX5W1mBRpLMu7ZWJG51j-OEWDkP+w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] modpost: remove redundant initializes for static variables
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

On Tue, Apr 5, 2022 at 4:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> These are initialized with zeros without explicit initializes.

s/initializes/initializers/

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - New
>
>  scripts/mod/modpost.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f9e54247ae1d..2a202764ff48 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -23,15 +23,15 @@
>  #include "../../include/linux/license.h"
>
>  /* Are we using CONFIG_MODVERSIONS? */
> -static int modversions = 0;
> +static int modversions;
>  /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
> -static int all_versions = 0;
> +static int all_versions;
>  /* If we are modposting external module set to 1 */
> -static int external_module = 0;
> +static int external_module;
>  /* Only warn about unresolved symbols */
> -static int warn_unresolved = 0;
> +static int warn_unresolved;
>  /* How a symbol is exported */
> -static int sec_mismatch_count = 0;
> +static int sec_mismatch_count;
>  static int sec_mismatch_warn_only = true;
>  /* ignore missing files */
>  static int ignore_missing_files;
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
