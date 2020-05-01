Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA711C0DCC
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 07:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbgEAFiF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 01:38:05 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59735 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFiF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:38:05 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0415bh42007654;
        Fri, 1 May 2020 14:37:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0415bh42007654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588311464;
        bh=qhr8O6PNoNTMDkn08RG5IuDq9QyyKdwASkM9IiK29Mc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PdCcHp2Yo1NVWUnq26ARCkLFPxUY2eNdoYuXaSyAv4Wdnbv03sd3DCPsfJH5GF6V1
         jE4nB/ku9cgRJrBg9MKukdWexf3kAdIpesS2dOxpmptUitWoZ2eWRd1GXMvaNq2gIk
         F14ZdaNHi7AFNx6abvoD8UYYiCKLwDtcLLmQvVITnLjrvNr1oH4ryHCS50SKj6bIJ2
         ZPLgIO7ZcCatdlqocr1Jr82ph9vAL/v3Pkb/15DZ7M5MghPr4ZEiGQLmhPZMONiDLV
         7RS5dnVjsf8JGFipG6xJrtPHhaViKsgcu8MvcVL+EsAReGDdAzJNK7qw+RrmchrqoU
         ZTkTwPEoKCt4A==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id a5so5747865vsm.7;
        Thu, 30 Apr 2020 22:37:44 -0700 (PDT)
X-Gm-Message-State: AGi0PubTVgjFeEMY2aVIoSxMi9LMDUznu0W3A3f6eT71SRXqTo+pzI8Y
        JZvgjIt9o/unfGsyi2W7VpOTeWoq4J7+xxGFXTQ=
X-Google-Smtp-Source: APiQypKXK70jwAGWQSCtSzA9rTjzc0A/nYOZPkXPg6+35qSxP5FaNSPhDTVqn0obnAejsYXllF7zxfARGRYkmL4TSJk=
X-Received: by 2002:a67:6e07:: with SMTP id j7mr2055106vsc.181.1588311463175;
 Thu, 30 Apr 2020 22:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200427141251.154129-1-masahiroy@kernel.org>
In-Reply-To: <20200427141251.154129-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 14:37:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQq6Z4Czf56EF02oA1JnFvrv=hwnPraxkfP+80hLQuqCw@mail.gmail.com>
Message-ID: <CAK7LNAQq6Z4Czf56EF02oA1JnFvrv=hwnPraxkfP+80hLQuqCw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: determine the output format of DTC by the target suffix
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 27, 2020 at 11:13 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> cmd_dtc takes the additional parameter $(2) to select the target
> format, dtb or yaml. This makes things complicated when it is used
> with cmd_and_fixdep and if_changed_rule. I actually stumbled on this.
> See commit 3d4b2238684a ("kbuild: fix DT binding schema rule again to
> avoid needless rebuilds").
>
> Extract the suffix part of the target instead of passing the parameter.
> Fortunately, this works for both $(obj)/%.dtb and $(obj)/%.dt.yaml .
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



Applied to linux-kbuild.


> ---
>
>  scripts/Makefile.lib | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 12f6a331a8f3..cd52a8c6428f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -287,13 +287,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>         $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> -       $(DTC) -O $(2) -o $@ -b 0 \
> +       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> -       $(call if_changed_dep,dtc,dtb)
> +       $(call if_changed_dep,dtc)
>
>  DT_CHECKER ?= dt-validate
>  DT_BINDING_DIR := Documentation/devicetree/bindings
> @@ -304,7 +304,7 @@ quiet_cmd_dtb_check =       CHECK   $@
>        cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
>
>  define rule_dtc
> -       $(call cmd_and_fixdep,dtc,yaml)
> +       $(call cmd_and_fixdep,dtc)
>         $(call cmd,dtb_check)
>  endef
>
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
