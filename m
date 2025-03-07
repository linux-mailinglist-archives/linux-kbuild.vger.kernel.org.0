Return-Path: <linux-kbuild+bounces-6008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E52A5761F
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 00:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D105170CD2
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 23:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE6320E014;
	Fri,  7 Mar 2025 23:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2kUD9xc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3121AAA1E
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Mar 2025 23:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741390389; cv=none; b=Y7xbkKK/FrRDtJRFL5k1X4S1Vfy0LSgkRNW1ntM9LraEQFqhczGS0RAzxEJ34F6ZsoyeHRPS5MoO3o+RCxAyTCFGl/0wcg1g0HSYNeA7gUMn5flWraqb0lUZM/VKl1chagZTGiEHokebufnXm8maAxSRpvZTS52ocds8it9XPFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741390389; c=relaxed/simple;
	bh=L4aJtPrE2GfnROL3oS1K4BKrQk2bSyTkmLWv+1Ga//g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+KjNW6gXiQNeJcyg8982f4Hcq7Lc5beMshxIKOwYhoBSRdte/+touYEKEdlCdKO/v0XoI+AWjI/BXPlE/UNXmLYrCC497eYjmhT6+v2Rxi0VIrBfCAskx7zeD682yYQZokqL6fDUmo4es5jHes5WgWj2498EP/Zf2nyfzoVDYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2kUD9xc; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85afd2b911aso67857339f.2
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Mar 2025 15:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741390385; x=1741995185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHFXO9D6YwhROjoFlwWSesjCYFiKET0NT2Feon19Q6U=;
        b=k2kUD9xckJ57FamQavIRngz9SRxwGmFBVrm5lTB90cHRqkkg83eegNh0ge0KBCmfIe
         /QRw4bppDOf14fwz+RBsTHMrCwZiM3OtI9PXu/PH0zun5gk/GVI52Bci+3jX3nTorKb1
         9ACZb+alUl/YTdI6a9on1h35z8ZvxDEh6isuzEeIPw3vg18G+XkC1plEcmgfaqqGldjM
         0OHAnnRwtYXUb1o/MncUoYp7RN3ZKyDEjpZ8eXJ6V4BNBfJDQP00hJaFNUyH0gmwz5r0
         FddyrObyjEBI0OSKCGCmcbIGQxpP46NMk+D+0ZlZRoXKD/qtDRP5BrfCTN+haGvzTGyg
         Igiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741390385; x=1741995185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHFXO9D6YwhROjoFlwWSesjCYFiKET0NT2Feon19Q6U=;
        b=trvTJ2ZnXj6IG8rr8W/+et7Q7dBzJW/LrT8QDiFo3I5+MS8mZZ1l6FlRtUt1mtxsA/
         Ij2kxOcy7ViFE64cC0G/uAyRSm7RVseKMzue3ja7tWSGrME+zpKPstrTTNcYJ7Dkn3uK
         /IW9FuW8XAr6iCTqjnU4tafj9GwDiYS4NXIFsb/GBGPCTa6Wsw5BJQkuQtTIEPAns09g
         mIdHvpp1+dL/c49dwMAnSibwY5sfKgboFubGB7/yURo+FdeLmETi4W4ULxO/EUWaBN7F
         6y5B3XXW1PSyKZm1ais6rGG1inQqT4mvvGuxHKio3q3oYlCsXC/YwUk5NbZ6xDUNedSO
         n0aA==
X-Forwarded-Encrypted: i=1; AJvYcCVLVcJc0tZbwyg1qN/Otu1fWs8JC8XvYnXA0tnxZKECSbmeALwBuqg7wQHHbmaQJZAQ3OWgB7L6HJ2Apyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwGssmlDxdxgDXrLhDYB7APWoa+q2rcJgR58wq2dACJ07zV7O+
	lc9q4Lb9ORiRQOxwsrXH1D/qFgp0MtAljlnZfee40DvqBpm9BlCmz1+KYOK1fA==
X-Gm-Gg: ASbGncuGh9dlwhV+z/cMJXX1CD4F98BaGNHCcYYIH9qe1HaB808Fkd/HjhqsWwcWBpR
	h3aiVIY9//AjUv8ZinORV7objMMzNtm6E+yGMu2TME3OXyBhpLca+/Yldwcg+PG/vLHU+lasR8D
	4xehr0tNbvVRSBCikyrG1EtbIXY3gJA4vKwUAQsv9w4F1Ha1rDMyyNznrfHxihQq2YPSLdN9VR2
	qlavzvAI+IvFpZkXVaBu/GlL707UYK5r6EDSB6blhvSLXEK2uG/HKSw1AD2qNwTZ1MJmpAkSIwh
	MJhEQLaEzrqXaMZ8VzyDYRLZTYNGOryFml1485/jxkANy/4s48tmTlFLeUv3Ysjj6hCHPeiDv68
	nj9rNsbL0
X-Google-Smtp-Source: AGHT+IFyRzzf7mMzUIJI4y0Th6wZ9sjI35nBIcnhd9RXwZh9GmhLYqRpDr7OO9MYwGSF0/lxYav2hg==
X-Received: by 2002:a05:6602:4006:b0:855:ac69:32a4 with SMTP id ca18e2360f4ac-85b1d053032mr663250139f.1.1741390384993;
        Fri, 07 Mar 2025 15:33:04 -0800 (PST)
Received: from google.com (26.80.59.108.bc.googleusercontent.com. [108.59.80.26])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f22079b1dfsm382085173.118.2025.03.07.15.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 15:33:04 -0800 (PST)
Date: Fri, 7 Mar 2025 15:33:01 -0800
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Hao Luo <haoluo@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Bill Wendling <morbo@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] ubsan/overflow: Enable ignorelist parsing and add
 type filter
Message-ID: <upvdnfozcexlpb2x4auimec347adozkl2al4hu2yp3kfagdeyp@dqs2ft6wdmog>
References: <20250307040948.work.791-kees@kernel.org>
 <20250307041914.937329-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307041914.937329-3-kees@kernel.org>

Hi,

On Thu, Mar 06, 2025 at 08:19:11PM -0800, Kees Cook wrote:
> Limit integer wrap-around mitigation to only the "size_t" type (for
> now). Notably this covers all special functions/builtins that return
> "size_t", like sizeof(). This remains an experimental feature and is
> likely to be replaced with type annotations.

For future travelers, track the progress of type annotations over at
[1]. There's still discussion on how these will be implemented in Clang.

> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: kasan-dev@googlegroups.com
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> ---
>  lib/Kconfig.ubsan               | 1 +
>  scripts/Makefile.ubsan          | 3 ++-
>  scripts/integer-wrap-ignore.scl | 3 +++
>  3 files changed, 6 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/integer-wrap-ignore.scl
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 888c2e72c586..4216b3a4ff21 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -125,6 +125,7 @@ config UBSAN_INTEGER_WRAP
>  	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
>  	depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
>  	depends on $(cc-option,-fsanitize=implicit-unsigned-integer-truncation)
> +	depends on $(cc-option,-fsanitize-ignorelist=/dev/null)
>  	help
>  	  This option enables all of the sanitizers involved in integer overflow
>  	  (wrap-around) mitigation: signed-integer-overflow, unsigned-integer-overflow,
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 233379c193a7..9e35198edbf0 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -19,5 +19,6 @@ ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
>  	-fsanitize=signed-integer-overflow			\
>  	-fsanitize=unsigned-integer-overflow			\
>  	-fsanitize=implicit-signed-integer-truncation		\
> -	-fsanitize=implicit-unsigned-integer-truncation
> +	-fsanitize=implicit-unsigned-integer-truncation		\
> +	-fsanitize-ignorelist=$(srctree)/scripts/integer-wrap-ignore.scl
>  export CFLAGS_UBSAN_INTEGER_WRAP := $(ubsan-integer-wrap-cflags-y)
> diff --git a/scripts/integer-wrap-ignore.scl b/scripts/integer-wrap-ignore.scl
> new file mode 100644
> index 000000000000..431c3053a4a2
> --- /dev/null
> +++ b/scripts/integer-wrap-ignore.scl
> @@ -0,0 +1,3 @@
> +[{unsigned-integer-overflow,signed-integer-overflow,implicit-signed-integer-truncation,implicit-unsigned-integer-truncation}]
> +type:*
> +type:size_t=sanitize

Hi again future travelers, sanitizer special case list support for
overflow/truncation sanitizers as well as the "=sanitize" comes from a
new Clang 20 feature allowing SCL's to specify sanitize categories, see [2].

> -- 
> 2.34.1
> 
>

The plumbing looks correct,

Reviewed-by: Justin Stitt <justinstitt@google.com>

[1]: https://discourse.llvm.org/t/rfc-clang-canonical-wrapping-and-non-wrapping-types/84356
[2]: https://github.com/llvm/llvm-project/pull/107332

Thanks
Justin

