Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B04E5EFCDA
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Sep 2022 20:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235550AbiI2SRz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Sep 2022 14:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbiI2SRy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Sep 2022 14:17:54 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA0B1F65FF
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Sep 2022 11:17:53 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a29so2147350pfk.5
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Sep 2022 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nLT1oM8QWicP3ioul090HC9HcqJUN2HR9/MOAI6jcjw=;
        b=PyxKzwY3Vk3cc+OoJNLY60fNm4G3oIvAzdZrg5zVSCSu9dJnpznTMv65rbq0o7bUs0
         aftRtgYyKLbKbW1jsThHQvsCzscd4nmC6CpORmJ11/rWWk5Z0XXcjfbhiIRvlPBTYtTu
         gfqnSfNydnHSwkxQCQv2yAcY6+mgM0PBw2YvUcZuI/+FLtAh6yUoYphJrSoporHYMaBF
         3DoYLd05iu9KcIWKevhJhxS8DIynAEjsb4U6HeL1SNOtYXEIgY3Qijlx0977uB3GAT7V
         EJ46jHXtSxVp5ByJoL+ioZ9j9X9NqrBWPyqMMVqXaztBO8N9fd4SXySfUo1erlfkBdAw
         B4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nLT1oM8QWicP3ioul090HC9HcqJUN2HR9/MOAI6jcjw=;
        b=yOcXIF0QDKztnIWpzqiu8CtQKJHUjOtnVrsFrJjuj/5eOh2RsDy4TBYL8D8gdirTew
         HLbvAn74WX7eo0n0z51IeKI9qWFRlTNvVXM2hjWyrNgUeIL0YAaGU3Io2HDVC7Nr0h/A
         iqBOkawSOzzttuI15tKdmfHevXKRWnG0Z52Iz65bcAgOSlN6neOz6LHKkUx5E3gG2hB1
         FdZGWRZY2amUdnm1NmG+sPIKXy8UdbAzlIr1NqW6GKs757Cpa01y0vzj+oS2v1Wj4Q2j
         0YU48qUXAmy6vfKCaKv8mUNiNcu2xUpTE8qqAVNJ83Pua9ctxwhf5PJsPM3eFS6W6API
         ctHQ==
X-Gm-Message-State: ACrzQf1kNfaJRwjA9csFd1X7DKJVxgXUPkimY0t2suCCRcMeDeKu5iJO
        MwN/XETuL0cR56d14s4ZC2W4G6kwA9bwa1DwwLPDGQ==
X-Google-Smtp-Source: AMsMyM7Htg0TT1qjR6Zvm2wA+9REqCpnz2fgFHOVlNGiiiHdLp5ohVQXYYynbLE39Hk59fQajP+3G5cCM7ueJSrtW8Y=
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr4077179pgi.403.1664475472752; Thu, 29
 Sep 2022 11:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220929181223.2502994-1-masahiroy@kernel.org>
In-Reply-To: <20220929181223.2502994-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 29 Sep 2022 11:17:41 -0700
Message-ID: <CAKwvOdkTSns1oWzb9QG7_=DaNF2_QstdsJeKCgAEWVMmth0XWw@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: Check if linker supports the -X option"
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
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

On Thu, Sep 29, 2022 at 11:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This reverts commit d79a27195a33f4b5e591de5536799ad874ea6cf5.
>
> According to the commit description, this ld-option test was added for
> the gold linker at that time.
>
> Commit 75959d44f9dc ("kbuild: Fail if gold linker is detected") gave
> up the gold linker support after all.
>
> I tested the BFD linker from binutils 2.23 and LLD from LLVM 11.0.0.
> Both of them support the -X option.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 49dcae886c48..d7c85ec79000 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1037,7 +1037,7 @@ KBUILD_LDFLAGS    += $(call ld-option,--no-warn-rwx-segments)
>  endif
>
>  ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
> -LDFLAGS_vmlinux        += $(call ld-option, -X,)
> +LDFLAGS_vmlinux        += -X
>  endif
>
>  ifeq ($(CONFIG_RELR),y)
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
