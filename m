Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFA82533BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 17:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgHZPbe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 11:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgHZPba (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 11:31:30 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE1AC061574
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 08:31:30 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x143so1171293pfc.4
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9zs23ZhZ8ODz+nwQb6O4UO1P/7U3n6533OiIueYs3+4=;
        b=fMuNysL9TRE9tjmnJj7r871P+3ghVsjGqk6g7RFH/IMtzNKXM0FISK5rAJ/OiHsYza
         rFrCws4uMg3/z/CeginhE5eK1vSkV2xXtEH4MX0f7MVYE3ra3I8AdosYGwQdeejofVMH
         B47IJdSMOhiEr2mcypKdSVI9cDZ3sDdqfl2jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9zs23ZhZ8ODz+nwQb6O4UO1P/7U3n6533OiIueYs3+4=;
        b=ZfyuI47tDEBvgmXA1GvVD3JVMWeT1ljKcs4LkHNmJSlXgsPtRm1SOOU3UFobx/w2tB
         AnFSj6uvIMt4wy5WPcjDACPXe9FU4hT+OkhXt7n1Jcim8RKM/IS08LbqtZ/JIBqlsRQG
         8pedC+yVhVEb9H7h0BMq8MA6OIaRHcj4eeo9ondvzgAjGHs4WQ6Ysf6rsDKtmf5zIHUL
         mpKQVTKhavGfzyspfWlAxIyRBf8crPXWxeVYhzVieMTQllUKrMx/yu4kVvFN/cVObCwO
         4Zs6Jx9aOeSv2BZHLvmiCEw6hBgmZlCYhI7wfOX0e3GvRkyW7wlJ3r/dlVLTRrL4mqtA
         S5dA==
X-Gm-Message-State: AOAM533eBZMtZ+XS/YUVaW3B36C1Q18IKE+5rxILbKPECC41jxiOTYRG
        TQV8zDZEhMdRy1wllx5GDhYE3Q==
X-Google-Smtp-Source: ABdhPJww4NdRyKAu7yXQIwgpisUvht3AHwC/Rz7IL1gREdefK8/VL//78URle+k83Q4oxX3OrEJTeg==
X-Received: by 2002:a63:f305:: with SMTP id l5mr10176512pgh.421.1598455889714;
        Wed, 26 Aug 2020 08:31:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j14sm2487110pgl.48.2020.08.26.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 08:31:28 -0700 (PDT)
Date:   Wed, 26 Aug 2020 08:31:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Theodore Ts'o <tytso@mit.edu>, Will Deacon <will@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: add minimum clang/llvm version
Message-ID: <202008260830.A10CCF80F@keescook>
References: <20200825222552.3113760-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825222552.3113760-1-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 25, 2020 at 03:25:51PM -0700, Nick Desaulniers wrote:
> Based on a vote at the LLVM BoF at Plumbers 2020, we decided to start
> small, supporting just one formal upstream release of LLVM for now.
> 
> We can probably widen the support window of supported versions over
> time.  Also, note that LLVM's release process is different than GCC's.
> GCC tends to have 1 major release per year while releasing minor updates
> to the past 3 major versions.  LLVM tends to support one major release
> and one minor release every six months.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Yay! :)

With the typo Will found fixed:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
