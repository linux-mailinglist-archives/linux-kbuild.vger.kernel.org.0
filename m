Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E97A6545C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Dec 2022 18:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiLVRvO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Dec 2022 12:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiLVRvN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Dec 2022 12:51:13 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA792111F
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Dec 2022 09:51:12 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d82so1714509pfd.11
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Dec 2022 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ir+NOeunegWBFgMdpVr6IERtYeXv7QPwh+4VeaHIc2s=;
        b=fnyiYHJ61BvkoFKP642PuC4+sz09mMW4pSP1DD1m3U4f/khEIQRXYi9KFHMtWhzq4M
         Irrb66e5c8qdk6EZMGpv/W1aRalwGXC/Gcj7knrozwW3L+Q3tPsTQkBwZUQ+88DNorv9
         hRKq2QKqdu4myCAwdDybTLJbtwpK+bsmIn2yuHxAKuXCvuo78PQA9uyM/yEEJH5KLQes
         oEL1sQipkFKYpPiI+8nxXvtB4Tugyj0MnPTsIcRlu929jkxYA+XqH7jcS1/Su1FApIX2
         zi15ik7Zy6WcA7qPs/Tqh8sJDYyPv4x1sy3Al9D2UdwRILKUK5JtWn3bp0UaJx+OnrRT
         tvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ir+NOeunegWBFgMdpVr6IERtYeXv7QPwh+4VeaHIc2s=;
        b=iwEg1dvAsI1O1fqw54b+wXQBY3zvVaLx7bc1jJJMNL5lzbVO8TBv065Ah63GJfKr3m
         dGV1rUYCD4dnkr4gB5lmb+/VNpBW16zLIbW9EFwf3lKkOKzIJbrAFNUatQthk+y5Khsq
         3fcXRXMJFxI4zOixd8t2BjT01FElI2cnDXjg82MeLXWYHJJgmqARIdgloOey/Bh16Qut
         9RkGqXBKZGb4wQwvZ0aUvGYovQTtOEHfQUjJEsxZAi0ld2o/kjtDPgxZma4hVseWOIgx
         Ff6wctKSNA8Z/qSA3kJkRrjl2sJQ0okAO4AhdhlpH+fWdg1av0E9hNvcpyhx3mqlzEgF
         N//Q==
X-Gm-Message-State: AFqh2krC3bGhG3mUE58Gaa6WeJHFssKbepLhu59MHrgWX6l+TJDbcNd7
        1e2GClGecfhbXpoy3D8SEm0R5Sy3Ocn3SLj+TqHRxw==
X-Google-Smtp-Source: AMrXdXtLCR+XjuWbjIT/TBN/oxtbugMK0VGc4HPX25kpium9rXq7t6hC0axwkXz6uCKOZuk4ZBEc/rhdG75xJw/zOIc=
X-Received: by 2002:a63:4943:0:b0:478:e6cf:c24c with SMTP id
 y3-20020a634943000000b00478e6cfc24cmr482923pgk.365.1671731472157; Thu, 22 Dec
 2022 09:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20221222162535.1578462-1-masahiroy@kernel.org>
In-Reply-To: <20221222162535.1578462-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 22 Dec 2022 09:51:00 -0800
Message-ID: <CAKwvOdkN1b1gfQ=FP2-PUq-c=ycOwB27y-0eG2bmDzXuFOu1hA@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: refactor silent mode detection
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
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

On Thu, Dec 22, 2022 at 8:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Factor out $(findstring s,...).
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 25247f931872..e8ce3e2b30d6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -100,12 +100,12 @@ endif
>  # make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
>
>  ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> -silence:=$(findstring s,$(firstword -$(MAKEFLAGS)))
> +short-opts := $(firstword -$(MAKEFLAGS))
>  else
> -silence:=$(findstring s,$(filter-out --%,$(MAKEFLAGS)))
> +short-opts := $(filter-out --%,$(MAKEFLAGS))
>  endif
>
> -ifeq ($(silence),s)
> +ifneq ($(findstring s,$(short-opts)),)
>  quiet=silent_
>  KBUILD_VERBOSE = 0
>  endif
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
