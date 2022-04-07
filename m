Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647124F864C
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Apr 2022 19:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346066AbiDGRgg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Apr 2022 13:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbiDGRgc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Apr 2022 13:36:32 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5228A152825
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Apr 2022 10:34:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id e16so10830676lfc.13
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Apr 2022 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pTS6JoVH0FZyCW8Yz5J0aJH1QFk/MAO8eWoamKneeUI=;
        b=M3AA7BjRuxkuqzx49jk/NFaKYoTsCoSAWMVVUDjaTI4T8fd3Wy95ngt1pt0dLu6oS1
         e+5OVOyD/J0SEvSMrLOcvQ5BgTaWRMNPlGBm0z6dB51fCtAsXALVbMv6wXHdac3np803
         pCISNBcet+jtM2oSeGW+IuxGxybalvArdtuNMHizxV6fpU9GmQI/hHbh7+HIJaaHinX3
         UMzsCzWRStPg8Y7JlXBsI0By84oyCvllllYm9J2/GErrERQQWisKLIkGaeuNnZoQyEV8
         7VkOdmoYWocpzBqVSFvaLCz5MRZet9iPTczlHywz7p133HfQYJ7KC4VG6gsOX6WsVXtf
         FgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTS6JoVH0FZyCW8Yz5J0aJH1QFk/MAO8eWoamKneeUI=;
        b=uBDfjroICprMSWIxB/KN/BwRqD5SnPsDVIxhCEbr2R24QOGQBjI6HClM3/O8g7TB0Y
         9AcLZgc5C54TRuH7+vVr9q8WZZej2u31Qi3LqpykIrw6PDfqOkFf41YcWJVgnPR6MiB8
         oVM7IjHwAhHdLAOdRFDJXNvTE/85UKMjwzyIrhl7XH/idA+VvUKMJQqzAUuN8hnkVUOE
         Aw0EFv7r0DczC3vTit0KGd7GC2NOB9SD+ZkRq2hdHQyFHax4yNbFsvy45lU6E1TysTtS
         kaRzAzMHZksQWj2N1EIGdfvu020+/PpShnr3Yf1dcfrk0joM3mVKGfrp/suP6/zLI4AQ
         Zmlw==
X-Gm-Message-State: AOAM530WRkdVlsV8yLwTBtgjVYqlCtnP9O8U8ncvO4H2CXyK1JhQezZK
        L5g64bEtDJv4wy+2a69+RIVUvvGbNsP4HbaTDE5OwmzF0QE=
X-Google-Smtp-Source: ABdhPJzswKfjK36kyyP5jTdYD4iVcctmx2qTBsZ56uCoqUldKnYlfpajfq/zzMPxndyjmIwgZzZTYDIazgOd8NR7d6M=
X-Received: by 2002:a05:6512:108b:b0:44a:6dc2:ffeb with SMTP id
 j11-20020a056512108b00b0044a6dc2ffebmr10335124lfg.184.1649352868337; Thu, 07
 Apr 2022 10:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220406153023.500847-1-masahiroy@kernel.org> <20220406153023.500847-3-masahiroy@kernel.org>
In-Reply-To: <20220406153023.500847-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 7 Apr 2022 10:34:16 -0700
Message-ID: <CAKwvOdnqxh2=QrtWmTMuzF4ob0+TBODM4S88J299G2xHz4zfAw@mail.gmail.com>
Subject: Re: [PATCH 2/7] kbuild: make multi_depend work with targets in subdirectory
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Apr 6, 2022 at 8:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Precisely speaking, when you get the stem of the path, you should use
> $(patsubst $(obj)/%,%,...) instead of $(notdir ...).
>
> I do not see this usecase, but if you create a composite object in a
> subdirectory, the Makefile should look like this:
>
>    obj-$(CONFIG_FOO) += dir/foo.o
>    dir/foo-objs      := dir/foo1.o dir/foo2.o
>
> The member objects should be assigned to dir/foo-objs instead of
> foo-objs.
>
> This syntax is more consistent with commit 54b8ae66ae1a ("kbuild:
> change *FLAGS_<basetarget>.o to take the path relative to $(obj)").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/Makefile.lib | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index d56cda3c1e8a..0453a1904646 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -236,9 +236,9 @@ endif
>  # Usage:
>  #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
>  define multi_depend
> -$(foreach m, $(notdir $1), \
> -       $(eval $(obj)/$m: \
> -       $(addprefix $(obj)/, $(call suffix-search, $m, $2, $3))))
> +$(foreach m, $1, \
> +       $(eval $m: \
> +       $(addprefix $(obj)/, $(call suffix-search, $(patsubst $(obj)/%,%,$m), $2, $3))))
>  endef
>
>  # Copy a file
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
