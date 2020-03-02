Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 945E1175F2D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 17:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgCBQG5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 11:06:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:39240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgCBQG5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 11:06:57 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EABD321D56;
        Mon,  2 Mar 2020 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583165216;
        bh=FWnUygv4/e1NB0NjtQw9OUCpn5jXkAg3i3qDLFQvqeg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=V1sDNg9CvFoV8bJgnkeS33MRYvUFepx168eHn9Y/5c49pJ5uP0fJMKVNng23NvOyY
         GH5ykhG5qknLhHAs88H7h8I/3GmLkOMO5CnEyJcQLzNv0koc2iW1UFUxbPS6V4gjdM
         Xaif95jUOSjn+lXGWUnZ/gGYAmZEpZNxRkhZdb3o=
Received: by mail-qk1-f169.google.com with SMTP id h22so167024qke.5;
        Mon, 02 Mar 2020 08:06:55 -0800 (PST)
X-Gm-Message-State: ANhLgQ3H0yqaitlgweQRkAg4JwaJjyMUKNyHRA/fKSAu8gMtTtnjSfLe
        jw/elXENjdaBciLmtO93+MURt07yz90EwNZWJw==
X-Google-Smtp-Source: ADFU+vveAKlcmb+GxNy59Dg0McC+KzfuES95yHvrgexZ+1FIEOPRyOG/VO3EajCNvz5KDZVs+HvnXMFh5PXyf7k45Ho=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr41673qkg.152.1583165214969;
 Mon, 02 Mar 2020 08:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <CAK7LNAQUbfVvYYSuMNnB2OyNbuYZkzY0gsKRybe-0P9GuYZN2w@mail.gmail.com>
In-Reply-To: <CAK7LNAQUbfVvYYSuMNnB2OyNbuYZkzY0gsKRybe-0P9GuYZN2w@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 2 Mar 2020 10:06:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLqZYZXGg8-FnoV8EFKSK8moQjEWe93+FazEbh9GTxQpw@mail.gmail.com>
Message-ID: <CAL_JsqLqZYZXGg8-FnoV8EFKSK8moQjEWe93+FazEbh9GTxQpw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 28, 2020 at 10:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
> On Sat, Feb 29, 2020 at 9:37 AM Rob Herring <robh@kernel.org> wrote:
> >
> > Most folks only run dt_binding_check on the single schema they care about
> > by setting DT_SCHEMA_FILES. That means example is only checked against
> > that one schema which is not always sufficient.
> >
> > Let's address this by splitting processed-schema.yaml into 2 files: one
> > that's always all schemas for the examples and one that's just the schema
> > in DT_SCHEMA_FILES for dtbs.
> >
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: linux-kbuild@vger.kernel.org
> > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Masahiro, given you pretty much re-wrote this, I added you as
> > Co-developed-by.
>
>
>
> I can apply both to my kbuild tree.

Please apply to your tree.

Rob

>
> Or, if you want to apply them to your tree,
> please add my
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>
>
> Either way is fine.
>
> Thanks.
>
>
>
> >
> > Based on next/master
> >
> >  Documentation/devicetree/bindings/.gitignore |  2 +-
> >  Documentation/devicetree/bindings/Makefile   | 22 +++++++++++++-------
> >  scripts/Makefile.lib                         |  3 ++-
> >  3 files changed, 17 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/.gitignore b/Documentation/devicetree/bindings/.gitignore
> > index ef82fcfcccab..57afa1533a5f 100644
> > --- a/Documentation/devicetree/bindings/.gitignore
> > +++ b/Documentation/devicetree/bindings/.gitignore
> > @@ -1,2 +1,2 @@
> >  *.example.dts
> > -processed-schema.yaml
> > +processed-schema*.yaml
> > diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> > index 646cb3525373..7c40d5ba1b51 100644
> > --- a/Documentation/devicetree/bindings/Makefile
> > +++ b/Documentation/devicetree/bindings/Makefile
> > @@ -2,7 +2,6 @@
> >  DT_DOC_CHECKER ?= dt-doc-validate
> >  DT_EXTRACT_EX ?= dt-extract-example
> >  DT_MK_SCHEMA ?= dt-mk-schema
> > -DT_MK_SCHEMA_FLAGS := $(if $(DT_SCHEMA_FILES), -u)
> >
> >  quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
> >        cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
> > @@ -11,26 +10,33 @@ quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
> >  $(obj)/%.example.dts: $(src)/%.yaml FORCE
> >         $(call if_changed,chk_binding)
> >
> > -DT_TMP_SCHEMA := processed-schema.yaml
> > +# Use full schemas when checking %.example.dts
> > +DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
> >
> >  quiet_cmd_mk_schema = SCHEMA  $@
> >        cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(real-prereqs)
> >
> > -DT_DOCS = $(shell \
> > +DT_DOCS = $(addprefix $(src)/, \
> > +       $(shell \
> >         cd $(srctree)/$(src) && \
> >         find * \( -name '*.yaml' ! \
> > -               -name $(DT_TMP_SCHEMA) ! \
> > +               -name 'processed-schema*' ! \
> >                 -name '*.example.dt.yaml' \) \
> > -       )
> > +       ))
> >
> > -DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
> > +DT_SCHEMA_FILES ?= $(DT_DOCS)
> >
> >  ifeq ($(CHECK_DTBS),)
> >  extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
> >  extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
> > +extra-y += processed-schema-examples.yaml
> > +
> > +$(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
> > +       $(call if_changed,mk_schema)
> >  endif
> >
> > -$(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
> > +$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
> > +$(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
> >         $(call if_changed,mk_schema)
> >
> > -extra-y += $(DT_TMP_SCHEMA)
> > +extra-y += processed-schema.yaml
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index f5ff506e4a24..b12dd5ba4896 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -307,7 +307,8 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> >
> >  DT_CHECKER ?= dt-validate
> >  DT_BINDING_DIR := Documentation/devicetree/bindings
> > -DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
> > +# DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
> > +DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
> >
> >  quiet_cmd_dtb_check =  CHECK   $@
> >        cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
> > --
> > 2.20.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
