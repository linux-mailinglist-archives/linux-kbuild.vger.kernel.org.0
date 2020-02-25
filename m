Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 426CD16B882
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 05:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgBYEZU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Feb 2020 23:25:20 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45896 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbgBYEZU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 23:25:20 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so6474024pfg.12
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2020 20:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V3nWmStnvPZrHNcjnbGk3TD16rtsFo3zS9ml9/tupfA=;
        b=Os+w8rwORbsSvA9/rgOQxjk9S+07cf3g1CvGuWAM6uFAwhSWbDL7GHzGIaudmk2yf2
         36n05PVA5rv0QjBX0cF2vNZ+wPMVub0+cIrLBXwOKMJToxcz0Q6KaSL8zXR1GIDslTJ/
         2raWdrHck/2t57HY4PwnZ6fnNZy/Q/hQMZfEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V3nWmStnvPZrHNcjnbGk3TD16rtsFo3zS9ml9/tupfA=;
        b=LIYDgCe5JVc//5+hNF1P+9A8LtuIF6T+3Or/md6rhxQ7gGvr3f52nvknq9+dlAhQ/J
         mRsWsOOkezadugTXLocE/BD61vxQR6VfOMya4PsE6SiZ5UkFX6Ti8CSe8xbMu82TBEX6
         cUAZvCysmxvRQRZ4BIYFYBYYJf0tedTOTAqkbk5AdW30tjGmkBeoUTjZSif7fxcptzdE
         nLiZqNMGtbLmiprcsf2aBPiKGqu/kodR/sGRnvH8VyYxZOaMdXmLezNyHi/fIcwmZh9O
         vAXRXJ9vmwJ37nWYEA5ehwRvdIvfh6Vp0w9692aaDpRcTNrssSvzHmweNMB/YFSY92F0
         lBAQ==
X-Gm-Message-State: APjAAAWKVZLO1Vqcsb/Jfn5ZiS8i9Ddz6ETWXeoEoMMNsTnkCu/VWSAx
        92ux1XHk9PVdJyLPIRSMCDKD/Q==
X-Google-Smtp-Source: APXvYqzUFoExhaYfwO6l6Dm9CbWXqNVrmAC1C4GQAZQIVOP0sF2hXsiJMAhOUZJQp9U5i4eYLsk5tw==
X-Received: by 2002:a65:6718:: with SMTP id u24mr57085768pgf.289.1582604720027;
        Mon, 24 Feb 2020 20:25:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x65sm15469700pfb.171.2020.02.24.20.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 20:25:18 -0800 (PST)
Date:   Mon, 24 Feb 2020 20:25:17 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, corbet@lwn.net,
        masahiroy@kernel.org, Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <202002242019.A9F519A33A@keescook>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook>
 <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 24, 2020 at 09:16:43PM -0700, Nathan Chancellor wrote:
> I think the clang one should be added in a separate patch that
> solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> macro and version check, like in include/linux/compiler-gcc.h.

Sounds good.

> ld.lld's minimum version should also be 9, what is the blocking issue
> that makes it 11?

I think I've mostly got future patches on my mind. lld before 11 will
blow up on this:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=build/link-time
(but I haven't sent this patch yet since I didn't want to break lld
until it was fixed, which it is now, but I got distracted by other
stuff).

Additionally there will be LTO, but LTO will be version-checked. Then I
was thinking about the orphan section handling, and there is very
clearly more work to be done there too... (i.e. the synthesized sections
get reported by the orphan warning before they're actually processed by
DISCARD is some cases -- I still need to isolate the behavior and open a
bug.)

-- 
Kees Cook
