Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE264F4F41
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Apr 2022 03:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1837048AbiDFAnp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Apr 2022 20:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457621AbiDEQS2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 12:18:28 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2220B193D3
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Apr 2022 09:16:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p15so24115833lfk.8
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Apr 2022 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uy8i40RIZFVV64urUf42bHyfQVf4Q/JqjVb+pMMetgg=;
        b=VEZUGGgcS/bCf+7bs3tHZb8+OMlT5unqdhNUgKPFfUrzmUWPzwkPflleyRfNc9Gszb
         Zvp51L5ajuECgaMz1MXPXAXCzpd+r7XgMLjc0WwZUqmG6YkOW8zjrrmE+M6NRQcmJWuO
         Y0fH0pb8byrF6pULERlph+UgHZwh1mkS4uFnJ4VLQVddcyXp54KZF/gQUNfoGi+CLUv5
         mS5mky+6cLoMPbbvLH9DILjT2TrafcmZcPrfQVcEzGZ47/o/q3O5NsqGbBMbE0V/AgPW
         oBBJDvv82i/EGVLu1pU55SOGOo1TrCbFYInzxzprvbxO/U2/r7StZYuNCf32nr453634
         fBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uy8i40RIZFVV64urUf42bHyfQVf4Q/JqjVb+pMMetgg=;
        b=rHAyOYnzsyWAMfoPi4kbhpiJaX51Y5hb4wbcWBGGhow4MYq5ahuDbL2eqIYvAQg+JF
         TW73MhuayzfyngaBroWrJQ0iuquJciHe+rk6NpkG++rLRvnBn3iV2YABOhaO77RRYR5D
         K13cju2/1JdEZIDF3OJ1zOPWiU2c2Ow24qKg9LdEKtqXQtHf375HRMGVX6gkWeMMcvJo
         wHMUGaIBXN5OBM567qeyoiVtWF/t05ePzw1Ur0UcaZwzpXZERmwDrK+JmtcD7yvfiXvH
         L4tvU3Oc6qs1/LNK6ANKlyOn4WZ3QNLryBwnVE0rjdxasHIy4ZOnMa7atgYpLd+s7qdM
         O+5g==
X-Gm-Message-State: AOAM5329pnEZAxagTlBUW75iZG76ajaBaF6dkOfG9kNaJGLoOia/WDdh
        o2DQXsHuWI63AWr8Rmaz1pAWMmmLcfP6bXRA7R6SrA==
X-Google-Smtp-Source: ABdhPJyczCamPzZ+WireWxW4CQXH7k2Pos0Q5thRcGyasYMnxW8whHvGnEWwMVjDvTFTyp15EDL3Em9/iSDdkwnlAHg=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr3071054lfv.626.1649175385326; Tue, 05
 Apr 2022 09:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220405113359.2880241-1-masahiroy@kernel.org> <20220405113359.2880241-2-masahiroy@kernel.org>
In-Reply-To: <20220405113359.2880241-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 5 Apr 2022 09:16:13 -0700
Message-ID: <CAKwvOdnJoAoMbcLo_N=t46SC62yxNDEbj24Y_zRzT4LG-LheXQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] kbuild: factor out genksyms command from cmd_gensymtypes_{c,S}
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
> The genksyms command part in cmd_gensymtypes_{c,S} is duplicated.
> Factor it out into the 'genksyms' macro.
>
> For the readability, I slightly refactor the arguments to genksyms.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

It looks like you may have sent v2 twice; apologies if I comment on
BOTH threads rather than 1.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - Fix the location of the closing parenthesis
>
>  scripts/Makefile.build | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 9717e6f6fb31..31e0e33dfe5d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -125,13 +125,14 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
>  $(obj)/%.i: $(src)/%.c FORCE
>         $(call if_changed_dep,cpp_i_c)
>
> +genksyms = scripts/genksyms/genksyms           \
> +       $(if $(1), -T $(2))                     \
> +       $(if $(CONFIG_MODULE_REL_CRCS), -R)     \
> +       $(if $(KBUILD_PRESERVE), -p)            \
> +       -r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
> +
>  # These mirror gensymtypes_S and co below, keep them in synch.
> -cmd_gensymtypes_c =                                                         \
> -    $(CPP) -D__GENKSYMS__ $(c_flags) $< |                                   \
> -    scripts/genksyms/genksyms $(if $(1), -T $(2))                           \
> -     $(patsubst y,-R,$(CONFIG_MODULE_REL_CRCS))                             \
> -     $(if $(KBUILD_PRESERVE),-p)                                            \
> -     -r $(firstword $(wildcard $(2:.symtypes=.symref) /dev/null))
> +cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
>
>  quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
>  cmd_cc_symtypes_c =                                                         \
> @@ -344,11 +345,7 @@ cmd_gensymtypes_S =                                                         \
>      $(CPP) $(a_flags) $< |                                                  \
>       grep "\<___EXPORT_SYMBOL\>" |                                          \
>       sed 's/.*___EXPORT_SYMBOL[[:space:]]*\([a-zA-Z0-9_]*\)[[:space:]]*,.*/EXPORT_SYMBOL(\1);/' ; } | \
> -    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - |                                \
> -    scripts/genksyms/genksyms $(if $(1), -T $(2))                           \
> -     $(patsubst y,-R,$(CONFIG_MODULE_REL_CRCS))                             \
> -     $(if $(KBUILD_PRESERVE),-p)                                            \
> -     -r $(firstword $(wildcard $(2:.symtypes=.symref) /dev/null))
> +    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
>
>  quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
>  cmd_cc_symtypes_S =                                                         \
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
