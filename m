Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDCB3AE858
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 13:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhFULuJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 07:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFULuI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 07:50:08 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A32C061574;
        Mon, 21 Jun 2021 04:47:54 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id u11so19566038oiv.1;
        Mon, 21 Jun 2021 04:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sTLds6k8hTeNmy8LAUsRkWw0sTWUtxsqEbLIRxEoF04=;
        b=AVC5IPi5K8xUAsvToWKDgk11IDnAPVccYVBFUbMRed8RYy3zoMEMs26aiRw0EZlz94
         dIsUm3YXjQkYa4D48HUyJlkinx4gToMjgp7BNT1miCCeaEZegkXrpyYFMMBmSI1uTQSr
         OFezb9397FptEX+3dDvnS2MDDkmG0wqNpUx9DkITTLxaWBYZztrwQ7fqg8UWo+0meNGo
         J7jjZiqzoIRiN4uDtcm4uwxGqWuR0HuRm/Q8wibZ2itqgTyk3WYt2jNzcR2ecNxqoip8
         PFxDHIG9WApsNcjYXrXWrsSzoNCJyMi9flTHI9apMqph1uU4PjItgwPLZvqIhHpRc5N4
         NgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=sTLds6k8hTeNmy8LAUsRkWw0sTWUtxsqEbLIRxEoF04=;
        b=pDrgdt3YJBumnbDZalJDghN333KZ3ugKdMJ+HC2BuLDNwwxiXp4bRwwCyrh20OxSa9
         a83W9eHGMkZYVAZ8NQc//l7pVLRf9uBOm2emfzsYTCyxI20LazpgdxlRTdVvDPCptLI4
         HRkg16RhtpXxorTWbaglND9cpHIyIMxmCHHZRdzZXnhQrLPi2JBGIWOfNWSiIsjligSD
         Xuf2ZixCg+H2dOnwNeHv1INYzFU9ZZ602/8WhQx3JUY5Was+ufKcOXRTwq/RsdC6xuXa
         CYxU7/7kcz/jntv7EebhN79tPuLwyK7JOvjwtj7rleEWoRzgEkrhtD2O6+uJ4PEByt1+
         4FRA==
X-Gm-Message-State: AOAM533w7EdZ1XZvbj+aZ2bmPzLQ4p6C6uLZxpWKhBK3emOtg6WDElc7
        Ze/CEHoMZocmRN5gLubiqDw=
X-Google-Smtp-Source: ABdhPJymnCOHwsDHJB2uX5QOQRgQtnb2inCmaJ7ZxpaGL/krZBGf5/nMdqagr0un9AP49OgIkzzu5w==
X-Received: by 2002:a05:6808:1415:: with SMTP id w21mr16583879oiv.150.1624276074194;
        Mon, 21 Jun 2021 04:47:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p17sm3903705otp.73.2021.06.21.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 04:47:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 21 Jun 2021 04:47:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marty Faltesek <mfaltesek@google.com>
Subject: Re: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
Message-ID: <20210621114752.GA116119@roeck-us.net>
References: <20210204152957.1288448-1-arnd@kernel.org>
 <20210609110531.GA1528247@roeck-us.net>
 <CAK8P3a2cVpJf+r2b-8YCbknOeOA4w=bY8njr-+vmzbmm8AAC3Q@mail.gmail.com>
 <20210609151608.GA3389541@roeck-us.net>
 <20210609191553.GA2535199@roeck-us.net>
 <CAK8P3a1kgc6+fSHr7ddMRHxh+znW6jL2ZSo=JLWa-Uuzw7UZ-w@mail.gmail.com>
 <20210610120531.GA711216@roeck-us.net>
 <CAK8P3a2LTXme3pa-es=7s7aHX2EvC+2Dxegs=reuJrjeS4sygg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2LTXme3pa-es=7s7aHX2EvC+2Dxegs=reuJrjeS4sygg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 10, 2021 at 02:26:50PM +0200, Arnd Bergmann wrote:
> On Thu, Jun 10, 2021 at 2:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On Wed, Jun 09, 2021 at 10:30:23PM +0200, Arnd Bergmann wrote:
> > > > I thought I'd see the added symbols, but it looks like the only difference
> > > > between the two files is the addresses.
> > > >
> > > > What am I missing ?
> > >
> > > I probably misremembered the part about 'objdump --syms' and there was
> > > something more to it.
> > >
> > > Maybe this was the last version before converging? It looks like the '<' version
> > > has one extra symbol ompared to the '>' version. The diff has no context, but I
> >
> > It is the difference between step 1 and 2. Why would diff on objdump not
> > show the additional symbol ? Is it possible that the symbol is not added
> > to the object file ?
> 
> Note sure. The symbol must be in the object file, but perhaps the
> 'objdump --syms' output skips a different set of symbols compared
> to the list that is used as input for kallsyms, which comes from '${NM}'.
> 
> Comparing the nm output might be another thing to try.
> 
Just following up on this: As Murphy would have told us, the problem
disappeared while trying to track it down. We'll add some instrumentation
into the ChromeOS kernel build to get data once/if/when it shows up again.
When that happens, we'll try to come up with a patch to show the symbol
file differences in the kernel build and submit it upstream.

Thanks,
Guenter
