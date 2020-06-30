Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854B920FE8C
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 23:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgF3VOc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 17:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgF3VOc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 17:14:32 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F00C061755;
        Tue, 30 Jun 2020 14:14:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f3so10544222pgr.2;
        Tue, 30 Jun 2020 14:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jd9buR0lAUndx68KN2YMQq4trG2iraWW+d933aJz8jk=;
        b=SJdukTyiNtAfSOBg4IZfNyPT6gQ94u4Vtbm8yQbTxd0UbdLEMSA00rYipN2tbdPbVN
         a28a4Xkbs2XbmtE5jJcH2/bvlGvXVxV3lQCs+5aqMFW4YLKW38KTsUhO6jtytFtJmW6O
         I3fsLOhaFQHcJflpUTDmcSjlofWYHNN3vn8v+ge5BetPNYKyIyrilStC6QHh9ed4mi3c
         ic8WsuaOxv+Tx4cwtT2XNw4/Rx1OQvtoeMgnvCGkGopNvY63PgfrfRqlndN5/tVFy5sw
         BiTV17ZKCz89i3ub/PBO9YaKKU2fXq7vya580zo5JgcmYEzCHjgRMmHavJ4+a7EFXFYp
         1PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jd9buR0lAUndx68KN2YMQq4trG2iraWW+d933aJz8jk=;
        b=M7xB7bDBN4mQq5gE0AYQs54IlCJwAGVaSAxcvxjFslt5PPoP9hYJIwPURkHss9R2cb
         VdQvYVktXE42Ay4vFr8+Osl5QzQq2HVPMdzgz2XlzlDZmcXfyyP5S5trDOlOTiVBstVr
         FpUpJHX7A9hEnOuVzHP+bO2PqvbCBKOvsYrDvRjLlsBc8z8r4/Q9A8xmXOg1wV4B6/zc
         NbfcGIbmHAhlchIml3LVZZtqOp0l7bq7z82o/heWKzbCN5aO8InZx9gRGFWemsHBSs48
         WPCSLnCF9jTxb4eN4xj2R7uBD/s36dG1mZ04ScFAxMxyy8wKHvKorVx++B4Oi8Nf9veP
         SbOw==
X-Gm-Message-State: AOAM531Z2YOBpf5s1Ux1hDAjZeNwow3Ln7On1oM/8KhD5mIZe/CKg/SJ
        CTGDs2+cG0and6mQejloCyA=
X-Google-Smtp-Source: ABdhPJyLh/WE/XGDpaTbEN4uc8Kt8tW4wUzCToJ38CNmK/xHc9RAU7Nvy4NJ5IawcEUgZT+r551nTw==
X-Received: by 2002:a62:158d:: with SMTP id 135mr11234007pfv.254.1593551670529;
        Tue, 30 Jun 2020 14:14:30 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:1000:7a00::1])
        by smtp.gmail.com with ESMTPSA id s22sm3312413pfm.164.2020.06.30.14.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:14:30 -0700 (PDT)
Date:   Tue, 30 Jun 2020 14:14:28 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2 2/2] kbuild: make Clang build userprogs for target
 architecture
Message-ID: <20200630211428.GB4163361@ubuntu-s3-xlarge-x86>
References: <20200630150625.12056-1-masahiroy@kernel.org>
 <20200630150625.12056-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630150625.12056-2-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 01, 2020 at 12:06:25AM +0900, Masahiro Yamada wrote:
> Programs added 'userprogs' should be compiled for the target
> architecture i.e. the same architecture as the kernel.
> 
> GCC does this correctly since the target architecture is implied
> by the toolchain prefix.
> 
> Clang builds userspace programs always for the host architecture
> because the target triple is currently missing.
> 
> Fix this.
> 
> Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
> (no changes since v1)
> 
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ac2c61c37a73..bc48810d1655 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -970,8 +970,8 @@ LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
>  endif
>  
>  # Align the bit size of userspace programs with the kernel
> -KBUILD_USERCFLAGS  += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> -KBUILD_USERLDFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> +KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> +KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
>  
>  # make the checker run with the right architecture
>  CHECKFLAGS += --arch=$(ARCH)
> -- 
> 2.25.1
 
