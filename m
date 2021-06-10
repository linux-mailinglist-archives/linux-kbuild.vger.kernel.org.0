Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B8B3A2B10
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jun 2021 14:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhFJMIu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Jun 2021 08:08:50 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46069 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhFJMIo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jun 2021 08:08:44 -0400
Received: by mail-ot1-f42.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso14226948oto.12;
        Thu, 10 Jun 2021 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n7jgvY2qmcoUNKWmM7+jxPH+b+Sh4qFDlgu1Os4TRlI=;
        b=ljHhlO5xWyAGeYvV7C8NjGm7sv9TxbD9O2pSgHXSCws1Opl/DtnCHxhUhYtzEcCEbG
         Vz3l7qJ3d20Ee2upLdYhV8uXYinKQX+igHOKhl7JhA9xoM0KMWuxiESqpGj31Wr1aCoj
         EHuO7A+UnvBCJ1P4MOP6ZW6DpcoFzX5DAuhTXJ5j74uO9v6N0Qdusynzan4ly0Lv2DWx
         dhYpu3thgqSjATMHGRk/DKzGvDa05v4o+UypSpYn5Amq1BK5GMfDQyOnbg6Bcy+VyJG4
         JsBkYkzRU2IzYNWyBoNzUQF+7PIQ0wn21s5f49kOVp/9iiynT0Tk4e2v6TeiuyusMX0Z
         076Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=n7jgvY2qmcoUNKWmM7+jxPH+b+Sh4qFDlgu1Os4TRlI=;
        b=rCM9Y2Z5vCPt+fodWnshtDTH3LONd6b5lWQ1Je1I3tJukxuz2DT409f9OaUpneHyl/
         ap7gRqWUVWMMFaLQ3hO7uedDu+1Gm6tpqHORq4OwxYytwh4LRnQDPTtXzDJJuyIxvU8X
         cn803PnEe+Mye7J5FKsOn/uBYCD0xPvozkf6Q4M6izrsPogHdh5WTAIOP1E2Gsm1xx7v
         IyhFKW0V8H09J+bR+Yg4xigP5oyW8ZE8eT66Fqszg968+i6CrumnvhcBB78aqij2w9ZW
         75oGoSNEIe25IMGouGuvLtm6z5qpd7PG2/8i945Rq2jtBOPhyHYFswrEqlsBe6UAwxEr
         zmOg==
X-Gm-Message-State: AOAM533cicnPlRmYy9h0W+VUeWR4Cn5nVw50HlDDtMmm2qEp7WjaYB4u
        Yt42lRXisSXpMSINGFP/Qk4=
X-Google-Smtp-Source: ABdhPJxjnr/MsiG2dwCw9lwLV0UPm+EAcUQ5DSWNozu9qI2yaWVftJiC3lMeKsmFn8wcpArxJmRjKg==
X-Received: by 2002:a05:6830:1002:: with SMTP id a2mr2077749otp.144.1623326734514;
        Thu, 10 Jun 2021 05:05:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 5sm559675ots.67.2021.06.10.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 05:05:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 10 Jun 2021 05:05:31 -0700
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
Message-ID: <20210610120531.GA711216@roeck-us.net>
References: <20210204152957.1288448-1-arnd@kernel.org>
 <20210609110531.GA1528247@roeck-us.net>
 <CAK8P3a2cVpJf+r2b-8YCbknOeOA4w=bY8njr-+vmzbmm8AAC3Q@mail.gmail.com>
 <20210609151608.GA3389541@roeck-us.net>
 <20210609191553.GA2535199@roeck-us.net>
 <CAK8P3a1kgc6+fSHr7ddMRHxh+znW6jL2ZSo=JLWa-Uuzw7UZ-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1kgc6+fSHr7ddMRHxh+znW6jL2ZSo=JLWa-Uuzw7UZ-w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 09, 2021 at 10:30:23PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 9, 2021 at 9:15 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On Wed, Jun 09, 2021 at 08:16:11AM -0700, Guenter Roeck wrote:
> > > > I suppose we could improve the situation if scripts/link-vmlinux.sh was able
> > > > to do that automatically, and compare the kallsyms output .S file between
> > > > steps 1 and 2.
> > >
> > > Comparing the .S files doesn't result in useful data; turns out there are
> > > always irrelevant differences. We'll try to run a diff on the output of
> > > "objdump --syms". Hopefully that will generate something useful.
> > >
> >
> > Turns out it wasn't that useful.
> >
> > chromeos-kernel-5_10-5.10.42-r406: Symbol file differences:
> > chromeos-kernel-5_10-5.10.42-r406: 7c7
> > chromeos-kernel-5_10-5.10.42-r406: < 00000000000325c8 g       .rodata   0000000000000000 kallsyms_relative_base
> > chromeos-kernel-5_10-5.10.42-r406: ---
> > chromeos-kernel-5_10-5.10.42-r406: > 00000000000325c0 g       .rodata   0000000000000000 kallsyms_relative_base
> > chromeos-kernel-5_10-5.10.42-r406: 9,13c9,13
> > chromeos-kernel-5_10-5.10.42-r406: < 00000000000325d0 g       .rodata   0000000000000000 kallsyms_num_syms
> > chromeos-kernel-5_10-5.10.42-r406: < 00000000000325d8 g       .rodata   0000000000000000 kallsyms_names
> > chromeos-kernel-5_10-5.10.42-r406: < 00000000000cd7f0 g       .rodata   0000000000000000 kallsyms_markers
> > chromeos-kernel-5_10-5.10.42-r406: < 00000000000cdb18 g       .rodata   0000000000000000 kallsyms_token_table
> > chromeos-kernel-5_10-5.10.42-r406: < 00000000000cde78 g       .rodata   0000000000000000 kallsyms_token_index
> > chromeos-kernel-5_10-5.10.42-r406: ---
> > chromeos-kernel-5_10-5.10.42-r406: > 00000000000325c8 g       .rodata   0000000000000000 kallsyms_num_syms
> > chromeos-kernel-5_10-5.10.42-r406: > 00000000000325d0 g       .rodata   0000000000000000 kallsyms_names
> > chromeos-kernel-5_10-5.10.42-r406: > 00000000000cd7d8 g       .rodata   0000000000000000 kallsyms_markers
> > chromeos-kernel-5_10-5.10.42-r406: > 00000000000cdb00 g       .rodata   0000000000000000 kallsyms_token_table
> > chromeos-kernel-5_10-5.10.42-r406: > 00000000000cde60 g       .rodata   0000000000000000 kallsyms_token_index
> >
> > I thought I'd see the added symbols, but it looks like the only difference
> > between the two files is the addresses.
> >
> > What am I missing ?
> 
> I probably misremembered the part about 'objdump --syms' and there was
> something more to it.
> 
> Maybe this was the last version before converging? It looks like the '<' version
> has one extra symbol ompared to the '>' version. The diff has no context, but I

It is the difference between step 1 and 2. Why would diff on objdump not
show the additional symbol ? Is it possible that the symbol is not added
to the object file ?

> assume the first symbol that has a different size is 'kallsyms_offsets', which
> is generated by kallsyms.

I'll give it another try and run diff -u.

> 
> I see that link-vmlinux.sh already compares the System.map files, using
> "cmp -s System.map .tmp_System.map", which is roughly the same as the
> objdump --syms diff you got, so comparing these files probably doesn't
> help either. However, comparing the .tmp_System.map file with the previous
> version might reveal the problem. This might need another step to filter out
> the address and only compare the symbol names.

I'll do that as well.

Thanks!
Guenter
