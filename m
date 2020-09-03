Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D41F25CDF2
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 00:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgICWoY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 18:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728678AbgICWoV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 18:44:21 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF87FC061245
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 15:44:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h12so3269401pgm.7
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=52NN7zmbWj8pqq618ReYhqgg44nUMSxhK8Ic7l6b9IQ=;
        b=MBK0WKmdN+VVS8ZrwY58Hlad4tCyZ5qwvoRKwdhpO5bHKBKJVYLTH6lKUS2u0lc/Bh
         8VA6LKlg81yIvhCjEQrBhESR4/qWsfETlF2eMA30SIkhfR/LjqzXlb1lgrKip62VobMn
         BSCke5Bwqm1qGde6q4c4/K9qre+J4wJi4pj1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=52NN7zmbWj8pqq618ReYhqgg44nUMSxhK8Ic7l6b9IQ=;
        b=CMmzpcNY0JkiRkSLwZXDENlont0k6ocClKGi4dZyJnfkdrc5YdrgHgyuLLysTgROpT
         Wa6lXz6FslVGkcm644F+zGa2SOnW7czp0lCRYP5bkxUCdHXKxM57KwHiUcXtpKDA46eF
         vF4QWLinbJm4tGhhBYCDCxchdSZ69g7bij/9xXykqrSkm+8umdxDGtvkVyw9w2+K+H5k
         IhEsmTpXs9J5gmSKAqbba5hSLieIwI/ib+S5eQwys/BwDClyD3tk6cHqVceZqBGX4fc7
         2F0DzHHOM/Upgpqg8a0NdSqsyOLCUmr2TjXPAjjki9teRqFQc87iUcpqkNl5u16mliC/
         nGBg==
X-Gm-Message-State: AOAM531JafUpFSja+OtOXyYHn4AmaTCCErreAf7rpvF6uNrIgENUflrF
        pHGerfYb2wT97FDJT6JiWR3xqg==
X-Google-Smtp-Source: ABdhPJy9dQk51yQ0UJxiuUPjBSPLNVfH7SoTa7H5YomZF3lQK5E4Z9WCG1DCkxj0GCE61YpXubg48g==
X-Received: by 2002:a17:902:121:: with SMTP id 30mr6136106plb.205.1599173060307;
        Thu, 03 Sep 2020 15:44:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m25sm4297846pfa.32.2020.09.03.15.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:44:19 -0700 (PDT)
Date:   Thu, 3 Sep 2020 15:44:18 -0700
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
Subject: Re: [PATCH v2 22/28] arm64: export CC_USING_PATCHABLE_FUNCTION_ENTRY
Message-ID: <202009031544.D66F02D407@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-23-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-23-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:47PM -0700, Sami Tolvanen wrote:
> Since arm64 does not use -pg in CC_FLAGS_FTRACE with
> DYNAMIC_FTRACE_WITH_REGS, skip running recordmcount by
> exporting CC_USING_PATCHABLE_FUNCTION_ENTRY.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

How stand-alone is this? Does it depend on the earlier mcount fixes?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
