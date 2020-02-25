Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3CA16EE7D
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 19:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbgBYS6b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Feb 2020 13:58:31 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33645 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgBYS6a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 13:58:30 -0500
Received: by mail-pg1-f196.google.com with SMTP id 6so11034pgk.0
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 10:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Iv8nu0Tmrew9fnUnqPnKjAEYAPCBJwm2aHqQgQlHcXI=;
        b=OTDHNKDTmnSxFLlKliRJJ9/P+0Gj67aV93Z9DkDKQSb5UBIv6Lf9hta72mOKzV7lCA
         hgdCJGHTBdyOTlwFrBh3IP1/RsLtfWq4kGje6VP73W5eFbI6N6Io/NJxgJdkF05efPs5
         m+mbix3wNRslURQ37RuZEZxFXo2t0g1SvssQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Iv8nu0Tmrew9fnUnqPnKjAEYAPCBJwm2aHqQgQlHcXI=;
        b=gTye4fw60QZZ3bWvkDOGzbmSiZHa7hmEmObKEJZ84giOGN8jcGsT1BKEZs+RCrxqsB
         AmMYg4tZWW99Ba1FK1sgzJEytQnDs5pRi+ZIJcW4qev00YT+TbnkLNFLiYAnhA8lYkYR
         AIK1kGmz5UWOA8nvrjfWdJb80liFgvY2KGdafUOCiW1hKSOB7ok3F7wMV6psXJtnVZYY
         ozLITx9y3xik89yTpk3GESepNqeh5Jk4Eb/GIyFB+MyxhMVxNNs8FbaiLXoFPSZM17Rk
         AuOSr5kGyHDM0EMkkvNxnWA00HLeJROUpi0lMxZTqTLWFGR5SZVETPU3zzmAVsiQZuHf
         /TPA==
X-Gm-Message-State: APjAAAX+Xb6QiIMHk7T9qGzqiv8mWkvH3atrjWVHS47aH/Y8EC/u1YqU
        CUOAaRg/k11G4jcb/m77amHTxwvE/8o=
X-Google-Smtp-Source: APXvYqwlFhU6hPGfLFawa58hpajX7pM4HYhMZNF5+kHXg+q9Uo6O71/hbEkW5Dj1+zEZt+TbulmPgw==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr62064239pgf.427.1582657109996;
        Tue, 25 Feb 2020 10:58:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b18sm18196190pfd.63.2020.02.25.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:58:29 -0800 (PST)
Date:   Tue, 25 Feb 2020 10:58:28 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kernel-hardening@lists.openwall.com, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gcc-plugins: fix gcc-plugins directory path in
 documentation
Message-ID: <202002251057.C4E397A@keescook>
References: <20200213122410.1605-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213122410.1605-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 13, 2020 at 09:24:10PM +0900, Masahiro Yamada wrote:
> Fix typos "plgins" -> "plugins".
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

Jon, can you take this?

-Kees

> ---
> 
>  Documentation/kbuild/reproducible-builds.rst | 2 +-
>  scripts/gcc-plugins/Kconfig                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> index 503393854e2e..3b25655e441b 100644
> --- a/Documentation/kbuild/reproducible-builds.rst
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -101,7 +101,7 @@ Structure randomisation
>  
>  If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
>  pre-generate the random seed in
> -``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
> +``scripts/gcc-plugins/randomize_layout_seed.h`` so the same value
>  is used in rebuilds.
>  
>  Debug info conflicts
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index e3569543bdac..7b63c819610c 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -86,7 +86,7 @@ config GCC_PLUGIN_RANDSTRUCT
>  	  source tree isn't cleaned after kernel installation).
>  
>  	  The seed used for compilation is located at
> -	  scripts/gcc-plgins/randomize_layout_seed.h.  It remains after
> +	  scripts/gcc-plugins/randomize_layout_seed.h.  It remains after
>  	  a make clean to allow for external modules to be compiled with
>  	  the existing seed and will be removed by a make mrproper or
>  	  make distclean.
> -- 
> 2.17.1
> 

-- 
Kees Cook
