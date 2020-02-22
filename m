Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18208168D53
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 09:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgBVIBp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Feb 2020 03:01:45 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34312 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgBVIBp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 03:01:45 -0500
Received: by mail-ot1-f68.google.com with SMTP id j16so4281320otl.1;
        Sat, 22 Feb 2020 00:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vT81nvbtkGPYyB7EYop5s54CEn2jqtzV1GkVQRlvubQ=;
        b=E7O6HkSF4D+Uxknx/QGF9lTKHLoun8VV8g0bjPaFeXOvk1hMvR5mXW1jBp6fPJNJVZ
         aZB7e6HLMhKX+h9MVNI7q8KNLLoxCOPHb49419ykJKO0NTLi/kGUyDbUKGxs5cEkECyw
         dwMuaiNI3QPYR+uYjaReFrvp5hx9qlz0T/P+k0CnHnUfWaBCjVnKXcbVtdIWlvlsMqLz
         pD9SsuwXyHwy8DCusOg7qCIKY+geoQXRZnmRb0HqS67yFg2sx0UIqvyFCe7KiQptbMwG
         7JTwf6e37eEihNZOhJmGy5JPim4KQDR19JcdGF1MeFhHI0Cv4HjDMsTb+6rLO2Wx6wpk
         fI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vT81nvbtkGPYyB7EYop5s54CEn2jqtzV1GkVQRlvubQ=;
        b=SaJmBg2Yiw6x+vzrBNN38Z+zpkL3aTFVEFjVGj/pTvhQh888eYw+ay8tvOw81kxcJx
         ZB30EWbJ2RFhLL8TJhP3d3w/bZbAWZfyEW6Yh7I4z/pPeAqGx9CHAqoCPxhChucv+Jfk
         gNk71F/ihZx/gbInDWXQidY/iYIt3rYETzCWgH3Q9HxzL5Dquax9BUfZKteblbDgtj0a
         3C5e5RuuLI9/sSsNI/7GZRn0yBRWovC7Yfaw+G5tyxyOReW3pXn1upExkPOrsuXFPlKG
         3/HLORKn4C2Pk7CsWBhfNCI5mTUJA4ojVXXptjfRDX9NL6Gk1bfyH6afI7zHvxgbeTHN
         uu8g==
X-Gm-Message-State: APjAAAXdy5dBEV6BJPwNQk16qrQQoUCshhqRB4fCYNEVRrnZuqzJ9yCj
        my+BS/DQyZR3n04Ok2gQk+vPnMgw
X-Google-Smtp-Source: APXvYqwozrjydg0qlpHHdirUIatUqNDdS/rPMUEphftHCBpdfqQ9n9h/OV0v2ujjZGxaNuh47mmK0A==
X-Received: by 2002:a9d:62d8:: with SMTP id z24mr30827638otk.362.1582358502147;
        Sat, 22 Feb 2020 00:01:42 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id n22sm1995229otj.36.2020.02.22.00.01.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Feb 2020 00:01:41 -0800 (PST)
Date:   Sat, 22 Feb 2020 01:01:40 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc:     Russell King <linux@armlinux.org.uk>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Message-ID: <20200222080140.GA40311@ubuntu-m2-xlarge-x86>
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
 <20200222003820.220854-1-alex_y_xu@yahoo.ca>
 <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
 <1582341758.yo66djba3t.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1582341758.yo66djba3t.none@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 21, 2020 at 11:01:24PM -0500, Alex Xu (Hello71) wrote:
> Excerpts from Nathan Chancellor's message of February 21, 2020 9:16 pm:
> > Hi Alex,
> > 
> > On Fri, Feb 21, 2020 at 07:38:20PM -0500, Alex Xu (Hello71) wrote:
> >> -pipe reduces unnecessary disk wear for systems where /tmp is not a
> >> tmpfs, slightly increases compilation speed, and avoids leaving behind
> >> files when gcc crashes.
> >> 
> >> According to the gcc manual, "this fails to work on some systems where
> >> the assembler is unable to read from a pipe; but the GNU assembler has
> >> no trouble". We already require GNU ld on all platforms, so this is not
> >> an additional dependency. LLVM as also supports pipes.
> >> 
> >> -pipe has always been used for most architectures, this change
> >> standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
> >> affected.
> >> 
> >> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
> > 
> > Do you have any numbers to show this is actually beneficial from a
> > compilation time perspective? I ask because I saw an improvement in
> > compilation time when removing -pipe from x86's KBUILD_CFLAGS in
> > commit 437e88ab8f9e ("x86/build: Remove -pipe from KBUILD_CFLAGS").
> > 
> > For what it's worth, clang ignores -pipe so this does not actually
> > matter for its integrated assembler.
> > 
> > That type of change could have been a fluke but I guarantee people
> > will care more about any change in compilation time than any of the
> > other things that you mention so it might be wise to check on major
> > architectures to make sure that it doesn't hurt.
> > 
> > Cheers,
> > Nathan
> > 
> 
> Sorry, I should've checked the performance first. I have now run:
> 
> cd /tmp/linux # previously: make O=/tmp/linux
> export MAKEFLAGS=12 # Ryzen 1600, 6 cores, 12 threads
> make allnoconfig
> for i in {1..10}; do
>     make clean >/dev/null
>     time make XPIPE=-pipe >/dev/null
>     make clean >/dev/null
>     time make >/dev/null
> done
> 
> after patching -pipe to $(XPIPE) in Makefile.
> 
> Results (without ld warnings):
> 
> make > /dev/null  130.54s user 10.41s system 969% cpu 14.537 total
> make XPIPE=-pipe > /dev/null  129.83s user 9.95s system 977% cpu 14.296 total
> make > /dev/null  129.73s user 10.28s system 966% cpu 14.493 total
> make XPIPE=-pipe > /dev/null  130.04s user 10.63s system 986% cpu 14.252 total
> make > /dev/null  129.53s user 10.28s system 972% cpu 14.379 total
> make XPIPE=-pipe > /dev/null  130.29s user 10.17s system 983% cpu 14.288 total
> make > /dev/null  130.19s user 10.52s system 968% cpu 14.530 total
> make XPIPE=-pipe > /dev/null  129.90s user 10.47s system 978% cpu 14.343 total
> make > /dev/null  129.50s user 10.81s system 959% cpu 14.620 total
> make XPIPE=-pipe > /dev/null  130.37s user 10.60s system 975% cpu 14.446 total
> make > /dev/null  129.63s user 10.18s system 972% cpu 14.374 total
> make XPIPE=-pipe > /dev/null  131.29s user 9.92s system 1016% cpu 13.899 total
> make > /dev/null  129.96s user 10.39s system 961% cpu 14.596 total
> make XPIPE=-pipe > /dev/null  131.63s user 10.16s system 1011% cpu 14.015 total
> make > /dev/null  129.33s user 10.54s system 970% cpu 14.405 total
> make XPIPE=-pipe > /dev/null  129.70s user 10.40s system 976% cpu 14.349 total
> make > /dev/null  129.53s user 10.25s system 964% cpu 14.494 total
> make XPIPE=-pipe > /dev/null  130.38s user 10.62s system 973% cpu 14.479 total
> make > /dev/null  130.73s user 10.08s system 957% cpu 14.704 total
> make XPIPE=-pipe > /dev/null  130.43s user 10.62s system 985% cpu 14.309 total
> make > /dev/null  130.54s user 10.41s system 969% cpu 14.537 total
> 
> There is a fair bit of variance, probably due to cpufreq, schedutil, CPU 
> temperature, CPU scheduler, motherboard power delivery, etc. But, I 
> think it can be clearly seen that -pipe is, on average, about 0.1 to 0.2 
> seconds faster.
> 
> I also tried "make defconfig":
> 
> make > /dev/null  1238.26s user 102.39s system 1095% cpu 2:02.33 total
> make XPIPE=-pipe > /dev/null  1231.33s user 102.52s system 1081% cpu 2:03.29 total
> make > /dev/null  1232.92s user 102.07s system 1096% cpu 2:01.71 total
> make XPIPE=-pipe > /dev/null  1239.59s user 102.30s system 1096% cpu 2:02.39 total
> make > /dev/null  1229.81s user 101.72s system 1093% cpu 2:01.74 total
> make XPIPE=-pipe > /dev/null  1234.64s user 101.30s system 1098% cpu 2:01.64 total
> make > /dev/null  1228.50s user 104.39s system 1093% cpu 2:01.91 total
> make XPIPE=-pipe > /dev/null  1238.78s user 102.57s system 1099% cpu 2:01.99 total
> make > /dev/null  1238.26s user 102.39s system 1095% cpu 2:02.33 total
> 
> I stopped after this because I needed to use the machine for other 
> tasks. The results are less clear, but I think there's not a big 
> difference one way or another, at least on my machine.
> 
> CPU: Ryzen 1600, overclocked to ~3.8 GHz
> RAM: Corsair Vengeance, overclocked to ~3300 MHz, forgot timings
> Motherboard: ASRock B450 Pro4
> 
> I would speculate that the recent pipe changes have caused a change in 
> the relative speed compared to 2018. I am using 5.6.0-rc2 with -O3 
> -march=native patches.
> 
> Regards,
> Alex.

I used hyperfine [1] to run a quick benchmark with a freshly built
GCC 9.2.0 for x86 and aarch64 and here are the results:

$ hyperfine -w 1 -r 25 \
            -p 'rm -rf out.x86_64' \
            'make -j$(nproc) -s CROSS_COMPILE=x86_64-linux- O=out.x86_64 defconfig all' \
            'make -j$(nproc) -s CROSS_COMPILE=x86_64-linux- KCFLAGS=-pipe O=out.x86_64 defconfig all'

Benchmark #1: make -j$(nproc) -s CROSS_COMPILE=x86_64-linux- O=out.x86_64 defconfig all
  Time (mean ± σ):     68.535 s ±  0.275 s    [User: 2241.681 s, System: 185.454 s]
  Range (min … max):   67.855 s … 68.953 s    25 runs

Benchmark #2: make -j$(nproc) -s CROSS_COMPILE=x86_64-linux- KCFLAGS=-pipe O=out.x86_64 defconfig all
  Time (mean ± σ):     68.922 s ±  0.095 s    [User: 2264.168 s, System: 190.297 s]
  Range (min … max):   68.781 s … 69.126 s    25 runs

Summary
  'make -j$(nproc) -s CROSS_COMPILE=x86_64-linux- O=out.x86_64 defconfig all' ran
    1.01 ± 0.00 times faster than 'make -j$(nproc) -s CROSS_COMPILE=x86_64-linux- KCFLAGS=-pipe O=out.x86_64 defconfig all'

$ hyperfine -w 1 -r 25 \
            -p 'rm -rf out.aarch64' \
            'make -j$(nproc) -s ARCH=arm64 CROSS_COMPILE=aarch64-linux- O=out.aarch64 defconfig all' \
            'make -j$(nproc) -s ARCH=arm64 CROSS_COMPILE=aarch64-linux- KCFLAGS=-pipe O=out.aarch64 defconfig all'

Benchmark #1: make -j$(nproc) -s ARCH=arm64 CROSS_COMPILE=aarch64-linux- O=out.aarch64 defconfig all
  Time (mean ± σ):     166.732 s ±  0.594 s    [User: 5654.780 s, System: 475.493 s]
  Range (min … max):   165.873 s … 167.859 s    25 runs

Benchmark #2: make -j$(nproc) -s ARCH=arm64 CROSS_COMPILE=aarch64-linux- KCFLAGS=-pipe O=out.aarch64 defconfig all
  Time (mean ± σ):     168.047 s ±  0.428 s    [User: 5734.031 s, System: 488.392 s]
  Range (min … max):   167.328 s … 168.959 s    25 runs

Summary
  'make -j$(nproc) -s ARCH=arm64 CROSS_COMPILE=aarch64-linux- O=out.aarch64 defconfig all' ran
    1.01 ± 0.00 times faster than 'make -j$(nproc) -s ARCH=arm64 CROSS_COMPILE=aarch64-linux- KCFLAGS=-pipe O=out.aarch64 defconfig all'

In both cases it seems like performance regresses (by 1% but still) but
maybe it is my machine, even though this benchmark was done on a
different machine than the one from my commit back in 2018.

I am not sure I would write off these results, since I did the benchmark
25 times on each one back to back, eliminating most of the variance that
you described.

[1]: https://github.com/sharkdp/hyperfine

Cheers,
Nathan
