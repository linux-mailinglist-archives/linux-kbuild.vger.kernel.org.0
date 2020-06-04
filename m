Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F771EE841
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 18:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbgFDQIJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 12:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgFDQII (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 12:08:08 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95F7C08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 09:08:08 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id r2so6955766ioo.4
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=vkah7tA2JbMnZrtqfXrKlEZJ4/XR19T0Xn69PklfsaI=;
        b=W4vuJHiabRSBy2U5xpLUZF5tthLmAUg8b99ln7jVjQE/WKrIWA24OrDpHjB8RqzNKb
         ElUQEOxzm+p1hrkfjhwKfcYKBlbUVXfLlb/mlf687ZZlkofFxBNWFVG/RhepH/h39K1n
         8/VOgA5bypie/gfX7wVWG0VM7L7MICqO7HKTA9Bg2zn+LixglQAR4xpsJSrXEDtlz463
         8uzLak7WPl9Q7joIitfk8u4+VVgkOjlGhR3sm7ikQdkVV6Jelwr1rAC8kIBgUEgrKz2x
         miYo5aTOA15S6/afbgMrE8SwNu5A+WurO3xv11OOMi9jlzO4L2u//FkljrL3NnZqffl1
         +TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=vkah7tA2JbMnZrtqfXrKlEZJ4/XR19T0Xn69PklfsaI=;
        b=kkkQrPki9dhhWXNbAucpmrrFu2ozHJozB++SuPCe62p1ZcdXd/rnOGs6057dTyEZuY
         7KvBfsjTKEYdmQwLtBISv3sJmf6WHR90AIdGcqyuZbqwdnLidS8O26yYKyIPVyc4Hz7y
         DpOqXTMekIeJLleK8YuCDkupPQVYu72gBQoU6W5p23JnvRjbFHn7O9LMegJqRFy8rtRs
         r/0Rc8JClM1SPzyoCEr+5YPP7iN37wJ6ukLlnDfoueIkEIIU9ovRrArBHcaPOSrDnGlK
         KgUYDjnNkIg+u+Gw5+2SlbipJXTNjbv3L7K9RCWH4RLSwvegR4OeJ06OjoWfAvhD0Qzw
         3aJA==
X-Gm-Message-State: AOAM532BDPASskEMI+IqH994ij45ikMLZKloe2N7Yss2knRBDXljIMCB
        qcoqqtJON5aOMNJekC0HVF2gFtr8GQS0SdfFyw8=
X-Google-Smtp-Source: ABdhPJwLeLzm6pnUq2RJRT57ZdJ/GX2En9cfO5noUbK0ewUuTUP7d33LXz+rop4BA2hH2hNvi/borjeDyazek4Alp9c=
X-Received: by 2002:a05:6602:2dca:: with SMTP id l10mr4615255iow.163.1591286887567;
 Thu, 04 Jun 2020 09:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
 <635d02d6-05a9-7620-c386-dac766cd49da@linux.com>
In-Reply-To: <635d02d6-05a9-7620-c386-dac766cd49da@linux.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 4 Jun 2020 18:07:56 +0200
Message-ID: <CA+icZUUGgtsxw7UXDQYpouRuRhFWnfA3-XN7zp3OK7Yv2Ase+w@mail.gmail.com>
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

On Thu, Jun 4, 2020 at 3:55 PM Denis Efremov <efremov@linux.com> wrote:
>
> Hi,
>
> On 6/4/20 4:05 PM, Sedat Dilek wrote:
> > Hi Denis,
> >
> > is it possible to add ZSTD compression support with the possibility to
> > add - for example multithreading - options?
>
> Where do you want to use zstd in kernel?
>
> For example, to compress headers xz is used, to compress /proc/config.gz
> gzip is used. It could be relatively easy patched to use zstd for it and
> it could be easy to add tarzstd-pkg target for building the kernel
> as a zstd compressed tarball. However, I doubt that someone really needs it.
> xz is best for headers because of compression ratio, gzip is best for config
> because gzip is installed by default on most systems.
> To compress modules, ramdisk or kernel image with zstd one needs
> to implement zstd decompression algorithm in kernel. Given that there
> are already gzip,bzip2,lzma,xz,lzo,lz4 I really doubt that it will be
> useful. There should be a good comparison showing that kernel image
> with zstd, for example, beats gzip and couple of others in comression ratio
> and decompression speed to properly position the zstd algo.
>

[ CC Nick ]

Hi,

me and other people use "support for ZSTD-compressed kernel and
initramfs" for a long time successfully.

I have modified Debian's initramfs-tools package to support creating
such an initrd.img and boot it successfully.
See Debian Bug #955469.

There is a pull-request sent out to integrate into Linus tree.

Some numbers from Nick Terell in his pull-request:
"
The zstd compressed kernel is smaller than the gzip compressed kernel but larger
than the xz or lzma compressed kernels, and it decompresses faster than
everything except lz4. See the table below for the measurement of an x86_64
kernel ordered by compressed size:

algo size
xz   6,509,792
lzma 6,856,576
zstd 7,399,157
gzip 8,522,527
bzip 8,629,603
lzo 9,808,035
lz4 10,705,570
none 32,565,672
"

More numbers in [0].

Hope this helps you to position the zstd algo.

Maybe, Nick can give you some more details.

Thanks.

Regards,
- Sedat -

[0] https://lwn.net/Articles/817134/
[1] https://github.com/terrelln/linux/commits/zstd-v5
[2] https://lkml.org/lkml/2020/6/1/1590
[3] https://bugs.debian.org/955469

> > For the documentation - which I have not checked - are the tools and
> > libs mentioned you will need to have installed for certain compression
> > tools?
>
> gzip, bzip2 are already installed on most systems. It's highly likely that
> lzo, lzma, xz will require you to install them.
>
> Thanks,
> Denis
