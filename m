Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3393CEFD9
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 01:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244464AbhGSWrN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Jul 2021 18:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387227AbhGST5L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jul 2021 15:57:11 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32961C061768
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Jul 2021 13:34:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u13so32345740lfs.11
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Jul 2021 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Fk8+31S0fHnH1ziB0T55VcQ2gIsHPuUv22CBZq7JBE=;
        b=OX5FHLjet6+SRAJ4XSnkrNOCO9j8c36OqlYSpKdQ+uH3CJsQqmrlKhV3GPYhW00StA
         2bA4iBUxBXGpchoNJ4hW8itBP5nt1XcyoZoG0q0LYC3087a43GX2YDOYo0pEfnfrcK7N
         C6dCvoe+yC0ZxBr6yIUz7UFC0yM1z8UmgUzMVB4KIg+kfsULXz+yE1RHy5cJelIv8jLb
         sJyu1J7ofICyDkY/Br896OZ4YIUPBAh/ee4kWTZ6VxSFVuit90+88xhmk0aOwL7x0CoS
         VdSabBWhP1vJkdW7mJ8XIAZLRti+4Ry9HwjxGfPiTK0xg6fpovA/T/l70Wpr2qn2Lba0
         ZzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Fk8+31S0fHnH1ziB0T55VcQ2gIsHPuUv22CBZq7JBE=;
        b=KEJ/BZ490r069kEIkiHtoQYJmRa8BPnlDGutHpkJpw7Y3AZaGO9g9NpEQZuB5pqDtb
         PZNbhAGaxUCVfShfXN+Kis7XZlCEKRnRoh5YJrLQSsID2KUGe5FwZiH7QEgJtg4maNoi
         b0O4MNva4EvWRLBSbrQ2SaqZm6s5SMjGlzLuaLuCMEyiBG8dyAG35HFgjeJC2acnLXof
         94NZPqm1qHLdNWOKTZSID9OI2aYXVqkkwTGB4gYU3qptrGomO53UNjFCY4ET7MPmd0Jl
         g4VYv/3DApLLtiS+pjNweuWnW9AHI++uzSQSYfIwKvLEs2iP6WPdqI9gp5UiJPyqjcPM
         rIyw==
X-Gm-Message-State: AOAM530ce82FAWroHe2t097p/edf99dXswZLKky06CpVROvPWAC3XB2M
        ZT1Slmepx2oFW7RMZUQ2r5u942s4IHcb3optm4FQqA==
X-Google-Smtp-Source: ABdhPJyJwTN5dBDo3nwDO5PqQM0lY/t5XyBNTZUOfCTw8kchIOEJUhA4dAPgaub/dhyJ2hV58wXSTElY5Sf9L13Ds+c=
X-Received: by 2002:a05:6512:3e0c:: with SMTP id i12mr18956149lfv.122.1626727067355;
 Mon, 19 Jul 2021 13:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625734629.git.hns@goldelico.com> <4AC1CCE9-CCAF-4D4B-BAD5-CEB9E5155FDF@goldelico.com>
In-Reply-To: <4AC1CCE9-CCAF-4D4B-BAD5-CEB9E5155FDF@goldelico.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Jul 2021 13:37:36 -0700
Message-ID: <CAKwvOd=FdZsQZCGqqpnbzgVZ+s2=ffyh337RwqyTAzHMcjUb+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Regex fixes for mips and x86 cross-compile
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Jessica Yu <jeyu@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, "H. Peter Anvin" <hpa@zytor.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, kernel@pyra-handheld.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+ Masahiro, linux-kbuild (EOM)

On Mon, Jul 19, 2021 at 12:07 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Any chance that it gets merged?
>
> > Am 08.07.2021 um 10:57 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >
> > Trying to run the x86 relocs tool on a BSD based HOSTCC (cross
> > compilation environment) leads to errors like
> >
> >  VOFFSET arch/x86/boot/compressed/../voffset.h - due to: vmlinux
> >  CC      arch/x86/boot/compressed/misc.o - due to: arch/x86/boot/compressed/../voffset.h
> >  OBJCOPY arch/x86/boot/compressed/vmlinux.bin - due to: vmlinux
> >  RELOCS  arch/x86/boot/compressed/vmlinux.relocs - due to: vmlinux
> > empty (sub)expressionarch/x86/boot/compressed/Makefile:118: recipe for target 'arch/x86/boot/compressed/vmlinux.relocs' failed
> > make[3]: *** [arch/x86/boot/compressed/vmlinux.relocs] Error 1
> >
> > and when cross compiling a MIPS kernel on a BSD based HOSTCC
> > we get errors like
> >
> >  SYNC    include/config/auto.conf.cmd - due to: .config
> > egrep: empty (sub)expression
> >  UPD     include/config/kernel.release
> >  HOSTCC  scripts/dtc/dtc.o - due to target missing
> >
> > It turns out that relocs.c on x86 uses patterns like
> >
> >       "something(|_end)"
> >
> > while MIPS uses egrep with
> >
> >       (|MINOR_|PATCHLEVEL_)
> >
> > In both cases it is not valid syntax or gives undefined results
> > according to POSIX 9.5.3 ERE Grammar
> >
> >       https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html
> >
> > It seems to be silently accepted by the Linux regcmp() or egrep
> > implementation while a BSD host complains.
> >
> > Such patterns can be replaced by a transformation like
> >
> >       "(|p1|p2)" -> "(p1|p2)?"
> >
> > Test Linux:
> >
> > root@letux:~# echo foo | egrep '^(|foo)$'
> > foo
> > root@letux:~# echo fool | egrep '^(foo)?$'
> > root@letux:~# echo fun | egrep '^(|foo)$'
> > root@letux:~# echo f | egrep '^(|foo)$'
> > root@letux:~# echo | egrep '^(|foo)$'
> >
> > root@letux:~# echo foo | egrep '^(foo)?$'
> > foo
> > root@letux:~# echo fool | egrep '^(foo)?$'
> > root@letux:~# echo fun | egrep '^(foo)?$'
> > root@letux:~# echo f | egrep '^(foo)?$'
> > root@letux:~# echo | egrep '^(foo)?$'
> >
> > root@letux:~#
> >
> > Test BSD:
> >
> > iMac:master hns$ echo foo | egrep '^(|foo)$'
> > egrep: empty (sub)expression
> > iMac:master hns$ echo fool | egrep '^(foo)?$'
> > egrep: empty (sub)expression
> > iMac:master hns$ echo fun | egrep '^(|foo)$'
> > egrep: empty (sub)expression
> > iMac:master hns$ echo f | egrep '^(|foo)$'
> > egrep: empty (sub)expression
> > iMac:master hns$ echo | egrep '^(|foo)$'
> > egrep: empty (sub)expression
> > iMac:master hns$ echo foo | egrep '^(foo)?$'
> > foo
> > iMac:master hns$ echo fool | egrep '^(foo)?$'
> > iMac:master hns$ echo fun | egrep '^(foo)?$'
> > iMac:master hns$ echo f | egrep '^(foo)?$'
> > iMac:master hns$ echo | egrep '^(foo)?$'
> >
> > iMac:master hns$
> >
> >
> > H. Nikolaus Schaller (2):
> >  x86/tools/relocs: Fix non-POSIX regexp
> >  arch: mips: Fix non-POSIX regexp
> >
> > arch/mips/Makefile      | 2 +-
> > arch/x86/tools/relocs.c | 8 ++++----
> > 2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > --
> > 2.31.1
> >
>


-- 
Thanks,
~Nick Desaulniers
