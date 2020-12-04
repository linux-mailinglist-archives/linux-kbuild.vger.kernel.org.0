Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454F22CE45F
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 01:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbgLDAS3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 19:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgLDAS3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 19:18:29 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D55C061A53
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 16:17:48 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id b12so2131718pjl.0
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 16:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZaTj52peLvRicw4PoF/BKEFQ/jidWJ8M3lLP62y2KXw=;
        b=f6utJprcA2gyLCW6KhyBkBOzHNpkQeBC/6cuqkAXEhCJ6UgQtF7AxaxQ05zH+PtOVE
         ngRNtGmJjMrRCyxuel2vp8wlwExduHHpqG1twOhkKReqNPqwkGQzWMa9+mJvoWG5HcmU
         jbOXjnaGcT/4wiLyjdwdWJgjzmChyf2hSNKNMRA0G6iYjS3K3/G7IayMTdGdH0Uo72k9
         UQyfZh2XIMwww4V7SZD487qSLA4wyr2Tug7LXA74/IOpJ+83Ji9ITG1XBcN0yFaI8pxB
         SgQFNyQB4I8CbkiYzEmqrlOY+Yh7mtMKPR0ZCZ2ZfOrRy4ilSW8kAIb/VN3BMTRjJkKB
         NblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZaTj52peLvRicw4PoF/BKEFQ/jidWJ8M3lLP62y2KXw=;
        b=DuNapxOWq46XFpvwOzy/Eyvd+5JkC9p3cZROHxa9yq5wBFt/SUMfnyPBReJiZrY0j7
         LYXLL1ly1dhN/TrGeuKXsT+I07w2PkHSvmOqnDJHQRMPkUx+yk7VNoJd/XdABos8Aov3
         q8TfFDeK7hMK4h/9UUEY5i7j7zMa+OafUhty+LRLpgrdI9parUwZFddvbLs1eabsi/ti
         a3s3WTqOHiJGmZsxStv3wQ07ayoqm6rqOouZ0wTpr1OaU0S1hXCHs5kxDSg3XxaK3Zw3
         vqxpzYgionu8zAPYT0OwXsCnMeWNCoDaQYX9cKEV6yk5nRB7biYzJ40/n9D/weE/52Li
         eY8A==
X-Gm-Message-State: AOAM533JMMfEsWZ+R176M/hMKGmGNGLo2Akcu1EoO0ZK/P2azKZGeQ62
        EqYyBFLljC9Y1kvCj0N25J+SYSaWC97jGHQzLFq7wA==
X-Google-Smtp-Source: ABdhPJyxXL5jwtglQD1q3elOXDsNjJcQNpbqr0Xs+vQZC98CB5dp9xodDoPkfL8B6EplaZIGbgVa00zycl9nrwEa7p4=
X-Received: by 2002:a17:902:e901:b029:d8:e727:2595 with SMTP id
 k1-20020a170902e901b02900d8e7272595mr1464109pld.56.1607041068143; Thu, 03 Dec
 2020 16:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com>
 <20201104000016.GA2399651@rani.riverdale.lan> <CAKwvOdnFstgMa3c+=Vo=QtFYsABDekVeddcPmP=8Pn2bqWfxpg@mail.gmail.com>
 <20201104001703.GA2407187@rani.riverdale.lan> <CAKwvOd=U1mxfgep3KyoAJ3WBcsywdx9_wfVgLcgAhd-+kFfZhA@mail.gmail.com>
In-Reply-To: <CAKwvOd=U1mxfgep3KyoAJ3WBcsywdx9_wfVgLcgAhd-+kFfZhA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 3 Dec 2020 16:17:36 -0800
Message-ID: <CAKwvOd=m9+CxsBuG_DLSx1gaMmOmpm05xeU353As_tPKUij2qA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 3, 2020 at 2:56 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Tue, Nov 3, 2020 at 4:17 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > On Tue, Nov 03, 2020 at 04:05:36PM -0800, Nick Desaulniers wrote:
> > > On Tue, Nov 3, 2020 at 4:00 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > > >
> > > > On Wed, Oct 21, 2020 at 06:21:06PM -0700, Nick Desaulniers wrote:
> > > > > Further -gdwarf-X where X is an unsupported value doesn't
> > > > > produce an error in $(CC).
> > > >
> > > > Do you have more details here? On godbolt.org, gcc does report an error
> > > > for unsupported dwarf versions.
> > > >
> > > > https://godbolt.org/z/G35798
> > > >
> > > > gcc does not seem to pass the -gdwarf-* options to the assembler when
> > > > compiling C source. For assembler, gcc will pass an appropriate option
> > > > depending on the version of binutils it was configured with: if the
> > > > assembler doesn't support dwarf-5 it can call it with --gdwarf2 for eg.
> > > >
> > > > If the user is using a properly configured toolchain it doesn't look
> > > > like it should be an issue to just use cc-option?
> > >
> > > I wrote the base patch back in May, and didn't revisit until recently.
> > > I could have sworn the cc-option silently failed for the check
> > > cc-option does, which is /dev/null input.  I need to recheck that, but
> > > it doesn't hurt to simply include it for now, which I've done in a v2
> > > I'm about to send.
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> >
> > This is giving me deja vu about the -gz=zlib option.
> >
> > Didn't Masahiro fix the cc-option issue with
> >   4d0831e8a029 ("kconfig: unify cc-option and as-option")
> >
> > The existing -Wa,-gdwarf-2 in the Makefile seems bogus, btw. GCC 4.9.0
> > at least appears to pass on --gdwarf2 automatically.
>
> It looks like we don't need -Wa,-gdwarf-2 when -gdwarf-2 is set. So I
> can probably drop
> +DEBUG_CFLAGS   += $(dwarf-aflag)
> from v2.  Will retest though.

That's needed for non LLVM_IAS=1 builds so that clang informs GAS to
assembler using DWARF Version 5; otherwise every translation unit
fails to assemble with an error from GAS.
-- 
Thanks,
~Nick Desaulniers
