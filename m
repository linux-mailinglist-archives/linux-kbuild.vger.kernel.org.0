Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4775516B6C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 01:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgBYAef (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Feb 2020 19:34:35 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33654 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgBYAef (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 19:34:35 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01P0YVll005755;
        Tue, 25 Feb 2020 09:34:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01P0YVll005755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582590872;
        bh=YpOdnzakaY4kQ6Hq6dtj/GHqkEvETebfSIs9KOwQ0T8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MZUmed1J+bg0P9U5cLP0KDe6EudILxSvAKJw93aRA8kbt7gBONA3BZALlWADR6BMF
         CMoxZ0Zza8pljSStpx6p+mJsqL7n2ioB/9jyi5yC0vNyPENvIYJzIHB9JTNs04dHKd
         7YTmsLTA1MidiEi4e6xCeSSAuX9Wyp3LGAvw5grTTnEszGzqHwvztlv3oWfmetIWbq
         HeXx3W2D5WKu89rFhfppIQfw1N40xixjwx268uF3UDyb3PBR6gjPuH0PPRIEUJjB3k
         bvBgTdTqcUiHQxZSYjgSS5DitWQK+lkwNGqln821wX2MoRtyEqfL9o9XcffWgoDY/H
         VXWKV/It7RAxg==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id 7so6921644vsr.10;
        Mon, 24 Feb 2020 16:34:31 -0800 (PST)
X-Gm-Message-State: APjAAAWAsI/1uQgccafZxG2Jzj49ffkTDefg8HZ2BassJhbKEkK3u+qq
        RaHXCViQySy/JJRQRxfIWI9xnn+rQj8DZJb/sKI=
X-Google-Smtp-Source: APXvYqzj10eMuqjbwrFRWiVgDyYJLfStG4A6MxApgJofjA494yCTfv1qpK+4fv08UMIGDzFcQ4drlbYAqmuqapAxg4M=
X-Received: by 2002:a67:6485:: with SMTP id y127mr29738781vsb.54.1582590870771;
 Mon, 24 Feb 2020 16:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
In-Reply-To: <20200224174129.2664-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 25 Feb 2020 09:33:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
Message-ID: <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Added to kbuild documentation. Provides more official info on building
> kernels with Clang and LLVM than our wiki.
>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---


Perhaps, is it better to explicitly add it to MAINTAINERS?

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
 B:     https://github.com/ClangBuiltLinux/linux/issues
 C:     irc://chat.freenode.net/clangbuiltlinux
 S:     Supported
+F:     Documentation/kbuild/llvm.rst
 K:     \b(?i:clang|llvm)\b

 CLEANCACHE API



Thanks.

-- 
Best Regards
Masahiro Yamada
