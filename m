Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D622BBA84
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Nov 2020 01:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727157AbgKUAIq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Nov 2020 19:08:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgKUAIp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Nov 2020 19:08:45 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99893C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 16:08:45 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so9452520pfn.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 16:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZrI6T0ydbBGHVkvNAITM1/rIzBX4TKDzD+4JBPsjVAU=;
        b=jdjYaxbUzlqk4snx5STJs9c411mkqGRvaAvaha/amTKXJU9fZPQWsoZ8Ed3KIQw4ja
         mBRbalwnztTkPDbdJI5G2sIfrSCr7If5HYlFrLCJbofKQbI0ZoWG8UUmNU8xPtQqLFiR
         RQcHeEoMBRUOZMePca3LRVAiz6fVXCeRkfjAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZrI6T0ydbBGHVkvNAITM1/rIzBX4TKDzD+4JBPsjVAU=;
        b=Q32TabwMs6SH/1WGibn5dyow4QSyB0EHhIRPJ9Dq5ht4nP5CDOVsQt6+WZKIJzQCwv
         03+u3r4xoFUNnxGg6Qexy8gluFJfeqrdPVDN/U/IC0S3ddyDvV4yptIBSx0iX41X8KxU
         bwmGT9ndkWw9Xr5cNpB8EhbfGeXuW7sCq/tKENbHm6Pndz30KskDBkKsC+Dz8wWOhpR1
         PVMev1mwAn0HSvGE+TEi2LI+0TO71GKkJ6IvPwZE+P4uwK7Ko1TRO19gmwEMn1yqkFlO
         cIEIM41WV0JZgHbnX4KP5FEJqBDGslgrkrH0WrssFNIk05oHnpjdataK+e19s96vHusy
         S20Q==
X-Gm-Message-State: AOAM533GE4IhDtt+kzmS0gDAh+nDeUSzgCZZB2EMykFBBTZD+gn4dRet
        tF+YKu5KHpvIf6xzdU6cXZb7iQ==
X-Google-Smtp-Source: ABdhPJz2VCMT0GkwPGQ5DfLfgvDeslgTacR3q9aKQe4GBKPv6eKou3aGHdxLiBBAYPFreVGoa8LMSA==
X-Received: by 2002:a62:cd0d:0:b029:18b:a1cc:a5be with SMTP id o13-20020a62cd0d0000b029018ba1cca5bemr16150890pfg.67.1605917325096;
        Fri, 20 Nov 2020 16:08:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fu5sm5201126pjb.11.2020.11.20.16.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 16:08:44 -0800 (PST)
Date:   Fri, 20 Nov 2020 16:08:43 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <202011201607.75FA476@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119204656.3261686-1-natechancellor@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 19, 2020 at 01:46:56PM -0700, Nathan Chancellor wrote:
> Currently, '--orphan-handling=warn' is spread out across four different
> architectures in their respective Makefiles, which makes it a little
> unruly to deal with in case it needs to be disabled for a specific
> linker version (in this case, ld.lld 10.0.1).
> 
> To make it easier to control this, hoist this warning into Kconfig and
> the main Makefile so that disabling it is simpler, as the warning will
> only be enabled in a couple places (main Makefile and a couple of
> compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> conditional is easier due to Kconfig syntax. One small additional
> benefit of this is saving a call to ld-option on incremental builds
> because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
> 
> To keep the list of supported architectures the same, introduce
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> gain this automatically after all of the sections are specified and size
> asserted. A special thanks to Kees Cook for the help text on this
> config.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Masahiro, do you want to take these to get them to Linus for v5.10? I
can send them if you'd prefer.

-Kees

-- 
Kees Cook
