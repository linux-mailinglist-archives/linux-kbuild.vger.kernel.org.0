Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B8B3383AC
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhCLCkK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhCLCjq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:39:46 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82D5C061762
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:39:46 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id t26so14904576pgv.3
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bWbXoBSRfLL/FoTdQfLfpXolWUy5m83XPY+H7QO24j0=;
        b=evzkYQgPA8nzFkbfdQKvRQL6ieuUkCwpRnth+avWnhVog6oBX6wwEDiqjRSV5zJc4/
         a0uxnzyPyJry3x4YSS1x4Kmnn2YsoxzEP8f6D0kWamIfwpqHbY5Y0/qY/FWzHxMfwihz
         yUkW/BECzVzHTMH03Su4DS19ldO5mtf+x1ZZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bWbXoBSRfLL/FoTdQfLfpXolWUy5m83XPY+H7QO24j0=;
        b=mX/DkbvigYUcQNQbyj2zU8BvySmV88p++zUlXI28kKHo7/gFQLmo5Y+srelwRF4PN/
         tIGJ8BEsPIrET8T8xW3zct6Z+zTbGG02OURSFFWU/gVvAWutwk8GcJQW/9D50tKdUfk6
         2XWziSIAQnRIJoVaf/qdJ73S+BDf8QNeBIQGltvoYQ0Jq8q7t2/3Y2Hxi18yykebBQHd
         hBZkHC5/EWnNS2fUg5iCPGnfEPTn7bdYzY8G+1GSkuE3stU+nvYZZVvSYzy3wBRzAp3Z
         Qti5rArJquhOIGqQ4n35B4/TkCw+kSMfaMiSP3XoUCsRFthG4ek+6oYrTZ9YAJDfQFuW
         EvDQ==
X-Gm-Message-State: AOAM533XLbVhaXUTvm5pNPUken7WIROdJHm2qeDZJ3TP7+3ugvkM5Ma0
        PbEaygi8kfVTJlSK+/SP7xcFyQ==
X-Google-Smtp-Source: ABdhPJwhrU4emOD5WayCUMZ7IN6WHeCVuTJ7ryuE6Iq+KPE0SNSElLD+CiEu3EiXqH08G+7H37jG2g==
X-Received: by 2002:a05:6a00:16c7:b029:1b6:68a6:985a with SMTP id l7-20020a056a0016c7b02901b668a6985amr10384578pfc.44.1615516786330;
        Thu, 11 Mar 2021 18:39:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t22sm393058pjo.45.2021.03.11.18.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:39:45 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:39:44 -0800
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
Subject: Re: [PATCH 01/17] add support for Clang CFI
Message-ID: <202103111839.4A4375E@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-2-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312004919.669614-2-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:03PM -0800, Sami Tolvanen wrote:
> This change adds support for Clang’s forward-edge Control Flow
> Integrity (CFI) checking. With CONFIG_CFI_CLANG, the compiler
> injects a runtime check before each indirect function call to ensure
> the target is a valid function with the correct static type. This
> restricts possible call targets and makes it more difficult for
> an attacker to exploit bugs that allow the modification of stored
> function pointers. For more details, see:
> 
>   https://clang.llvm.org/docs/ControlFlowIntegrity.html
> 
> Clang requires CONFIG_LTO_CLANG to be enabled with CFI to gain
> visibility to possible call targets. Kernel modules are supported
> with Clang’s cross-DSO CFI mode, which allows checking between
> independently compiled components.
> 
> With CFI enabled, the compiler injects a __cfi_check() function into
> the kernel and each module for validating local call targets. For
> cross-module calls that cannot be validated locally, the compiler
> calls the global __cfi_slowpath_diag() function, which determines
> the target module and calls the correct __cfi_check() function. This
> patch includes a slowpath implementation that uses __module_address()
> to resolve call targets, and with CONFIG_CFI_CLANG_SHADOW enabled, a
> shadow map that speeds up module look-ups by ~3x.
> 
> Clang implements indirect call checking using jump tables and
> offers two methods of generating them. With canonical jump tables,
> the compiler renames each address-taken function to <function>.cfi
> and points the original symbol to a jump table entry, which passes
> __cfi_check() validation. This isn’t compatible with stand-alone
> assembly code, which the compiler doesn’t instrument, and would
> result in indirect calls to assembly code to fail. Therefore, we
> default to using non-canonical jump tables instead, where the compiler
> generates a local jump table entry <function>.cfi_jt for each
> address-taken function, and replaces all references to the function
> with the address of the jump table entry.
> 
> Note that because non-canonical jump table addresses are local
> to each component, they break cross-module function address
> equality. Specifically, the address of a global function will be
> different in each module, as it's replaced with the address of a local
> jump table entry. If this address is passed to a different module,
> it won’t match the address of the same function taken there. This
> may break code that relies on comparing addresses passed from other
> components.
> 
> CFI checking can be disabled in a function with the __nocfi attribute.
> Additionally, CFI can be disabled for an entire compilation unit by
> filtering out CC_FLAGS_CFI.
> 
> By default, CFI failures result in a kernel panic to stop a potential
> exploit. CONFIG_CFI_PERMISSIVE enables a permissive mode, where the
> kernel prints out a rate-limited warning instead, and allows execution
> to continue. This option is helpful for locating type mismatches, but
> should only be enabled during development.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
