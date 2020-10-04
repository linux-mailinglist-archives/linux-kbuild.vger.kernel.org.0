Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9731E282954
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 09:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgJDHKu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 03:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDHKu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 03:10:50 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329F9C0613CE;
        Sun,  4 Oct 2020 00:10:49 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d13so3706157pgl.6;
        Sun, 04 Oct 2020 00:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1lp3ONKRIcSr1E/HUlOYkge7MJGQfoguGKaYXDrNni8=;
        b=D5/KwKAum4y9PGhFIsybx7BEhjmkPjry8KrHtBwezwUg411c7D2tM4/vXeKEfTuBIW
         vly9DZQ+ZaPZiAyeTlfv7xYlZNLm/PGry8zaGYp7SstiKErAH+BnvM1z9fjwqOw+rnFd
         dXDs6cX4qEmztyt9MR/oAusvd//eZ8m0L0aRBNJ++z3qmJdW7i3OH2eGa6rdsS0FU84p
         nh+WmnSycaIM6IztXOgZQwzDnrnR4gybee84a8oIaTS5aHOxfi50LczxBoi135Cd8sF2
         mO/n+9411ZpcqqYB4gfVUSDm+i8KQPdCiiVi2qRmaAaRyvnKU326Iti/9qwPKk9n0cXt
         a1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1lp3ONKRIcSr1E/HUlOYkge7MJGQfoguGKaYXDrNni8=;
        b=Bel9zwbh4ZO2hH3s6J32L/2Ui8d6ykd4UTO9TMJkW4eNucyxGLUkPqF5nIgjlH0ipr
         Yd6Dyoqgk7TzBmQMZ1riAxpjvXPyfhdTcPbr5BqJSZlbY++Z+T1gKJ86TpONkJjVlwhg
         kBm1qtnVVuKHGSA26jECLVikfUUXCq+iNwjCKUh5AquI5ZZlt3Za2XgyIvJoZCKU8G+c
         ZCw1GVP9ljPFn1voLTx3PBHHfF+Jw1OmjpcATppti31WSxg6FuQrSbp/SXCCCp2KWnSJ
         8Zc+JfmyBpvIkKqqjxs+CkkOapNjJHor31iJf49xuobCsVeRTjKWVS0DiFg3okk/DNvf
         D1MA==
X-Gm-Message-State: AOAM532lJYCmGRByGiCWgVXSOo1SlCyp/I4i6T2sF3pdS5aYWkOpfLqW
        LF9j1dddVRG2Oz41gBaToKY=
X-Google-Smtp-Source: ABdhPJxAVoTlU9pMQd+5do1rXe3+QrtPPYCxBMWVU9DRF50blLKFr1ckGxz5No3znGBIZz15aJkAZQ==
X-Received: by 2002:aa7:93a2:0:b029:142:2501:39f4 with SMTP id x2-20020aa793a20000b0290142250139f4mr10611073pff.67.1601795448728;
        Sun, 04 Oct 2020 00:10:48 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain (ip68-3-136-221.ph.ph.cox.net. [68.3.136.221])
        by smtp.gmail.com with ESMTPSA id i17sm7755066pfa.29.2020.10.04.00.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 00:10:47 -0700 (PDT)
Date:   Sun, 4 Oct 2020 00:10:45 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Kees Cook <keescook@chromium.org>
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
Subject: Re: [PATCH 2/4] ubsan: Disable object-size sanitizer under GCC
Message-ID: <20201004071045.GB1650@Ryzen-9-3900X.localdomain>
References: <20201002221527.177500-1-keescook@chromium.org>
 <20201002221527.177500-3-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002221527.177500-3-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 02, 2020 at 03:15:25PM -0700, Kees Cook wrote:
> GCC's -fsanitize=object-size (as part of CONFIG_UBSAN_MISC) greatly
> increases stack utilization. Do not allow this under GCC.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Link: https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  lib/Kconfig.ubsan | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index c0b801871e0b..aeb2cdea0b94 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -104,6 +104,9 @@ config UBSAN_UNSIGNED_OVERFLOW
>  
>  config UBSAN_OBJECT_SIZE
>  	def_bool UBSAN_MISC
> +	# gcc hugely expands stack usage with -fsanitize=object-size
> +	# https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
> +	depends on !CC_IS_GCC
>  	depends on $(cc-option,-fsanitize=object-size)
>  
>  config UBSAN_BOOL
> -- 
> 2.25.1
