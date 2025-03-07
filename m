Return-Path: <linux-kbuild+bounces-6009-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FDDA5764D
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 00:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8614017984F
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 23:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B30E212B3E;
	Fri,  7 Mar 2025 23:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4vwXPcN9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE7320D4FC
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Mar 2025 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741390804; cv=none; b=ORsvGBFPKvEbLiW2RsPP3ogtvllloUhprqpgPFh+IRC5BHHdMPfT5OruX4PfcFqwOErq86lsTLPZkwi3RkGZGt+DugGzqlHI9LHlw2pKcf/Z7c/VVNV4b6LUNV5J9MZY3d1D5Y4tkkRS+sGELQXZj7217E8Widzveow+TRG1PgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741390804; c=relaxed/simple;
	bh=w436wgjGcjzJ3dyS3A6//n+WNelqPnxFh6A/g8MJI18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVW4LOKu8e/aU9zR1dwAa/ktiXlMnfh/qCVpkI15tOgJHiO4Rs3WOvzEj/3+xoUeOc33lnY92ja4E0nuX95hj3F9hPWCVmR6qvAZnuybjohBNn2LQlGhT+HbufR0s1SaMFMhJoLdgtY4EeU8jhueCVQPxQfWomsm1htiE5Pe29U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4vwXPcN9; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85ae3310966so67123439f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Mar 2025 15:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741390800; x=1741995600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDc72lD8Mhnu3NfUsPcD1oy818yB1nERuThSEkGUHkw=;
        b=4vwXPcN9EGBJ8ArVBWRV4hhuiBxfqvIWxYMwiZbdrqCsMPfdc5jLTlnroiaktJRLbm
         LTglMy81pePPJdHIi6qUoTDil3fjiSrhxYyDzkhnXFI8V0m8Zc7Br5HQJo2ASz0+8ZIM
         yaD3t/44crfxvTVhTdlycs1+v1A0W2VIkIvEXoFyHWbejQ37hsCOVtSNQ6TqScOa+C0s
         LK7ztbCcQnFMyTifJQdOFzoyjrwdOq1iIvZiVSv/tiTE4vMhUwC2blVrh14fiQyIVsfy
         aRwx8/pM4W3SGR/L1T9smglthFDByAXMQSf+jELc49CjcWOljOlS+uQzHEkKery5Edih
         ioWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741390800; x=1741995600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDc72lD8Mhnu3NfUsPcD1oy818yB1nERuThSEkGUHkw=;
        b=N6sGnXeqpdw7tFAwQCa5aIX0+3IbIfRKsWwTC5/mSIbeTrEciChlV7Z312WXzihkmg
         ypvtPa+0S//JmGTseyUFZGU+fGvUHyXIBJjp4PU8ArIneK9jJt+GP5DoVfmqe8iHh8dy
         7ITGyMXqS2fD8MMX/ENJdSNV1BxZqUwIuvbJaJ1PM4VhRK1+OK/bW4P6wwq2mXe5CTRN
         RpPinORsoZgQsG8b56LIDXIuvDrYu3iN+xE9u/RrctKPmTqEN6c/yFjkbAjrs2bDlnka
         JTeOFL2UGUcCZxHjhbxnOM9bcIUN03jRe5gLU7NGFTNfiJ/O0WonZd4mUh2w79h6FRZA
         RoRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiAAdwFNQBMWPdJDisJVnY1NNBbh0T+zKzX1qfjeAPZtXmTissJ0RpftrgA1DthbJF0YY9OK+V2kwX6cE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46qNGJakB7UP35OlfCJM66CGIsBroK6RIhLVKZesk58BqQGso
	ypsH5igEhkvvdhqT3R4FjyScNo10q/GK0lgd8iW1l8r8cpmtVyTXAs4SB/4p+Q==
X-Gm-Gg: ASbGncuTfIw8euC9p8T4o7U9EyHYa2H6W5114N/8HRasrytqPS4gq0pEI/tIcYFQ8lv
	Fy3DZ3gmiv8tTaZotBFWt/a0bbZrhF0JsA8xfX2RLMSflKrepmx50JFGQq7tLyGR2wBeMlUNTIZ
	WHopj5hsmxWMkqSXLLHfkWqUUQZ7WAx85iDtcmW5oSNuH4P6As11+fyKd2oFMryqsS+LroNVBpL
	LzVGgj7nZpxKWDrYLBVlVHN/IkcmRo8tdmcM3ANT1/FEGT6SwsFAckiZZ5/jgY20xdXYxXeN7Fr
	JdkZlOb9pU9xeIz4gK7EJqDrai529rh0l5B09V2CC5OvfpWq1whgsHukB2IdrVvxOVwD0pxSg1B
	2GdA+sXlO
X-Google-Smtp-Source: AGHT+IE5GWqkBP7F2KuCtSZMj3O7YCqwL1LClyQ1d+IKR/y1v4SzZvWajbv9qbfRqrrAzp37TIieCQ==
X-Received: by 2002:a05:6602:474b:b0:855:9c88:7894 with SMTP id ca18e2360f4ac-85b1d03fb51mr700353139f.11.1741390800315;
        Fri, 07 Mar 2025 15:40:00 -0800 (PST)
Received: from google.com (26.80.59.108.bc.googleusercontent.com. [108.59.80.26])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f20a06b059sm1193908173.136.2025.03.07.15.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 15:39:59 -0800 (PST)
Date: Fri, 7 Mar 2025 15:39:57 -0800
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
Message-ID: <52samxs253u3t2cmm5xwbmrwzyof36w7xczpuvbkarqwonwl32@2jbmkagpk7za>
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

On Thu, Mar 06, 2025 at 08:19:11PM -0800, Kees Cook wrote:
> Limit integer wrap-around mitigation to only the "size_t" type (for
> now). Notably this covers all special functions/builtins that return
> "size_t", like sizeof(). This remains an experimental feature and is
> likely to be replaced with type annotations.
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

Forgot to mention this in my intial reply but we have to be careful
with what types are added here. Kees, I know we're on the same page from
offline chats but for others: using sanitizer case lists to discriminate
against types for the purposes of sanitizer instrumentation may not work
properly through various arithmetic conversions. Mainly, implicit
promotions which tend to break this particular approach.

Now, for size_t we got kind of "lucky" because there are no implicit
promotions with size_t, it doesn't get promoted. This is not the case
for other types. This further necessitates the need for canonical
wrapping types backed by in-source annotations/qualification -- coming
soon in Clang.

> -- 
> 2.34.1
> 

Justin

