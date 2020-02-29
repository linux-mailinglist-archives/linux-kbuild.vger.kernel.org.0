Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D2D1744DE
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Feb 2020 05:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgB2E0E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 23:26:04 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31730 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB2E0D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 23:26:03 -0500
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01T4PpMx004086;
        Sat, 29 Feb 2020 13:25:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01T4PpMx004086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582950353;
        bh=IoW+eWHMQIv4qeexNIpztdRvxWoV2yvFt4Xxd6pxnEg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a24IZ3FmtPkRvMlA580GkGNfecBc++M/1F753ktfq4ZOXc+XBet2zImjZNvbeOiZl
         ZGbtUK3UOWyViI+pGXur2qRCmDV3DdVJ2AuOKOrkUKV8v7o7vKurgVW26WEWybZ0G/
         s0xyCHNeWWGe8Wpss351fvzAIt3L0E00GEk3uV4b/zifDknZhhZ1BlnHH+5MSEcJfn
         fKPag6ci6seFXxtou7gIeFfLtDxyNDKpfGkJGx3BVqp0GqX+aplQamfeqeVXYiAOM/
         fTlYqglhOjDG4r9kowFEBWFBmkSU+HfzNNp1qP+4ROljJFCSeW3sMZ23aZ8YMUiGgM
         SAW+G3mh94Hkw==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id c7so1763810uaf.5;
        Fri, 28 Feb 2020 20:25:52 -0800 (PST)
X-Gm-Message-State: ANhLgQ1zgtQ0ADMioQJ7M0J1wLeo88cTy87Q2/J4KUQOjy1gCZqoVOCm
        qeYBI7aR4Wtjwn+Bvh3kQffqGWXQW6/KZeOnRuw=
X-Google-Smtp-Source: ADFU+vv6FqcwXbKV/S2bf6lXPsmnVyBfNhCNJiLTJArUffmmJYpHaoH4zAWx4RoeSQwio4rXep+GLhYhIK8qmhyUs5g=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr3730478uap.95.1582950351005;
 Fri, 28 Feb 2020 20:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org>
In-Reply-To: <20200229003731.2728-1-robh@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Feb 2020 13:25:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUbfVvYYSuMNnB2OyNbuYZkzY0gsKRybe-0P9GuYZN2w@mail.gmail.com>
Message-ID: <CAK7LNAQUbfVvYYSuMNnB2OyNbuYZkzY0gsKRybe-0P9GuYZN2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Rob,

On Sat, Feb 29, 2020 at 9:37 AM Rob Herring <robh@kernel.org> wrote:
>
> Most folks only run dt_binding_check on the single schema they care about
> by setting DT_SCHEMA_FILES. That means example is only checked against
> that one schema which is not always sufficient.
>
> Let's address this by splitting processed-schema.yaml into 2 files: one
> that's always all schemas for the examples and one that's just the schema
> in DT_SCHEMA_FILES for dtbs.
>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Masahiro, given you pretty much re-wrote this, I added you as
> Co-developed-by.



I can apply both to my kbuild tree.

Or, if you want to apply them to your tree,
please add my
Acked-by: Masahiro Yamada <masahiroy@kernel.org>


Either way is fine.

Thanks.



>
> Based on next/master
>
>  Documentation/devicetree/bindings/.gitignore |  2 +-
>  Documentation/devicetree/bindings/Makefile   | 22 +++++++++++++-------
>  scripts/Makefile.lib                         |  3 ++-
>  3 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/.gitignore b/Documentation/devicetree/bindings/.gitignore
> index ef82fcfcccab..57afa1533a5f 100644
> --- a/Documentation/devicetree/bindings/.gitignore
> +++ b/Documentation/devicetree/bindings/.gitignore
> @@ -1,2 +1,2 @@
>  *.example.dts
> -processed-schema.yaml
> +processed-schema*.yaml
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> index 646cb3525373..7c40d5ba1b51 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -2,7 +2,6 @@
>  DT_DOC_CHECKER ?= dt-doc-validate
>  DT_EXTRACT_EX ?= dt-extract-example
>  DT_MK_SCHEMA ?= dt-mk-schema
> -DT_MK_SCHEMA_FLAGS := $(if $(DT_SCHEMA_FILES), -u)
>
>  quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
>        cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
> @@ -11,26 +10,33 @@ quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
>  $(obj)/%.example.dts: $(src)/%.yaml FORCE
>         $(call if_changed,chk_binding)
>
> -DT_TMP_SCHEMA := processed-schema.yaml
> +# Use full schemas when checking %.example.dts
> +DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
>
>  quiet_cmd_mk_schema = SCHEMA  $@
>        cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(real-prereqs)
>
> -DT_DOCS = $(shell \
> +DT_DOCS = $(addprefix $(src)/, \
> +       $(shell \
>         cd $(srctree)/$(src) && \
>         find * \( -name '*.yaml' ! \
> -               -name $(DT_TMP_SCHEMA) ! \
> +               -name 'processed-schema*' ! \
>                 -name '*.example.dt.yaml' \) \
> -       )
> +       ))
>
> -DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
> +DT_SCHEMA_FILES ?= $(DT_DOCS)
>
>  ifeq ($(CHECK_DTBS),)
>  extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
>  extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
> +extra-y += processed-schema-examples.yaml
> +
> +$(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
> +       $(call if_changed,mk_schema)
>  endif
>
> -$(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
> +$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
> +$(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
>         $(call if_changed,mk_schema)
>
> -extra-y += $(DT_TMP_SCHEMA)
> +extra-y += processed-schema.yaml
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f5ff506e4a24..b12dd5ba4896 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -307,7 +307,8 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>
>  DT_CHECKER ?= dt-validate
>  DT_BINDING_DIR := Documentation/devicetree/bindings
> -DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
> +# DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
> +DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
>
>  quiet_cmd_dtb_check =  CHECK   $@
>        cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
