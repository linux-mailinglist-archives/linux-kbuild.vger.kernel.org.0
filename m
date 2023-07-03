Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7C074548B
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jul 2023 06:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjGCEaQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jul 2023 00:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjGCEaP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jul 2023 00:30:15 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612ED1AC
        for <linux-kbuild@vger.kernel.org>; Sun,  2 Jul 2023 21:30:08 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4031dacaacaso37516391cf.0
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Jul 2023 21:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688358607; x=1690950607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zEdc92voe5SVnUQt2ohatpq3UyVTM9AOsFNMBkp1+vU=;
        b=PYRoowynH+g1Yj7bPmYI0bTq4CDGfrc2P9eN9RZcW3u+TGVJiVdZ1ci8gdcG2+JjNZ
         MwAH4v1si77CUu98oNeCw/wA8yBfjFN1+URJ/9gMzPlSeQcuBjZKKIIK4LeOb/WRwPXi
         aqzIBFeF8AsgF5Q1MCPd1gO2f69/cpGKa2dAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688358607; x=1690950607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEdc92voe5SVnUQt2ohatpq3UyVTM9AOsFNMBkp1+vU=;
        b=JiSCxvivUrdKDyy0UoPzqVj2/XQE58N5z3dWzIESEvpSRGqcTqrlgEOy6dtSlbTWPk
         O/gAV6ILHYRPfpVSfr3KvL2eWvGQAWtxjTM7FbfWHJWefrNf3l2EGiBLZIJq+1P2lK9L
         /IQT9jjqSWbaZ6aOdE9a+3U6WhCPt89E17tH6i2YyaaqB1c2IKsdDUnO+xIoZ2DRC5SS
         j5aV5NO1WbyT91Yywb7c5vstf743487X2QpFNGXDCxAe/ge0B+G7wtCbZzFlTUhD6xXo
         XtKPamrLYoJTwb0UZUb+/tIoUkn/ZSVoTqL27cSu+xHdlYqZlBjYzrYshB4s7W/CZQfB
         8YEw==
X-Gm-Message-State: AC+VfDw0L7A31ubExb8qR1RVN7UTT2N/iL7AgflQC9jQmrQbLWaWzwzA
        nxi6fOVQTYp1GdQ+G3m9iW5XNg==
X-Google-Smtp-Source: APBJJlH0i/RZIsKfOmMwg3TzthqVd3UOqdfze9pdmyWQBuNN9125b85uiCESMhHhgTNGuz0xEs4KmQ==
X-Received: by 2002:a05:622a:d1:b0:3fd:ecdc:1e0f with SMTP id p17-20020a05622a00d100b003fdecdc1e0fmr13032180qtw.17.1688358607491;
        Sun, 02 Jul 2023 21:30:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 18-20020a631452000000b005539d676060sm13911045pgu.29.2023.07.02.21.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:30:06 -0700 (PDT)
Date:   Sun, 2 Jul 2023 21:30:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LLVM <llvm@lists.linux.dev>,
        linux-kbuild@vger.kernel.org,
        Linux Regressions <regressions@lists.linux.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Message-ID: <202307022115.D96AB033F@keescook>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me>
 <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
 <4ea9488c-0f98-89b4-7af3-174cfcdaa02c@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ea9488c-0f98-89b4-7af3-174cfcdaa02c@alu.unizg.hr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 03, 2023 at 05:53:48AM +0200, Mirsad Goran Todorovac wrote:
> On 7/3/23 05:26, Guenter Roeck wrote:
> > On 7/2/23 20:20, Kees Cook wrote:
> > > On Mon, Jul 03, 2023 at 08:44:37AM +0700, Bagas Sanjaya wrote:
> > > > On Sun, Jul 02, 2023 at 06:36:12PM +0200, Mirsad Goran Todorovac wrote:
> > > > > Hi,
> > > > > 
> > > > > After new git pull the kernel in Torvalds tree with default debug config
> > > > > failed to boot with error that occurs prior to mounting filesystems, so there
> > > > > is no log safe for the screenshot(s) here:
> > > > > 
> > > > > [1] https://domac.alu.unizg.hr/~mtodorov/linux/crashes/2023-07-02/
> > > > > 
> > > > > Bisect shows the first bad commit is 2d47c6956ab3 (v6.4-rc2-1-g2d47c6956ab3):
> > > > > 
> > > > > # good: [98be618ad03010b1173fc3c35f6cbb4447ee2b07] Merge tag 'Smack-for-6.5' of https://github.com/cschaufler/smack-next
> > > > > git bisect good 98be618ad03010b1173fc3c35f6cbb4447ee2b07
> > > > > # bad: [f4a0659f823e5a828ea2f45b4849ea8e2dd2984c] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
> > > > > git bisect bad f4a0659f823e5a828ea2f45b4849ea8e2dd2984c
> > > > > .
> > > > > .
> > > > > .
> > > > > # bad: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
> > > > > git bisect bad 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c
> > > > > # first bad commit: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
> > > > > 
> > > > > The architecture is Ubuntu 22.04 with lshw and config give in the attachment.
> > > > 
> > > > Can you show early kernel log (something like dmesg)?
> > > > 
> > > > Anyway, I'm adding it to regzbot:
> > > > 
> > > > #regzbot ^introduced: 2d47c6956ab3c8
> > > > #regzbot title: Linux kernel fails to boot due to UBSAN_BOUNDS tightening
> > > 
> > > I'm confused. Commit 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c isn't in the v6.4
> > > tree... it's only in Linus's ToT.
> > > 
> > 
> > In ToT:
> > 
> > $ git describe 2d47c6956ab3
> > v6.4-rc2-1-g2d47c6956ab3
> > 
> > $ git describe --contains 2d47c6956ab3
> > next-20230616~2^2~51
> > $ git describe --contains --match 'v*' 2d47c6956ab3
> > fatal: cannot describe '2d47c6956ab3c8b580a59d7704aab3e2a4882b6c'
> > 
> > "git describe" always shows the parent tree, which I guess was based on
> > v6.4-rc2.
> > 
> > Guenter
> > 
> > 
> > > Also, the config you included does not show CONFIG_UBSAN_BOUNDS_STRICT
> > > as even being available, much less present. Something seems very wrong
> > > with this report...
> > > 
> > > -Kees
> 
> Anyway, I have double checked and linux-image-6.4.0-rc2-crash boots while
> linux-image-6.4.0-rc2-crash-00001-g2d47c6956ab3 freezes in early boot.

I don't understand what tree you're testing. 2d47c6956ab3 is only in
Linus's latest tree, which is not 6.4-rc2.

If you're testing Linus's tree, and you're bisecting to 2d47c6956ab3,
I don't understand why the .config you sent doesn't include
CONFIG_UBSAN_BOUNDS_STRICT (which was introduced by that commit) --
it should be visible whether or not it is selected.

> Of course, in the next boot dmesg appears overwritten ... I could provide
> only the first screen screenshots.

Without CONFIG_UBSAN_TRAP, I would not expect anything other than a
warning (i.e. boot would continue).

The only other thing I can think of that seems related (the backtrace
appears to show usb), might be this:
https://lore.kernel.org/lkml/20230629190900.never.787-kees@kernel.org/
which won't appears until after v6.5-rc1.

> The difference is only one commit.
> 
> It is a bit strange so I am available for any additional diagnostics.

Thanks! Can you send "grep UBSAN .config" output for the crashing kernel?

Are you booting on an EFI-capable machine? If you could configure pstore
to use the EFI-vars backend, you can capture the crash in EFI and
pstorefs will show it after the next boot. (If you're using systemd,
this all may already be happening -- check /var/lib/systemd/pstore/
or see[1] for more details.)

-Kees

[1] https://www.freedesktop.org/software/systemd/man/systemd-pstore.service.html

-- 
Kees Cook
