Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E893931C68A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 07:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhBPGmZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Feb 2021 01:42:25 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38728 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhBPGmY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Feb 2021 01:42:24 -0500
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11G6fSQu001971;
        Tue, 16 Feb 2021 15:41:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11G6fSQu001971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613457689;
        bh=sfEE88E8zodGl9pgVL//ZMGChpopWqeKDKHn6Cpcy54=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PkvY1OsYFbDoHrMrTFk1iWkoCU6CzfhWm0+T7ju+7X5DNc0Gbv/dRZBWytpjZPxeX
         9+Ur3FKFvOQsHHSxsQ3z1gYSPP+YMP2cpM6oLMrUs5zVNlWWNS8HJObnJyKs+finWl
         XeYOA9dUDtQdVaDEmuaiC3p3C/ZM08w6/4AUK3HiGl+WiZ2Czn9wizT2yumJHZIaNG
         HKkVw6o/UX2NFl1JCCHkik7dE+458UiJKnSyN5PuSGGTiLppwdjfijbYRzAZ1Mtopi
         N/w0v2nkgl95EgMEkVDP52KTBuDqqwWtiWQWlZWKvOgwS3EImruhUz8Qo2mVjpX5gs
         TuDNgsZ4+b52A==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id e9so4973068plh.3;
        Mon, 15 Feb 2021 22:41:29 -0800 (PST)
X-Gm-Message-State: AOAM533YjMySGlO+/2g3NuKr9Hx5fcVZtILLN6O5BeKBJVDiCTZhaqZG
        z2NpLxAcDdrLtVNcxuOwNqk2FerbsDIftaizZpo=
X-Google-Smtp-Source: ABdhPJxktul2aMlFBFsBcXxpJLNBs4w78dVlT+Nlq3vElgchqmiUh0YSY2itIW2Wvc00Fq9L/x5cgR2OPr0Nf5j8Cg8=
X-Received: by 2002:a17:90b:1b50:: with SMTP id nv16mr2648284pjb.153.1613457688393;
 Mon, 15 Feb 2021 22:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20210211161154.3892836-1-masahiroy@kernel.org> <20210211171908.GA3820685@ubuntu-m3-large-x86>
In-Reply-To: <20210211171908.GA3820685@ubuntu-m3-large-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 16 Feb 2021 15:40:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgjCtXT1ZmTs-nLpLBmpvQSLA+FQHazP+trBgQcvcqcQ@mail.gmail.com>
Message-ID: <CAK7LNATgjCtXT1ZmTs-nLpLBmpvQSLA+FQHazP+trBgQcvcqcQ@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: prune some directories
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 2:19 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Feb 12, 2021 at 01:11:54AM +0900, Masahiro Yamada wrote:
> > If directories are passed to gen_compile_commands.py, os.walk() traverses
> > all the subdirectories to search for .cmd files, but we know some of them
> > are not worth traversing.
> >
> > Use the 'topdown' parameter of os.walk to prune them.
> >
> > Documentation about the 'topdown' option of os.walk:
> >   When topdown is True, the caller can modify the dirnames list
> >   in-place (perhaps using del or slice assignment), and walk() will
> >   only recurse into the subdirectories whose names remain in dirnames;
> >   this can be used to prune the search, impose a specific order of
> >   visiting, or even to inform walk() about directories the caller
> >   creates or renames before it resumes walk() again. Modifying
> >   dirnames when topdown is False has no effect on the behavior of
> >   the walk, because in bottom-up mode the directories in dirnames
> >   are generated before dirpath itself is generated.
> >
> > This commit prunes four directories, .git, Documentation, include, and
> > tools.
> >
> > The first three do not contain any C files. My main motivation is the
> > last one, tools/ directory.
> >
> > Commit 6ca4c6d25949 ("gen_compile_commands: do not support .cmd files
> > under tools/ directory") stopped supporting the tools/ directory.
> > The current code no longer picks up .cmd files from the tools/
> > directory.
> >
> > If you run:
> >
> >   ./scripts/clang-tools/gen_compile_commands.py --log_level=INFO
> >
> > then, you will see several "File ... not found" log messages.
> >
> > This is expected, and I do not want to support the tools/ directory.
> > However, without an explicit comment "do not support tools/", somebody
> > might try to get it back. Clarify this.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Sorry, I did not realize that gen_compile_commands.py did not intend to
> support. I was only looking at the history for the current location, not
> the former one of scripts/gen_compile_commands.py.
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
>

Applied to linux-kbuild.



Best Regards
Masahiro Yamada
