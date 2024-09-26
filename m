Return-Path: <linux-kbuild+bounces-3805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3727C986A22
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 02:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4387A1F2564F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 00:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836F4288B1;
	Thu, 26 Sep 2024 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="faHDMdSv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04637157E6B
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2024 00:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727308859; cv=none; b=W00yggaxFWApljbtRd/MTVj2jDighiZGsUiJm4yI00HmulMmKZDjHMgLhEPSkSoPBwqQNgQnSoA6sD60L+KwtfSHfpiYx0+o6AawDbU2+KBZa9Kk2emGIwPXgnXz0MjGlD3gmIFO/ERS8I7HFdNuTVQQzK0sBn6/Ptgj6py+jGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727308859; c=relaxed/simple;
	bh=BRlZIBO2y/xAVIRFSMfbTOWt4y/TMHCA4wppJ2Xy5Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpYZO6OA6bKP08HCSY9v4iY4Aij5KBK77ki049rhBDK4WbxuKgk4++JnXGHF4rQlZGDfRb+gzCf3UIrFhMU9Wa6h27vRor+A4fYZVD8tZTeZ/NWxbzr9BKQZ4g5KuYkwcBft8fJ9oi0HYlXqfxYvAvXC1zxyQcg+RY+sM4ycaNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=faHDMdSv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2077b48cb09so82475ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 17:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727308857; x=1727913657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPuMIPtkFUqqXprChJbKt7gTP4JuGanqczP3oBY5vrw=;
        b=faHDMdSvbX8rqqyfay0OhfYhvUMXi193BkGEo8FEYdNM94AleaUsNar64tqQSmjWS2
         iwq4kI93R+4iTc8cb3XKyEEw1WwosTeeImZFvIQZB8nL7OJ7gfoY4L+l6RVG/cZ3DqM1
         IidRJMKuV9P5w2/NvZSLMIKil6wURI30fezkXjOrDKcslJUQbzOBHyTWWo0JlZjmvAN2
         XLK4jJU/nSgjvTs6al8UHiKTJjQUWsbMj0RVfCyxtzfydeCzhNwJwtsGqhQNz/CfTAGJ
         rZN9Jt2Yurxr6pfLezelNVYaXeQgLhAGXbvQzFf3W3IZPHLUBoFwcE4W1d80ZASOG3Gg
         92HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727308857; x=1727913657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPuMIPtkFUqqXprChJbKt7gTP4JuGanqczP3oBY5vrw=;
        b=HNYathXrobZVh+1UurjQa+fuLlgXAs2rZMx6UhPYTdkpZjUxdRUNY8dO+iSLHkCduL
         aG/Y6WNo59QQITsl9Uk8HlLwx5xxzAdrMBNjIMJRNfRlsuqGmStNlOofky39Da9Vnan9
         tNWkYK3QL8HaZUBDjuMkNyh2YkXCAHvgG9pjjXiwIYq2V67m5xbsQQfVa4/GXx3Uf6DP
         rNowwcHi7IWGYGeMeQnxiWYtXrO7y7mx2H/QI5BQzq+VMT+ley2fq7uLfPrR4+0KQwto
         CYpZyutm02V1ut8xJiTv5Dxnep5YVAKC45azX5N/CKe5zLPYK4GhGpauKqplQCr3kdyD
         Jkcg==
X-Forwarded-Encrypted: i=1; AJvYcCW+jG00mCTgL03qvfL7eVLlkYG6blGfM8zJJWIplzmljpAtRPY1TOrrfkH9Zoe/h99y8spstUA5BSFUyiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2MnZQM0/y7eBqa9FmSyiUtqL+9ubxtena25nzekXPu9shZps
	MH9EOtoLQGJPzAb+LG2a31mwDkU2KBh2HUmlOzmB0iuUSqohPnRCGnDSAmQmvg==
X-Google-Smtp-Source: AGHT+IFhjnkWy3FRA/CwSvG5CGnMdRcwTo96YK+0WkkTkGo3zIVuPlKKZn2oyrmo/1I+PT8z7lwKjA==
X-Received: by 2002:a17:902:d506:b0:20b:b52:3f7c with SMTP id d9443c01a7336-20b1b47470emr1341395ad.18.1727308856775;
        Wed, 25 Sep 2024 17:00:56 -0700 (PDT)
Received: from google.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17e1806sm28912165ad.166.2024.09.25.17.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 17:00:56 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:00:53 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Gatlin Newhouse <gatlin.newhouse@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] cfi: encode cfi normalized integers + kasan/gcov bug in
 Kconfig
Message-ID: <20240926000053.GA3188344@google.com>
References: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>

Hi Alice,

On Wed, Sep 25, 2024 at 08:10:18AM +0000, Alice Ryhl wrote:
> An alternative solution is to inspect a binary created by clang or rustc
> to see whether the faulty CFI tags are in the binary. This would be a
> precise check, but it would involve hard-coding the *hashed* version of
> the CFI tag. This is because there's no way to get clang or rustc to
> output the unhased version of the CFI tag. Relying on the precise
> hashing algorithm using by CFI seems too fragile, so I have not pursued
> this option.

I suppose there would be no need to hardcode hashes in the test,
it's enough to verify that the hashes for the compiler-emitted
functions change when integer normalization is enabled. Still, I
agree that this doesn't sound worth it in this case.

> diff --git a/arch/Kconfig b/arch/Kconfig
> index ee58df8b1080..b8066bf43153 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -829,7 +829,7 @@ config CFI_CLANG
>  config CFI_ICALL_NORMALIZE_INTEGERS
>  	bool "Normalize CFI tags for integers"
>  	depends on CFI_CLANG
> -	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
> +	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
>  	help
>  	  This option normalizes the CFI tags for integer types so that all
>  	  integer types of the same size and signedness receive the same CFI
> @@ -842,6 +842,22 @@ config CFI_ICALL_NORMALIZE_INTEGERS
>  
>  	  This option is necessary for using CFI with Rust. If unsure, say N.
>  
> +config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
> +	def_bool !GCOV_KERNEL && !KASAN
> +	depends on CFI_CLANG
> +	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)

This looks reasonable to me. Thanks for the fix!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

