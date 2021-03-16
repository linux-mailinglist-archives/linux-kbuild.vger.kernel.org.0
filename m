Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0658233D543
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 14:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhCPNzu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 09:55:50 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:33339 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbhCPNza (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 09:55:30 -0400
Received: by mail-vs1-f51.google.com with SMTP id f1so8102077vsl.0;
        Tue, 16 Mar 2021 06:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3wUKUD0yFWquUSQ0aF+YSPLFm6XuAJmGospQPYqJX8=;
        b=XHsK4DrX3pXJQPpgpQ2FDAfxj/+xpEqhhem7yGF9/FF6ulnGRSJtVXWR3+d3qw3ToQ
         IitciApzzX6ukLFnX2ud2LEZylqJIUZg0vmWVM6XiLyOJaAAHDXkk1mHbaUvFqVH1fb3
         djdVDvsNsSfZSodozQ3XnhLPXM6HrTki/oSNO96vIQk7aTqdWftlDL/Pdrf/ardxziFi
         L2Vj8kMkI+KyohC6zApb6M/F7XjPe6DvpVwdgjsrvaqt1h5widum8al7vF5sOL/IuD6F
         WFOT1Ce9GGJlZBAzAFTap6Tdo+qEEHVXmuMc1t8quu0mce4DZeNfLBZ494g6mr3yLbdE
         9Jvg==
X-Gm-Message-State: AOAM533iVUiGPQLJkWOM/K27BOtnFR4GlKiM6jCq5QkvBmOrde5sDjBo
        /vPIG6R7KwU81SvKSN/aSv/uGCTdcCTVhW8NY/U=
X-Google-Smtp-Source: ABdhPJyQJ274DH4Dxo5JnveoBksTMt2117Vm5jcJGqpROxzRn7Xu6D1paM3dWSOkIE43jm5Q8UlLWaapjmqwUz6Fa/k=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr8604868vsr.40.1615902929927;
 Tue, 16 Mar 2021 06:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210311233640.1581526-1-robh@kernel.org> <20210311233640.1581526-2-robh@kernel.org>
In-Reply-To: <20210311233640.1581526-2-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Mar 2021 14:55:18 +0100
Message-ID: <CAMuHMdV3hG4ddXo6jBu52+2=n3mBLfbmoCzb4VRUQ8YvanH9+Q@mail.gmail.com>
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

On Fri, Mar 12, 2021 at 12:38 AM Rob Herring <robh@kernel.org> wrote:
> dt-validate has an option to warn on any compatible strings which don't
> match any schema. The option has recently been improved to fix false
> positives, so let's enable the option. This is useful for tracking
> compatibles which are undocumented or not yet converted to DT schema.
> Previously, the only check of undocumented compatible strings has been
> an imperfect checkpatch.pl check.
>
> The option is enabled by default for 'dtbs_check'. This will add more
> warnings, but some platforms are down to only a handful of these
> warnings (good job!).
>
> There's about 100 cases in the binding examples, so the option is
> disabled until these are fixed. In the meantime, they can be checked
> with:
>
> make DT_CHECKER_FLAGS=-m dt_binding_check
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

This causes lots of warning when using DT_SCHEMA_FILES, as all
compatible values in bindings not specified with DT_SCHEMA_FILES
become unknown.

Perhaps this should be disabled automatically when DT_SCHEMA_FILES
is specified?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
