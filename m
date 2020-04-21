Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BCB1B28E4
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 16:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgDUOBq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 10:01:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:59138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDUOBq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 10:01:46 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E94A20679;
        Tue, 21 Apr 2020 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587477705;
        bh=0/vQA+06myS9w12zgVJltCpDyjHNAbrJL3ofBd0iyqs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kz2e4XnCFbk6VbsPQIcV3zjxNZYM1a1OFHKEbEfX5WpOIqCu/yjJc77Os4fCLubWH
         hwXo4yyb2Zt0yN9I+jIPm4gmEMxvcxttbUkhOpv24NSGy4uoFaDDyCnqReFSVsfFoT
         e6HZDtycaaBEFfILCfF2uUY8ePnHTnHk4Iub9BL4=
Received: by mail-qt1-f177.google.com with SMTP id z90so11555406qtd.10;
        Tue, 21 Apr 2020 07:01:45 -0700 (PDT)
X-Gm-Message-State: AGi0PuZcaT/3kcrQN37gTePm6VV8yx9ue128eOAXLyyOQfeGeWc5PdpR
        eTthRMhQR3CkvZG1Hg5Og06Q04xS0JK7n3yj1g==
X-Google-Smtp-Source: APiQypKbFgwXWO0X+MdJIdqnmE60P1/zCgH5EWDZARwe6ZtYF6Vf583clemWqHDkdhmu0JX82hpeUDHUlbCtHKEhIMA=
X-Received: by 2002:aed:3ac8:: with SMTP id o66mr9578884qte.110.1587477704278;
 Tue, 21 Apr 2020 07:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com>
In-Reply-To: <20200421134654.GD5983@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Apr 2020 09:01:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
Message-ID: <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 21, 2020 at 8:47 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yamada-san,
>
> On Tue, Apr 21, 2020 at 10:15:02PM +0900, Masahiro Yamada wrote:
> > On Tue, Apr 21, 2020 at 8:05 PM Laurent Pinchart wrote:
> > > On Tue, Apr 21, 2020 at 07:45:05PM +0900, Masahiro Yamada wrote:
> > > > On Tue, Apr 21, 2020 at 7:08 PM Laurent Pinchart wrote:
> > > > > On Fri, Feb 28, 2020 at 06:37:30PM -0600, Rob Herring wrote:
> > > > > > Most folks only run dt_binding_check on the single schema they care about
> > > > > > by setting DT_SCHEMA_FILES. That means example is only checked against
> > > > > > that one schema which is not always sufficient.
> > > > > >
> > > > > > Let's address this by splitting processed-schema.yaml into 2 files: one
> > > > > > that's always all schemas for the examples and one that's just the schema
> > > > > > in DT_SCHEMA_FILES for dtbs.
> > > > >
> > > > > This broke
> > > > >
> > > > > make DT_SCHEMA_FILES=Documentation/devicetree/.. dt_binding_check
> > > >
> > > > What is intended by
> > > > "DT_SCHEMA_FILES=Documentation/devicetree/.."  ?
> > >
> > > My bad, I forgot to write that ... is the continuation of the string.
> > > It's any yaml schema file that has an example.
> >
> > Ah, OK. I just input verbatim.
> >
> > Is it broken?
> >
> > You can specify any individual file(s) under Documentation/devicetree/bindings/.
> >
> > For example, the following worked for me.
> >
> > $ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml
> >  dt_binding_check
> >   HOSTCC  scripts/basic/fixdep
> >   HOSTCC  scripts/dtc/dtc.o
> >   HOSTCC  scripts/dtc/flattree.o
> >   HOSTCC  scripts/dtc/fstree.o
> >   HOSTCC  scripts/dtc/data.o
> >   HOSTCC  scripts/dtc/livetree.o
> >   HOSTCC  scripts/dtc/treesource.o
> >   HOSTCC  scripts/dtc/srcpos.o
> >   HOSTCC  scripts/dtc/checks.o
> >   HOSTCC  scripts/dtc/util.o
> >   LEX     scripts/dtc/dtc-lexer.lex.c
> >   YACC    scripts/dtc/dtc-parser.tab.[ch]
> >   HOSTCC  scripts/dtc/dtc-lexer.lex.o
> >   HOSTCC  scripts/dtc/dtc-parser.tab.o
> >   HOSTCC  scripts/dtc/yamltree.o
> >   HOSTLD  scripts/dtc/dtc
> >   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
> >   DTC     Documentation/devicetree/bindings/arm/psci.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/arm/psci.example.dt.yaml
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
>
> This is getting interesting.
>
> ~/src/kernel/linux $ make O=output/x86 DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml dt_binding_check
> make[1]: Entering directory '/home/laurent/src/kernel/linux/output/x86'
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
>   HOSTCC  scripts/dtc/fstree.o
>   HOSTCC  scripts/dtc/data.o
>   HOSTCC  scripts/dtc/livetree.o
>   HOSTCC  scripts/dtc/treesource.o
>   HOSTCC  scripts/dtc/srcpos.o
>   HOSTCC  scripts/dtc/checks.o
>   HOSTCC  scripts/dtc/util.o
>   LEX     scripts/dtc/dtc-lexer.lex.c
>   YACC    scripts/dtc/dtc-parser.tab.[ch]
>   HOSTCC  scripts/dtc/dtc-lexer.lex.o
>   HOSTCC  scripts/dtc/dtc-parser.tab.o
>   HOSTCC  scripts/dtc/yamltree.o
>   HOSTLD  scripts/dtc/dtc
>   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
>   DTC     Documentation/devicetree/bindings/arm/psci.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/arm/psci.example.dt.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> make[1]: Leaving directory '/home/laurent/src/kernel/linux/output/x86'
>
> ~/src/kernel/this_is_a_long_directory_name/linux $ make O=output/x86 DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml dt_binding_check
> make[1]: Entering directory '/home/laurent/src/kernel/this_is_a_long_directory_name/linux/output/x86'
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
>   HOSTCC  scripts/dtc/fstree.o
>   HOSTCC  scripts/dtc/data.o
>   HOSTCC  scripts/dtc/livetree.o
>   HOSTCC  scripts/dtc/treesource.o
>   HOSTCC  scripts/dtc/srcpos.o
>   HOSTCC  scripts/dtc/checks.o
>   HOSTCC  scripts/dtc/util.o
>   LEX     scripts/dtc/dtc-lexer.lex.c
>   YACC    scripts/dtc/dtc-parser.tab.[ch]
>   HOSTCC  scripts/dtc/dtc-lexer.lex.o
>   HOSTCC  scripts/dtc/dtc-parser.tab.o
>   HOSTCC  scripts/dtc/yamltree.o
>   HOSTLD  scripts/dtc/dtc
>   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
> make[2]: execvp: /bin/sh: Argument list too long
> make[2]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Documentation/devicetree/bindings/Makefile:38: Documentation/devicetree/bindings/processed-schema-examples.yaml] Error 127
> make[1]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Makefile:1300: dt_binding_check] Error 2
> make[1]: Leaving directory '/home/laurent/src/kernel/this_is_a_long_directory_name/linux/output/x86'
> make: *** [Makefile:180: sub-make] Error 2
>
> It seems to only fail with out of tree builds (O=...). I expect that
> failures will become more common the more YAML bindings we have, even
> without long directory names.

dt-mk-schema can take and recurse a single directory already, so does
this fix it for you:

@@ -22,7 +22,7 @@ $(obj)/%.example.dts: $(src)/%.yaml
check_dtschema_version FORCE
 DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml

 quiet_cmd_mk_schema = SCHEMA  $@
-      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
$(real-prereqs)
+      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
$(srctree)/$(src)

 DT_DOCS = $(addprefix $(src)/, \
        $(shell \
