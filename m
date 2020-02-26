Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFB416FF61
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 13:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgBZM7m (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 07:59:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55433 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgBZM7m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 07:59:42 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so2952799wmj.5;
        Wed, 26 Feb 2020 04:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=TvwRMoMGJoOBW5U/G6Ov9OkglcVw7Zi5W3FAUCreUTE=;
        b=G0gUbLLUQ+kjHCC8gG63gzA/B5sX1xWkJ1OeXKwycE8dbb3G5FNjapOnAbOUohNpuI
         qwdE+5rBdulwvx8iIrraarXoT3rrKgcdPGsRJmhVdi52aZnwTkkc3ktLW4JVb4e+FKBZ
         yJMhIIVo2fI4ytDMxXwTWWP1BXU3M84Jy6duOBcJtuOhCFLQe7g5gSTJyz/8AVg8Yz6h
         dgYue9BOU5kruD1xV5vVaTXrFRRrbVZYPuHbvNvJmmzZ5EjHrT3tiv6jWuknR5BGmMU2
         Iv62OdRPfBGlgcPhKVSqA8G5OrOWahXkcTZQO8dRW9AuC9dFVGiFV2vZgoeg2NO+a3S+
         r5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=TvwRMoMGJoOBW5U/G6Ov9OkglcVw7Zi5W3FAUCreUTE=;
        b=J6dwsxEARdozYOsM8ym9AthziEvIUFbm/lMRZPCzpntue8A45YC37Fb5/lRkXQQnfc
         CTjNgDomcNHiriGVTfoFPBLW2IQ8u1WVuhAQJcpCJjoURuonhbEWvOZOElf1+sJnyU9S
         dqptyJuPag1jJ6KP4F1Ko7tRRrc+J1lNHzWQHePUdAjmK6OCcJDh1w/IGzrA0/DN+bBl
         0bcrLkdUPM3BRNLxYhJeQXSs0IslL9LUcKOBHywsJf5LCNRXf0p4bR4yaJVrRaawS9Tt
         zrYmZOTw9TBt0DAESI9Xbikumg4H+hRT4fXTqdtyd6xsnTn48ezbYQuIiNAbAiPGGM1G
         5g7A==
X-Gm-Message-State: APjAAAWXgZLuhNd0XNnwpqq+hj9sZDQwmyNcu9Iy9P9A8Fy0gJ++XU3D
        WaVCw3lA4YP4SYN8Fk0jLGinGGdifCQyY9EEv1A=
X-Google-Smtp-Source: APXvYqzOXKr7YjubT2c2bwbdts/K1ziby/AC4aTEgXdbIhBFxKfLviVhitgx5pe+YIc3glYsAR7MV2AG+P48GF8sHwU=
X-Received: by 2002:a7b:cc69:: with SMTP id n9mr5055395wmj.163.1582721980031;
 Wed, 26 Feb 2020 04:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <20200225210250.64366-1-ndesaulniers@google.com> <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
 <CA+icZUWcW3+9QdZcACCXP6Yun__Sm_s4+qM4rALdFf=hGBt3FQ@mail.gmail.com> <CAK7LNAQX0nFWruCgHDEkZsTKT895ahrAVQT12wuJQ_dUQtVrsg@mail.gmail.com>
In-Reply-To: <CAK7LNAQX0nFWruCgHDEkZsTKT895ahrAVQT12wuJQ_dUQtVrsg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Feb 2020 14:02:09 +0100
Message-ID: <CA+icZUUHs98=OgF5LVd9svdzbWpaBCv6=4nUNs8zb3rUcaOD=A@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
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

On Wed, Feb 26, 2020 at 1:39 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Feb 26, 2020 at 9:26 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Wed, Feb 26, 2020 at 12:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Hi.
> > >
> > >
> > > On Wed, Feb 26, 2020 at 6:02 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > Added to kbuild documentation. Provides more official info on building
> > > > kernels with Clang and LLVM than our wiki.
> > > >
> > > > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > ---
> > > > Changes V1 -> V2:
> > > > * s/On going/ongoing/
> > > > * add Randy's Suggested-by
> > >
> > >
> > > I do not understand this tag update.
> > >
> > > As far as I saw the review process,
> > > I do not think Randy deserves to have Suggested-by
> > > because he just pointed out a typo (on going -> ongoing) :
> > > https://patchwork.kernel.org/patch/11401189/#23179575
> > >
> > > (or, was there off-line activity I had missed?)
> > >
> >
> > Hi Masahiro,
> >
> > I got some credits from Nick for a review by seeing a typo - not on a
> > review of the code - and H. Peter Anvin asked why.
> >
> > I am not sure what is here the correct credit to give.
> > Depends a "Reviewed-by" and/or "Suggested-by" on a technical review?
>
>
>
> Documentation/process/submitting-patches.rst
>
>   13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
>
> is a helpful guideline.
>

Thanks for CCing Randy and the pointer to
"Documentation/process/submitting-patches.rst" file.

This document [1] is mostly focusing on technical handling.

- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n584
