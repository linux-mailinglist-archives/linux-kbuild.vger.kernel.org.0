Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221864EB34F
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Mar 2022 20:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240508AbiC2S3p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Mar 2022 14:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238160AbiC2S3o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Mar 2022 14:29:44 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF1E98F47
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 11:28:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 17so24562560ljw.8
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEsaIpfGuGJOhUIm0H9UVSLgz5NQlKj2WuLYDNMMKww=;
        b=nXRNZr4s55P5NZofW2TBn4pudVrihSs1n8yDaT8QdSILssP1d1ZD1Y15RfKpi4KPTr
         Uu8E1wM9N3iviXIefra9RiwoL8WoXOC+Np8t8QlmnjAH7/i+FAyeTBDWGRyrj379EP0V
         1I6s9MFc7oCor5UNrveAGVT+vfsRG8QorrL5UbBmOz1RS5Pr/s+ns8vjbyop6NuSp19/
         fU36wpnxz+JT1p8eCZuem6nNjErOSpOQ5tTLBmcCbZG6kFGwMqY33THXBhwn0OPBkKV4
         S7E1ztBRBWxx009d0vOMIvZ2y779O+rnyAC0Vv2dA/hfoH7J9qqn6UzJ65nQ6uYu2ivo
         89Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LEsaIpfGuGJOhUIm0H9UVSLgz5NQlKj2WuLYDNMMKww=;
        b=v4keheF6xOm8zHGgAwriwJ9z4EXX18webfuqV7ipxeusXs7zn8AMytjy6OtKKfs1gg
         KHggqfE1sH+8PtflWyyMO5yKSLYEz35Wc9qoA9HLyjQLtYPbk0ItiY8sdcWeKlfKcQW3
         U3Y3bk45UD5Vsg9ZVHodbY8xXTUo3xRFuX9Iwn/r5MYcoEyhntSPnrudryD0w8apYJa1
         MosVZHu1Hjl1we6JGBUpJw6P2M7lmTqjH7RxIWomFnlPAVCdF4ofpCe2Gih5F6QDJn8/
         ErlVXTxJVkMgyb6ataILcHCdnXydPGerehwApxxwXohkOBoOqPwkHntHo+6V5XfVXvPt
         mzfQ==
X-Gm-Message-State: AOAM531DftHkcAqfy7e1pPNvQ6wcZCoU/nRQYR9oZu3QPtWQ1ytDSMm+
        STlOIPYhbB/UAv1CFt5obMGix4A0Gc2EAoVuIUbO7ACy9+eekg==
X-Google-Smtp-Source: ABdhPJxyDCbUs3P0iDO3sS8Lwqjr56z3pLlnPDMkaLKE9m1ms3Ks72/ED5j+irAip/mhuPzNFDYxQ7ecavxgAFYsRPE=
X-Received: by 2002:a2e:611a:0:b0:249:83e5:9f9b with SMTP id
 v26-20020a2e611a000000b0024983e59f9bmr3897329ljb.165.1648578479300; Tue, 29
 Mar 2022 11:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220329021520.308997-1-masahiroy@kernel.org> <20220329021520.308997-2-masahiroy@kernel.org>
In-Reply-To: <20220329021520.308997-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 29 Mar 2022 11:27:47 -0700
Message-ID: <CAKwvOdnbEVj=Y-AVSWnOT1g3jUEJdAESHjhny=5d8iXcKWgb9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: do not remove empty *.symtypes explicitly
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

On Mon, Mar 28, 2022 at 7:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Presumably, 'test -s $@ || rm -f $@' intends to remove the output when
> the genksyms command fails.
>
> It is unneeded because .DELETE_ON_ERROR automatically removes the output
> on failure.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.build | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3f2985df4d60..974bb6435826 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -135,9 +135,7 @@ genksyms = scripts/genksyms/genksyms                \
>  cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
>
>  quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
> -cmd_cc_symtypes_c =                                                         \
> -    $(call cmd_gensymtypes_c,true,$@) >/dev/null;                           \
> -    test -s $@ || rm -f $@
> +      cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@)

Was it an accident that you removed the redirection of stdout to
/dev/null here, but not also below?
If quiet_modtag silences the output, perhaps the redirection should be
dropped below as well?

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
