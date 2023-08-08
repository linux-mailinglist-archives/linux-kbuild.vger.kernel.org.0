Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6FB7749C6
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Aug 2023 22:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbjHHUDa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Aug 2023 16:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbjHHUDD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Aug 2023 16:03:03 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470D38DC4A
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 11:21:53 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-56401f1da3dso3429174a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Aug 2023 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691518913; x=1692123713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JmyLEGU8GSveXQW4ZwKDzQ9yMdM7AfBAEdQ4m4LJOnQ=;
        b=abrxRrd0sYsjaDd1GRFKwJ9nlXO94DqGiXr7ZuKo+O01p4pxbRXCrBUFBLE1aDmbQ3
         wsY30SOQzfkNzCj/bCy9Xt9DI51lUoBHtGGM3JQsYlVsay/aEPrVmh+N2zbcFjhoL01U
         QkRjaFpVb1xh95xm8xeq9ILUL05tHSizKuNgaoQ1IKIOSYY1gCVmaHqUawsleyjGbQp5
         1NMyoBj+bpqFpT0oflORFjNhiXRIZJ22UIbUa4WvKepS/SuimNUV5cWrxAXCP9qNiTc1
         70F0VrWks96BEVtPx3J5dYiY5oE/LzDGQ6l/JHo8VUMC+YYQcRpfrDgRFiqhPMMPwVeO
         35ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691518913; x=1692123713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmyLEGU8GSveXQW4ZwKDzQ9yMdM7AfBAEdQ4m4LJOnQ=;
        b=BBfUU6cdgzLz2OVbEzW/V1W48wPXKTHVI+I53sYQ2bbYkxHSt/3sNvpTBrr5tMB6V/
         b08fhFcsk2igZ9+eBj8gOUAAlHOByEgxfJrFox6eIU0v57W5iZpuiJ0E3wEY1B5WuDFs
         FGqStGJTkxz42iCD91imIFlD6kYhYDTUbPKmKt3d/gs8fcdWXeW+W1vsHANoL1kYGtl9
         gSNwuAJIUJNDKxjViQeygi7SBULs53lCfvvNr7i3cKEqjnzj4fXGFY1OdAOAqviuRVIf
         ZjIg1wAqGiGEZNxddzjSwRwdlEXtO9M1CLFrfz/xRP5vRMtiU/QBhPe/UcQWng0ar4qD
         jy2g==
X-Gm-Message-State: AOJu0YyyeTGhvn4XnNLH9GXq1OAWG/FbvVjtHgtKZHA7b1Buv8a/bmPy
        o5gMEKAc5B2/asSlpqXKMk7yPg==
X-Google-Smtp-Source: AGHT+IG/n51ocBB6FRywFFitnfbQeW9iCANzsfD18QE1l0UvN+OO0XnZsX2w3M7ClY3FnmZNCDy5EA==
X-Received: by 2002:a05:6a00:14d6:b0:686:7621:5494 with SMTP id w22-20020a056a0014d600b0068676215494mr242443pfu.27.1691518912493;
        Tue, 08 Aug 2023 11:21:52 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b0065e154bac6dsm8365280pfe.133.2023.08.08.11.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 11:21:52 -0700 (PDT)
Date:   Tue, 8 Aug 2023 11:21:47 -0700
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 2/2] UML: use obj-y to descend into arch/um/*/
Message-ID: <ZNKHu4+MlO3L6wUl@google.com>
References: <20230721171857.3612639-1-masahiroy@kernel.org>
 <20230721171857.3612639-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721171857.3612639-2-masahiroy@kernel.org>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 22, 2023 at 02:18:57AM +0900, Masahiro Yamada wrote:
> The single build rule does not work with the core-y syntax. [1]
> 
> Use the standard obj-y syntax.
> 
> [1]: https://lore.kernel.org/linux-kbuild/d57ba55f-20a3-b836-783d-b49c8a161b6e@kernel.org/T/#m7bc402e1e038f00ebcf2e92ed7fcb8a52fc1ea44
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This resolves an issue I reported (but doesn't seem to be on lore
for linux-kbuild...)

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> 
> Changes in v2:
>   - Rephase the commit log
> 
>  arch/um/Kbuild   | 2 ++
>  arch/um/Makefile | 4 ----
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/um/Kbuild b/arch/um/Kbuild
> index a4e40e534e6a..6cf0c1e5927b 100644
> --- a/arch/um/Kbuild
> +++ b/arch/um/Kbuild
> @@ -1 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-y += kernel/ drivers/ os-Linux/
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 1735a562453d..82f05f250634 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -22,10 +22,6 @@ ARCH_DIR := arch/um
>  # features.
>  SHELL := /bin/bash
>  
> -core-y			+= $(ARCH_DIR)/kernel/		\
> -			   $(ARCH_DIR)/drivers/		\
> -			   $(ARCH_DIR)/os-Linux/
> -
>  MODE_INCLUDE	+= -I$(srctree)/$(ARCH_DIR)/include/shared/skas
>  
>  HEADER_ARCH 	:= $(SUBARCH)
> -- 
> 2.39.2
> 
