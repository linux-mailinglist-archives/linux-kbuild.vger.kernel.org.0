Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FF11B2756
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 15:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbgDUNQC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 09:16:02 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33235 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgDUNQB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 09:16:01 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 03LDFdQZ018599;
        Tue, 21 Apr 2020 22:15:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 03LDFdQZ018599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587474940;
        bh=1BJDwjQB7G9abt/U83QIzg6NdbKts7PDKbztJPZLt24=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R4QCTuNWwDcRuz/yFMQzdJrCSA76pdP2s/cDiBVD5Z+/M3lOILBBGiX/2YPt7zt1U
         qu1Y22pf/YFAXeopWFf+3iA69wYrgNFIVy35lw9bM+Xi6NSEPyTkHx1H7tdNhYAzzb
         5/o5luAv8lx1faPRdAkWUVISO5iMEnJYQrw1XZkQYFHSF+UyFCeqDCmNen9WbZlNbJ
         tLh9X5xxaxh+kY3jR1ahCXUFOh9hSkuQsZ65OV7eh/OTRmrgWhv3Yk2R2W/E/ryWIs
         UeGM/Wxs3XPHYCf1F7KNIdWrJVI++PKO7Ku4d9yOZkohZjefX6jvikrcOGS7FgXQeU
         Mi0w/1yq2doug==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id l25so5664910vso.6;
        Tue, 21 Apr 2020 06:15:39 -0700 (PDT)
X-Gm-Message-State: AGi0Pubg0rmu81Q+7jxh9s+R6H/FPtMGaB7PA61kOHX/FETMYFKapvfE
        hjO9Z19S82EQk70gu10CAP1vSXACcOAITOvGRkc=
X-Google-Smtp-Source: APiQypJ05lC28dt8eVxZ6JdJ6omCKZaDtWBRo8fc27BPU7748NxdblRCMr93fcGZvmIWPGHtU7QQVCQLHWCmSiv0jBQ=
X-Received: by 2002:a67:3293:: with SMTP id y141mr16095552vsy.54.1587474938732;
 Tue, 21 Apr 2020 06:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com> <20200421110537.GC5983@pendragon.ideasonboard.com>
In-Reply-To: <20200421110537.GC5983@pendragon.ideasonboard.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 21 Apr 2020 22:15:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
Message-ID: <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
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

Hi Laurent,

On Tue, Apr 21, 2020 at 8:05 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yamada-san,
>
> On Tue, Apr 21, 2020 at 07:45:05PM +0900, Masahiro Yamada wrote:
> > On Tue, Apr 21, 2020 at 7:08 PM Laurent Pinchart wrote:
> > > On Fri, Feb 28, 2020 at 06:37:30PM -0600, Rob Herring wrote:
> > > > Most folks only run dt_binding_check on the single schema they care about
> > > > by setting DT_SCHEMA_FILES. That means example is only checked against
> > > > that one schema which is not always sufficient.
> > > >
> > > > Let's address this by splitting processed-schema.yaml into 2 files: one
> > > > that's always all schemas for the examples and one that's just the schema
> > > > in DT_SCHEMA_FILES for dtbs.
> > >
> > > This broke
> > >
> > > make DT_SCHEMA_FILES=Documentation/devicetree/.. dt_binding_check
> >
> > What is intended by
> > "DT_SCHEMA_FILES=Documentation/devicetree/.."  ?
>
> My bad, I forgot to write that ... is the continuation of the string.
> It's any yaml schema file that has an example.

Ah, OK. I just input verbatim.

Is it broken?

You can specify any individual file(s) under Documentation/devicetree/bindings/.

For example, the following worked for me.

$ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml
 dt_binding_check
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTCC  scripts/dtc/yamltree.o
  HOSTLD  scripts/dtc/dtc
  CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  DTC     Documentation/devicetree/bindings/arm/psci.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/arm/psci.example.dt.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml


-- 
Best Regards
Masahiro Yamada
