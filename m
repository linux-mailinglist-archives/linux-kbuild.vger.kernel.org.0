Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0883F29A248
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Oct 2020 02:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504001AbgJ0BmY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 21:42:24 -0400
Received: from mail-qv1-f66.google.com ([209.85.219.66]:42510 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503998AbgJ0BmW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 21:42:22 -0400
Received: by mail-qv1-f66.google.com with SMTP id b11so5317265qvr.9;
        Mon, 26 Oct 2020 18:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pdv/+pyfJzI+Ew6OQ4XAO7djSaFMXjqvu+g73Scjri0=;
        b=GK+Ez+05++sbRT0uuY9xE2Y9GN4CVObzaj880p5MKtes9odPxOUikEXS5qlIjznM/2
         R/0xkqoQ++se977m6FreJuKZxFULzNHO9fsPcV8n+cRN5S/uXhndFEr0f2Z2dSd1AzUE
         GkbbK8rp0baW48biprDP6eJdR2h7S1Mazh2BDpDqDlOUS5fLCu0j6CPxfqR0wy4SNEfi
         95HGCEdpCqC0zd8eNSyrioATkeLr5lvZlE/pwPc//ZUaPI181vcf2mhAWmyjhX7D6sDw
         BkUSu94bzJBqTcMOCXZKqb+5mPhQPHANg3uWA8SMQkNJcDeavTgod+r+29RVKerOaAor
         9iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pdv/+pyfJzI+Ew6OQ4XAO7djSaFMXjqvu+g73Scjri0=;
        b=Bf/YqcmDGxVK2Y9wTUxPcGYMbVuTJNOhSBDu93KopiPSo6HDPZFa9q5u3E27jAiy8l
         93R2NgXlt5nQf5Lowhe2xc0N+/SJEL2Sf6W7sZOAADUcW2nUn3VZb+b7u8z21lTawejc
         9OD9ScJH5kGmVVa6T4k8eFydikYIEYUCiX5E4r3D0xyYchZburniGyKro8hqF7DajxwP
         JoTTZ73RbEMrkvfWp2k8wgIALrIV4W98Oj0sqhHriTJYGa7QRGeiB1m0f2yD7fcBbmkW
         zt9fzE7+rzAKFRTf8Ujoqqv0OafGxqxuGbZt1IH3OvVyNgxZ4Sat3MQhzQczgvlKSaYN
         s+zw==
X-Gm-Message-State: AOAM531dfE5Nqp8+IsK8GO/7a/O7pdV+qDja86xckWkgb1XxHBzU70jL
        QQIt9PmThX2gRL0gc8Bi86I=
X-Google-Smtp-Source: ABdhPJxK35jn739YswkxvZ7K3ZUelxBIcfkoXAH24+B1hjBfvIqcT3NbB4TCqxilBaWGPDTTJIc6ZQ==
X-Received: by 2002:ad4:456c:: with SMTP id o12mr156268qvu.48.1603762941400;
        Mon, 26 Oct 2020 18:42:21 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45d1:2600::3])
        by smtp.gmail.com with ESMTPSA id o5sm229qtt.3.2020.10.26.18.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 18:42:20 -0700 (PDT)
Date:   Mon, 26 Oct 2020 18:42:19 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH 1/2] Makefile.extrawarn: move -Wcast-align to W=3
Message-ID: <20201027014219.GA4058050@ubuntu-m3-large-x86>
References: <20201026220331.3896226-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026220331.3896226-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 26, 2020 at 11:03:13PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This warning behaves differently depending on the architecture
> and compiler. Using x86 gcc, we get no output at all because
> gcc knows the architecture can handle unaligned accesses.
> 
> Using x86 clang, or gcc on an architecture that needs to
> manually deal with unaligned accesses, the build log is
> completely flooded with these warnings, as they are commonly
> invoked by inline functions of networking headers, e.g.
> 
> include/linux/skbuff.h:1426:26: warning: cast increases required alignment of target type [-Wcast-align]
> 
> The compiler is correct to point this out, as we are dealing
> with undefined behavior that does cause problems in practice,
> but there is also no good way to rewrite the code in commonly
> included headers to a safer method.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Always sad to see a warning move further down the list but noisy headers
are rough to deal with. This seems okay.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  scripts/Makefile.extrawarn | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 95e4cdb94fe9..6baee1200615 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -60,7 +60,6 @@ endif
>  #
>  ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>  
> -KBUILD_CFLAGS += -Wcast-align
>  KBUILD_CFLAGS += -Wdisabled-optimization
>  KBUILD_CFLAGS += -Wnested-externs
>  KBUILD_CFLAGS += -Wshadow
> @@ -80,6 +79,7 @@ endif
>  ifneq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
>  
>  KBUILD_CFLAGS += -Wbad-function-cast
> +KBUILD_CFLAGS += -Wcast-align
>  KBUILD_CFLAGS += -Wcast-qual
>  KBUILD_CFLAGS += -Wconversion
>  KBUILD_CFLAGS += -Wpacked
> -- 
> 2.27.0
> 
