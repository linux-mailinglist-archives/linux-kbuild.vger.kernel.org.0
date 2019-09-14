Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 873C5B2CAC
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2019 21:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfINT1t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Sep 2019 15:27:49 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34526 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbfINT1q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Sep 2019 15:27:46 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so17057329pgc.1
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Sep 2019 12:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=v6C3ZvAydqGC3rFSdN2T0p9SAevh8Gx6OJqDWauOVmw=;
        b=i1HXkiBxW2X50jS+LQsRhsvYxiqcOPonavs0iWq0X0ggH8i/rnnO90+GoQyta37I4L
         18UJSm9RNsQn9cd9jOneHO3W/lr/FplrZJU+uk7yYiHugLG9SZo/IHP0WhpasLXaz/MV
         n8TyrOYL83154CglqmkeMxiimbg+ZtU+VhRfhvGf/FlXZWQoby6nYZGDL0M0HoE4Qvbh
         UtFRMC/MxFnqa0ROcKsvzr/QSj3vMk6Gi+av/vPxNQ4hh7WsnVfiiEGhrYUejgH7kh/l
         /Kx/z9D8F4RhAWiiZBUzzFkVrrjH5dw88arvgGhEifH6iywN8yRpcOaxZXWYmYWYC4B8
         lCzQ==
X-Gm-Message-State: APjAAAVYeCBB0BJhnKP5gzmb8Xt0Lyl6tdx07plJ7GRcF/NEzAdwZpUs
        QvK9JwP6H2DJXhJ/TLTf0QV4gA==
X-Google-Smtp-Source: APXvYqwB+1DyOesfa/VZYXSB3dOHrrPdtntsVeSHhLZiOjHp6dYnW9FtU1z/2J6MMNFbasmlhtdtFQ==
X-Received: by 2002:a17:90a:ba93:: with SMTP id t19mr2903492pjr.141.1568489265106;
        Sat, 14 Sep 2019 12:27:45 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
        by smtp.gmail.com with ESMTPSA id i1sm4105089pfe.136.2019.09.14.12.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2019 12:27:44 -0700 (PDT)
Date:   Sat, 14 Sep 2019 12:27:44 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 12:25:33 PDT (-0700)
Subject:     RE: [RFC] buildtar: add case for riscv architecture
In-Reply-To: <MN2PR04MB60613FADCF3482C14F29F4558DB20@MN2PR04MB6061.namprd04.prod.outlook.com>
CC:     mail@aurabindo.in, Troy Benjegerdes <troy.benjegerdes@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-4e30fb12-057c-425c-a867-ecf93e080ed9@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 14 Sep 2019 06:05:59 PDT (-0700), Anup Patel wrote:
> 
> 
>> -----Original Message-----
>> From: linux-kernel-owner@vger.kernel.org <linux-kernel-
>> owner@vger.kernel.org> On Behalf Of Palmer Dabbelt
>> Sent: Saturday, September 14, 2019 6:30 PM
>> To: mail@aurabindo.in
>> Cc: Troy Benjegerdes <troy.benjegerdes@sifive.com>; Paul Walmsley
>> <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu; linux-
>> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> kbuild@vger.kernel.org
>> Subject: Re: [RFC] buildtar: add case for riscv architecture
>> 
>> On Wed, 11 Sep 2019 05:54:07 PDT (-0700), mail@aurabindo.in wrote:
>> >
>> >
>> >> None of the available RiscV platforms that I’m aware of use compressed
>> images, unless there are some new bootloaders I haven’t seen yet.
>> >>
>> >
>> > I noticed that default build image is Image.gz, which is why I thought its a
>> good idea to copy it into the tarball. Does such a copy not make sense at this
>> point ?
>> 
>> Image.gz can't be booted directly: it's just Image that's been compressed
>> with the standard gzip command.  A bootloader would have to decompress
>> that image before loading it into memory, which requires extra bootloader
>> support.
>> Contrast that with the zImage style images (which are vmlinuz on x86), which
>> are self-extracting and therefor require no bootloader support.  The
>> examples for u-boot all use the "booti" command, which expects
>> uncompressed images.
>> Poking around I couldn't figure out a way to have u-boot decompress the
>> images, but that applies to arm64 as well so I'm not sure if I'm missing
>> something.
>> 
>> If I was doing this, I'd copy over arch/riscv/boot/Image and call it
>> "/boot/image-${KERNELRELEASE}", as calling it vmlinuz is a bit confusing to
>> me because I'd expect vmlinuz to be a self-extracting compressed
>> executable and not a raw gzip file.
> 
> On the contrary, it is indeed possible to boot Image.gz directly using
> U-Boot booti command so this patch would be useful.
> 
> Atish had got it working on U-Boot but he has deferred booti Image.gz
> support due to few more dependent changes. May be he can share
> more info.

Oh, great.  I guess it makes sense to just put both in the tarball, then, as 
users will still need to use the Image format for now.

> 
> Regards,
> Anup
