Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3516F34A092
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Mar 2021 05:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhCZEej (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Mar 2021 00:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbhCZEeG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Mar 2021 00:34:06 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC4B8C0613E0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Mar 2021 21:34:05 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id m7so3766069pgj.8
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Mar 2021 21:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z1EPeptCFoIaJaJVsVX640bsVfb5dv09v+eTesBEdqU=;
        b=L33UBWhhTV0f0TkrQMXt+B0VKX9Vlp3fb+/k78HIXW/yrd0LU0Om96mIq2bNG+r7xH
         5RzEDHiSIxJe6Qo1t9vt49eiID6LFyta9K33XFxXNDxpmV/PlZ0wbsclB3yvkHHpJffs
         QjWaq7BabNEk9dYp9Y1/B2mFH7xUCJOw1mokE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z1EPeptCFoIaJaJVsVX640bsVfb5dv09v+eTesBEdqU=;
        b=Tsd4LwQCxU/xJNrW+D6fpUipvanFpSajR6TTjNpjFfUHXsA4fNgEyToaU9CulxUZcV
         KO1udrEJHDA46WKiFRqjDneIyTR4wq+uZgjZ/ktj9RAwizZ6eLTHmPgeu/JpD8/SzNkH
         da550cJwHhFBmLNAq5kPapFn/U/LLkU/gk9Veym7sKcwqMWgnxyVulCBAbIYPo5xOooU
         eKm1kEFpxgAbkIsN1nW3nPCBXjgLoCSV/3kkWKknu6FyTr4o6QIoCvBx8QagqlVYYewx
         bN3+Mv1d4hnaDx4vcvJ8WH1COZvTNxRLyp9vV6pH/nkff6B9abIhtrwF02nLxdli+0QD
         Gzcg==
X-Gm-Message-State: AOAM5336eJR5G3o0Memq5+q6pKFwAYqvo8No0CXOH4gIxMgaFmmdIQlG
        ip/kbhjOiIHujWjge47NabssIA==
X-Google-Smtp-Source: ABdhPJyXVZPxtB7HYMsPfMGgcKqDfIITOg/pt8Wm93KxfhLZgWVnApKcmHPTpqIeTPK3vTEVX3bBXA==
X-Received: by 2002:a62:fc90:0:b029:213:be9a:7048 with SMTP id e138-20020a62fc900000b0290213be9a7048mr11194418pfh.4.1616733245174;
        Thu, 25 Mar 2021 21:34:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l4sm7513908pgn.77.2021.03.25.21.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 21:34:04 -0700 (PDT)
Date:   Thu, 25 Mar 2021 21:34:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/17] module: ensure __cfi_check alignment
Message-ID: <202103252133.339A7A49@keescook>
References: <20210323203946.2159693-1-samitolvanen@google.com>
 <20210323203946.2159693-5-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323203946.2159693-5-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 23, 2021 at 01:39:33PM -0700, Sami Tolvanen wrote:
> CONFIG_CFI_CLANG_SHADOW assumes the __cfi_check() function is page
> aligned and at the beginning of the .text section. While Clang would
> normally align the function correctly, it fails to do so for modules
> with no executable code.
> 
> This change ensures the correct __cfi_check() location and
> alignment. It also discards the .eh_frame section, which Clang can
> generate with certain sanitizers, such as CFI.
> 
> Link: https://bugs.llvm.org/show_bug.cgi?id=46293
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Yay macros! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
