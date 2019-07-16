Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C116B02E
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 22:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbfGPUAD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 16:00:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54504 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfGPUAD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 16:00:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id p74so19850063wme.4;
        Tue, 16 Jul 2019 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q2k4Tez3BcD/DYNbzop5shEmRtJWPxKAmmFMVnHWHlw=;
        b=cJSPfeIKP4fg4RqIm/hF2Mv/PaPPlrWrv1jGqmd+PzW9u6Yr2OS4F+Bnf0zR9/DDNT
         MOcA0LyqKKyGDu8JUOMcwM99+S23y7pi4UdjcE3zXCL3MgaNTAznUqgLEuaVfgaTroKW
         gtfZVYS8B5ltN0lbmRK/hlBrDmlUCnwkvxGlJMp9iYmGHkwUa7RX9GUXHGZbkUqUDZvK
         6fMm2xi1PSKmU12WyF7cPtF5daP3KQ3NHAoH0vTaEyDSEZ5tHvSAbaI+8FjoXCrtomYF
         WoAR2PadyLiElD3JUSV0yvV39xbWD3Hf+kUeHw3mGJk/WiyH52HRVoVLouxsgyG8GdRx
         pefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q2k4Tez3BcD/DYNbzop5shEmRtJWPxKAmmFMVnHWHlw=;
        b=tPls/J89m2TBKm4rayk40YdptQfeXuZfaQ5gjUOBL/dxBqAly5mwtxmvDMhcayMFmb
         nVljtmzGltagyeRlRjx4qnhMJI1cVyhJZVSgaRcXVqTivuJeetE2C30khV5xLJPEU6PE
         +wvHPiSzvkka85BaKcvkYO0j1L4GZUsT2ZHamWgzsKJ9Qgd3LGoXBMcpyHYVBV4x6A15
         e8C0QBYUWUIu9wiu2QHZ23UUvJQi3YzRCSG4NFd/ciMz4pBIcLA7vlJrN4qr3flz3ktl
         /xDMYrlOGiPY3ZpQpD+ybz5h2YaXU1GgREZ+3Z+e2xxEJ1EyRD/vm5SYZr+/aBH945BP
         ss5A==
X-Gm-Message-State: APjAAAUYxAVXbV1Zv3g7yVHNXDIocfzMCmMDaOHbZ1BbbwCaCNYlH5qg
        O7RWOwMK/ucpXpGOHEd1gsQ=
X-Google-Smtp-Source: APXvYqyQEr+LTK+JlN52NndYJ0BClzKtNWVdYv17XSWLgYCuugCJDuebXJdlQyq3+lybjIdWKY+eqQ==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr31522543wmf.45.1563307200469;
        Tue, 16 Jul 2019 13:00:00 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id b8sm25256991wmh.46.2019.07.16.12.59.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 12:59:59 -0700 (PDT)
Date:   Tue, 16 Jul 2019 12:59:57 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
        Mike Lothian <mike@fireburn.co.uk>
Subject: Re: [PATCH v2] kbuild: Fail if gold linker is detected
Message-ID: <20190716195957.GA38495@archlinux-threadripper>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716170606.GA38406@archlinux-threadripper>
 <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 09:47:27PM +0200, Thomas Gleixner wrote:
> The gold linker has known issues of failing the build both in random and in
> predictible ways:
> 
>  - The x86/X32 VDSO build fails with:
> 
>    arch/x86/entry/vdso/vclock_gettime-x32.o:vclock_gettime.c:function do_hres:
>    error: relocation overflow: reference to 'hvclock_page'
> 
>    That's a known issue for years and the usual workaround is to disable
>    CONFIG_X86_32
> 
>  - A recent build failure is caused by turning a relocation into an
>    absolute one for unknown reasons. See link below.
> 
>  - There are a couple of gold workarounds applied already, but reports
>    about broken builds with ld.gold keep coming in on a regular base and in
>    most cases the root cause is unclear.
> 
> In context of the most recent fail H.J. stated:
> 
>   "Since building a workable kernel for different kernel configurations
>    isn't a requirement for gold, I don't recommend gold for kernel."
> 
> So instead of dealing with attempts to duct tape gold support without
> understanding the root cause and without support from the gold folks, fail
> the build when gold is detected.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com

Based on the crude little testing script I wrote below:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

$ cat test.sh
#!/bin/bash

# ld.bfd (expected to pass)
make distclean defconfig || exit ${?}

# ld.gold explicitly (expected to fail)
make LD=ld.gold distclean defconfig && exit ${?}

# ld.gold as if it were the system linker (expected to fail)
ln -fs /usr/bin/ld.gold ld
PATH=${PWD}:${PATH} make distclean defconfig && exit ${?}

# ld.lld (expected to pass)
make LD=ld.lld distclean defconfig || exit ${?}
