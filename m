Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04CBB648876
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Dec 2022 19:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbiLIS3i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Dec 2022 13:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiLIS31 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Dec 2022 13:29:27 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD173A5079
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Dec 2022 10:29:26 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id a9so5738364pld.7
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Dec 2022 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dIjL3PSL1jjI7LxiEIUx5ipFU6TCdjar/3Ia0XvmXME=;
        b=o+5rR6ScE09OHQkXYr+DQzHLHFXH7JABuPPTMfjkIJiiKFzEHCbYuNmj9mEDgAChX9
         /7Ar/h3OdTWxDwEFl66RNsCNJfRGr1HD7FsaZYHPscsbCuTwmGlt/7cIlHeUovsRfITd
         9CSD2SeM04KjZHuHCGXg++9Bcb9Y3f5T0ywyt44LIr5p2QRmPwfLAJGlBLsQTzq6xRx/
         sJDueEPmG54MjbBN/G6eY5O2p8sZjrXzPTW4R210Xl71vLDr1ahMSW9slOK2p8/T2TYh
         u7eCRBIhld8qnyUjHHDsOPd480e34RcIGLXUvYXYDVwN5cQlQl3fTvJyqEZi1kpxhykk
         farA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIjL3PSL1jjI7LxiEIUx5ipFU6TCdjar/3Ia0XvmXME=;
        b=wjeoQuIQ/fffYYWRmENUSsvtcqXQWfYO/SJEGmHUfYc+2umNHg8+mU1vIYaC5barXH
         XtXXi7V7ON9almF4OEQSDMmGCYKTh0xoJI8zsDsqUIGpiwo7t+kh4GmoYKMocvZVLgkU
         nA8qni6ZFfThyQszsBE0qHNdmSLx9CLGYP9ap45tYgjjzKEyzBBl2wEbdyoj3G2WtN2P
         qP4T1rIgOQL6AAqlznceiJFI64lbHOt0vJ9zwHKmEkueNcWITJXVm9ovWv7kXQwDmTZx
         XTVY2EnPavyfXNRciK0VAS8kvlD3fo1SyMT3dMbWeRbqOXanWykBaC/S7U8lz7wQyOJ3
         lg4Q==
X-Gm-Message-State: ANoB5pnuA6lmRhRrCSCquAjKxUeiD6+vzco3Tg4W1YVFJmFuDCMuYuN4
        x7Es3mk+is98/Umwig1OFHZSeyo0kOsLCoY2kVe/mg==
X-Google-Smtp-Source: AA0mqf7WhRWTXaMcLZfPWhLk3HGtkmWk2HBc+09UARUQNly+afqsoqSQ2ssHHk91hKPGBbSUJ3EzAHejeotpbphoo5w=
X-Received: by 2002:a17:90b:2743:b0:20d:4173:faf9 with SMTP id
 qi3-20020a17090b274300b0020d4173faf9mr108649204pjb.147.1670610565930; Fri, 09
 Dec 2022 10:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20221206040731.442499-1-masahiroy@kernel.org> <20221206040731.442499-2-masahiroy@kernel.org>
In-Reply-To: <20221206040731.442499-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 9 Dec 2022 10:29:14 -0800
Message-ID: <CAKwvOdnkxbaGFLDkAgQNCtKwL_z5YrXeDQGprgP9Pw59nOZSnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add -Wundef to KBUILD_CPPFLAGS for W=1 builds
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 5, 2022 at 8:07 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The use of an undefined macro in an #if directive is warned, but only
> in *.c files. No warning from other files such as *.S, *.lds.S.
>
> Since -Wundef is a preprocessor-related warning, it should be added to
> KBUILD_CPPFLAGS instead of KBUILD_CFLAGS.
>
> My previous attempt [1] uncovered several warnings, and could not finish
> fixing them all.
>
> This commit adds -Wundef to KBUILD_CPPFLAGS for W=1 builds in order to
> block new breakages. (The kbuild test robot tests with W=1)
>
> We can fix the warnings one by one. After we fix all of them, we can
> make this default in the top Makefile, and remove -Wundef from
> KBUILD_CFLAGS.

I like that approach.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> [1]: https://lore.kernel.org/all/20221012180118.331005-2-masahiroy@kernel.org/
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 6bbba36c5969..40cd13eca82e 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -38,6 +38,7 @@ KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-type-limits
>  KBUILD_CFLAGS += -Wno-shift-negative-value
>
> +KBUILD_CPPFLAGS += -Wundef
>  KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
>
>  else
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
