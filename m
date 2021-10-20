Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85511435380
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 21:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhJTTMu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 15:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbhJTTMo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 15:12:44 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE8CC061755
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 12:10:29 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id f5so23348362pgc.12
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 12:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wVGzzfgnL/5+EVz7nUkXUAXqxSjihMCdywSgZNSjBYw=;
        b=DwMQ4D3wZpgIR3NIpfycsBq2xaES5DyGbqyRS/i5o/nBWcgMLVNvEeu0KcYNrUQxhj
         kZm3bs1BEdShJK+Dn5WC5+veOD0bRgMYqDhc9DpeOjhAVyCJx4O+tLnj9VBHRgBIZ0AV
         9wGHLHARLPRy7skB+8Itej1+BxlysWKWl6Po4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wVGzzfgnL/5+EVz7nUkXUAXqxSjihMCdywSgZNSjBYw=;
        b=nQ/2RTs5zSoXLHUAFOx9O0PBKClVES9Hemwli5ycPCgGKRKJFY5HBN0fpnvUJDFUzG
         aUgiMtmwoKIRanpqirOs5ORhKs15J2OoAi4RhQOUFWpnAxK/ya7yhuyWZgvi6FHuJ0QG
         scPPJVFeuN6lvM8IIyKmU+s/kBhcYC9F9cW43/akIEA1eBLAF5MEUlh1VJC5NejW7M57
         Iqd1rNcXr6loTZqaGDIrA0/f5zdzC1k7We8kibkQAjFEAISarK8WkfmZifh0PUbYzqAT
         F4bo7MIEKmDkPhprgbavwD7R9dwGHKcX3iVji81Px736juJmrBbfgvL7S8d/jkLGTfqp
         N4Jg==
X-Gm-Message-State: AOAM532CXmnYhd1hQTfp1Qr8LKsomUiRmk0a0zefB0xA8v+QBT6qRgu3
        CM5k7J4caCyHBp5H5pG4kPB6lOolbAAPYA==
X-Google-Smtp-Source: ABdhPJyXWd8u1gETbwuD1vZ5RgGVUE1xxBqGz1WjKcwOLNGdrFGtWRibkkRqU5gREEBYytayh7HBNA==
X-Received: by 2002:a05:6a00:1829:b0:44d:df1f:5624 with SMTP id y41-20020a056a00182900b0044ddf1f5624mr598429pfa.27.1634757028834;
        Wed, 20 Oct 2021 12:10:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p31sm3324671pfw.201.2021.10.20.12.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 12:10:28 -0700 (PDT)
Date:   Wed, 20 Oct 2021 12:10:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, Dan Li <ashimida@linux.alibaba.com>,
        ardb@kernel.org, ojeda@kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] gcc-plugins: Remove cyc_complexity
Message-ID: <202110201209.A245EFB94@keescook>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-3-keescook@chromium.org>
 <YXBWi/bCQoddzXB6@archlinux-ax161>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXBWi/bCQoddzXB6@archlinux-ax161>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 10:48:59AM -0700, Nathan Chancellor wrote:
> On Wed, Oct 20, 2021 at 10:35:54AM -0700, Kees Cook wrote:
> > This plugin has no impact on the resulting binary, is disabled
> > under COMPILE_TEST, and is not enabled on any builds I'm aware of.
> > Additionally, given the clarified purpose of GCC plugins in the kernel,
> > remove cyc_complexity.
> > 
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-hardening@vger.kernel.org
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> One comment below.
> 
> > ---
> >  Documentation/kbuild/gcc-plugins.rst        |  2 -
> >  scripts/Makefile.gcc-plugins                |  2 -
> >  scripts/gcc-plugins/Kconfig                 | 16 -----
> >  scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
> >  4 files changed, 89 deletions(-)
> >  delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c
> > 
> > diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
> > index 4b28c7a4032f..0ba76719f1b9 100644
> > --- a/Documentation/kbuild/gcc-plugins.rst
> > +++ b/Documentation/kbuild/gcc-plugins.rst
> > @@ -96,7 +96,6 @@ Enable the GCC plugin infrastructure and some plugin(s) you want to use
> >  in the kernel config::
> >  
> >  	CONFIG_GCC_PLUGINS=y
> > -	CONFIG_GCC_PLUGIN_CYC_COMPLEXITY=y
> >  	CONFIG_GCC_PLUGIN_LATENT_ENTROPY=y
> >  	...
> >  
> 
> There is a comment about the cyc_complexity plugin at the very end of
> this file that should also be removed it seems:
> 
> "See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin."

Yup; I think it was hiding from you, see here:

> 
> > @@ -115,4 +114,3 @@ The GCC plugins are in scripts/gcc-plugins/. You need to put plugin source files
> >  right under scripts/gcc-plugins/. Creating subdirectories is not supported.
> >  It must be added to scripts/gcc-plugins/Makefile, scripts/Makefile.gcc-plugins
> >  and a relevant Kconfig file.
> > -See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin.
    ^^^^

:)

Thanks!

-Kees

-- 
Kees Cook
