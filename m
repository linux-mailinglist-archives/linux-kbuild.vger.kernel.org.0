Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1345F217D84
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 05:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgGHDXd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 23:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgGHDXd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 23:23:33 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1EDC061755;
        Tue,  7 Jul 2020 20:23:32 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id t7so19852774qvl.8;
        Tue, 07 Jul 2020 20:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0tB4yD5kInlZmy1upi23IYYVXDZraVGUBEv20VlqeTE=;
        b=VK2rzIejF6RAq9zDQnBEBxXLePiSGScgzCtI4kUlohWOu8Ea3Nd3R2/K9XzhqsFVCK
         JDzEg4s4EwNUne3GplxSmEbcwHrVCTNqjA83EqK1ifBb5+JnOhtCxabCMzsibIfqNsvC
         AYzRqR29Ne7LnPCaDmeFFwVSaV34rOohdRD9mlIASCppx5JbPFHFmzpv1Q6KGbJBlDVn
         LycBAohVRkR64f8ij2TONkYdp69WvGR8Lb/3ag0RKcsuqBB2GUPoSJdwEEY81YKQvdDB
         3nA2XY+qE1IOA1M6sNcKH2RHJrxjmwpuXoyox2nkyf3MlN4loLS4xXc9BeHkyf37lKzB
         DiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0tB4yD5kInlZmy1upi23IYYVXDZraVGUBEv20VlqeTE=;
        b=qMUAnrfYCoClycgMNX1o7dBxB57sNWZiN+k+HMK8pCC1PKKXfWQmYFReDDrSCRMkYN
         M98KfxxvCDCsxval3rQ2lPwgO7P8336ob7FHUTjsf+PeVHe3qlDpuRxw7dAvoiGcujT5
         uXLRkLf3Qcd/eNg67muMobHV7GJACwPYf8K0GCjmJfmQkf1royh/IApCG7x1DKP5284S
         8X1srQ713FkFORoDNZHcTJi3KVNPkSIvqbchHd91WXeTEglIiQkBpBkTP2pXXixJfh4J
         wYY9tyfxiKu8eGteRizzZmm1ojKAxNAdjboI5Xb5qhfucZ4WvUWyZma7XxDh4iFEuvSu
         yS7w==
X-Gm-Message-State: AOAM531POu0wFOnvR/aKWxV8JKYKFtYXn4YxTctN46PytJ9teWfpLVhB
        +959LM/Mquen4mPrtzP1qC8=
X-Google-Smtp-Source: ABdhPJxAQp5az1SIV+4Vq38pQumLjoTSoxuOs9eJ5X285QH9uuaz1vC1Eq4d7KNq1zUyr7TTeNgSuA==
X-Received: by 2002:a0c:e78e:: with SMTP id x14mr38208940qvn.65.1594178612000;
        Tue, 07 Jul 2020 20:23:32 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id h197sm25525655qke.51.2020.07.07.20.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 20:23:31 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 7 Jul 2020 23:23:29 -0400
To:     Kees Cook <keescook@chromium.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v6 2/8] lib: prepare xxhash for preboot environment
Message-ID: <20200708032329.GB1847378@rani.riverdale.lan>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-3-nickrterrell@gmail.com>
 <20200707215925.GA1591079@rani.riverdale.lan>
 <202007071947.5E9723AF48@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202007071947.5E9723AF48@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 07, 2020 at 07:49:25PM -0700, Kees Cook wrote:
> On Tue, Jul 07, 2020 at 05:59:25PM -0400, Arvind Sankar wrote:
> > On Mon, Jul 06, 2020 at 08:45:58PM -0700, Nick Terrell wrote:
> > > From: Nick Terrell <terrelln@fb.com>
> > > 
> > > Don't export symbols if XXH_PREBOOT is defined.
> > > 
> > > This change is necessary to get xxhash to work in a preboot environment,
> > > which is needed to support zstd-compressed kernels.
> > 
> > The usual way to do it is by adding -D__DISABLE_EXPORTS to the CFLAGS, which will
> > cause EXPORT_SYMBOL to be stubbed out. Doesn't that work here?
> 
> This is quite rare, actually:
> 
> $ git grep DISABLE_EXPORTS
> arch/s390/purgatory/Makefile:CFLAGS_sha256.o := -D__DISABLE_EXPORTS
> arch/x86/boot/compressed/kaslr.c:#define __DISABLE_EXPORTS
> arch/x86/purgatory/Makefile:CFLAGS_sha256.o := -D__DISABLE_EXPORTS
> drivers/firmware/efi/libstub/Makefile: -D__DISABLE_EXPORTS
> include/linux/export.h:#if !defined(CONFIG_MODULES) || defined(__DISABLE_EXPORTS)
> 
> But yes, it seems that would be the better approach.
> 
> -- 
> Kees Cook

Looks like Ard added it a couple of years back [0] but it got used only
for the EFI stub and not the decompressors.

[0] http://lkml.kernel.org/r/20180704083651.24360-3-ard.biesheuvel@linaro.org
