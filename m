Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D558C28EB24
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Oct 2020 04:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbgJOCYq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Oct 2020 22:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgJOCYi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Oct 2020 22:24:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E56C05BD2B
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2020 15:47:02 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 1so493549ple.2
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2020 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1ZkeuWYx0x8NcK97W3bc1qXSyhy0ywO9Zu1gztVJSpU=;
        b=WE3ire40GLinUOppIi7ZcbOVETm0WyX7RLx7xCaymADCWSNOR8y2/RwcPtSnft1aFu
         0ChZJ7ygTGlmsX8EVM6bGmei1Zx5q2bj0yebVv+SOHsAiV0uEn+oar9jyVds8dZOPeFt
         NDilDA6BdcrnvpJnue+wzGel9tWEzsFUzutQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1ZkeuWYx0x8NcK97W3bc1qXSyhy0ywO9Zu1gztVJSpU=;
        b=HfB57xWfgaKV9TFd7wjYAJ8s50a/iAqTqk4xL3Dvyr7tY32/pcb2gCohoZ8B5422w+
         yS1l1FETiGZjhN1aaiqw9v5qn7s/pAQBnAiE+NgTW/m7Ttn98IhrvBAqA1CXVnn2cWpX
         oeOqbMRmb8/JBtmlIHJmLqHTx7m7qQ77cZz+Ozfhw66Oqf1MllULPQ42VwSrAxr1rNeN
         rP57pjo9zacrXGGG5OEjG3VK25Jay6umBi0KAYv8FnY1+aUjLZK4GgMS9L9p4OBHCWw9
         LWmTZxVo1uozt/fHjcSwhYJu9ASiJ4t919rsAsWGRLbYjM+KKSr+4BA4ayLXzBR8doh1
         /Cfg==
X-Gm-Message-State: AOAM532tXXoRhijDjhVkheSTWzyiWx76vclOKwqIqTWpbsOIqCGayNb0
        o5fivQZzsfFFiun1cdp2JBbLSQ==
X-Google-Smtp-Source: ABdhPJw7BSKlM7cAv8r7/0jhJx32xhaKYpzsb2RiBeH0xy7bNtYmDuLkURklLKzHhQnxbTes9rTU2A==
X-Received: by 2002:a17:90a:f0ca:: with SMTP id fa10mr1313834pjb.130.1602715621497;
        Wed, 14 Oct 2020 15:47:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d9sm591245pjx.47.2020.10.14.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 15:47:00 -0700 (PDT)
Date:   Wed, 14 Oct 2020 15:46:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v6 22/25] x86/asm: annotate indirect jumps
Message-ID: <202010141545.1E2A393C62@keescook>
References: <20201013003203.4168817-1-samitolvanen@google.com>
 <20201013003203.4168817-23-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013003203.4168817-23-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 12, 2020 at 05:32:00PM -0700, Sami Tolvanen wrote:
> Running objtool --vmlinux --duplicate on vmlinux.o produces a few
> warnings about indirect jumps with retpoline:
> 
>   vmlinux.o: warning: objtool: wakeup_long64()+0x61: indirect jump
>   found in RETPOLINE build
>   ...
> 
> This change adds ANNOTATE_RETPOLINE_SAFE annotations to the jumps
> in assembly code to stop the warnings.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

This looks like it's an independent fix -- can an x86 maintainer pick
up this patch directly?

-- 
Kees Cook
