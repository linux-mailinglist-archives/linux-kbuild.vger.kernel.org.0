Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61062170FC1
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 05:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgB0EoF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 23:44:05 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39514 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728284AbgB0EoE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 23:44:04 -0500
Received: by mail-oi1-f195.google.com with SMTP id r16so369997oie.6;
        Wed, 26 Feb 2020 20:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4RNB8wxWEzVJtgJjqldIaCI4XGfYsamNd1UsJb6gSog=;
        b=Nol59jAChbbtZLwod/sooHhsr+dlxfsYpBLbyj/vCLX1ol55wVGURk64QiHeOYxFRX
         mHK1+UiyAXvreMg4ZIkS2I0WQZ1et64pUap3FNaL9eX0mxqfndy619KzLjmxjReTU7du
         5c2tcwQZaL1arGl9L1/vb11eBxLVzxJcoxNTHpwUiG3FiyR/J3jJSakwXSC7IIBZaNb7
         Zuok8/WPd6UJ1zAQqwahT4PDOBKVrYqwXr9KpUZbe50+gZPJZubDY+VkHWj/rqM1TiNA
         UuruIMllXhC/IEpSuyEHDMVirOHPuugk1m9JelYk7aBx4b2NE5KHgH3/7xrntSzh69v2
         RAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4RNB8wxWEzVJtgJjqldIaCI4XGfYsamNd1UsJb6gSog=;
        b=gnkJtJE5QU3csZjOW50MLP5kYPr7G4QdEdZn53x+U8639lBceCIfun7ep7TK2icUrO
         WdCdxRL63aAfM2RdYU9yL/YN6ezKC4j+dZ3hrxw0M4owwTpbPc2Lsl9g4kyBCJT5gtPx
         rfsF1+evtNcyiDYWx+T+4/ga5Qx59vPIJAh4sT3CTWb6zZ7zXw7FfUpd19Yhe3unw/15
         xNnOp/6zg1YmKV2a/cKuN6aqvPJg3xWACYO5S+czrZ701RyTZSpfckMPiU1b3x36ckXv
         bOyavPomqyFuMmkAaF81PxYVu5OWQvqcdpl2TdD9wqv+yY2FTgFOzUqMZ3316cHOLg1S
         QfGA==
X-Gm-Message-State: APjAAAWu63OaPXuOVxGMZbSG2WJTsY5GPzSs6qWObhjZjiBjdtPewc7/
        3zefaqRQQTUx82w+anrz5dQ=
X-Google-Smtp-Source: APXvYqzxek+4Hcli5Vv0AI34Ja9/izEaL50t0C1GUclI3TdvYYvnKtRy2i2vNYXrYdBllQG0UrR/rQ==
X-Received: by 2002:a05:6808:289:: with SMTP id z9mr1908161oic.48.1582778643913;
        Wed, 26 Feb 2020 20:44:03 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id a14sm1585830otr.54.2020.02.26.20.44.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 20:44:03 -0800 (PST)
Date:   Wed, 26 Feb 2020 21:44:02 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <20200227044402.GB55684@ubuntu-m2-xlarge-x86>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook>
 <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
 <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 25, 2020 at 12:59:25PM -0800, Nick Desaulniers wrote:
> On Mon, Feb 24, 2020 at 8:16 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > > Should this also include an update to Documentation/process/changes.rst
> > > with the minimum version required? (I would expect this to be "9" for Clang,
> > > and "11" for ld.lld.)
> >
> > I think the clang one should be added in a separate patch that
> > solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> > macro and version check, like in include/linux/compiler-gcc.h.
> >
> > ld.lld's minimum version should also be 9, what is the blocking issue
> > that makes it 11?
> 
> I'm super hesitant to put a minimally required version of Clang, since
> it really depends on the configs you're using.  Sure, clang-9 will
> probably work better than clang-4 for some configs, but I would say
> ToT clang built from source would be even better, as unrealistic as
> that is for most people.  The question of "what's our support model"
> hasn't realistically come up yet, so I don't really want to make a
> decision on that right now and potentially pigeonhole us into some
> support scheme that's theoretical or hypothetical.  We need to expand
> out the CI more, and get more people to even care about Clang, before
> we start to concern ourselves with providing an answer to the question
> "what versions of clang are supported?"  But it's just a strong
> opinion of mine, held loosely.
> 
> Either way, it can be done (or not) in a follow up patch.  I would
> like to land some Documentation/ even if it's not perfect, we can go
> from there.
> -- 
> Thanks,
> ~Nick Desaulniers

I think the question of support model is something that we are going to
have to sit down and figure out sooner rather than later, especially if
we are adding this file to the Documentation; we are saying that this IS
supported in some fashion, we need to be able to answer how we are going
to resolve issues and what versions can be adequately expect to work
with the kernel.

I think that being able to tell people to update is not unreasonable,
given how efficient we are getting fixing into clang. However, clang's
release model is definitely different from gcc's and that can make
getting fixes into the hands of regular users harder, aside from asking
them to build their own version, which again, is not that difficult and
hard to do with something like tc-build.

I agree this should happen in a follow up patch. I think starting with
clang-9 and saying if anything older works, cool, otherwise update is
probably a decent initial model.

Cheers,
Nathan
