Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB2475332A6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 May 2022 22:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240795AbiEXUx0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 May 2022 16:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239996AbiEXUx0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 May 2022 16:53:26 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27065719C6
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:53:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q1so12624663ljb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bW5/8lI4JjFQ6Xag2meN8L4VITbIpxKq0yUGICqVrIc=;
        b=WpvrEVmuTl2Kx5iqizXnztaJbRV6fnt43A0sf4YpzEgTzyvZ1jmLsw+fd6x4j/a5jl
         ef9kOPZKrEXxbXKlOmkFFkqVl7qePJXkW7sSjczqRVU9eaK23gdLP0JzNRYvjPBeCGKX
         50WAFccP6NrcY5s62BPW6EYi2JkzEq+oR9WH8GtAEN+UR6hNMHnarAv14tJGOAamIjU/
         PPYIVS0QGSEcwQCslNS5imW4VKB/fVCyYLQFfNtMGuqhk9Rgu7dw2kuCJqw0tMwuqmbG
         c9NemwHFdhnEzrKcWgeVh28uM39rBtJb2f+QyxtTKr/hEETDVVbwwEcJZugMGnPgPqR8
         LKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bW5/8lI4JjFQ6Xag2meN8L4VITbIpxKq0yUGICqVrIc=;
        b=Na3qMe5STCwyZ9C9TE3HaBsQp2yQUSGnJhHvDs1goAs7y/LVkwigLgyN2szhqv383u
         FTGCayDCR45nkMpkqy+2UXqxSxM8TGmYxnsyk+NThMXWs55CrffGhGW5PV3WtD6PCTkZ
         PzSuichifX1eDSNdbo/8lq/hz8ZMfq+pxfoCmq5Gde43t5QmiGTfUvs0OHSEPFhvYtSE
         3DICP7VJNc4pXTVZRA3boAbSK1iSayatoj6rKH+aYW5drVyBwJcbe1EQsikGXg8qEk8e
         ivi09VAYu2sLEjoYQLAxy+UNwfpmE24qxtcnd1HSLz7OwQMtuf7j/i9LLsShllfkwFck
         jCJQ==
X-Gm-Message-State: AOAM533jAwglxRtz8BqFMeL2sqRRR6s7QJ2/J452F4vZ9cKwHiCelnrM
        7uzqieGw65+9aBYHdP0M2CJV/1GflrKUrkK5cb9XnfMkmvA=
X-Google-Smtp-Source: ABdhPJxk2brImsvQXheQLXj2NVwibLAuU32WQRqqGWEA2q1mzgCJ9lYctHlJTOcDFEPuy9bwxBxyAT2QBckrxuuAKwg=
X-Received: by 2002:a2e:98c3:0:b0:253:e0e1:20 with SMTP id s3-20020a2e98c3000000b00253e0e10020mr11709312ljj.26.1653425603309;
 Tue, 24 May 2022 13:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220523181503.1007987-1-masahiroy@kernel.org>
In-Reply-To: <20220523181503.1007987-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 May 2022 13:53:12 -0700
Message-ID: <CAKwvOdmrcmaR7vUP73UXCLaibqJ0-tiJUTL=tZQTY8buL3NwqQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: replace $(if A,A,B) with $(or A,B) in scripts/Makefile.modpost
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Schier <nicolas@fjasle.eu>
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

On Mon, May 23, 2022 at 11:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Similar cleanup to commit 5c8166419acf ("kbuild: replace $(if A,A,B)
> with $(or A,B)").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/Makefile.modpost | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 7c3899182a4a..911606496341 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -84,7 +84,7 @@ obj := $(KBUILD_EXTMOD)
>  src := $(obj)
>
>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
> -include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, $(src)/Makefile)
> +include $(or $(wildcard $(src)/Kbuild), $(src)/Makefile)
>
>  # modpost option for external modules
>  MODPOST += -e
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
