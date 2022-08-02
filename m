Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C336C58811A
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Aug 2022 19:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiHBRgB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Aug 2022 13:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiHBRf7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Aug 2022 13:35:59 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5905BBCAD
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Aug 2022 10:35:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y11so22934798lfs.6
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Aug 2022 10:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMSbpoPgZo1nXG06BELKlRTAIPdpj4wofQosM2wSXKI=;
        b=r3PRTJMvCLPoJ7ojXKsINdDqMe3s1XbeycrpPF6SPPTi308tOITiHq4rgU+dsSHoqE
         Y6oiG1cSBCWCQTeFKT385yv56/VzNeK2w4JMLu0FO+4WYt2w6T+fRZV7WfuAcgJiMceP
         gpIHJny2a9YmJJ3xud4kx75xOKezDrfDjsWXSJzxfa+PSUyYWfFpIe2n40hrW/FitCGM
         1fcEkrLlf2GibxJvp90oY3KJFe9ZkDDaMfGDhJh/CFU6Q+P36NMthgr5vWvGnYDHxezO
         UKGFLmfvnbohg3S14jjl1pa3vfTep/gsPjDCsQdIy3A0LLbHlQkkjUowxqVA6olX+jAe
         kMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMSbpoPgZo1nXG06BELKlRTAIPdpj4wofQosM2wSXKI=;
        b=co6qcZUDiaUHds0kQhBROeZQ6rLs9d+Y3KKElAu5Pg+c46EKCyKVCjkzWVAraIJYlU
         SV/FdkYSLKuvWb1xuEgtIPJkbWMSgEN+qZATx+BUB/jNXKXb3ctS1BSEOFwjL/GXYCIX
         VGX4kQq/JszbJB4dr22tzwqqbikRJdVsLL8/i5CdghWueTBQXSr45TlEDVZCngp1lGM0
         eMXiPDpmv4Mr8RxQuSRMDdQbttdpKxbJaSKPgwmCEeYMmJWOLde4GtOVdQDZR/8QDXvB
         EFv/dyeYDZMgje5XsPBY73FXlhhHKym3c5TUZYFPTjzxyD6pP6KBYNGo/vhaGk9hP65b
         OBZQ==
X-Gm-Message-State: ACgBeo2jert0LscNqNm+CVBobj+9Div5H0rTQuUPWfhHSTKWxZLRWxDx
        0nsy+MgA7SqC+f8o1kGx6sNI6l9Ve6f8JdddoJuzeA==
X-Google-Smtp-Source: AGRyM1s5fn8r1OS8bSQ7BGQMtJRW4mpj0vVcOawjZ0SJoS3KoP9R1J3iBmnRwCT7BaVVLrI2T9kdeYqYZTy29ZZLFKU=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr8481056lfr.647.1659461755489; Tue, 02
 Aug 2022 10:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220726165204.3363120-1-masahiroy@kernel.org>
In-Reply-To: <20220726165204.3363120-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 2 Aug 2022 10:35:44 -0700
Message-ID: <CAKwvOdkjcaxK7N0T-PUbfjvMqpftEXG2QQJ7NsqxgidwuPko1g@mail.gmail.com>
Subject: Re: [PATCH] modpost: remove unused Elf_Sword macro
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
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

On Tue, Jul 26, 2022 at 9:53 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 9ad21c3f3ecf ("kbuild: try harder to find symbol names in
> modpost") added Elf_Sword (in a wrong way), but did not use it at all.
>
> BTW, the current code looks weird.
>
> The fix for the 32-bit part would be:
>
>     Elf64_Sword    -->    Elf32_Sword
>
> (weirdness in the prefix, Elf32_ vs Elf64_)
>
> The fix for the 64-bit part would be:
>
>     Elf64_Sxword   -->    Elf64_Sword
>
> (the size is different between Sword and Sxword)
>
> Note:
>
>     Elf32_Sword   ==  Elf64_Sword   ==  int32_t
>     Elf32_Sxword  ==  Elf64_Sxword  ==  int64_t
>
> Anyway, let's drop unused code instead of fixing it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 68cd4aeeae3d..620f2fd08e05 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -26,7 +26,6 @@
>  #define Elf_Shdr    Elf32_Shdr
>  #define Elf_Sym     Elf32_Sym
>  #define Elf_Addr    Elf32_Addr
> -#define Elf_Sword   Elf64_Sword
>  #define Elf_Section Elf32_Half
>  #define ELF_ST_BIND ELF32_ST_BIND
>  #define ELF_ST_TYPE ELF32_ST_TYPE
> @@ -41,7 +40,6 @@
>  #define Elf_Shdr    Elf64_Shdr
>  #define Elf_Sym     Elf64_Sym
>  #define Elf_Addr    Elf64_Addr
> -#define Elf_Sword   Elf64_Sxword
>  #define Elf_Section Elf64_Half
>  #define ELF_ST_BIND ELF64_ST_BIND
>  #define ELF_ST_TYPE ELF64_ST_TYPE
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
