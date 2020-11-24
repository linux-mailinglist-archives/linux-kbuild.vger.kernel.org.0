Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22E32C2E85
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 18:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390828AbgKXR2j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 12:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728749AbgKXR2j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 12:28:39 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCCEC0613D6;
        Tue, 24 Nov 2020 09:28:39 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id d5so7617207qtn.0;
        Tue, 24 Nov 2020 09:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d9JcnTG5JgeooMfKrRunrCMwnGXThm1f4yiaLwKkVO4=;
        b=SPczykiC7FK1BLtNtG1KAa5bptCDzNbkm0f2Y5O/Dm+rQ6NrMvwBRFVYege24xnZus
         8Um2rpW22d8QjKs+KCXOnxOa0cIl2qCCHEM+g0ZDlZMjFdzffHZ2KH7Fiikf2wi9a6Ol
         e3vhrSNoQZd+GNRVw/quW5LI7zY1Wxc7Kp3y1o/aycKEd9Uyv1pqqb8+oLs7t1nSHq6K
         NJGPySg0G5gsF/i3WUS27IocKKlTndGWYsfbdNg0jFANrkxZg6HAjbBseR2EALzm/hCC
         vApejRKAtngkuIeV/Bpxpja2Y+PxS7jey14zTpjQ3lKF07ekbrtTHHscjg2hkzRLKwH3
         YnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=d9JcnTG5JgeooMfKrRunrCMwnGXThm1f4yiaLwKkVO4=;
        b=ZfRsNvkvGuoFuxKuuKwZQWPk4af1Bt350BZRy93xARWXcIKQK3BGEO09XoF+K+UN1X
         qFSoTFaW+JI7nPG9yQECLMR2f0roM2jJOVtdgLYSmsicDMZDhoqcL/VcaWnqQNU2SKjz
         ewHmk3p+GsCybrSob/FgqC5hoyzMInLSGi2CN/rSj6HdyOqKOoEGXcg3tP4xp1hLH3I+
         lyhesdm8Rm8dKEzz2aPNRXxB4QdVRbv5wq6Ndsy8EnlPwFXxzV2HkyrH863X1Pru6Dit
         N9IKXHFjWobeZwsxWtGUF4nTce4dEUdNqhfMrRQ4Ts7nXZi48SnhaxXOIG8iShRQwBeX
         kKoA==
X-Gm-Message-State: AOAM531OinmumRGed+t3dTsAgckxCNiM7YD3gFXfNVPCqCdFjmUBwouP
        zpTXrIEP3TCYd3Y/XhldvV4=
X-Google-Smtp-Source: ABdhPJwSsQPuJ+lsWMaJlhRKTY7GXjPlzUOfbGS7clZ2fl3bLrHzO5Vwpi4SAE5L9Cr1v0Kpd/8i3g==
X-Received: by 2002:ac8:7518:: with SMTP id u24mr5429666qtq.114.1606238918661;
        Tue, 24 Nov 2020 09:28:38 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id p128sm9158424qkc.47.2020.11.24.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:28:38 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 24 Nov 2020 12:28:36 -0500
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v2 4/4] Kbuild: implement support for DWARF v5
Message-ID: <20201124172836.GA346213@rani.riverdale.lan>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
 <20201104005343.4192504-5-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201104005343.4192504-5-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 03, 2020 at 04:53:43PM -0800, Nick Desaulniers wrote:
> DWARF v5 is the latest standard of the DWARF debug info format.
> 
> Feature detection of DWARF5 is onerous, especially given that we've
> removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> support.  GNU `as` only recently gained support for specifying
> -gdwarf-5.

With gcc, using -gdwarf-5 even without -Wa,--gdwarf-5 results in
considerably smaller debug info. gcc does not seem to generate the .file 0
directive that causes older GNU as to barf.

Should the assembler support check be restricted to CC_IS_CLANG?

>  /* Stabs debugging sections. */
>  #define STABS_DEBUG							\
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 03c494eefabd..c5b54ba51060 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -274,6 +274,14 @@ config DEBUG_INFO_DWARF4
>  	  It makes the debug information larger, but it significantly
>  	  improves the success of resolving variables in gdb on optimized code.
>  
> +config DEBUG_INFO_DWARF5
> +	bool "Generate DWARF5 debuginfo"
> +	depends on $(cc-option,-gdwarf-5)
> +	depends on $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
> +	help
> +	  Genereate dwarf5 debug info. Requires binutils 2.35+, gcc 5.1+, and
> +	  gdb 8.0+.
> +
>  endchoice # "DWARF version"

Perhaps this can be expanded with some description of the advantages of
dwarf5 over dwarf4?

>  
>  config DEBUG_INFO_BTF
> diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> new file mode 100755
> index 000000000000..156ad5ec4274
> --- /dev/null
> +++ b/scripts/test_dwarf5_support.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Test that assembler accepts -gdwarf-5 and .file 0 directives, which were bugs
> +# in binutils < 2.35.
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=25612
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=25614
> +set -e
> +echo '.file 0 "filename"' | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -

This also actually needs --gdwarf-5 to really check the support for the
option, but older versions should error on the .file 0 in any case.
