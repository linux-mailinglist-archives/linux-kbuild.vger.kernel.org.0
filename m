Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB194F4F32
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Apr 2022 03:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442950AbiDFAmb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Apr 2022 20:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457629AbiDEQUj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 12:20:39 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9939BA193
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Apr 2022 09:18:38 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t25so24116092lfg.7
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Apr 2022 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIU2TEaS8WXbUqpi1fM6EfmEmwnBi19lD4NhlLBz3ig=;
        b=H8/4Lx4V0XygDs2dccjNd7TS7BtZ2fMSdr3xp4cjLVJj1pIAG8E/lefcRKdKOVEcDq
         0K+DG1Xns7N/k3s/nBe/9wCZfncNH69qMkDM9XvpXMRkvH+bCU2KCXleFNDWKjkqewpk
         IPy2hfj/pbDYC90dDuVUsKY0KS75145Wb2v/078FGCGX71uwEW/JGKMcMqr+9Cj2bPOp
         HKSXu5vKjskeXytHF25DvAkVsnlFk15eVE4zcractjvW8tvGzunroHoHyGFtu1iB8E40
         C7FXx+WgMFYFECMibHGBn5OK/9VMXK53nQXr/V6k+ni5i/+X5vRXaQu+vE2tXjFzGv2x
         SYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIU2TEaS8WXbUqpi1fM6EfmEmwnBi19lD4NhlLBz3ig=;
        b=49WkdJo2t+vp042rBdaZzN0rZtU2h/q2cr04mLDTUhvFKo1z7iAXHHrBf/KoBwSTs5
         zSsxaFu0uku4r5symXt1MuzJrSiOHAaXavV4fYss7LBJ2wUTB3TBXcc9CteJJNC84rnl
         N+EfdOMJJOBJR4ZI/kH70KSS+2mTD7wo+Qd5YiSJuKkuM62EvvE7THigroAAQ1TjvmEd
         lshRNZUm3MpZDWCURwYbnSHHqd5Dq75XDEM+8kapHYyrRsFupZUdDUzzOrtVHxXLIpVq
         D4IpSYzMtQzb3C9rw6Wg0uSYr05KBUN+HRGMcs38iCU321OAcDwNUDXr0zylYLPYV6kN
         Rz8w==
X-Gm-Message-State: AOAM5329WKUnNR7j6Fa6cTe1lp1zIhcIG2ZKbdXPpE/DLPuapuqfEoZ/
        y2MjB3q4aDzCZwn+c5zJgD/ENIaeaqhvTfQ68a7G1g==
X-Google-Smtp-Source: ABdhPJzyIXHKLyRxKNDc0gfAZnnCNVmFVcYvD3pwWFNRifi2q7UjxoNx7BuehqH/sa8M5LtAyeh2d+vmVolrtFy4p0A=
X-Received: by 2002:a05:6512:3da1:b0:44a:2aeb:28e4 with SMTP id
 k33-20020a0565123da100b0044a2aeb28e4mr3016271lfv.579.1649175515578; Tue, 05
 Apr 2022 09:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220405113359.2880241-1-masahiroy@kernel.org> <20220405113359.2880241-3-masahiroy@kernel.org>
In-Reply-To: <20220405113359.2880241-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 5 Apr 2022 09:18:23 -0700
Message-ID: <CAKwvOd=13RwpvTQ5O86aQkyrGVSbqJkCWwsvU+DbRsGiKNS71A@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] kbuild: do not remove empty *.symtypes explicitly
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Tue, Apr 5, 2022 at 4:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Presumably, 'test -s $@ || rm -f $@' intends to remove the output when
> the genksyms command fails.
>
> It is unneeded because .DELETE_ON_ERROR automatically removes the output
> on failure.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - Fix accidental drop of '> /dev/null'
>
>  scripts/Makefile.build | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 31e0e33dfe5d..3ef2373f0a57 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -135,9 +135,7 @@ genksyms = scripts/genksyms/genksyms                \
>  cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
>
>  quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
> -cmd_cc_symtypes_c =                                                         \
> -    $(call cmd_gensymtypes_c,true,$@) >/dev/null;                           \
> -    test -s $@ || rm -f $@
> +      cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
>
>  $(obj)/%.symtypes : $(src)/%.c FORCE
>         $(call cmd,cc_symtypes_c)
> @@ -348,9 +346,7 @@ cmd_gensymtypes_S =                                                         \
>      $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
>
>  quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
> -cmd_cc_symtypes_S =                                                         \
> -    $(call cmd_gensymtypes_S,true,$@) >/dev/null;                           \
> -    test -s $@ || rm -f $@
> +      cmd_cc_symtypes_S = $(call cmd_gensymtypes_S,true,$@) >/dev/null
>
>  $(obj)/%.symtypes : $(src)/%.S FORCE
>         $(call cmd,cc_symtypes_S)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
