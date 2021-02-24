Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CBF323B43
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 12:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbhBXL1g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Feb 2021 06:27:36 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46809 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234428AbhBXL1c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Feb 2021 06:27:32 -0500
Received: by mail-ot1-f49.google.com with SMTP id k13so1759987otn.13;
        Wed, 24 Feb 2021 03:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ihzmy8wLHJ+Ka8D82jECfgw9aSGEAXyEzPKmvC2YQNk=;
        b=hHlrvvMUVkOvJNyYgG/h8pRJgNHwmR4OpCxB/70rVEUXrGIW3DYwZOa6s7uh+9XHex
         9PHn0mUlyv+uk0NKovr3egS5Utq4N5EVGGQpPzomeZ+CTuiv3WR5PGIBoJNodS3XggKp
         JN3XCKyxbbS5vYgfbpksD1j3f+lKjN/8EedSVAdeT+gdQnKy9EquzLJ+73p3qSuvpkXE
         jLjTQ5wFY0wi0uCKYs80f60/06nfKVGSC5NIjWhd1mvCndcuMxxD19poAcPq15xzkIze
         hHnE6zhLG1gFakW9ibwafyGzVbJWeDh9m7Y1wiqjfST9FEW1DP2qD+Q+LP8sKJRcfo+E
         2KAg==
X-Gm-Message-State: AOAM530+TGAUElYMCtChAlliYgFZ19AU3Z1T0Y3QsNaNlhonf+vMPvXF
        Yedwbb6HYDX2980vDd5RAO8OcPqWGMJpGo9ugEhaOPorDYM=
X-Google-Smtp-Source: ABdhPJwUYE7bxPVB80HS5ZT0of+KV/qAezNt+3eZsEB/2DkVxU4QgYLwSD1krEyN+4Hvh2cR/DfJ6DUQ/cLQmtK8V4I=
X-Received: by 2002:a9d:328:: with SMTP id 37mr1670671otv.250.1614166011963;
 Wed, 24 Feb 2021 03:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20210223181425.4010665-1-robh@kernel.org> <20210223181425.4010665-4-robh@kernel.org>
In-Reply-To: <20210223181425.4010665-4-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Feb 2021 12:26:40 +0100
Message-ID: <CAMuHMdVyP4ZfXy_sjCb2NbHRSWz1DFo06Q4MD4DsiL0ASLsGgA@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: Add a build check for missing gitignore entries
To:     Rob Herring <robh@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Rob,

On Tue, Feb 23, 2021 at 7:18 PM Rob Herring <robh@kernel.org> wrote:
> Any non-phony targets need to be in gitignore. The normal way to check
> this is doing an in-tree build and running git-status which is easy to
> miss. Git provides an easy way to check whether a file is ignored with
> git-check-ignore. Let's add a build time check using it. If the build is
> not in a git tree, the check will silently fail.
>
> This also has the side effect of a sanity check for 'always-y',
> 'extra-y' and 'targets' entries which are not correctly marked as PHONY
> or have the wrong path.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

After removing the .git directory from my repository clone, or
removing the git command from $PATH:

    scripts/Makefile.lib:106: scripts/basic/fixdep is missing gitignore entry
    scripts/Makefile.lib:106: scripts/sorttable is missing gitignore entry
    [...]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
