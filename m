Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29884EF96D
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Apr 2022 19:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236243AbiDASBa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Apr 2022 14:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347853AbiDASBa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Apr 2022 14:01:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710E16442
        for <linux-kbuild@vger.kernel.org>; Fri,  1 Apr 2022 10:59:39 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 17so4960286lji.1
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Apr 2022 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVo2yneeaoxV8R6Z7eFrjSGIjEuANhXKz6InNmADjE4=;
        b=VGVRglkQ5qT4QrFHTstzXLRNvKIXaFc/bd4yzqo+pIEHf/eHKnIB9w4H/LXNbkJgoi
         07dUE722eMqQPOTQz5VtHjFY4MwJEeQpXLP1cH+bPNKnIJ1wS69+6xZB5jlhq7T9ex8K
         C92uUGXEqPBNFrHhCfgEe/wnGQjH7eqVizKBxwOeW2xNEMV1/HnyClk7uxDwRjre2+2u
         OeRWnfIATizFCQmWuUwDf+090/sQv9OT0MQFhF+M+6mMQ8/jZlC2Bna3mKdQnrSNXrGH
         wFXSkgUYzcHtYdldWljBvbwgz0q96wDMuaAId8QiyjgvR6puPJLuaEAjji9l5sN+N/vl
         ePgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVo2yneeaoxV8R6Z7eFrjSGIjEuANhXKz6InNmADjE4=;
        b=AG2YcagjmpTj3eqhYHsB0W5RUi92UZebfEZMXKrCMMWDZPX1RKfJHTRdcys83SoxPE
         j+nxn+kRrTpMLdPOX+uhmXXj9jORfZj9NIBgB6DITfrowJGxAcZF4YauM+itwGGD4Th+
         nk/ioE6MGyeXTv55lVFX/lI0RSjcnrti72x1XWPhnWSNq+TndFCeXOMtcunxz5uwhpQP
         22GfC0D/Tmw24ZT0fOr56/sPIp5x+jxE3zoFXnUz+ZE3hK2pmgHK6ClPWvLmbaJHS81R
         Lw9UMRDjDfyhOxDZNCtoLFh4hXn2z5CrkQufV/U+Z9DTv8hc0gWgqW5bzEajJyc6irsk
         Zdfw==
X-Gm-Message-State: AOAM530GKfej5JnMK1drRyz3vj1eJsEQLXjJZtlsETogAdyDPHpU7eP3
        8pystYOf3+Cwk2ktA/tDyqpHeU59Di8/3pBcKoZqvg==
X-Google-Smtp-Source: ABdhPJz52xEbRMdX+J6RoF1PxIaVh4m7s0dsr5oimFatM/w31uwQdcfsTkc+f2SlEfD8uh7GODGMndZxkW2SY+pQS/k=
X-Received: by 2002:a05:651c:19a8:b0:249:a7f3:25e7 with SMTP id
 bx40-20020a05651c19a800b00249a7f325e7mr13589488ljb.352.1648835977151; Fri, 01
 Apr 2022 10:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220401155610.1280262-1-masahiroy@kernel.org>
In-Reply-To: <20220401155610.1280262-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 1 Apr 2022 10:59:25 -0700
Message-ID: <CAKwvOdnwSnoiP3Vnf-77VGeD6nKc7gLa-nc-ipoCsRBk2m3ueQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: restore the warning message for missing symbol versions
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
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

On Fri, Apr 1, 2022 at 8:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This log message was accidentally chopped off.
>
> I was wondering why this happened, but checking the ML log, Mark
> precisely followed my suggestion [1].
>
> I just used "..." because I was too lazy to type the sentence fully.
> Sorry for the confusion.
>
> [1]: https://lore.kernel.org/all/CAK7LNAR6bXXk9-ZzZYpTqzFqdYbQsZHmiWspu27rtsFxvfRuVA@mail.gmail.com/
>
> Fixes: 4a6795933a89 ("kbuild: modpost: Explicitly warn about unprototyped symbols")
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d10f93aac1c8..ed9d056d2108 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -674,7 +674,7 @@ static void handle_modversion(const struct module *mod,
>         unsigned int crc;
>
>         if (sym->st_shndx == SHN_UNDEF) {
> -               warn("EXPORT symbol \"%s\" [%s%s] version ...\n"
> +               warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
>                      "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
>                      symname, mod->name, mod->is_vmlinux ? "" : ".ko",
>                      symname);
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
