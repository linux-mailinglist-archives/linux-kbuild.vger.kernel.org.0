Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A831744DB
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Feb 2020 05:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgB2ERV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 23:17:21 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37137 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgB2ERV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 23:17:21 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01T4H5gh014497;
        Sat, 29 Feb 2020 13:17:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01T4H5gh014497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582949826;
        bh=ozwqPj1PB8R+TkXvQLc4SA7la0S/SMRrpEdge2Jd6EE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C0f+gqaIYxm/M4FDVvtxabgINNq2ru4vGIdrQS87Bw+C1EFl1L5pJQEgq2D1xPIgQ
         ySE9fJzNowhf01v9FDOEQQjaxpzrYGvEnA1EK/EbnlOdYHL0mBET2XpHkb2pKSZqIA
         HTdPCldAnbXgGB48ZcTX28KpMKlvwDIXNv37uhos1P8Px3LOy7uPPb1v0hpI/XocQj
         jS9pZeDmExUsRVvyeMOft6cPgqJr/I5GLVqILQCgSJMmJ3096HXBBf1ukjp8gCkZiF
         JHICZiK9Amsldkt4zLrRpkLpIGC9btsgeWCTC9D7WenYvrYcfJrXRuo/RgJGTOlLKa
         SeXbbI7BA0VUQ==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id 7so3291745vsr.10;
        Fri, 28 Feb 2020 20:17:06 -0800 (PST)
X-Gm-Message-State: ANhLgQ1BxaRSZVts7r5502XmUUC9cBE++oACMqqvGpJFyfqV7ejqVBLm
        JqwwgbkqiqqNrJIQomlLJ91IkZChl+OUIXFkAAA=
X-Google-Smtp-Source: ADFU+vsRHPSCrxOxF68PVThJanUZMU17UddC9LE+Qr2pjcyoxlmDlBY/PGEML7CKt5w5N7u4kIj9uhEGoEx/82zjNv4=
X-Received: by 2002:a67:fa4b:: with SMTP id j11mr4366136vsq.155.1582949825234;
 Fri, 28 Feb 2020 20:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20200228172015.44369-1-qperret@google.com>
In-Reply-To: <20200228172015.44369-1-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Feb 2020 13:16:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQniztgAbF8N_OK+BJmaVUTVzhYmnY0-u1R_VsfEdOkTA@mail.gmail.com>
Message-ID: <CAK7LNAQniztgAbF8N_OK+BJmaVUTVzhYmnY0-u1R_VsfEdOkTA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYM
To:     Quentin Perret <qperret@google.com>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 29, 2020 at 2:20 AM Quentin Perret <qperret@google.com> wrote:
>
> The current norm on Android and many other systems is for vendors to
> introduce significant changes to their downstream kernels, and to
> contribute very little (if any) code back upstream. The Generic Kernel
> Image (GKI) project in Android attempts to improve the status-quo by
> having a unique kernel for all android devices of the same architecture,
> regardless of the SoC vendor. The key idea is to make all interested
> parties agree on a common solution, and contribute their code upstream
> to make it available to use by the wider community.
>
> The kernel-to-drivers ABI on Android devices varies significantly from
> one vendor kernel to another today because of changes to exported
> symbols, dependencies on vendor symbols, and surely other things. The
> first step for GKI is to try and put some order into this by agreeing on
> one version of the ABI that works for everybody.
>
> For practical reasons, we need to reduce the ABI surface to a subset of
> the exported symbols, simply to make the problem realistically solvable,
> but there is currently no upstream support for this use-case.
>
> As such, this series attempts to improve the situation by enabling users
> to specify a symbol 'whitelist' at compile time. Any symbol specified in
> this whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is
> set, even if it has no in-tree user. The whitelist is defined as a
> simple text file, listing symbols, one per line.


Series, applied to linux-kbuild.

Thanks.


> v6:
>  - made permission checks on the whitelist file more robust (Masahiro)
>  - better style/identation in Makefile (Masahiro)
>
> v5:
>  - made sure to be POSIX-compliant (+ tested with dash and posh)
>  - added failure path if the whitelist path is incorrect (Matthias,
>    Nicolas)
>  - collected Acked-By (and other) tags from Nicolas and Matthias
>
> v4:
>  - removed [[]] bash-specific pattern from the scripts (Nicolas)
>  - use $CONFIG_SHELL consistently in all patches (Masahiro)
>  - added shortlog for initial generation of autoksyms.h (Masahiro)
>  - added comment on how 'eval' expands the whitelist path (Masahiro)
>
> v3:
>  - added a cover letter to explain why this is in fact an attempt to
>    help upstream in the long term (Christoph)
>  - made path relative to the kernel source tree (Matthias)
>  - made the Kconfig help text less confusing (Jessica)
>  - added patch 02 and 03 to optimize build time when a whitelist is
>    provided
>
> v2:
>  - make sure to quote the whitelist path properly (Nicolas)
>
> Quentin Perret (3):
>   kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
>   kbuild: split adjust_autoksyms.sh in two parts
>   kbuild: generate autoksyms.h early
>
>  Makefile                    |  7 +++--
>  init/Kconfig                | 13 ++++++++++
>  scripts/adjust_autoksyms.sh | 24 +++--------------
>  scripts/gen_autoksyms.sh    | 52 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+), 22 deletions(-)
>  create mode 100755 scripts/gen_autoksyms.sh
>
> --
> 2.25.1.481.gfbce0eb801-goog
>


-- 
Best Regards
Masahiro Yamada
