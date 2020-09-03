Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD1D25CE14
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 00:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgICWri (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 18:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgICWrf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 18:47:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7702C061247
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 15:47:34 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o16so2261861pjr.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eFrstCXBN3HfrZebeISGA36KawHO68DuV5H+8+oCMrk=;
        b=UyJevSS3jZbv6N7QB5+swtwOzbQH8Mebfc6NiguMHEEa3zpvf2Fa8BOPsjRPafItrX
         94+boIdY0eIFAYNargKYhKvUD4q+qsol+8WhYmSNTTfQeUzQx66molHRZp0VKRR4pNjd
         TeTJKO1SkL6fNUa/+nF94zP8Ps5d09zjKGzZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eFrstCXBN3HfrZebeISGA36KawHO68DuV5H+8+oCMrk=;
        b=pbo5wpe19Wgt9uZ1vLmDQ+BJ7yBKm30iWmYujSoMcDnNFqNUPSD5J6CDXnoz5XfeYh
         Zu0zE+3zZRs55aUZEpsc2y5Og9A2HA8TWgDR0GWHJI3VJiCHKs2F6qa1OeAX4Cg7Egsb
         G9g/4BJ/ukkti00WDIqbzxwY8F6Xo7oWErhATd8bLeuOxWwn2fMaHtCua0DD3o8rIaiq
         Af1kYw/Ploiy7NwMIQbmlstlWajOi6GckHZoUkygc8Cff6tMI2DNWxMLRpe7tA7RFK9M
         f2wfwyEYcvJFOL9mvCKFXOriuZeBJiS52G0UD4L53aOP4rVg0KJFOMz8JKXToSC9+Vs6
         /QtA==
X-Gm-Message-State: AOAM530se5zbrAHqfyO/fJMYtWkFgeNlazYR3rxz7DmCObjV8X7ucxzr
        MoiEJb9ntNf2EHHRM3EP9RSODQ==
X-Google-Smtp-Source: ABdhPJxBUddtcfqLuFrofAmKe3Wkr2dCSnES8MsReM+zYAT8LfVgd6BWIelLMAoy/r1/rEVW2WoePA==
X-Received: by 2002:a17:90b:889:: with SMTP id bj9mr5382384pjb.101.1599173254469;
        Thu, 03 Sep 2020 15:47:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s198sm3700589pgc.4.2020.09.03.15.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:47:33 -0700 (PDT)
Date:   Thu, 3 Sep 2020 15:47:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 27/28] x86, relocs: Ignore L4_PAGE_OFFSET relocations
Message-ID: <202009031546.4854633F7@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-28-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-28-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:52PM -0700, Sami Tolvanen wrote:
> L4_PAGE_OFFSET is a constant value, so don't warn about absolute
> relocations.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Any other details on this? I assume this is an ld.lld-ism. Any idea why
this is only a problem under LTO? (Or is this an LLVM integrated
assembler-ism?) Regardless, yes, let's nail it down:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
