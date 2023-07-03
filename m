Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B82745417
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jul 2023 05:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjGCDUs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Jul 2023 23:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjGCDUs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Jul 2023 23:20:48 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D31C1B2
        for <linux-kbuild@vger.kernel.org>; Sun,  2 Jul 2023 20:20:43 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-553a1f13d9fso3210881a12.1
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Jul 2023 20:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688354443; x=1690946443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBONHC/7jTbYyAxcCcqnQXJVugXf5DsUfZ9d7BfbZ4o=;
        b=Y7EAPvfp/8oRSUv6xld+uqKeQv1pjO9MFfvbUb3RCncHKhxPyPO02miWVd7revhBZ3
         lHxT6f6XGPKunL8sPKTh1Y2M2oaU4JOa2rtNy3/tk9deVmleI0yrY7c0wOOneMHF9EtV
         nrrRMldpULEc4xyyhbkSIndS07vXY09DYzby8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688354443; x=1690946443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBONHC/7jTbYyAxcCcqnQXJVugXf5DsUfZ9d7BfbZ4o=;
        b=j2QL3qJauwZVlyl9OeIkCIAtkCxZEwPLTdBipTE81QoR5b2cVPCBMkgDOBW492QYLE
         C9nvNFC2Mo5tssfeeR68Yep1egPITaVefq4dgSNx8mHL8vpPPXpdKMSqjx5uK3xW7PwA
         oP2Y9lXdwcTBQrZtZwmDEXVLs27ZjUK2VzbK2NTHFhv+IBLyY8uNxwPJhT9jUz1lLYJt
         JU/LGpgpiHE4R2qVtcG1ndY2FhD7H2o65GIL5SGYSQgMUCWdjg7bAxh2GKhgDF92CRmD
         wCnhcK9UIdZZ0e5WrWZNbhxF4aSm3mVBw5kUSAUfxU5j3v0eskuF3UEcfOEHEGPd9J+8
         iGxQ==
X-Gm-Message-State: ABy/qLYeRwwDjl4UTrZjGihWg28uB4TNHZnlRxRWDoUQxD4bhGfBx6UA
        Hji5wlFlFJkV0GUaoXcfFaugrw==
X-Google-Smtp-Source: APBJJlF0LobRjNNE5KdmghKtTcThjdbQiS5tHFBiTjbNCBx8TAPBEq79Oo2P8VuNH4Y8wZm3ccmVYQ==
X-Received: by 2002:a17:903:2594:b0:1b8:6900:a368 with SMTP id jb20-20020a170903259400b001b86900a368mr9572619plb.66.1688354443087;
        Sun, 02 Jul 2023 20:20:43 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x1-20020a1709027c0100b001b05e96d859sm5307699pll.135.2023.07.02.20.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 20:20:42 -0700 (PDT)
Date:   Sun, 2 Jul 2023 20:20:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LLVM <llvm@lists.linux.dev>,
        linux-kbuild@vger.kernel.org,
        Linux Regressions <regressions@list.linux.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Message-ID: <202307022018.B26F5795@keescook>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKIoBVzrjZ+Ybxy9@debian.me>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 03, 2023 at 08:44:37AM +0700, Bagas Sanjaya wrote:
> On Sun, Jul 02, 2023 at 06:36:12PM +0200, Mirsad Goran Todorovac wrote:
> > Hi,
> > 
> > After new git pull the kernel in Torvalds tree with default debug config
> > failed to boot with error that occurs prior to mounting filesystems, so there
> > is no log safe for the screenshot(s) here:
> > 
> > [1] https://domac.alu.unizg.hr/~mtodorov/linux/crashes/2023-07-02/
> > 
> > Bisect shows the first bad commit is 2d47c6956ab3 (v6.4-rc2-1-g2d47c6956ab3):
> > 
> > # good: [98be618ad03010b1173fc3c35f6cbb4447ee2b07] Merge tag 'Smack-for-6.5' of https://github.com/cschaufler/smack-next
> > git bisect good 98be618ad03010b1173fc3c35f6cbb4447ee2b07
> > # bad: [f4a0659f823e5a828ea2f45b4849ea8e2dd2984c] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
> > git bisect bad f4a0659f823e5a828ea2f45b4849ea8e2dd2984c
> > .
> > .
> > .
> > # bad: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
> > git bisect bad 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c
> > # first bad commit: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
> > 
> > The architecture is Ubuntu 22.04 with lshw and config give in the attachment.
> 
> Can you show early kernel log (something like dmesg)?
> 
> Anyway, I'm adding it to regzbot:
> 
> #regzbot ^introduced: 2d47c6956ab3c8
> #regzbot title: Linux kernel fails to boot due to UBSAN_BOUNDS tightening

I'm confused. Commit 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c isn't in the v6.4
tree... it's only in Linus's ToT.

Also, the config you included does not show CONFIG_UBSAN_BOUNDS_STRICT
as even being available, much less present. Something seems very wrong
with this report...

-Kees

-- 
Kees Cook
