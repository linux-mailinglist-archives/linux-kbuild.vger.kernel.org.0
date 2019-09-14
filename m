Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB0D3B2B47
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2019 15:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388285AbfINM75 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Sep 2019 08:59:57 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36669 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387462AbfINM75 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Sep 2019 08:59:57 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so19799014pfr.3
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Sep 2019 05:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=6diO6eSUOGmz76ljddxSI/7HgVoh3wlKhuqDW6TPNNI=;
        b=UcXaC8HC1NfK2uSJh3nQVdAh+eZ25TdRrOyNH9kCpQByXZ5P90gGVmlIoWsdeytYHh
         QlXUBBIi8+94fqP8GVHV9vhxEapDId1RpO7anoayCZ8SseZQ6v4kO8a/sjPuRY3/xr4Q
         EH5cZeG+uYj/1Fn2WTntiar8MPg4t1VlW0aq/RxS4smO8cvBuqoLRKoPIXFEQvqluAam
         qayv3x4TSNEZJI4Uc0kilV+21BTqdtdwVZFeUXNtpOuFNKO3x0Wfkkj/Jk+1bLYB0/JO
         QQwXOFtm6KoqDxtt5mTAMIW8P006hBiM3QnHQvA1knd5V/h+7lcoijjipw8jl2zQjt+Y
         SAoQ==
X-Gm-Message-State: APjAAAWffSbitU++3yV1xWUlFx1VQKNtxrYulh+tby2T9tlxiVEMMmoI
        kHChaDip7wbDXHbK+DX/RGsy6g==
X-Google-Smtp-Source: APXvYqynfdYc2ptc0xQfgnYnCNXJTDLZ2JGB3tku+3p+zwrQ53V7lsFNW5DAukBS7j+VSynO3hMqGQ==
X-Received: by 2002:a65:6256:: with SMTP id q22mr2197933pgv.408.1568465996538;
        Sat, 14 Sep 2019 05:59:56 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
        by smtp.gmail.com with ESMTPSA id f27sm24474034pgm.60.2019.09.14.05.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2019 05:59:55 -0700 (PDT)
Date:   Sat, 14 Sep 2019 05:59:55 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 05:55:05 PDT (-0700)
Subject:     Re: [RFC] buildtar: add case for riscv architecture
In-Reply-To: <X9f9LozkDQUeBwasTsPlPseP6ZT5yJHNY2GcIgoAgNQJPuFAyYimnDXTJUqxfrZ64GOIl5-uPh07NZnD1pi4uWhCpZvbu9khOW6rEq5P4jU=@aurabindo.in>
CC:     Troy Benjegerdes <troy.benjegerdes@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     mail@aurabindo.in
Message-ID: <mhng-ed262582-dc00-41fe-9be5-2487297f2432@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 11 Sep 2019 05:54:07 PDT (-0700), mail@aurabindo.in wrote:
>
>
>> None of the available RiscV platforms that I’m aware of use compressed images, unless there are some new bootloaders I haven’t seen yet.
>>
>
> I noticed that default build image is Image.gz, which is why I thought its a good idea to copy it into the tarball. Does such a copy not make sense at this point ?

Image.gz can't be booted directly: it's just Image that's been compressed with 
the standard gzip command.  A bootloader would have to decompress that image 
before loading it into memory, which requires extra bootloader support.  
Contrast that with the zImage style images (which are vmlinuz on x86), which 
are self-extracting and therefor require no bootloader support.  The examples 
for u-boot all use the "booti" command, which expects uncompressed images.  
Poking around I couldn't figure out a way to have u-boot decompress the images, 
but that applies to arm64 as well so I'm not sure if I'm missing something.

If I was doing this, I'd copy over arch/riscv/boot/Image and call it 
"/boot/image-${KERNELRELEASE}", as calling it vmlinuz is a bit confusing to me 
because I'd expect vmlinuz to be a self-extracting compressed executable and 
not a raw gzip file.
