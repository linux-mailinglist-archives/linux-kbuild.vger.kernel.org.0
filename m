Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5CB25CDE3
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 00:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbgICWnk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 18:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729499AbgICWnj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 18:43:39 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12420C061246
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 15:43:39 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u20so3524093pfn.0
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 15:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x2xuRKyyLJWi/1UackWdCkMB4cqQZJ4+/7t+T3jGKh8=;
        b=lJIfcDz7WioC0cxPF2mcu4r4CpHJqN+NQMfhDVOZMDBJjVlbujjOIztvgAAg+FLLZl
         OQLArQHvfuAUFWnT+Br9hn0eKYi/T1OqGrNfJkgbHQQkXC6PnVXOP14VrZKCoiAx6sGj
         N08DlYuf2tSmgQZcy/X6jmQw8+vZKntUZzYMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x2xuRKyyLJWi/1UackWdCkMB4cqQZJ4+/7t+T3jGKh8=;
        b=ax9suZS+EoOC6rE5RQAFz/KPxjPtQMK7QH1ZwnrHK6wpd8En4jNHwnlWyI5sjFQlK7
         m0xB1KBQKKnBeOQMomslHV80Ck0i+pbMvUjBc+sDS0Dcx30rxnprUVlauSvPZmmMLv6n
         lTnuxBSO+RrDpcWeGL9GrngRJ9MwEFQspO40VPjNbCAGiGiRWcNqMrKq0pBOEW6zEFSy
         6nhMvurlDEEC9Eau4kG24qt1duR+9Hrw3wDwLlC+PIKH78AX0WU76rInBzoxbXfxpqpu
         CtpvDdV2cr3hzEJQZ5qyZlBx5ywqK9PvbrR4z1LyOKimH5fpEndX3fKzhsOc1Tbun+HQ
         JJNA==
X-Gm-Message-State: AOAM530XJg+cAD7ILUZV3vU1b2BN7BQ/JlaqYjt8EQDo8SHnnSynPrDQ
        cWHim6uLLtLuil9y8SGl+OL4Zg==
X-Google-Smtp-Source: ABdhPJxsKeiM9lZAcQ/0JJhv0k/hyo346z/156yZaTdrOqzHtGfq/qkV1ZHNDgZ+unL1v+eZfT0LrA==
X-Received: by 2002:a17:902:326:: with SMTP id 35mr6096909pld.1.1599173018675;
        Thu, 03 Sep 2020 15:43:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w16sm4354057pfq.13.2020.09.03.15.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:43:37 -0700 (PDT)
Date:   Thu, 3 Sep 2020 15:43:37 -0700
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
Subject: Re: [PATCH v2 20/28] efi/libstub: disable LTO
Message-ID: <202009031543.47CF616F@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-21-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-21-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:45PM -0700, Sami Tolvanen wrote:
> With CONFIG_LTO_CLANG, we produce LLVM bitcode instead of ELF object
> files. Since LTO is not really needed here and the Makefile assumes we
> produce an object file, disable LTO for libstub.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
