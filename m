Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EED13330B4
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 22:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhCIVPt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 16:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhCIVPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 16:15:32 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A74C06175F
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Mar 2021 13:15:32 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id a24so7257248plm.11
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Mar 2021 13:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dnLdM6V19dYuJ5oWXUJHk+YsPLsfZioKwGopMLufT4w=;
        b=RsyKUaD5iS2WQePCyWDtH+L7M3aHuWLu7s+Q/o+EJ5wHgWtebAb5PjPQSJK0/rS85s
         ZP93aCOCPQxWLkUDEBO5CgCHLxYogUsKW48GleN5CDCn5a05zbURHIjTcsxzhb8y8R+T
         +77B8y4sTr0TjHgTNEKthIAF4iiBhL1h91VSl2yux5zH19vo3HYtA08npg6DqQ475Pdn
         VwOLTCeWEDl66DMONuGnnW65+erlBkUTXUpCtYeubdJYxJJczQQ0ixUeqARzY0h1Nzoh
         IyKGsE1mq2G0ujt3SJal7fK0YbvE3Pi5MicUZftDcK8TlXe5YI5y4LUGgNbtxD32pRR4
         lgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dnLdM6V19dYuJ5oWXUJHk+YsPLsfZioKwGopMLufT4w=;
        b=roL4CqUW136dqfEpvxsL6hzdhIA8wy4FAVH5To3UPn/fzJEWQcYjz0gal/nP7mvhlw
         tze6GG1ZpQJQBu9oS/jwU4DGSEiKB/jdNypdea4V+84xJZcs8oLOLG8WXOgGdbpByjRX
         H66tYPH3mMQZWf1tZ0rhstVfbXJT0NW+GRFaEKuFKI50YUqv3nRe5pNmVOEKcRYvwalz
         rjDhKpVRMPbBFpEg0WXTdKr0YqS7pTGkIpZcJ4PI3VaBXAQqcpCpcFP3lcRSL4VU8amp
         VGPnYGfg6yrPChBjuOFNBWs1oaq5wdg6AGuUR7dGw6SyIczZnbb4ng6P7Z77IKiBOC1E
         +zGw==
X-Gm-Message-State: AOAM530CFRmHCGpVs2NeeQ3i1Rbd72LWgKToO5MGqZSFdpTb2PRwl2a8
        NcXCPyAoZf9xpUMihuEo0Df9++c2yoGi2w==
X-Google-Smtp-Source: ABdhPJxoXav81vfvIgM8zkp5ggAGnMiap5MCh48ZexB2xFcuGhIiCeyQ5sDHMIYX3XLO18knNOCUMw==
X-Received: by 2002:a17:90a:8813:: with SMTP id s19mr6538514pjn.94.1615324531902;
        Tue, 09 Mar 2021 13:15:31 -0800 (PST)
Received: from google.com ([2620:15c:2ce:0:e577:9d57:1fab:6e0b])
        by smtp.gmail.com with ESMTPSA id 82sm13602154pfv.19.2021.03.09.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 13:15:31 -0800 (PST)
Date:   Tue, 9 Mar 2021 13:15:27 -0800
From:   Fangrui Song <maskray@google.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: Remove '--gcc-toolchain' flag
Message-ID: <20210309211527.us52fgxdzpf25xzw@google.com>
References: <20210302210646.3044738-1-nathan@kernel.org>
 <20210309205915.2340265-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210309205915.2340265-1-nathan@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 2021-03-09, Nathan Chancellor wrote:
>This flag was originally added to allow clang to find the GNU cross
>tools in commit 785f11aa595b ("kbuild: Add better clang cross build
>support"). This flag was not enough to find the tools at times so
>'--prefix' was added to the list in commit ef8c4ed9db80 ("kbuild: allow
>to use GCC toolchain not in Clang search path") and improved upon in
>commit ca9b31f6bb9c ("Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang
>cross compilation"). Now that '--prefix' specifies a full path and
>prefix, '--gcc-toolchain' serves no purpose because the kernel builds
>with '-nostdinc' and '-nostdlib'.
>
>This has been verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as
>well as a distribution version of LLVM 11.1.0 without binutils in the
>LLVM toolchain locations.
>
>Link: https://reviews.llvm.org/D97902
>Signed-off-by: Nathan Chancellor <nathan@kernel.org>

The wording looks good.

Reviewed-by: Fangrui Song <maskray@google.com>
