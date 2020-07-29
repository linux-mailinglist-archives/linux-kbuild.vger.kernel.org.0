Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D9B2326AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 23:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgG2VSU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 17:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgG2VSU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 17:18:20 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161F9C0619D2
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jul 2020 14:18:20 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f9so2878920pju.4
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jul 2020 14:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g0KUC06W8wfVDa5/aZnaCNDXj9N7Ln444BL6AjoPMxY=;
        b=Ov00EPcpcds4iXOLfFieegwR7hRlUtJeKUY5QQkoF0Jh9tZT4y47ON4fxaZEsShZVi
         fUtVBaFg6UI206ysebvZU7XlJKrNCGUtO3b3dYfZbBpeEv2+k58TFlsv9W2l+H5RlU/x
         xMnrIcH5vYD2zHkhisMgP8KYicUzt69+3EeaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g0KUC06W8wfVDa5/aZnaCNDXj9N7Ln444BL6AjoPMxY=;
        b=CT2jToJPje8fk7ZDMSlvCggSZwKx+DSmcbO1N5DDbWNeZiVwWQk4+F6HYS8MMnFpJB
         utpbhsMB4SPWRVmozNDJHQvzi9v5Rw/XwLwcqbcP/CZnRPNABbHl/ggx2pjGtOzE1GZi
         5Y9U+murDc35L9+ySzurXlGQmkLAbjVQOdLTLOPIIkWbASNxeAY4XSR6gh4Bfx+0eeAC
         FZVXusnUSbMwUH9kNkPf8k/WyKwwTv7UQObZlxXCwV2uj1vFiJIW0sRXlIDLnvFVqQ9d
         SbAFIx66D9jl939zB44fx3lukUrBWSb62ovMaqWIf6IDC2VW3nQ09rSH47Ij9aE/Z5+H
         P87A==
X-Gm-Message-State: AOAM531Mat2rSxKi/JthaLwh+OPGg6LYbqibN+soQ/z5aIkEegMFfw0g
        4JoXRbx90LlKwBTFRzcUoWIExw==
X-Google-Smtp-Source: ABdhPJwi4J+xm/nvozPDUCQnat7NJCVcTCoGI36EfCZlyYLjp9/7AClfhzP1RAFLsh2ytY1lCy1vVg==
X-Received: by 2002:a17:90a:3488:: with SMTP id p8mr12222748pjb.211.1596057499443;
        Wed, 29 Jul 2020 14:18:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h63sm2367630pjb.29.2020.07.29.14.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 14:18:18 -0700 (PDT)
Date:   Wed, 29 Jul 2020 14:18:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: move shared library build rules to
 scripts/gcc-plugins/Makefile
Message-ID: <202007291401.A50E25BB@keescook>
References: <20200729031537.37926-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729031537.37926-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 29, 2020 at 12:15:36PM +0900, Masahiro Yamada wrote:
> The shared library build rules are currently implemented in
> scripts/Makefile.host, but actually GCC-plugin is the only user of
> them. Hence, they do not need to be treewide available.

Are none of the VDSOs intending to use these rules?

> Move all the relevant build rules to scripts/gcc-plugins/Makefile.
> 
> I also optimized the build steps so *.so is directly built from .c
> because every upstream plugin is compiled from a single source file.
> 
> I am still keeping the infrastructure to build a plugin from multiple
> files because Kees suggested to do so in my previous attempt.
> (https://lkml.org/lkml/2019/1/11/1107)
> 
> If the plugin, foo.so, is compiled from two files foo.c and foo2.c,
> then you can do like follows:
> 
>   foo-objs := foo.o foo2.o
> 
> Single-file plugins do not need the *-objs notation.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

But, yeah, sure!

Acked-by: Kees Cook <keescook@chromium.org>

Unrelated, but I do note that objtool maybe has the wrong indentation,
path name reporting, and tool names (HOSTLD vs CC)?

...
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/extract-cert
  HOSTCC  scripts/genksyms/genksyms.o
  YACC    scripts/genksyms/parse.tab.[ch]
  LEX     scripts/genksyms/lex.lex.c
  DESCEND  objtool
  HOSTCXX scripts/gcc-plugins/cyc_complexity_plugin.so
  HOSTCXX scripts/gcc-plugins/latent_entropy_plugin.so
  HOSTCXX scripts/gcc-plugins/structleak_plugin.so
  GENSEED scripts/gcc-plugins/randomize_layout_seed.h
  HOSTCXX scripts/gcc-plugins/stackleak_plugin.so
  HOSTCC  scripts/genksyms/parse.tab.o
  HOSTCC  scripts/genksyms/lex.lex.o
  HOSTCC   /home/kees/src/linux-build/plugins/tools/objtool/fixdep.o
  HOSTLD  arch/x86/tools/relocs
  HOSTLD   /home/kees/src/linux-build/plugins/tools/objtool/fixdep-in.o
  LINK     /home/kees/src/linux-build/plugins/tools/objtool/fixdep
  CC       /home/kees/src/linux-build/plugins/tools/objtool/exec-cmd.o
  CC       /home/kees/src/linux-build/plugins/tools/objtool/help.o
  CC       /home/kees/src/linux-build/plugins/tools/objtool/weak.o
...

-- 
Kees Cook
