Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7903C1EE946
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 19:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbgFDRSX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 13:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730118AbgFDRSW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 13:18:22 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222E0C08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 10:18:22 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id p5so6836266ile.6
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=V1uiVo3mexe++RT9bHQlCNMTPaFEBjt3ut6p9BZcOdA=;
        b=d+BQwJlh7jRaoc1mX7zF3nckK2Kg+vlQcwV51J1cDdDgfA8ZFDtJOAB2X95rbjWfa1
         foNB0xNzcTxyZAg58+w8XN/Ew7/15fUbY+WuTJTdvohO75/nQ40siFhWNjTmKkNsknUf
         h7/9Yviw/25ei1Z4zGDfBIrnVj3Kb92UUbXDAMuXmU7estU3i7EHa50J1NJyQpCjXiU0
         80jUGescuc/LkZx4fdg5fKVVnzDjyAPap1uluseav1g+aCHmO94U7cSAVBP0p1c4jaot
         47Cc+0AOaP9klm/tKlxFdiBJwUoSrZp7WuwlO5uJSQnLc/IAcG40OHIj7o20G5Qkk0cS
         FQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=V1uiVo3mexe++RT9bHQlCNMTPaFEBjt3ut6p9BZcOdA=;
        b=uJYSI6famZy6bzhDLYLk7P3A5h83Edf4Wz0+1o7wUBQiaXzapuvAVqSz8GHrmJ0U+L
         LY3cH6nhp5u8nMbtBHQriN/oGzj2Tc4FvI+nMrozx3d5g64KhiTWLhLkeu51odRlXws4
         hTma4RCjIBcj8loFzRt+lB7NzwIcRlNhkIbh4HNy0l2qyt/ks7d3XllIXn73VQRXBP92
         huGVG6HyFmt7xdATBj1+OtVUrnzyC42Tm6W1yaM3v6oUqrcAMnNTqWI7zWutXm/fMPcS
         KVTm6jV7k6SLnkP/rCy6EEdXj9QiqNXD8toBMlahCO1Xh2v9sI2P5BZwG2MJ9pUQ5vaU
         ohFA==
X-Gm-Message-State: AOAM533+OtpM8RaJgOLiSaSP8ISYOvpQ/Bpk85uFaeenXGea7IKxEYyB
        mdN0NDZT/rnJ9iYmWkgXw8mTVOE4KkMIHvYqemE=
X-Google-Smtp-Source: ABdhPJx7i0ooMYHK77Q58f0+azr4TCQdAcFuIRSuNrXLJ0zHRxXVFapIjlysHGiNf0HHU05eWB0kLX2603LHP9fonEk=
X-Received: by 2002:a92:7311:: with SMTP id o17mr5228300ilc.176.1591291101359;
 Thu, 04 Jun 2020 10:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
 <635d02d6-05a9-7620-c386-dac766cd49da@linux.com> <CA+icZUUGgtsxw7UXDQYpouRuRhFWnfA3-XN7zp3OK7Yv2Ase+w@mail.gmail.com>
 <a9615332-f735-4c7a-0368-f3a0402f611b@linux.com> <CA+icZUVfXwVfouPpFeBR5=TxOAT6XWDnpjhPmxTMpajV8Rs-gw@mail.gmail.com>
In-Reply-To: <CA+icZUVfXwVfouPpFeBR5=TxOAT6XWDnpjhPmxTMpajV8Rs-gw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 4 Jun 2020 19:18:09 +0200
Message-ID: <CA+icZUUkYeYqBn9j2QEq2imBntc=2n52pCaqQyK2C4Vw_fv1rw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add variables for compression tools
To:     efremov@linux.com
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 4, 2020 at 7:05 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Jun 4, 2020 at 7:01 PM Denis Efremov <efremov@linux.com> wrote:
> >
> > >
> > > me and other people use "support for ZSTD-compressed kernel and
> > > initramfs" for a long time successfully.
> > >
> > > I have modified Debian's initramfs-tools package to support creating
> > > such an initrd.img and boot it successfully.
> > > See Debian Bug #955469.
> > >
> > > There is a pull-request sent out to integrate into Linus tree.
> > >
> > > Some numbers from Nick Terell in his pull-request:
> > > "
> > > The zstd compressed kernel is smaller than the gzip compressed kernel but larger
> > > than the xz or lzma compressed kernels, and it decompresses faster than
> > > everything except lz4. See the table below for the measurement of an x86_64
> > > kernel ordered by compressed size:
> > >
> > > algo size
> > > xz   6,509,792
> > > lzma 6,856,576
> > > zstd 7,399,157
> > > gzip 8,522,527
> > > bzip 8,629,603
> > > lzo 9,808,035
> > > lz4 10,705,570
> > > none 32,565,672
> > > "
> > >
> > > More numbers in [0].
> > >
> > > Hope this helps you to position the zstd algo.
> >
> > Well, I didn't know that it's already implemented.
> >
> > My patch simply adds variables like GZIP, BZIP2, etc to the top makefile.
> > Unfortunately there is no ZSTD in kernel now. Maybe it's in the linux-next?
> > I can't see it. If my patch will be accepted to the mainline then it will
> > be reasonable to add ZSTD var in makefiles as soon as zstd compression
> > will be merged.
> >
>
> No, it was not merged anywhere AFAICS.
>
> If you want to test please pull from [1].
> I am using it on top of Linux v5.7.
>
> - Sedat -
>
> [1] https://github.com/terrelln/linux/commits/zstd-v5

v5 series overview at patchwork:
https://lore.kernel.org/patchwork/project/lkml/list/?series=437934

v5 single mbox file (cleanly applied here):
https://lore.kernel.org/patchwork/series/437934/mbox/

- Sedat -
