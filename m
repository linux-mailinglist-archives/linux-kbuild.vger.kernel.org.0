Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3021B2863
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 15:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728745AbgDUNrh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 09:47:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:53506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728479AbgDUNrh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 09:47:37 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91D8A20738;
        Tue, 21 Apr 2020 13:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587476856;
        bh=xwGfqpY+jSMQa7+aqhUnV5bg17fNQU268EGV84xlAog=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gcc67ApFHiPldJCLWoZ6XmF0SmsCkqA8XNL/gqdg0koH5B58AOWyp8jGs7OZjEqdl
         G0moNuTw6tpgTmoEc6KTondsaxlioxB6f2zXKI8rAUN/IC5/7GiB8BTQcduneX2o9P
         w3ThwpDNOl302kA0XTnjG+xvj/q2FGUzdMOS65h8=
Received: by mail-qk1-f172.google.com with SMTP id 20so14439166qkl.10;
        Tue, 21 Apr 2020 06:47:36 -0700 (PDT)
X-Gm-Message-State: AGi0PuYNW0oute4+N586JyPZFoDQjnfjLRJFrQR8K9wF3DT7gQQqY8mN
        UDS3RRRf7lrV0x5GLN79qNx8WvENev00dJdQoQ==
X-Google-Smtp-Source: APiQypISnv8ozS7dPUrDNXNOORNfcjGF9xC4yno1CVV5J1VOJiqF6mt7TVU8G9LyEbpZm+a+Jg2LJ5vuxnjQTc0lk5I=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr21383674qkb.393.1587476855700;
 Tue, 21 Apr 2020 06:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
In-Reply-To: <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Apr 2020 08:47:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLRWdBm24ZmL+muo4Ef8OoxkYPDNo4ksWSrnvmO_89wkA@mail.gmail.com>
Message-ID: <CAL_JsqLRWdBm24ZmL+muo4Ef8OoxkYPDNo4ksWSrnvmO_89wkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 21, 2020 at 8:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Laurent,
>
> On Tue, Apr 21, 2020 at 8:05 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Yamada-san,
> >
> > On Tue, Apr 21, 2020 at 07:45:05PM +0900, Masahiro Yamada wrote:
> > > On Tue, Apr 21, 2020 at 7:08 PM Laurent Pinchart wrote:
> > > > On Fri, Feb 28, 2020 at 06:37:30PM -0600, Rob Herring wrote:
> > > > > Most folks only run dt_binding_check on the single schema they care about
> > > > > by setting DT_SCHEMA_FILES. That means example is only checked against
> > > > > that one schema which is not always sufficient.
> > > > >
> > > > > Let's address this by splitting processed-schema.yaml into 2 files: one
> > > > > that's always all schemas for the examples and one that's just the schema
> > > > > in DT_SCHEMA_FILES for dtbs.
> > > >
> > > > This broke
> > > >
> > > > make DT_SCHEMA_FILES=Documentation/devicetree/.. dt_binding_check
> > >
> > > What is intended by
> > > "DT_SCHEMA_FILES=Documentation/devicetree/.."  ?
> >
> > My bad, I forgot to write that ... is the continuation of the string.
> > It's any yaml schema file that has an example.
>
> Ah, OK. I just input verbatim.
>
> Is it broken?
>
> You can specify any individual file(s) under Documentation/devicetree/bindings/.
>
> For example, the following worked for me.

Me too.

There is however a bug I just noticed. We're now always setting '-u'
for dtbs_check which means the core schema are never used.

Masahiro, Got a better suggestion than adding the ifeq:

ifeq ("$(origin DT_SCHEMA_FILES)", "command line")
$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
endif

Rob
