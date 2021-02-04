Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9514E30EC5C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Feb 2021 07:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhBDGOR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Feb 2021 01:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhBDGOP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Feb 2021 01:14:15 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46513C0613D6
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Feb 2021 22:13:35 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id u11so1175573plg.13
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Feb 2021 22:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncXEJ1dZpoFNtJ7RLMyE5p7WlT1xC95XJWCpTzmVYWE=;
        b=XPBT5TFm7JgmY9O9VISnJGEkGoPrAlzNb9PchDy7LZiduD7wP1ehIzarhoSUk0UvaB
         FBjNqlEb6tjBq25k4rdQHtYxcBNVHDAZ/Z0ETVd0tZ7xogpZ83BbQ3yG++6S/b/P2Vvu
         4RupnOrIdn4bf8yyktL2+fhZlIz/LNAG9m+TcEINqoCdyIkT91ZYgTO/I3tJcsF+Dr8f
         sX53Ujseq68ZclyDHO086NvofeGGmd7QI/bTQ3UoN7F15nLXDoj9+vCBn4YYlsYreoiQ
         GIOGSfavRdbmTty94m4EAlbV361SEPjuOVQkXQFEWB2yPHuQhLXLMzrNv96/GunrvQs9
         Il5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncXEJ1dZpoFNtJ7RLMyE5p7WlT1xC95XJWCpTzmVYWE=;
        b=OnuNYnNktK4b7fw3h8zXV032GyZGom2DCOksaN3LICvW9C5tQJqsE37JEWGyI3fo/0
         Owck0FzcEmMOGJYfT9GvjdS+BeeE3mnaq3TWLpxtBKQy0BNx16dMdQL0/l1sgD3YvWwK
         3KbyGCdOa31oPlIXeDBD+004f2n0OeUkKx7RUez00iv7LQi0y+L56Qw0Gui6dthRLuJr
         La5FZLfr4xYqRtLwAt2Lg2LZKVLJPrTxDSMpDz3ATsHYOfIaibEv9JzfXX4huPyhb3cZ
         MTQTcNv6idlqn3lp1+BDMs/4Tocr9r2H4AhiRWQaFzKKXrq/LrbDBYINE5VJ8czKxVj5
         Svxw==
X-Gm-Message-State: AOAM532lMcatadqshDbTBDS+JR3xvs8AZWeTQJpHHl9YZlJJ8tPdlFk/
        N0P4rCoeCxy356gFtA2A4KXh/YeUV0dp8PLBukgWZw==
X-Google-Smtp-Source: ABdhPJyKDThP0trUUIdsz6iIijzlmPEakH+sB7moIhqkBdUBvPAWclyV2e4vceezFD0v56p2N6y41FMPXMzREaczZYM=
X-Received: by 2002:a17:902:ed94:b029:de:8844:a650 with SMTP id
 e20-20020a170902ed94b02900de8844a650mr6808235plj.56.1612419214450; Wed, 03
 Feb 2021 22:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20210130004401.2528717-1-ndesaulniers@google.com>
 <20210130004401.2528717-2-ndesaulniers@google.com> <20210130015222.GC2709570@localhost>
In-Reply-To: <20210130015222.GC2709570@localhost>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 3 Feb 2021 22:13:22 -0800
Message-ID: <CAKwvOdkJMfhSBDNsUXbmgF970=766eJZF1E0=8QKCwsEAED1tQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] Kbuild: make DWARF version a choice
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        Nick Clifton <nickc@redhat.com>, Yonghong Song <yhs@fb.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 29, 2021 at 5:52 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Jan 29, 2021 at 04:44:00PM -0800, Nick Desaulniers wrote:
> > Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice which is
> > the default. Does so in a way that's forward compatible with existing
> > configs, and makes adding future versions more straightforward.
> >
> > GCC since ~4.8 has defaulted to this DWARF version implicitly.
> >
> > Suggested-by: Arvind Sankar <nivedita@alum.mit.edu>
> > Suggested-by: Fangrui Song <maskray@google.com>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> One comment below:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >  Makefile          |  5 ++---
> >  lib/Kconfig.debug | 16 +++++++++++-----
> >  2 files changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 95ab9856f357..d2b4980807e0 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -830,9 +830,8 @@ ifneq ($(LLVM_IAS),1)
> >  KBUILD_AFLAGS        += -Wa,-gdwarf-2
>
> It is probably worth a comment somewhere that assembly files will still
> have DWARF v2.

Such a comment should have gone on
commit b8a9092330da ("Kbuild: do not emit debug info for assembly with
LLVM_IAS=1")

It's also more complicated than "assembly files will still have DWARF
v4," due to the LLVM_IAS check.

Further, such a comment would be inappropriate for patch 1 of the
series, which simply changes a Kconfig option into a choice.  I will
add a note to the commit message of patch 2, and carry your reviewed
by tag.  Please nack v8 (which I plan to send imminently) if you
disagree.
-- 
Thanks,
~Nick Desaulniers
