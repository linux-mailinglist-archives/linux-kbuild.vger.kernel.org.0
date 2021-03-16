Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FE133D5D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 15:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbhCPOez (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 10:34:55 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:34171 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbhCPOet (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 10:34:49 -0400
Received: by mail-vs1-f42.google.com with SMTP id m18so18345213vsa.1;
        Tue, 16 Mar 2021 07:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/CaSMW6mHvMrxRGMwX6vygFCDnZG5TgrFBraedQTtk=;
        b=PrDyyZg2UfAEzGcBFrl1w92AHkIj9PUG/BhCw3rHLE4vqye2bl3HNxfr7QimV4bRvW
         JlK1zWmiw3R5DjSvZssnGEqaA/5q693zHmRvtHKTQ68w8d8ff3/Bf/q4r1nMIfNfvKgH
         hRJB8mk3dkLwBIaJBN/r6ycCgp4uC0MdAAkE/Ik4YZPVe8QX1uPAILX+jCKF9wTzSn+N
         56KZQITvbL/1qtbLmAhDSyEBYeqrFlo2bzCZy2FHz8rS8hfKdB2IOOg6aXPHKdaz82/N
         Nvs6krsikL+lY6V+0zJKSDPbaTAGF+CQ3tXXkwUugYfvRHs94ZWWrLC9IWCpU4WtLM37
         K6GA==
X-Gm-Message-State: AOAM530Hk46ZJg2+RjQ34Otd7AwuPremo7Hj6gPUovMRKx1WWtiw4jm5
        6H1HJvOUo5p2DyfUyPsCBVoTVr6pLIL9vIgAD8MXijt5
X-Google-Smtp-Source: ABdhPJzA7gtqTSfS56UqGIGIxOsCspglJmqVjbp97rZLkCPKdRRzc2Qqe0tPHbwiHYbsIaRSAu/aZok4oBvcEwC3ax8=
X-Received: by 2002:a67:8883:: with SMTP id k125mr9034488vsd.18.1615905289017;
 Tue, 16 Mar 2021 07:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210311233640.1581526-1-robh@kernel.org> <20210311233640.1581526-2-robh@kernel.org>
 <CAMuHMdV3hG4ddXo6jBu52+2=n3mBLfbmoCzb4VRUQ8YvanH9+Q@mail.gmail.com> <CAL_JsqKPgB+Zz4VHd9dn27bdiZgE=_QUem8BR76Vfc6Y3G8GVw@mail.gmail.com>
In-Reply-To: <CAL_JsqKPgB+Zz4VHd9dn27bdiZgE=_QUem8BR76Vfc6Y3G8GVw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Mar 2021 15:34:37 +0100
Message-ID: <CAMuHMdXqnHq+zdpdr3y7NO-a_JCT-ogfTKDnLLOhFb-UWiGwrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Enable DT undocumented compatible checks
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Rob,

On Tue, Mar 16, 2021 at 3:28 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Mar 16, 2021 at 7:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Mar 12, 2021 at 12:38 AM Rob Herring <robh@kernel.org> wrote:
> > > dt-validate has an option to warn on any compatible strings which don't
> > > match any schema. The option has recently been improved to fix false
> > > positives, so let's enable the option. This is useful for tracking
> > > compatibles which are undocumented or not yet converted to DT schema.
> > > Previously, the only check of undocumented compatible strings has been
> > > an imperfect checkpatch.pl check.
> > >
> > > The option is enabled by default for 'dtbs_check'. This will add more
> > > warnings, but some platforms are down to only a handful of these
> > > warnings (good job!).
> > >
> > > There's about 100 cases in the binding examples, so the option is
> > > disabled until these are fixed. In the meantime, they can be checked
> > > with:
> > >
> > > make DT_CHECKER_FLAGS=-m dt_binding_check
> > >
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > Cc: Michal Marek <michal.lkml@markovi.net>
> > > Cc: linux-kbuild@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > This causes lots of warning when using DT_SCHEMA_FILES, as all
> > compatible values in bindings not specified with DT_SCHEMA_FILES
> > become unknown.
> >
> > Perhaps this should be disabled automatically when DT_SCHEMA_FILES
> > is specified?
>
> Indeed. I'll fix it up like this:
>
> index 90b095c60f79..ad6938468c11 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -360,7 +360,7 @@ $(overlay-y): FORCE
>  $(call multi_depend, $(overlay-y), .dtb, -dtbs)
>
>  DT_CHECKER ?= dt-validate
> -DT_CHECKER_FLAGS ?= -m
> +DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),,-m)
>  DT_BINDING_DIR := Documentation/devicetree/bindings
>  # DT_TMP_SCHEMA may be overridden from
> Documentation/devicetree/bindings/Makefile
>  DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.json

Thanks, works like a charm!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
