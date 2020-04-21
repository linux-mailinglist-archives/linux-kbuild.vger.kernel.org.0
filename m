Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D551B2E5B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 19:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgDURcp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 13:32:45 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42597 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgDURcp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 13:32:45 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 03LHWKKK009931;
        Wed, 22 Apr 2020 02:32:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 03LHWKKK009931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587490341;
        bh=w+FkBWSxdJfk+gQYc3vC+kfqkzyu3JW5i4DO7aCm4rc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cnQALd3u72XLpZgFQM6SjwaNYDt5QXERxpbhrhfOxwoNMcgcHz/4kHqQ0486V9+BZ
         Q0mAVGSoBubJzyK9VMim+/2FCtUdBiQgT7QXSltivUOB8zA867SVYs69j5Zj7sGrun
         2OQeCeMTWZoyr55rhhQT8kWcG+6E2mZ0ds5CMwgHx//NCoCZYY8fRR1+B/G4sTJl36
         zkHecGks3V2De3QKrzT6Bx6gYMZajPNLcwmwK7q5SO48Jz6cv/KWEIPAAJ2AVTcOJ1
         kC1DYinxIyqS01Ll6ofb0ZTWmVSou+qyihvsoNh1ynoXTL3cefic590bBrfvcn7gwL
         uEMH/105fzg3g==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id f7so1683422vkl.6;
        Tue, 21 Apr 2020 10:32:21 -0700 (PDT)
X-Gm-Message-State: AGi0PubyyonXaUJYok4BTQOUhjxYsJqu7uU5R+1MoDEBDmnkCj3wS5E+
        KMOZ/Cj3ILpsZDafa4qKpB3L+GAYcqj8HFUcfgs=
X-Google-Smtp-Source: APiQypL2bAyUw7xOZG/bAmVIw4ki7IfVUhK3uyAoLzDu3dFZZmrMYL2N73egZQc+Okzxk3aFLG+lMPk0EKuGO/5VRT4=
X-Received: by 2002:a1f:32cf:: with SMTP id y198mr16239376vky.96.1587490340093;
 Tue, 21 Apr 2020 10:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <CAL_JsqLRWdBm24ZmL+muo4Ef8OoxkYPDNo4ksWSrnvmO_89wkA@mail.gmail.com>
In-Reply-To: <CAL_JsqLRWdBm24ZmL+muo4Ef8OoxkYPDNo4ksWSrnvmO_89wkA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Apr 2020 02:31:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARu1hTM6r-w4gf4nuWXfori62Y5t8mFDKjkhBe2MRMD4Q@mail.gmail.com>
Message-ID: <CAK7LNARu1hTM6r-w4gf4nuWXfori62Y5t8mFDKjkhBe2MRMD4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Rob,

On Tue, Apr 21, 2020 at 10:47 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 21, 2020 at 8:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi Laurent,
> >
> > On Tue, Apr 21, 2020 at 8:05 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Yamada-san,
> > >
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
>
> Me too.
>
> There is however a bug I just noticed. We're now always setting '-u'
> for dtbs_check which means the core schema are never used.
>
> Masahiro, Got a better suggestion than adding the ifeq:
>
> ifeq ("$(origin DT_SCHEMA_FILES)", "command line")
> $(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
> endif


Hmm, this does not work when DT_SCHEMA_FILES is
passed as the environment variable.


ifneq ("$(origin DT_SCHEMA_FILES)", "file")
$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
endif

... should work, I think.


Maybe, the following also works. Please choose whatever you like.

diff --git a/Documentation/devicetree/bindings/Makefile
b/Documentation/devicetree/bindings/Makefile
index 1df680d07461..a939bb18f66b 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -2,6 +2,7 @@
 DT_DOC_CHECKER ?= dt-doc-validate
 DT_EXTRACT_EX ?= dt-extract-example
 DT_MK_SCHEMA ?= dt-mk-schema
+DT_MK_SCHEMA_USERONLY_FLAG := $(if $(DT_SCHEMA_FILES), -u)

 quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
       cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
@@ -37,7 +38,7 @@ override DTC_FLAGS := \
 $(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
        $(call if_changed,mk_schema)

-$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
+$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS :=
$(DT_MK_SCHEMA_USERONLY_FLAG)
 $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
        $(call if_changed,mk_schema)



-- 
Best Regards
Masahiro Yamada
