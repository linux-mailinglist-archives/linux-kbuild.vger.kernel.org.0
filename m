Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A334020BA37
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 22:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFZUWf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 16:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFZUWe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:22:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B4DC03E97B
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:22:34 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so5413075pgb.6
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jPQAU9v4pzrY0PE4flu5PAPHobp8jdW2HNLTVUzT1oI=;
        b=CaNAYjsNjxP0kkLIdVlt5c5Oa69x7xRpiGN4goDW3e/OAe81FlW4dN059KGBwdguPB
         5vV8GLL/6sQPsht0FTZUK4Yq1s/Sny/JKF+6B85oIDf03yHmfipwByPXObyqexE0YjoF
         WAOFnDVF04KUIeQU/TMB0646LxnS8fVBKnxlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jPQAU9v4pzrY0PE4flu5PAPHobp8jdW2HNLTVUzT1oI=;
        b=jadD9feikI9EVj76wmM7HzqYjUaFiYn8mSkGgCHmKkRaLMVUzFprSlPOasTvar64LB
         UZlxsj8X2x3z/AH2zhWWZe+z1usTYA3ibK8aSmy+vQDBE4WysvCgQ4LMWLIRdc6YuWJA
         wZhpQwomEnvChIX3MvhMT5KiYBdX1M1t4ALMYOkXQgQBtpFYzNoDNVSzIZEpYNJfIfm9
         KNSc2y5oTrSOejPUqnvqYmFIW5nKhFYL0aiu6nb1VTrIXGqYlB6XSBo4mOfuKToPKrFv
         dQR9qwRz1bvIhRzDJ36qPiNB1tPPqw9Gs8xFZ5ASeHZP7lbULSjUzTVtMBTYAqnDAzz8
         fPEA==
X-Gm-Message-State: AOAM532/uqrLMYI1FyKINRxtEGlAqcDn7edWryqrHmUTIKW4rLHDzuf0
        Y8RocUkAhvcZkfNrHLxaEF7172yrot4=
X-Google-Smtp-Source: ABdhPJwrOIeTMLKdIft+cOWotSF/l2fs2SAMNrFzNIavYFmOhxovPlR/2MDGKJa96fzr1pOzVyIL3g==
X-Received: by 2002:a65:6650:: with SMTP id z16mr433923pgv.161.1593202954587;
        Fri, 26 Jun 2020 13:22:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ds11sm12153574pjb.0.2020.06.26.13.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:22:33 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:22:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: remove cc-option test of -ffreestanding
Message-ID: <202006261322.16A9F14@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
 <20200626185913.92890-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626185913.92890-2-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 27, 2020 at 03:59:13AM +0900, Masahiro Yamada wrote:
> Some Makefiles already pass -ffreestanding unconditionally.
> For example, arch/arm64/lib/Makefile, arch/x86/purgatory/Makefile.
> No problem report so far about hard-coding this option. So, we can
> assume all supported compilers know -ffreestanding.
> 
> I confirmed GCC 4.8 and Clang manuals document this option.
> 
> Get rid of cc-option from -ffreestanding.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
