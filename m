Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFA944FBCD
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Nov 2021 22:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbhKNV2s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Nov 2021 16:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236332AbhKNV2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Nov 2021 16:28:46 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A28C061746
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Nov 2021 13:25:51 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v11so62865365edc.9
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Nov 2021 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tZSSynsKcz8SQQ9wlQiwyLd1LjN5A0/Q7Az2vBog8fs=;
        b=f/viiwPOa9QV59R4dkB8sPRey//vAi2MFsdmXxOnQDPgzBE5u6TsL8/xevZYp8DEoj
         E9DBrfwFkIxLTkn+Ciwp2Pk5aalk/Tl6op7yjcFs+9R219irGePGGHcCsQImGNUgixv8
         J51bTeoO3LyQrNlcHCfVtoFUoRdWd7B/iriEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tZSSynsKcz8SQQ9wlQiwyLd1LjN5A0/Q7Az2vBog8fs=;
        b=jIRPwl1F8Cjac3gso+WIM8HUtIqLhB8Yj3Ll18fJoEFE7H0V50u1ybEBq2r8Yf7TrY
         +xusH7l6VS/IONmCTx2KVGRsPDT+peZ7wyJKSYJIQHv4metofPcwd8G62ZJf4+0NRqHw
         fYvkw2YuCS2fBJs1O/DzXkgk4u6giRyTgf6P1FK0xH0NMNmzp/S6eHn29hRsFpprPiLH
         ObctMCsyUtrMkx/fkfNRk6T2BXHNGfeDa8Xb+hi3bmhkI82M+lymV6wxll+5cNPkb7Op
         ei47htZcOQY/cByl4edrPK1nXaq+hfo/ZpIloSmYFT/xVuY9v5e07j/nkrPDVEhVcTVx
         oz5Q==
X-Gm-Message-State: AOAM531TK0w9gF3zp1rw6t4IGe6dzUND33Sea5UP42s2mleVyqImbxkH
        nJJdLVrpP7LCyt2Ca482extyKNEzM5X/yKFu
X-Google-Smtp-Source: ABdhPJwkasHtyNHsHF96gF6EhEG1r1d5SherAHDZQYdMI3WCIZ5SBUWfe1UHb84tYklhSbQed/CKQQ==
X-Received: by 2002:a17:906:388c:: with SMTP id q12mr43189207ejd.281.1636925149847;
        Sun, 14 Nov 2021 13:25:49 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id p3sm5477926ejy.94.2021.11.14.13.25.48
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 13:25:49 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso8930865wmr.4
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Nov 2021 13:25:48 -0800 (PST)
X-Received: by 2002:a1c:7405:: with SMTP id p5mr51964221wmc.152.1636925148688;
 Sun, 14 Nov 2021 13:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20211114005725.GA27075@embeddedor> <YZF9MY6rRLQwdTgM@archlinux-ax161>
In-Reply-To: <YZF9MY6rRLQwdTgM@archlinux-ax161>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 14 Nov 2021 13:25:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgqEfw1wFcj98VxyvnoDsUhmYm_P_KuFOpEWe5zmYAp1w@mail.gmail.com>
Message-ID: <CAHk-=wgqEfw1wFcj98VxyvnoDsUhmYm_P_KuFOpEWe5zmYAp1w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Nov 14, 2021 at 1:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> It feels a little odd to have this in Kconfig but if it works and gets
> the warning enabled, then so be it.

We've actually been actively moving more and more of the compiler
flags configuration to Kconfig time.

The Kconfig language makes it fairly easy and natural to do these
days, and in some cases the compiler flags end up having a number of
other dependencies (not in this case, but look at things like
CC_HAS_KASAN_GENERIC etc, where the existence of some compiler flag
ends up then also affecting whether other options can be enabled).

So the whole "move it to config time" ends up being the direction
we've been going, and the only really unusual case here is that it
ends up being done as a string config rather than as a boolean.

And that's just because the different compilers also have different
flags in this case ;(

              Linus
