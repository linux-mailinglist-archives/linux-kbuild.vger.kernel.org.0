Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF56F22C7FD
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 16:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgGXOa0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 10:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgGXOaZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 10:30:25 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98ADC0619D3;
        Fri, 24 Jul 2020 07:30:25 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id j187so8718772qke.11;
        Fri, 24 Jul 2020 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0doYQZ5KxAI0epYHGnX1pY85PpBpa6FQXw9KGp32jgE=;
        b=LSCgymqc23a7u8vGj3ljfoI1PZJMaYtkE7yqqQ+OCssLoh1nS1vOJMLcD8L/F48j4f
         FtTGxSON+/y1bHXvduhGAJ0DMGz62kCmajpHJM64C/6x8Co2LDx1YAybIuanYVMX1O83
         O21zAvfXtVHHfJmoKaq8unw740IYMTDbnbxn2alMQ/XUzd2zBaJOq0Y5oyzp6RNXNkez
         Va9Jvo3i7wTKzgpGQZafRP+QSUsgdrlwz6Ebse5duXww5Ci8+44xD9g5s5Uv4h9tZq1L
         +py/6CsNgO+lbxUpsgzAUCCKnof+rh/kq+m7hKo/fHGM2FsSF2rYaO6DqCiHvIpt4OVZ
         BRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0doYQZ5KxAI0epYHGnX1pY85PpBpa6FQXw9KGp32jgE=;
        b=c7q9IK60QhmI+ngs2LkouPClct791zJQVNkvTTgJ/iSi9HwsZMP7EFJffuTZR2ZCaz
         in/fCvnJST95P7jrwbP4el2VG88k4ouhx2kR2ms76QHs3H5ItLkyFrV/TFc5PXWrvxFQ
         ROe649Kcjleh82NSTOLFlczjIJpPqhbvXE64526mca2dWxAtAE/xXTuYjYIFL0inbW4O
         HPSiWUB6jgJhBe95mwvZl7REwvW6GLx3bOLSlL5C5q9cVbcLsIxSXBCVe3XIfaYCYfht
         oU7H7p5ywybbnxOONIjTG1ijVfDJ/Ci978/BCqMNUCQ53WOLh2DtSw+6f3spslYDVlN9
         izwg==
X-Gm-Message-State: AOAM533GjB6JSIk3VmVopmMwWTzmz82mXVwMCg6VhLMHqnLRksHe8k+b
        CwqPjzDwJRkQDml+tKlroqU=
X-Google-Smtp-Source: ABdhPJycpsyk8cS1ebXw2OYgrfVPpRHkjnq6ng5g57Pf/jCGvIpcIrVGARtXuqyL+Etpg52cwm2ESQ==
X-Received: by 2002:ae9:f002:: with SMTP id l2mr11185843qkg.437.1595601024671;
        Fri, 24 Jul 2020 07:30:24 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id u42sm1697045qtu.48.2020.07.24.07.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 07:30:24 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Fri, 24 Jul 2020 10:30:22 -0400
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Message-ID: <20200724143022.GA601509@rani.riverdale.lan>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-7-nickrterrell@gmail.com>
 <CA+icZUWV3ANmBj08QZKBtEE38Y-iyCGGxLWtiFkdpKqkGP7ZqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+icZUWV3ANmBj08QZKBtEE38Y-iyCGGxLWtiFkdpKqkGP7ZqQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 24, 2020 at 02:50:34AM +0200, Sedat Dilek wrote:
> On Thu, Jul 23, 2020 at 9:30 PM Nick Terrell <nickrterrell@gmail.com> wrote:
> >
> > From: Nick Terrell <terrelln@fb.com>
> >
> > * Add support for zstd compressed kernel
> > * Define __DISABLE_EXPORTS in misc.c
> > * Bump the heap size for zstd.
> > * Update the documentation.
> >
> > Integrates the ZSTD decompression code to the x86 pre-boot code.
> >
> > Zstandard requires slightly more memory during the kernel decompression
> > on x86 (192 KB vs 64 KB), and the memory usage is independent of the
> > window size.
> >
> > __DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
> > kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile gives
> > duplicate definition warnings.
> >
> 
> That was reported by Arvind - feel free to add a Reported-by: ...
> 
> - Sedat -
> 

It's not necessary to add Reported-by's for problems encountered while
developing the series. Especially as it was my drive-by suggestion to
use __DISABLE_EXPORTS that introduced the issue in the first place :)

I'd have added it to the Makefile and just dropped the definition in
kaslr.c -- should be no reason for anything in here to use EXPORT_SYMBOL.

Thanks.
