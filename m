Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D2FB99BC
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Sep 2019 00:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391533AbfITWkb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 18:40:31 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34309 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387984AbfITWkb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 18:40:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id n9so4648030pgc.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=qpo1CPqc73MCadVo8iRju2Ls/5Qlein+jmhvtvLiZqY=;
        b=OHCOK+V0HKEyBFqOJ32B3ABP50mz0poRDGAM4/FfFIrfiImdUTCHk+RaUb6ter2Yl5
         +Et1oYNNUkR+uOTJkaKKY0IEaojK2nUTV1L+l60d4hWIc/lqSm9GVJEkoHnfUvQyPi5M
         juollKtqCpYuPTpDCLlLKy0M/AmdwOSAHC1qg7bfTt+sxiwTWkJGxvx3SLVAPFsedxq4
         EHXXoib7FuHxCyHCiAQ/xfZ8Ds7AMkJAtSbplkIfzN58pf74LUcPaguQeSs024cUPimZ
         Wzwg+bhFvXToTKCTuDJFkglFJfP4lH2p5Z7JOIFNLQe9AKKIrsXMrt6SqN9a+3288815
         m55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=qpo1CPqc73MCadVo8iRju2Ls/5Qlein+jmhvtvLiZqY=;
        b=ctbm29d2No8fiSYDcTnS/rJF7kTIJBG9b6v7JX4af9iF1UImYFFvbd3hKsmEh4NqFR
         +e7RFrDCPD8sETtkqVAfS6KPoDwxN9zAeqYPjiJgN2AozAvYJ3W+pL/4EEC2PJKAXem5
         HmiItpCUIWa0voynwdPyy/gecKCNQgpF0hoEgcUKRHfMXauZDnub28Swk8Ftrlcf7zTg
         Iy70AeY7vtNFTmQ9zRFk53E0+byFDSsW9P/oRXroUv6GdKOwXlPitmE/+q9Jeo34fEXG
         +bR8elRPOqW1Ox47CF8srtpvg05YGH6DQoQxifx7Lcf0x6HHnVxLnmUqGepqWhAXbSsN
         yMLQ==
X-Gm-Message-State: APjAAAW6/K2nRZIfyN5RFzCtZsMzzg4z75FymEqScubEyFZqNBebsfRU
        6/OO9dKLJNNmiqinr7n/1MCB9A==
X-Google-Smtp-Source: APXvYqxBLLCCHEO/jL8pLzoAfxhjW5ynBcF9ZKHvN1WdzOpo7zRbplvUWd30cWCyGZsTMoCFuQrFOg==
X-Received: by 2002:a62:fc46:: with SMTP id e67mr20195478pfh.153.1569019230813;
        Fri, 20 Sep 2019 15:40:30 -0700 (PDT)
Received: from localhost ([2607:fb90:5de:df7b:9794:c3bf:6169:a06c])
        by smtp.gmail.com with ESMTPSA id b16sm5242640pfb.54.2019.09.20.15.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 15:40:29 -0700 (PDT)
Date:   Fri, 20 Sep 2019 15:40:29 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Sep 2019 15:35:11 PDT (-0700)
Subject:     RE: [RFC] buildtar: add case for riscv architecture
In-Reply-To: <lMUhcsewB9GAKeZH2cH-zl3vFME8u2z5IzCqDBFhtT2IbG71vhHnjrlHKbhyxFee5XFe1X1gRllNJBR9e9dQlC0vbIpSffL_y0pLb46VddQ=@aurabindo.in>
CC:     Anup Patel <Anup.Patel@wdc.com>,
        Troy Benjegerdes <troy.benjegerdes@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     mail@aurabindo.in
Message-ID: <mhng-79e5204f-e7b6-43d0-94cb-815d3be314ae@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 17 Sep 2019 02:35:10 PDT (-0700), mail@aurabindo.in wrote:
> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
> On Sunday, September 15, 2019 12:57 AM, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> On Sat, 14 Sep 2019 06:05:59 PDT (-0700), Anup Patel wrote:
>>
>> > > -----Original Message-----
>> > > From: linux-kernel-owner@vger.kernel.org <linux-kernel-
>> > > owner@vger.kernel.org> On Behalf Of Palmer Dabbelt
>> > > Sent: Saturday, September 14, 2019 6:30 PM
>> > > To: mail@aurabindo.in
>> > > Cc: Troy Benjegerdes troy.benjegerdes@sifive.com; Paul Walmsley
>> > > paul.walmsley@sifive.com; aou@eecs.berkeley.edu; linux-
>> > > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> > > kbuild@vger.kernel.org
>> > > Subject: Re: [RFC] buildtar: add case for riscv architecture
>> > > On Wed, 11 Sep 2019 05:54:07 PDT (-0700), mail@aurabindo.in wrote:
>> > >
>> > > > > None of the available RiscV platforms that I’m aware of use compressed
>> > > > > images, unless there are some new bootloaders I haven’t seen yet.
>> > > >
>> > > > >
>> > > >
>> > > > I noticed that default build image is Image.gz, which is why I thought its a
>> > > > good idea to copy it into the tarball. Does such a copy not make sense at this
>> > > > point ?
>> > >
>> > > Image.gz can't be booted directly: it's just Image that's been compressed
>> > > with the standard gzip command. A bootloader would have to decompress
>> > > that image before loading it into memory, which requires extra bootloader
>> > > support.
>> > > Contrast that with the zImage style images (which are vmlinuz on x86), which
>> > > are self-extracting and therefor require no bootloader support. The
>> > > examples for u-boot all use the "booti" command, which expects
>> > > uncompressed images.
>> > > Poking around I couldn't figure out a way to have u-boot decompress the
>> > > images, but that applies to arm64 as well so I'm not sure if I'm missing
>> > > something.
>> > > If I was doing this, I'd copy over arch/riscv/boot/Image and call it
>> > > "/boot/image-${KERNELRELEASE}", as calling it vmlinuz is a bit confusing to
>> > > me because I'd expect vmlinuz to be a self-extracting compressed
>> > > executable and not a raw gzip file.
>> >
>> > On the contrary, it is indeed possible to boot Image.gz directly using
>> > U-Boot booti command so this patch would be useful.
>> > Atish had got it working on U-Boot but he has deferred booti Image.gz
>> > support due to few more dependent changes. May be he can share
>> > more info.
>>
>> Oh, great. I guess it makes sense to just put both in the tarball, then, as
>> users will still need to use the Image format for now.
>>
>
> Uncompressed vmlinux is already copied by default. This patch just adds the
> Image.gz into the archive as vmlinuz. But as you said, since the name vmlinuz is
> reserved for self extracting archives, should I keep the original name Image.gz ?

vmlinux is not the same as Image: vmlinux is an ELF file that can't be loaded 
directly by most bootloaders, Image is a mostly-flat binary with a small header 
that we're expecting can be booted by most bootloaders.
