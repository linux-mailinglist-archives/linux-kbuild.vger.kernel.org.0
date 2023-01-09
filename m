Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE45F6633C9
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbjAIWRh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234368AbjAIWRg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:17:36 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03F311C31
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:17:35 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id y1so11155766plb.2
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 14:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xGvurkR1Vr6sjo81OlaobHYxvZ0qlIiCt9EHEneHOsE=;
        b=DDZCTOCMHFE5ZjjCoXo6qIhcEGDmOZ7PVc9Am94F7Yk18Ol7+jsiYYIKULyIJ3QCJp
         iCL2XR16382+0R/lkiR8Ge6jNXB9uIjZWKRCGuq18T+2ZvWyTod6WDdQSBiARkqi8N/F
         7sKjhOkY+KoCSbCxFLS9kp71a2Fbz8MvEepczM/+WVzg7DDSuZT7OwofpTLbpYOX4XDq
         gg4Afss7nfhUt1X59LtfRzIK1b50H8l76BJjOZlJv3QZ8vPKaVaSpvW1lCim3j45N9Ya
         SzbkyYIunNLQKNcJ9NWYw8TCVyLI8R/34wzeeaKr5l1psASdlpWyJgj5moBG0lEOXiL+
         ghrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGvurkR1Vr6sjo81OlaobHYxvZ0qlIiCt9EHEneHOsE=;
        b=JUKi+yPROXfCO24LstojbVGMdasUFLm+W4cU3vNy/ygwhFoYgUvF3jKF2sqaoZW6WT
         RCDQqbI/P+h5DNbHoyhlWaUYmEd+MEdr4yleUoTedtbwV/361V7+qJSL9FTrYlhWoaOp
         9O8fJ4+tyPRD1s5jnfuZYeg8AMp3KoJzYxwz8FlMSEaWp3qNHnyf58uANAqgqwCF5pU1
         1k0YWyzukDO4S4/fi9wwMTQfJe9MF0F+3w5S67qAkhZd165O33yY2tNGHGk6EipPxrX6
         dWJ+367jh6/B9DxwQg8N3qKYAZhtgMZaos7YECgWETlV4IUOWeULvqR/bERya+3MIJ8R
         S42Q==
X-Gm-Message-State: AFqh2kputMU0d+x77zU5TlPaJlNBKjuQVxUvq3CHwmswNpCnLQcgOmUc
        H/szRV6G81VZTimgQpHCITC2is4iSfNU7uCbVhXfVw==
X-Google-Smtp-Source: AMrXdXsbEkI8ioQJlwLD7T5rd6K+n/Z046jK7Ma+7vkOIPXQukf7w9g5uyGrECSfGxO6LFFR0t9JF51Ub2jBHdYPCo8=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr2188673pjh.102.1673302655184; Mon, 09
 Jan 2023 14:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-14-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-14-658cbc8fc592@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 14:17:23 -0800
Message-ID: <CAKwvOdkk+U8Nkh9R4FRdfTe4y-SvhUXXiMWA4OS0EkUqwNiEnQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] kbuild: Stop using '-Qunused-arguments' with clang
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
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

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This option masks all unused command line argument warnings, which can
> hide potential issues, such as an architecture Makefile adding an
> unsupported flag to KBUILD_AFLAGS or KBUILD_CFLAGS, which will cause all
> as-option and cc-options to silently fail due to -Werror with no
> indication as to why in the main kernel build.
>
> Remove this flag so that warnings of this nature can be caught early and
> obviously in a build.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Nice job on the series!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c05b4fb7121e..4bc79d2a42f2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -878,7 +878,6 @@ KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
>  KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
>
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CPPFLAGS += -Qunused-arguments
>  # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
>  KBUILD_CFLAGS += -Wno-gnu
>  else
>
> --
> 2.39.0
>


-- 
Thanks,
~Nick Desaulniers
