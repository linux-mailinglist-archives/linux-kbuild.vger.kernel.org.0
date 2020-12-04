Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880FD2CE4CF
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 02:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgLDBOI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 20:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgLDBOH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 20:14:07 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961B8C061A4F
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 17:13:27 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id o7so2197965pjj.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 17:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AOrxpQhrFGHGfq5Ytdkq3w2p+LsOF6MEvdPgcjVv8Sc=;
        b=dYGhk5TPgQApAfyW6kfJli7dLYhltigAJySRYODCTXwN6s84B2b2u4W2hH/iP8xJ/m
         JE++NMo0IX3GB+PeYMV3jPc9HtYKbO0To21Yq5a/KOZ6LqPoi5eVr6pxMXiNHNisCZon
         u2+awhutYMwSbdthSL0VZiDlUphO7pIt0Y76MhUECIi9w+rGqPqBxqrCcLb8TSVaV7oP
         3oEUJqAvNu4i3/p43tYaYPkHgMsRIg0pSXedxfzaO62wGJd10VqYSNjtBWcXKP1jG5l7
         GbphKQbQ1V9Ur0wLXRt0DSr/j9VLJJmw9aex3bO5ucsTfiqTWCwY8yweBXdMqaEb/8Bh
         Cpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AOrxpQhrFGHGfq5Ytdkq3w2p+LsOF6MEvdPgcjVv8Sc=;
        b=Z4l0O/2flMj34Gx2Bv3N4UYW2CFIa2WlG7CA9ceOrMWdcwVoRthkrJcOpe6EkrZhTo
         aQZOudqZGR/TXVLo8Ja8TNH6bzH2Kw1d3xPu3agCOCVeoIITLdLfOhWRz+r4o7fo+3Do
         Di0muI/zqI7Tyb4tVMgkFVOYs84o0joWKJdp53bICf7EwbcExfJSbo/1UTEWaSnge0QO
         MkLikEzq38XpHsAXFutYo4fYJ2pd5+e1JqhB1b6QCL9AmgZNOjB5k1oPI/WYu8NMl301
         9BUHkWWTZYrVwp1iexhWcQgVfNamvKNg3r6rkCDl6Ruh19AF9Iq76anPieVRqcbX/LN6
         ZskA==
X-Gm-Message-State: AOAM532qxpNv9x3jZgqDcgD8arNtOOKobG+VFgwstyrwR1eGIFp8pae8
        msf+Wr35sECGWebRxN5ve8l6S8rSeoyVrSx7DtoghA==
X-Google-Smtp-Source: ABdhPJyzfkwgqUusexMknWv78y5y3238oFye3JoAxnJ83aVDDVd7MrMGO2rhZxY1dJFj2cdiPL+jvIOWACKbueUb8c8=
X-Received: by 2002:a17:90a:6fa1:: with SMTP id e30mr1834860pjk.32.1607044406943;
 Thu, 03 Dec 2020 17:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20201204011129.2493105-1-ndesaulniers@google.com> <20201204011129.2493105-3-ndesaulniers@google.com>
In-Reply-To: <20201204011129.2493105-3-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 3 Dec 2020 17:13:15 -0800
Message-ID: <CAKwvOdkZEiHK01OD420USb0j=F0LcrnRbauv9Yw26tu-GRbYkg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Kbuild: DWARF v5 support
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Clifton <nickc@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sigh...I ran a broken script to send the series which doesn't cc folks properly.
+ lkml, linux-kbuild
(Might just resend, properly)

On Thu, Dec 3, 2020 at 5:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> DWARF v5 is the latest standard of the DWARF debug info format.
>
> DWARF5 wins significantly in terms of size when mixed with compression
> (CONFIG_DEBUG_INFO_COMPRESSED).
>
> Link: http://www.dwarfstd.org/doc/DWARF5.pdf
>
> Patch 1 is a cleanup that lays the ground work and isn't DWARF
> v5 specific.
> Patch 2 implements Kconfig and Kbuild support for DWARFv5.
>
> Changes from v2:
> * Drop two of the earlier patches that have been accepted already.
> * Add measurements with GCC 10.2 to commit message.
> * Update help text as per Arvind with help from Caroline.
> * Improve case/wording between DWARF Versions as per Masahiro.
>
> Changes from the RFC:
> * split patch in 3 patch series, include Fangrui's patch, too.
> * prefer `DWARF vX` format, as per Fangrui.
> * use spaces between assignment in Makefile as per Masahiro.
> * simplify setting dwarf-version-y as per Masahiro.
> * indent `prompt` in Kconfig change as per Masahiro.
> * remove explicit default in Kconfig as per Masahiro.
> * add comments to test_dwarf5_support.sh.
> * change echo in test_dwarf5_support.sh as per Masahiro.
> * remove -u from test_dwarf5_support.sh as per Masahiro.
> * add a -gdwarf-5 cc-option check to Kconfig as per Jakub.
>
> Nick Desaulniers (2):
>   Kbuild: make DWARF version a choice
>   Kbuild: implement support for DWARF v5
>
>  Makefile                          | 15 +++++++------
>  include/asm-generic/vmlinux.lds.h |  6 +++++-
>  lib/Kconfig.debug                 | 35 ++++++++++++++++++++++++++-----
>  scripts/test_dwarf5_support.sh    |  9 ++++++++
>  4 files changed, 53 insertions(+), 12 deletions(-)
>  create mode 100755 scripts/test_dwarf5_support.sh
>
> --
> 2.29.2.576.ga3fc446d84-goog
>


-- 
Thanks,
~Nick Desaulniers
