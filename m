Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72913213E99
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2020 19:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgGCRg6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jul 2020 13:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGCRg5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jul 2020 13:36:57 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7E9C061794;
        Fri,  3 Jul 2020 10:36:57 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id a6so11149569ilq.13;
        Fri, 03 Jul 2020 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QzGRJEec8FfQiJDm0roEek02KXevbZQETXrH89HO5Eo=;
        b=F6yjztn7Wa4l76RPgCRyBNdfIgKwFEVEfkOWuvlXplVHPuY9DVS+of7q0zMG8i8SJS
         CHm6oPFwVaFBctWeHWoWqHHOGYF+d/5cFKywWEGFXWfwPv9n5dBit9iOYU8Ftu6E10x8
         fFsNv6UK55r5KxgWjfxYQs/0JRY+8Yqztogm+pisu1FDIvNGaEsxbcjduyTHCiJlRV1Y
         obbPvQGForL6FR+c5OGTyuL+yepqPqKD4UQjDk7ba/bhGoeM88+OoAhKef+T35WyuSZm
         cc/rWYZ15d4s425ewoojDUT7dyFpfZPPtcGLJbY5XTQ2/dnzBsd8jKheW6687/tvabwF
         3eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QzGRJEec8FfQiJDm0roEek02KXevbZQETXrH89HO5Eo=;
        b=k1v0tVMfGDsl5io9wGDZbvIDkksp2bRZ9ymc4/0WUCTFc9MhOBrz2wai7sOUW/CRnl
         +xy4rDhegsENxT87WHsz3ycjTLjBmU/d4Hb0Sin7QiDzwnEbgS+2cI9AmQSvsBdhNfQS
         dn+bYtJ5EskAFDBhv+obGIbtmFnlqaWdBjN8kJYMV8+OGcrBguCoI1c/CxHO0N0eIAqJ
         k4W/AlApxpvAhnO3VGvkbiTdsB4QkLRHIVRl42GHPfRwp6M+u56ZObN1lGRtbBi8Ktp5
         LvjghhJ7sNNMq0KtYiuPgks8Nj8aVxTKc+RjA5DeB1AQK7D3UC/d52qdarizKLUdzaC3
         XnbQ==
X-Gm-Message-State: AOAM533wHdDvKK4BvodvbDlXc5aY8AcKEFMQAkcQw8g3yw1mQ/cNv1ct
        hW+m2/cIHaOGqnRyg2nHA1bszTrhV866ODKQZIQ=
X-Google-Smtp-Source: ABdhPJz3atEwAL3qf2xUv+zkQmd6ql/SzlONTAWvYLW9wNOJbaMyfUgG8o0EoqS4c2tnRZGjN4XbPZ0pwNbrsRUa7xA=
X-Received: by 2002:a92:502:: with SMTP id q2mr17764879ile.61.1593797816746;
 Fri, 03 Jul 2020 10:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <1588791882.08g1378g67.none.ref@localhost> <1588791882.08g1378g67.none@localhost>
 <202007020818.87EA89106@keescook> <CA+icZUUBAzBNwqThSF=YS1zg9EVCuSZ-XDc5Pu3NrO6R3Fi2Zw@mail.gmail.com>
 <202007030855.ED7AABDF@keescook>
In-Reply-To: <202007030855.ED7AABDF@keescook>
From:   Norbert Lange <nolange79@gmail.com>
Date:   Fri, 3 Jul 2020 19:36:45 +0200
Message-ID: <CADYdroMqpTM105UZy+CJ3VOu8Ahgonb4JEMCEt3D4+hP92A6xA@mail.gmail.com>
Subject: Re: Kernel compression benchmarks
To:     Kees Cook <keescook@chromium.org>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        Nick Terrell <terrelln@fb.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org,
        x86@kernel.org, gregkh@linuxfoundation.org,
        Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Am Fr., 3. Juli 2020 um 18:06 Uhr schrieb Kees Cook <keescook@chromium.org>:
>
> On Fri, Jul 03, 2020 at 10:15:20AM +0200, Sedat Dilek wrote:
> > On Thu, Jul 2, 2020 at 5:18 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Wed, Jul 01, 2020 at 10:35:48AM -0400, Alex Xu (Hello71) wrote:
> > > > ZSTD compression patches have been sent in a number of times over the
> > > > past few years. Every time, someone asks for benchmarks. Every time,
> > > > someone is concerned about compression time. Sometimes, someone provides
> > > > benchmarks.
> > >
> > > Where's the latest series for this, btw? I thought it had landed. :P It
> > > seemed like it was done.
> > >
> >
> > Hi,
> >
> > Again, I would like to see this upstream, too.
> >
> > Last I asked for a rebase against Linux v5.8-rc1 or later.
> >
> > Beyond above adaptations, the latest series "zstd-v5" of Nick T.s
> > patchset needs some addition of zstd to the patch (see [1]):
> >
> > commit 8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294
> > "kbuild: add variables for compression tools"
> >
> > NOTE:
> > "zstd-v5" was against Linux-next 20200408 or download the series from
> > patchwork LKML which applies cleanly against Linux v5.7 - last is what
> > I did.
> >
> > There was a follow-up to the above patch (see [2]):
> >
> > commit e4a42c82e943b97ce124539fcd7a47445b43fa0d
> > "kbuild: fix broken builds because of GZIP,BZIP2,LZOP variables"
>
> Okay, cool. Yes, now is the right time to send an updated series based
> on v5.8-rc2 with any outstanding adjusted/fixes made.
>
> It seems v5 is here?
> https://lore.kernel.org/lkml/20200408215711.137639-1-nickrterrell@gmail.com/
>
> That wasn't sent "to" a maintainer, so it likely went unnoticed by either
> akpm or the x86 maintainers. I think this should likely go via the x86
> tree.
>
> > Nevertheless, this is the kernel-side of doing - user-space like for
> > example Debian's initramfs-tools needs adaptations (see [3]).
>
> Right, but the kernel needs to implement the support first. :)
>
> > @Kees: Can you aid Nick T. to get this upstream? You know the
> > processes a bit better than me.
>
> Sure; Nick, can you please rebase and handle any issues from v5? With
> the result, send a v6 as you did for v5 before, but I would make your
> "to" be:
>
> Borislav Petkov <bp@alien8.de>
> Thomas Gleixner <tglx@linutronix.de>

I got the hint to bring in Andrew Morton <akpm@linux-foundation.org> [1],
so you might add him aswell (he signded-off changes in lib/decompress*.c).

Norbert

https://lwn.net/ml/linux-kernel/CADYdroP0zdz=QtuDFCXpkDohEAgGOc7hDHT8_NnqKuvi979J5Q@mail.gmail.com/

>
> and keep the CC as you had it.
>
> --
> Kees Cook
