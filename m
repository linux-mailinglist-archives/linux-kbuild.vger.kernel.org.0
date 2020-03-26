Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08930194893
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 21:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgCZUQy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 16:16:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40067 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgCZUQq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:16:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id a81so8994327wmf.5
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malat-biz.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cJd2r32O8oRypAa5o9iHKon3qqroPaK9fKkWmlFzpvg=;
        b=GcBMssEd0ac5CL77EZp4+xWSbdMvIA7rQ+IDlsfwUPunB3Al+xkaVD/ZQ08PXGiVUz
         N9QqLz6Zm3QEwgwqLV+X+DwBitZjcnuq4E4IY7KThwDgDa+oA3W/MlfmMMWSxkcBt0ER
         ETn/0kv81PAp2aHmOjGgvLg3JTO8oduA79SCk9TSwAJy2ODzV5ob3B+sAD0Ep4QQalOd
         /w479MwXq9C+cD4iWPAcLqIaVROvxgKHY8QwyyLYh063OjDsVigWMyM19RhPKNtInDqO
         87I8LC02kYHe8xc/xM3Vl2O2SkpLoMoNtLtBI1nfHvgzpuktufyYcigl6PqLqz1duLL0
         wGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cJd2r32O8oRypAa5o9iHKon3qqroPaK9fKkWmlFzpvg=;
        b=iv19ZxjkF3Hls+IHvnRPl3XZZQrbwVh5U01nSsePi44GL0UHy4zvJLFW91jElFoIdP
         xRvyREf69r720voJAXUoXcYdQ5U1NHQD7eN311XOLqq5A3OP9Bxqs9s019kN4Wb/ShQe
         ZjgbRL5q/oMEJCKVZOKs24aNw55SYcsyIuq52VebvJAdyq723v0SrvMrZBg4MU3wY+gL
         wfLvrYrG8gV49koqCl8SoG5OH0rKRwfoSIzw3N3CT79TEDe323LSg8ns6Qomf5tctnSL
         GS2VC80FBAklLu6ly/WN2gc2TcHiHI6evTzAwEU/UR1ys3kWYbhxHEy4yOzrfRbXSCn6
         brmw==
X-Gm-Message-State: ANhLgQ2mlIsUB7O9kkvKMcbPfkNgLFAV8+3WypOVfkSjTDHFlQrtC66a
        gWrlnbqAwKQMnPyO4c9k3z+Vng==
X-Google-Smtp-Source: ADFU+vszuKd0m2fN3U/Uyz8Hf/tvzHDDhcNFhWW7EHox8Ri8sV3k2X8NAUG10dVFupb4HqhRj3qg6w==
X-Received: by 2002:a7b:ce9a:: with SMTP id q26mr1821977wmj.180.1585253803260;
        Thu, 26 Mar 2020 13:16:43 -0700 (PDT)
Received: from ntb.petris.klfree.czf (p5B36386E.dip0.t-ipconnect.de. [91.54.56.110])
        by smtp.gmail.com with ESMTPSA id p16sm4774022wmi.40.2020.03.26.13.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 13:16:42 -0700 (PDT)
Date:   Thu, 26 Mar 2020 21:16:34 +0100
From:   Petr Malat <oss@malat.biz>
To:     Nick Terrell <terrelln@fb.com>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v3 3/8] lib: add zstd support to decompress
Message-ID: <20200326201634.GA9948@ntb.petris.klfree.czf>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
 <20200326164732.GA17157@ntb.petris.klfree.czf>
 <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!
On Thu, Mar 26, 2020 at 07:03:54PM +0000, Nick Terrell wrote:
> >> * Add unzstd() and the zstd decompress interface.
> > Here I do not understand why you limit the window size to 8MB even when
> > you read a larger value from the header. I do not see a reason why there
> > should be such a limitation at the first place and if there should be,
> > why it differs from ZSTD_WINDOWLOG_MAX.
> 
> When we are doing streaming decompression (either flush or fill is provided)
> we have to allocate memory proportional to the window size. We want to
> bound that memory so we don't accidentally allocate too much memory.
> When we are doing a single-pass decompression (neither flush nor fill
> are provided) the window size doesn't matter, and we only have to allocate
> a fixed amount of memory ~192 KB.
>
> The zstd spec [0] specifies that all decoders should allow window sizes
> up to 8 MB. Additionally, the zstd CLI won't produce window sizes greater
> than 8 MB by default. The window size is controlled by the compression
> level, and can be explicitly set.
Yes, one needs to pass --ultra option to zstd to produce an incompatible
archive, but that doesn't justify the reason to limit this in the kernel,
especially if one is able to read the needed window size from the header
when allocating the memory. At the time when initramfs is extracted,
there usually is memory available as it's before any processes are
started and this memory is reclaimed after the decompression.

If, on the other hand, an user makes an initramfs for a memory constrained
system, he limits the window size while compressing the archive and
the small window size will be announced in the header.

The only scenario where using the hard-coded limit makes sense is in a
case the window size is not available (I'm not sure if it's mandatory
to provide it). That's how my code works - if the size is available,
it uses the provided value, if not it uses 1 << ZSTD_WINDOWLOG_MAX.

I would also agree a fixed limit would make a sense if a user (or network)
provided data would be used, but in this case only the system owner is able
to provide an initramfs. If one is able to change initramfs, he can render
the system unusable simply by providing a corrupted file. He doesn't have
to bother making the window bigger than the available memory.

> I would expect larger window sizes to be beneficial for compression ratio,
> though there is demising returns. I would expect that for kernel image
> compression larger window sizes are beneficial, since it is decompressed
> with a single pass. For initramfs decompression, I would expect that limiting
> the window size could help decompression speed, since it uses streaming
> compression, so unzstd() has to allocate a buffer of window size bytes.
Yes, larger window improves the compression ratio, see here a comparison
between level 19 and 22 on my testing x86-64 initramfs:
  30775022 rootfs.cpio.zst-19
  28755429 rootfs.cpio.zst-22
These 7% can be noticeable when one has a slow storage, e.g. a flash memory
on SPI bus. 

> > I removed that limitation to be able to test it in my environment and I
> > found the performance is worst than with my patch by roughly 20% (on
> > i7-3520M), which is a major drawback considering the main motivation
> > to use zstd is the decompression speed. I will test on arm as well and
> > share the result tomorrow.
> >  Petr
> 
> What do you mean by that? Can you share with me the test you ran?
> Is this for kernel decompression or initramfs decompression?
Initramfs - you can apply my v2 patch on v5.5 and try with your test data.

I have tested your patch also on ARMv7 platform and there the degradation
was 8%.
  Petr
