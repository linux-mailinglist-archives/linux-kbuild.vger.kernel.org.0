Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471803A18F5
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jun 2021 17:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFIPSG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Jun 2021 11:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhFIPSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Jun 2021 11:18:06 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA68FC061574;
        Wed,  9 Jun 2021 08:16:11 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so10653739otk.5;
        Wed, 09 Jun 2021 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SqWeZ1nLPj8cBitxoaF2IF1bsXimif+oMVHTeMU3XPs=;
        b=B2IlJYpjAEhmpcv7JfgrHyGlLIXAIMuTrFRWGQhPhwkyX5Vuo89GHOCuZEnUHsgLNi
         He3mmlWM7DTWuM0f/aTAEssdjXmzPdXk8EGtrd38WiDKHhu2TXp+MBN0qPb3zug4RQHY
         2G0tEgv8kI39Ci+3bLuADtczEhUb1tXhheZNjPXBuK9bPG+hF/qZCLZj9FQEg5N286fx
         tgfGt0tcuqPW+yZeTfJwvtAIpR35cMNvUlnurv4aOtUAN18S1yG5uIG85+l/MEXAPNV2
         03O+cEN9PXBV8rpoumiSdRuD7icAtETd1IYC5f+Lff3JlI9kjwDLrD+ucAJMuQhrNyVC
         GNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=SqWeZ1nLPj8cBitxoaF2IF1bsXimif+oMVHTeMU3XPs=;
        b=BrvyHF46eYKE5TBm6KlQJUnAWjn9gJOGnesqJxeJ+ymOafyZ995W5Q4nukvXQ9ONmY
         bAHLMNLf/x2/1oH7mD5rK7C8L7EQmRS9P5zxgg9SJKfD4cNTsCaFomIee9roHhFKMslb
         0aNmFi92B74ruAUr719nz30gDhy1UvyTNj1yNNauvyiKAZNalWG/4GpYUhQJTwDiUMn5
         VPwdvd/M+sgEnpHMS4B2spBWSBAxkz0sKwZKYg5v2EzT/6j4ecXLm1h2hsFrgRjWeoSf
         3etHeWcq93UJQC0YQ/xwmB+o9M2aEuBDe+7pGpTGPtF94y8ra/k7AbICC/BLAfoMcVW+
         Sipg==
X-Gm-Message-State: AOAM533Rl+V3h5zqlv9Iddut2UAACp8gG+J9mKrJ+XrJXyZQxNGqCkzj
        eTgDALxZ3pnWwRbatH/Cavk=
X-Google-Smtp-Source: ABdhPJzqwC3S+UtqM6z1ytXIUYLmCvD8LsrkL4loVdL28NKYXwv+E5dk5QmnywHEoC53w9lixzkPqA==
X-Received: by 2002:a9d:7141:: with SMTP id y1mr7039417otj.15.1623251771072;
        Wed, 09 Jun 2021 08:16:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w20sm49562otl.51.2021.06.09.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 08:16:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 08:16:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        mfaltesek@google.com
Subject: Re: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
Message-ID: <20210609151608.GA3389541@roeck-us.net>
References: <20210204152957.1288448-1-arnd@kernel.org>
 <20210609110531.GA1528247@roeck-us.net>
 <CAK8P3a2cVpJf+r2b-8YCbknOeOA4w=bY8njr-+vmzbmm8AAC3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2cVpJf+r2b-8YCbknOeOA4w=bY8njr-+vmzbmm8AAC3Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 09, 2021 at 01:24:18PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 9, 2021 at 1:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On Thu, Feb 04, 2021 at 04:29:47PM +0100, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > ARM randconfig builds with lld sometimes show a build failure
> > > from kallsyms:
> > >
> > >   Inconsistent kallsyms data
> > >   Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> > >
> > > The problem is the veneers/thunks getting added by the linker extend
> > > the symbol table, which in turn leads to more veneers being needed,
> > > so it may take a few extra iterations to converge.
> > >
> > > This bug has been fixed multiple times before, but comes back every time
> > > a new symbol name is used. lld uses a different set of idenitifiers from
> > > ld.bfd, so the additional ones need to be added as well.
> > >
> > > I looked through the sources and found that arm64 and mips define similar
> > > prefixes, so I'm adding those as well, aside from the ones I observed. I'm
> > > not sure about powerpc64, which seems to already be handled through a
> > > section match, but if it comes back, the "__long_branch_" and "__plt_"
> > > prefixes would have to get added as well.
> > >
> >
> > This is such a whack-a-mole. The problem is hitting us yet again. I suspect
> > it may be due to a new version of lld using new symbols, but I didn't really
> > try to track it down. Is there an easy way to search for missed symbols ?
> 
> The way I did it previously was to hack Kbuild to not remove the temporary
> files after a failure, and then compare the "objdump --syms" output of the
> last two stages.

Problem with that is that we have a non-deterministic problem: The build
fails for us on some build servers, but we are unable to reproduce the
problem when building the same image manually on a development server.
That is similar to what I had observed before, where powerpc builds would
pass on one server, but the same kernel with the same configuration would
fail to build on a second almost identical server. It would really be great
if we can find a better solution.

> 
> I suppose we could improve the situation if scripts/link-vmlinux.sh was able
> to do that automatically, and compare the kallsyms output .S file between
> steps 1 and 2.

Comparing the .S files doesn't result in useful data; turns out there are
always irrelevant differences. We'll try to run a diff on the output of
"objdump --syms". Hopefully that will generate something useful.

Thanks,
Guenter
