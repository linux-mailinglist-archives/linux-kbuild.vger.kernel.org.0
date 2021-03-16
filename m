Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F8B33D5B7
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 15:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236359AbhCPO2b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 10:28:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236329AbhCPO2W (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 10:28:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D371265077;
        Tue, 16 Mar 2021 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615904902;
        bh=wkSrBKdNWAHtJxgJmqjHzbBlDY57aoKm8HHoVta4vNM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FX9kDJox7LuQN6Qu+9QOS66uRXa/8miZL6BlpcoUCjBBGsPLD58w4fGd/jInkzMk4
         XnosimNbiMYzyR3NTcD/sD0pSBB0pw914noD2Y1+KVMWavN6Qrs/Fpa4RHXitkqH7B
         hLdzgaspndb/gquy7joQSnH4+OmEIAvAxBdhvkQ3q4AVyR2kwzZ2ZcKHNBtekutbnQ
         Faa5DcuITtg6bFUZhGJsJTOqYDtbxt7CWr1pJ8F1s7OjanHN0ZPaPXYRhN65QGiJwJ
         /TEUjLf8KDWiwA1WGv052Tz1I/Yl8G4IGjwwa9+9nez4n6Sx1uL5B34Kssw1cNv1ty
         y9CZ6RDcqnT5w==
Received: by mail-ed1-f51.google.com with SMTP id z1so21767124edb.8;
        Tue, 16 Mar 2021 07:28:21 -0700 (PDT)
X-Gm-Message-State: AOAM533hgV90EU27SKvTezqwlgy1MRIV0o9TwBl7Nqww7uGogebJ6e8i
        8hFuYLtK9FNsT6Yd9izi8g9gnRWxJoReysR9Yg==
X-Google-Smtp-Source: ABdhPJwbS1s033mZJD7SdGWGIunKqJyUclrhFERdEYWiJfPCzFm23oAkrhWagF4fyPhISZ4GPVRzApF61Y9jCqphNSA=
X-Received: by 2002:a05:6402:5252:: with SMTP id t18mr23129485edd.258.1615904900408;
 Tue, 16 Mar 2021 07:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210311233640.1581526-1-robh@kernel.org> <20210311233640.1581526-2-robh@kernel.org>
 <CAMuHMdV3hG4ddXo6jBu52+2=n3mBLfbmoCzb4VRUQ8YvanH9+Q@mail.gmail.com>
In-Reply-To: <CAMuHMdV3hG4ddXo6jBu52+2=n3mBLfbmoCzb4VRUQ8YvanH9+Q@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 16 Mar 2021 08:28:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKPgB+Zz4VHd9dn27bdiZgE=_QUem8BR76Vfc6Y3G8GVw@mail.gmail.com>
Message-ID: <CAL_JsqKPgB+Zz4VHd9dn27bdiZgE=_QUem8BR76Vfc6Y3G8GVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Enable DT undocumented compatible checks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Mar 16, 2021 at 7:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Fri, Mar 12, 2021 at 12:38 AM Rob Herring <robh@kernel.org> wrote:
> > dt-validate has an option to warn on any compatible strings which don't
> > match any schema. The option has recently been improved to fix false
> > positives, so let's enable the option. This is useful for tracking
> > compatibles which are undocumented or not yet converted to DT schema.
> > Previously, the only check of undocumented compatible strings has been
> > an imperfect checkpatch.pl check.
> >
> > The option is enabled by default for 'dtbs_check'. This will add more
> > warnings, but some platforms are down to only a handful of these
> > warnings (good job!).
> >
> > There's about 100 cases in the binding examples, so the option is
> > disabled until these are fixed. In the meantime, they can be checked
> > with:
> >
> > make DT_CHECKER_FLAGS=-m dt_binding_check
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Thanks for your patch!
>
> This causes lots of warning when using DT_SCHEMA_FILES, as all
> compatible values in bindings not specified with DT_SCHEMA_FILES
> become unknown.
>
> Perhaps this should be disabled automatically when DT_SCHEMA_FILES
> is specified?

Indeed. I'll fix it up like this:

index 90b095c60f79..ad6938468c11 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -360,7 +360,7 @@ $(overlay-y): FORCE
 $(call multi_depend, $(overlay-y), .dtb, -dtbs)

 DT_CHECKER ?= dt-validate
-DT_CHECKER_FLAGS ?= -m
+DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),,-m)
 DT_BINDING_DIR := Documentation/devicetree/bindings
 # DT_TMP_SCHEMA may be overridden from
Documentation/devicetree/bindings/Makefile
 DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.json

Rob
