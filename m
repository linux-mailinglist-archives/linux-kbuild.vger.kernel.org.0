Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB3426BE4F
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Sep 2020 09:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgIPHkg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Sep 2020 03:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIPHkd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Sep 2020 03:40:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF4FC061788
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Sep 2020 00:40:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so1873179wmk.1
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Sep 2020 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tqvp+bkIU1TWNlZpwcv+TKRU2X5GojmD5HYurFQV7BY=;
        b=gjM7bxmS6+Hzs07rV/WLqiZ7oypbPZeeynUIbEGf+1I9i5xUZgFTr9pBvxoJKit3lh
         /TC/qQi6Hp2TtnCO/NeCATHt2bkpPA/JZvcO9Wttw2I/Sc/8JV0ACXRCD1k8lq2qSH2u
         xFt8e4VclXK6orUp/sR81UNyuRsBU9CKP69jotta8/o3ZN0y/ATIUSrKa0W8LIOgRy2n
         DkB86wfYPzlKcUglMBue1jJjXIt1v3N2MKI2EvcrO/plB1MItPyrUhAx217Bc/mR4MCH
         vj2Ii+bGg1WlPNB/9eezKaFrqWjQ4uNrrqwZjwW+1wrycv8XxA+imCdxpWXZ+TBspfEU
         cO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tqvp+bkIU1TWNlZpwcv+TKRU2X5GojmD5HYurFQV7BY=;
        b=gkPPpf48uYJf7E6oTCTby5DXstFTfOs0W3Y1vfHZmw+SGR1CcZgbtBYNfGERnIMI1P
         B/rvXEvjPgl1q/F0I5S9nPCRItztCB1SeMJqFNGv4wJ77TpnjfWKbcE+l5UzNm++L0D8
         jSgyC9FoT3OPQQU1BCNsyNeKqnU18J0SCQ7GDUe2ghBdNTHrKWWxC593LD7qHxrXQDuj
         viwxEjqriJj6aMKFfN5HhQ3vVc1T38Dyapwy1BdAtQKWE7yYZ3Kg1wFlMJ0580gMRz4c
         /KMY+0YgarGOMDWtoyS9Rg0vvD4JyZssnAJh84pgOEG9O2tvEg5wRJwcJklBHuPXi6eZ
         x1rA==
X-Gm-Message-State: AOAM5324bS+hzrW8SBp/I1oR8WpTQJJ6brb0qvv9DAwOJDjIVboXN/3/
        ImNi3TbtI23TMXOeXWkZIWFtlA==
X-Google-Smtp-Source: ABdhPJx/FHKbG/LfARiaWGrhnM+fErvXhr1oAsC0Dy1+R1K4G2d1MrURncNcx4OJ1k5GECgPKBKUBg==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr3177066wme.136.1600242029785;
        Wed, 16 Sep 2020 00:40:29 -0700 (PDT)
Received: from google.com (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id u66sm3770553wme.12.2020.09.16.00.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 00:40:29 -0700 (PDT)
Date:   Wed, 16 Sep 2020 07:40:27 +0000
From:   George Popescu <georgepope@google.com>
To:     Marco Elver <elver@google.com>
Cc:     Kees Cook <keescook@chromium.org>, maz@kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        james.morse@arm.com, julien.thierry.kdev@gmail.com,
        suzuki.poulose@arm.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Brazdil <dbrazdil@google.com>, broonie@kernel.org,
        Fangrui Song <maskray@google.com>,
        Andrew Scull <ascull@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
Message-ID: <20200916074027.GA2946587@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-7-georgepope@google.com>
 <202009141509.CDDC8C8@keescook>
 <20200915102458.GA1650630@google.com>
 <CANpmjNOTcS_vvZ1swh1iHYaRbTvGKnPAe4Q2DpR1MGhk_oZDeA@mail.gmail.com>
 <20200915120105.GA2294884@google.com>
 <CANpmjNPpq7LfTHYesz2wTVw6Pqv0FQ2gc-vmSB6Mdov+XWPZiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNPpq7LfTHYesz2wTVw6Pqv0FQ2gc-vmSB6Mdov+XWPZiw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 15, 2020 at 07:32:28PM +0200, Marco Elver wrote:
> On Tue, 15 Sep 2020 at 14:01, George Popescu <georgepope@google.com> wrote:
> >
> > On Tue, Sep 15, 2020 at 01:18:11PM +0200, Marco Elver wrote:
> > > On Tue, 15 Sep 2020 at 12:25, George Popescu <georgepope@google.com> wrote:
> > > > On Mon, Sep 14, 2020 at 03:13:14PM -0700, Kees Cook wrote:
> > > > > On Mon, Sep 14, 2020 at 05:27:42PM +0000, George-Aurelian Popescu wrote:
> > > > > > From: George Popescu <georgepope@google.com>
> > > > > >
> > > > > > When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
> > > > > > the handler call, preventing it from printing any information processed
> > > > > > inside the buffer.
> > > > > > For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
> > > > > > -fsanitize=local-bounds, and the latter adds a brk after the handler
> > > > > > call
> > > > >
> > > > This would mean losing the local-bounds coverage. I tried to  test it without
> > > > local-bounds and with a locally defined array on the stack and it works fine
> > > > (the handler is called and the error reported). For me it feels like
> > > > --array-bounds and --local-bounds are triggered for the same type of
> > > > undefined_behaviours but they are handling them different.
> > >
> > > Does -fno-sanitize-trap=bounds help?>
> >
> > I tried replacing it with:
> >       ifdef CONFIG_CC_IS_CLANG
> >             CFLAGS_UBSAN += $(call cc-option, -fno-sanitize-trap=bounds)
> >             CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
> >       else
> >             CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
> >       endif
> >
> > The code traps.
> 
> What's your config? Do you have CONFIG_UBSAN_TRAP=y? If so, you have 2
> options: honor UBSAN_TRAP and crash the kernel, or have a
> 'CFLAGS_REMOVE_... = -fsanitize-undefined-trap-on-error' for the files
> where you can't deal with traps> 

I don't have CONFIG_UBSAN_TRAP=y. My .config is:
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_UBSAN_KCOV_BROKEN=y
CONFIG_UBSAN_MISC=y
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_TEST_UBSAN=m

Thanks,
George
