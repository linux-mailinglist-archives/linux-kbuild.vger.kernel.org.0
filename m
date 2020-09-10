Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200902649F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 18:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgIJQjM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 12:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgIJQh5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 12:37:57 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00CBC0617AB;
        Thu, 10 Sep 2020 09:37:18 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id o16so6682127qkj.10;
        Thu, 10 Sep 2020 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JdFFsE37eiFTRP6BERxF8cO71XTx86+LjItRyfR3qXo=;
        b=ClOsXW2gu5WYa1DOpSj8Qg6yWGAGzcCI2Y3HA3bciB+WiLOoamEyLaQmn2CqQ0P3wJ
         fgMTx+umTjA9TeAfZqBrN12gEo5pDLbYZInQ/zTIt2a0XX/VALOFw3Fi4CGDriyA4fXv
         TP4g7DMxSr+OVQTUJFkz5Qn4y2VxdeXA3PdyzJ8W1uuAbaBQ/LKeydAH0KPwJIysUB8w
         JZgaJw6/uWPmqydgxe8iTR4ToAgQ8G7G4AuKOCgvxtmV+zhFXrUikBceIuBMBFKYzqgO
         3qlGjxVfXub25qXG/VxaqxoKpmrp4EJsyF/fZNCc0sF+3tWYTMMjJXOMrduNQjzphCHd
         P1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JdFFsE37eiFTRP6BERxF8cO71XTx86+LjItRyfR3qXo=;
        b=b3/N7Xn1r/fe9EMQFBmmzSGqLksI4+6bVq4kkR4Q5y/jAQLqqyiGWi7athnaylU/dw
         3P/YQSq9AN+XrafciJSvcLpEN9KhKVAcsQy7iU0L7BMeSwXlkh28asaBEkDCEy1m8sPG
         AxrwXxar+G4427jknWnXzgFcEjW68UoMU2Cfy1L/zaNNocie1qSp0zYzK9XdGurk79ot
         kaS9OfC18F3bvQuqiEFX5RzubkwOZuQL1F8AWEEkFoP6vrYCv8T9DvefaAMoyTTow/bB
         Y7QNObf8VSynC8WMVebRNxvsuPBoKg0IQv1g6pVxRu37WEUmdnLe9WBVO90jhahwqqpI
         vSCg==
X-Gm-Message-State: AOAM5302c1BgfFxMBsKRa+BCpydKxhy6bXqd0JofJGNnFU6gBBUnmWcC
        snNgKkDOhApbZc0neHHyM6UygzasA4A=
X-Google-Smtp-Source: ABdhPJwmIWRMgSWl7iXkstmJ0pPLM9KnhtDIQ7NDzOEjOhXb6+ZuSpcZwFhxi6ViIB0BIKX8qUa5Dw==
X-Received: by 2002:a37:e508:: with SMTP id e8mr8499277qkg.380.1599755837906;
        Thu, 10 Sep 2020 09:37:17 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id y7sm7245670qtn.11.2020.09.10.09.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 09:37:17 -0700 (PDT)
Date:   Thu, 10 Sep 2020 09:37:16 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] kbuild: remove cc-option test of -fno-stack-check
Message-ID: <20200910163716.GC3119896@ubuntu-n2-xlarge-x86>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
 <20200910135120.3527468-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910135120.3527468-3-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 10, 2020 at 10:51:19PM +0900, Masahiro Yamada wrote:
> The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> 
> Here is the godbolt:
> https://godbolt.org/z/59cK6o
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This flag is technically ignored by clang (see commit
05b0798916f01690b5903302e51f3136274e291f) but that obviously does not
matter for the sake of this.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 1b6abecc5cab..5102c89d3167 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -934,7 +934,7 @@ KBUILD_CFLAGS	+= -fno-merge-all-constants
>  KBUILD_CFLAGS	+= $(call cc-option,-fmerge-constants)
>  
>  # Make sure -fstack-check isn't enabled (like gentoo apparently did)
> -KBUILD_CFLAGS  += $(call cc-option,-fno-stack-check,)
> +KBUILD_CFLAGS  += -fno-stack-check
>  
>  # conserve stack if available
>  KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
> -- 
> 2.25.1
> 
