Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06AC150E7F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Apr 2022 20:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241754AbiDYSWO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Apr 2022 14:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237011AbiDYSWO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Apr 2022 14:22:14 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCE83B28B
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:19:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j4so3178190lfh.8
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XWjyOTk2tGd4SQizwMeiUoN3Sq9yf6dGtgMTU28R/fY=;
        b=a6NU1EkhZkIg5psdckl12MWVLCiPzHkalwosSurPX+10R3BE0fypNlCtJNK5S9Fm33
         2YEBEEi/UVhjabcO80zk2m6oTTAPL81az32tapOcMzG6J4ZlxrymUqBd4GfVxeyw/A89
         sUCvynHn5KtU6pQJnPWYUPBm3E6c0NPhN3bvgcM1IM3aePtqlWuejGE3+hgWGe8DRBe8
         0r+WXQ6IP9CXTs3YirPawMoZtchf9K6PSVl4/lRm0wzOJeFm0s+arS5klDkoGekVaja8
         KG4uDg1BebEPxb+JyNRmkofOgdTFfPXEqg1X4MYfyXJ3lNrbTxa73xI8/nIT30F8YeJw
         3y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWjyOTk2tGd4SQizwMeiUoN3Sq9yf6dGtgMTU28R/fY=;
        b=KEEY9wIPmoyNaOmEgkyMmH1y50s7/SuCWqDMmy0yN7He0KcuB0kkBvPYbzGSMp6XKj
         uG+xK2U4eNz0APEqB8f48iLjKT9TX7t7Uv3iaOu8eWNpAQDaFuB7djaflLtyQWKyqkJ5
         mqqwBsedXfZ+JDl6I4ZtiE38CrNOO/3foBAL+bqIrrjgVzvfk3nksEzR9VVPuDt0hKGD
         4ZLVeS+ro8QOkhARL8xCjAdDpUIAGqwlUMkflwvtc8uyLG9qdkO+N0Sbqs8RC0EKciq6
         NcCQvcRz+FVbhl+5sLtpcen4LCxr+id5aEP1+JEZeGe0Ye4VYxVuq4vNPn8R3ttbRMsx
         K+RA==
X-Gm-Message-State: AOAM533Okbfghz2rH7UKd9REnpTlhqE2Siox+J0DvoCNT+QNFsMv+2gW
        dtceRZahqRx8ZELq6Y0Dtwpc0BeuBHsCBoadzD/9Rw==
X-Google-Smtp-Source: ABdhPJxr648XHmFtOsQbv/5l+cltqwh0ON3p+8hRlhV3L+DYFg9FO6UTQTq49XCNNQmDYsjURyqaNrLntwLPrDMxrKk=
X-Received: by 2002:ac2:4188:0:b0:471:96f4:c1d4 with SMTP id
 z8-20020ac24188000000b0047196f4c1d4mr13990835lfh.626.1650910746293; Mon, 25
 Apr 2022 11:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-4-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-4-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 25 Apr 2022 11:18:54 -0700
Message-ID: <CAKwvOdkvoFFpn58uwLsB4dsvZ4Xk51MvusmefOeSaLmzcku_1Q@mail.gmail.com>
Subject: Re: [PATCH 03/27] modpost: remove stale comment about sym_add_exported()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The description,
>
>   it may have already been added without a
>   CRC, in this case just update the CRC
>
> ... is no longer valid.
>
> In very old days, this function was used to update the CRC as well.
>
> Commit 040fcc819a2e ("kbuild: improved modversioning support for
> external modules") started to use a separate function (sym_update_crc)
> for updating the CRC.
>
> The first part, "Add an exported symbol" is correct, but it is too
> obvious from the function name. Drop this comment entirely.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f0d48f65fb33..c7cfeeb088f7 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -387,10 +387,6 @@ static void sym_update_namespace(const char *symname, const char *namespace)
>         s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
>  }
>
> -/**
> - * Add an exported symbol - it may have already been added without a
> - * CRC, in this case just update the CRC
> - **/
>  static struct symbol *sym_add_exported(const char *name, struct module *mod,
>                                        enum export export)
>  {
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
