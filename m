Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9912F1B242D
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 12:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgDUKqN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 06:46:13 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57506 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgDUKqM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 06:46:12 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 03LAjgof002832;
        Tue, 21 Apr 2020 19:45:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 03LAjgof002832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587465943;
        bh=T9c2GsgnlNfN37qKbAJxXgYKUvwzLDJJ5mznsfWY9wc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Qh2674gFzPlWyY8LN7794CQEcJIFt7sun6hr2JXWAGafj502+BnA/U9E1udg34NgU
         KfJlP8llkLEH4bKvLYsBZpY9vMU/OOf9QT9Cx/O9fIGCIrQegxUx0d/sYim6MnP6eq
         HfU3Zd4llIxMsbXUgN2i7C6WkPneRnUwgLv7FXW91Wu+UqJ3zQjbjibF0rDqkGdpdN
         XrSoxAE2ENInTBP9XNg+iCsuAz5546B+2BlNv+4nJujZPmKE5Kf4PfMpG995U0tgQP
         H+PcAFasf6CHPwb7Xy8TS8G1MjhJmoQxtYJ3ZsOwGMOLA08FZliGSHsHsQmheqrKsJ
         B6Bi8KKPkIx7g==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id 10so3463276vkr.7;
        Tue, 21 Apr 2020 03:45:43 -0700 (PDT)
X-Gm-Message-State: AGi0PuZbVX0tU1/GJ0JQd1r8VcLOTTbHBhikGMyygKnVTevSGSxckxXw
        6pbEEZwVYkQn25yAf+LLHZ5OnJsurAE525RBBSg=
X-Google-Smtp-Source: APiQypKL2cViNRNJA8M6+gKTwq1E3CZUqP0Be+AN28CIqnIp1KgBPB8TD1Bbb0EuhDokzSbkopDZ+7C815mOzxnEZl4=
X-Received: by 2002:a1f:d182:: with SMTP id i124mr14032762vkg.26.1587465941773;
 Tue, 21 Apr 2020 03:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
In-Reply-To: <20200421100749.GA5429@pendragon.ideasonboard.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 21 Apr 2020 19:45:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
Message-ID: <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 21, 2020 at 7:08 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Fri, Feb 28, 2020 at 06:37:30PM -0600, Rob Herring wrote:
> > Most folks only run dt_binding_check on the single schema they care about
> > by setting DT_SCHEMA_FILES. That means example is only checked against
> > that one schema which is not always sufficient.
> >
> > Let's address this by splitting processed-schema.yaml into 2 files: one
> > that's always all schemas for the examples and one that's just the schema
> > in DT_SCHEMA_FILES for dtbs.
>
> This broke
>
> make DT_SCHEMA_FILES=Documentation/devicetree/.. dt_binding_check

What is intended by
"DT_SCHEMA_FILES=Documentation/devicetree/.."  ?




>
> for me :-(
>
> make[1]: Entering directory '/home/laurent/src/linux/output/arm32'
> make[2]: execvp: /bin/sh: Argument list too long
> make[2]: *** [/home/laurent/src/linux/Documentation/devicetree/bindings/Makefile:35: Documentation/devicetree/bindings/processed-schema-examples.yaml] Error 127
> make[1]: *** [/home/laurent/src/linux/Makefile:1296: dt_binding_check] Error 2
> make[1]: Leaving directory '/home/laurent/src/linux/output/arm32'
> make: *** [Makefile:180: sub-make] Error 2
>
> Before the patch, dt-mk-schema was called with DT_SCHEMA_FILES only, and
> it is now called with DT_DOCS unconditionally.
>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: linux-kbuild@vger.kernel.org
> > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Masahiro, given you pretty much re-wrote this, I added you as
> > Co-developed-by.
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
> >       $(call if_changed,chk_binding)
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
> > +     $(shell \
> >       cd $(srctree)/$(src) && \
> >       find * \( -name '*.yaml' ! \
> > -             -name $(DT_TMP_SCHEMA) ! \
> > +             -name 'processed-schema*' ! \
> >               -name '*.example.dt.yaml' \) \
> > -     )
> > +     ))
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
> > +     $(call if_changed,mk_schema)
> >  endif
> >
> > -$(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
> > +$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
> > +$(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
> >       $(call if_changed,mk_schema)
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
> >  quiet_cmd_dtb_check =        CHECK   $@
> >        cmd_dtb_check =        $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Best Regards
Masahiro Yamada
