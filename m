Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FF83383B9
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhCLCkn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbhCLCke (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:40:34 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4993C061762
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:40:34 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id t37so4109073pga.11
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wQ2W9gu3Osj3MdqScThl5MpYybHbMYo3x9B6R2Mk6L8=;
        b=NZXDAK2nVsB5XLAK6iQkiJruNlfdqCk+PJ5VanZ25OXi+Q7zOTY+NZjcnHTYoiEtfi
         5wk/CnP+uAgWsZoZ/bHZzWMDdnp91wseWZkkXoKIWJYj/tDgoqrTmJkkLAGNo4onaoRj
         d0ViJy+d71HMPrIzKYMvvRJfOnUHCkn/TdDgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wQ2W9gu3Osj3MdqScThl5MpYybHbMYo3x9B6R2Mk6L8=;
        b=Eoy5oN15GOOHMoRQE7AWvp59OddIbDISEcjYVnTolOrtHaL8eOIj/LP+62jeSS4O51
         l/et5PJGT4uSBjTSni7K4p2mm0CxPTkOMwBE2SJSisJws09Kwpe7IaYkAJcDgJGHNakb
         Qs7ZEctMoZLXB5YeRphSRofmCsGCHwvPh01Ew5kpfn2DE+5EFSs5XsNyD3uNLgBp/UF9
         EOjBJISlLgk4757aqs+w3OMfKvHq6qwMfhUKtBFb/k6nyvkHxEeNCMfXmZIpLfpxPWa1
         lNepuc6w+SKV3pWbS9bFIyYCVJYkLZJfnTvNPhAmVGCIp3aeDdZcuiflxQA7tRiKJz7y
         /fIA==
X-Gm-Message-State: AOAM532DfhUAlf2SYMbUjd1xKRmuDXj3xBw4n3bc/FkJHQvBx2wO938R
        ZdGB0L6obMPsEeEMg2hbG2MpEg==
X-Google-Smtp-Source: ABdhPJz9mHRexfp/qVZ4vgjUgGk0DFoPnlAxOoA8yf6zI0h/vMdT7tBN76386sP73c1cfoYW99A5EA==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr9740097pgl.29.1615516834269;
        Thu, 11 Mar 2021 18:40:34 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s62sm3689109pfb.148.2021.03.11.18.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:40:33 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:40:32 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] mm: add generic __va_function and __pa_function
 macros
Message-ID: <202103111840.73C55A4A@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-4-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-4-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:05PM -0800, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler replaces function addresses
> in instrumented C code with jump table addresses. This means that
> __pa_symbol(function) returns the physical address of the jump table
> entry instead of the actual function, which may not work as the jump
> table code will immediately jump to a virtual address that may not be
> mapped.
> 
> To avoid this address space confusion, this change adds generic
> definitions for __va_function and __pa_function, which architectures
> that support CFI can override. The typical implementation of the
> __va_function macro would use inline assembly to take the function
> address, which avoids compiler instrumentation.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
