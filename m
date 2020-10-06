Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D902845C7
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Oct 2020 08:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgJFGDt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Oct 2020 02:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgJFGDs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Oct 2020 02:03:48 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D70AC0613A8
        for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2020 23:03:48 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so7399866pgl.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2020 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o+1mE6CyvtWobK1yelGFLZic7reL9nnvtSTOf+SbuLw=;
        b=AKn2a5gAkmOS3c6KWOCMKE3zG3Yr5UDOsY6/N8l40OaXH4y/N7DSqqkQajgy41Pdt9
         +57NKe9lna49m7GxxMfS/mY5SlHcJ08EUO33cGnDhzLZwI13XWrO0zqTlZtNWpoikCmD
         41q/FOv2LZz3+a3ULfrwTu2Jhj80EkzgKXHME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o+1mE6CyvtWobK1yelGFLZic7reL9nnvtSTOf+SbuLw=;
        b=RrhEo75LuxEOKsv59hwWpTnxkyBEjL88baIJrgG7wimO23Hrz82BSdDtEvvjsChgEb
         hnF/PxjF4XrR1EjImbmVXO+STY++IHHQIpdkGpWZO3xZ7btsyTt8xbI3+Mz7bupxZpIi
         wpzcoURQOJZhwJ9bqNt2EgStNap2ILqCNNU4rt95JyY/MAkLzKVhHQzJJoTxdVsfRBoz
         BIQ2YhVXtdGUYKwXdENc5auE+GFkUQXvpE2UXy1rgXqKdqizSGSZkWaW8XJSNgbMCeCI
         ICMVx9FvCfai9l5TbOZpMPtIOEIjILZgQSUUL/Ab4wP09MQNCzvws2r59Di91/4ZMXa6
         qbyQ==
X-Gm-Message-State: AOAM533sE4GHCDkRhaIx+yF803IO0mGOE6g1YF2oB5XLTK9fXphoMVzB
        uBYjVjTnVCIg9+xtem9njED61Q==
X-Google-Smtp-Source: ABdhPJx7XGhq35ijTOKBA/RFWn71PBN4VOHEabH/E2FAQcBchGZPetIPIEeI1vV0ftKbbx0ldqK6uA==
X-Received: by 2002:a05:6a00:2291:b029:142:2501:3987 with SMTP id f17-20020a056a002291b029014225013987mr3072038pfe.76.1601964228199;
        Mon, 05 Oct 2020 23:03:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r206sm1942936pfr.91.2020.10.05.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 23:03:47 -0700 (PDT)
Date:   Mon, 5 Oct 2020 23:03:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ubsan: Force -Wno-maybe-uninitialized only for GCC
Message-ID: <202010052301.CFBC03C72E@keescook>
References: <20201002221527.177500-1-keescook@chromium.org>
 <20201002221527.177500-4-keescook@chromium.org>
 <20201004071614.GC1650@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004071614.GC1650@Ryzen-9-3900X.localdomain>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 04, 2020 at 12:16:14AM -0700, Nathan Chancellor wrote:
> On Fri, Oct 02, 2020 at 03:15:26PM -0700, Kees Cook wrote:
> > Clang handles 'maybe-uninitialized' better in the face of using UBSAN,
> > so do not make this universally disabled for UBSAN builds.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Well this patch is not strictly necessary because Clang does not support
> -Wmaybe-uninitialized anyways :) its flags are -Wuninitialized and
> -Wsometimes-uninitialized so the warning stays enabled for UBSAN as it
> stands.

Ah, yes. Heh. Well... perhaps I can just drop this patch.

> However, something like this could still worthwhile because it would
> save us one call to cc-disable-warning (yay micro optimizations).
> 
> Maybe it just does not need to have a whole new symbol, just make it
> 
> ubsan-cflags-$(CONFIG_CC_IS_GCC)
> 
> instead of
> 
> ubsan-cflags-$(CONFIG_UBSAN)

If it gets kept, I'd still like it gated on CONFIG_UBSAN in some way
(e.g. the patch has an implicit depends due to the "if UBSAN" section).

But yes, this patch is rather a no-op.

-- 
Kees Cook
