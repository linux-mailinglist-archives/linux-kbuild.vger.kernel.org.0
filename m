Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBF120BA22
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 22:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgFZUS7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 16:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFZUS6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:18:58 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3461C03E979
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f9so5105116pfn.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SjdKzeH7GW9tQGsunBGfIcgoB4TuWBhVIwFN+ncvBXE=;
        b=Tm6uhy3i8keuHafctoH4MuP4dZ5blfAOikPg1Mlf5CHLIkopdkpyAFZI/u9bZwoURX
         X8shbqeQOPfH5Iyo1VLp9cMkDG+LeyHP3Oql7Nx4R5FFtRn/PB796zbp39sRouaHkGdj
         6eSxAbjnscbgL3gC9uEKsB4QlM7SqUZHn8pGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SjdKzeH7GW9tQGsunBGfIcgoB4TuWBhVIwFN+ncvBXE=;
        b=Gt9C3SkonzBW0l1zaFDRbQKCWsFTPllY10Nh1ITlawys0gKM5ePGZ5qcwjOGl4FusT
         5hd1dXi40tKd3jKM4f5SjjjX15/AUQSKiAySsZR83U8vS8P6wizi9FDHGuEKAr43GFwE
         nQPqr8ZTQoaiq5vPeMhP3JXxz6S4vBCnBNk6kkIE7cF21p49ftjpvThe+CVkywlUsT2f
         krxlVw5Zuz8jndEY9yR7S1Q64VVtd6lbnKC+2b2PvD6HliPEywzqfJWMfc4TPhoP6HKQ
         TIFH40jQKC6cStMq2ZcFlZT20JxIPXpfmqlz1oReV5IqgMKe6ISUz1TbwxaoXA3FPj1V
         pW5g==
X-Gm-Message-State: AOAM530WYFEbKB5YvcfqnoF2knMms0YGPA9cKwj62BzUdovjS+oy4HO0
        mqvlcB/Uwp+sTXlC7n5N0BfgLw==
X-Google-Smtp-Source: ABdhPJzRLB1VAhnTAH//Vf34hhnhLIcox6EcBAnKlJDtzGp+8PwlZspufe0ZqKpRpx5poWE80d8uJA==
X-Received: by 2002:a65:4c4b:: with SMTP id l11mr411781pgr.123.1593202738300;
        Fri, 26 Jun 2020 13:18:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p12sm23389172pgk.40.2020.06.26.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:18:57 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:18:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Message-ID: <202006261318.75C7FE339@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626185913.92890-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 27, 2020 at 03:59:12AM +0900, Masahiro Yamada wrote:
> Some Makefiles already pass -fno-stack-protector unconditionally.
> For example, arch/arm64/kernel/vdso/Makefile, arch/x86/xen/Makefile.
> No problem report so far about hard-coding this option. So, we can
> assume all supported compilers know -fno-stack-protector.
> 
> GCC 4.8 and Clang support this option (https://godbolt.org/z/_HDGzN)
> 
> Get rid of cc-option from -fno-stack-protector.
> 
> Remove CONFIG_CC_HAS_STACKPROTECTOR_NONE, which should always be 'y'.
> 
> Note:
> arch/mips/vdso/Makefile adds -fno-stack-protector twice, first
> unconditionally, and second conditionally. I removed the second one.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
