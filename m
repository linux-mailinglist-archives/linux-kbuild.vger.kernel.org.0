Return-Path: <linux-kbuild+bounces-6007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345BA575D4
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 00:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CA0F7A4699
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 23:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07C0258CEA;
	Fri,  7 Mar 2025 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jqC2HE2G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9120D503
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Mar 2025 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741389163; cv=none; b=aQbZdpBl0M7AXEKgt5eClhdMPC7kPuzrNjnm6Y05XFK/b7nCS9DIh2WUA9xq6+UqSGm4HNKCQcjAr7QOeIy8lzcyGflGo9MQzX1lzcqE6dyvvB0sz6Ij0NQ2Ine36u25dQTvIdcO2+MXZ1s/bY5EUIb+oNZan8gMZWCY3i3hw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741389163; c=relaxed/simple;
	bh=iAr5WyJszTlsFuuCiqSrDjfdnmsHP/Pi4YVF/CoLA7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/ObfHI4LZ4ScBWGblkdDYNfIRnt1fgTNl2zARo+O+jBFAquup90pIEiZiRElD9r3Eg8mga/OyqSfzqXXlJr5LewcaB7gZxlWj27pATD3MkbgfsnfYwYZBy6hco8dHxoShk0yRduvJnH5UUNfGLERo/dNkgZj+SR1MTzmL96h9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jqC2HE2G; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85ae131983eso178813239f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Mar 2025 15:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741389161; x=1741993961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rWk7dXPmdm5yCaIaVrSCJTIdKCaoNn8ysMEwHD+DXFk=;
        b=jqC2HE2GAR5fjnLq7k9HHXB9YU8wqgTJ+srKfDYA1zjBjjOFFvlCIa4oZJwpoHLnig
         FgTPTgiGKEf9Hi4kRTaw83z0sG4Y+u36LAoZ4KTZ5R4F3rZ4dr/ULb+7E8GLS4C6oCAI
         0ATDZTck0tSBPKRRai9l08E9dDydqIUlNkQQYwvxb9OiH1tl2yHrpVUtDs9c2XohMAfJ
         KrrjCTU+N6jxxYQE8Lk65/BKvK+FvR5SyWB2FcA/Zj9FWPqrlUNTaNxTce1ZsCLxWxCP
         Ly0qO3gAzeJH77UrTUwaznHZh+Mgax3HKEeyTgrqb7EiumnaFxPQro8En0k45BrWnJWy
         uiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741389161; x=1741993961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWk7dXPmdm5yCaIaVrSCJTIdKCaoNn8ysMEwHD+DXFk=;
        b=HmROnUzZWzfqsQs9/p753EoftCpBlSYbIHGc8Mun0OqF4AntsOElKRbCPMvlbR/WCs
         3EVfQJJjelz711peQhQk6vq8wBa2Gj3Nke2zkgBTyeA0e/4j2M+LdpoPnveUPi3pUA7Z
         ReaWQkggAZwu/57/bKncgsyxBFPOkE9yLCcria4XQk+fCjGJSKTsuUH6X36ur+hJRUCJ
         el5JYJqQ2ozNHVrHDbD3lc0gl7Qa03SZLtVqhDCYiGqs5Gza3lsic2qaQJlxRTdsT6of
         bj4tL/9X+mRxx9VBEskTt4pZUpEspjQR+FxCqTHUwPBI9EzcqmTEObL1TwBvXQYzGYes
         t2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVryezSrnJM4Aw7uTMXFG8eVyHkx6wI0dVNlNVkep+ywS3N6qJys35NJlT7IuRdzXQ5eO9tfy8aVVIo6YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLm3MSReQprPaPqFIb0RjVPbqNhkLGofl9A9+6+Qh/wJEq/9t/
	2poc1PyauUxKmmekX0TbwCSwDMcZkQPUx2RYm6o2nqb+JGTuMNeoF8AZLzRtCg==
X-Gm-Gg: ASbGncvVqZpZr2PGLU1b0vCDPAF4i+uAtSWOWfJOFa2OvoVSq1KLbWEiTh83/9i8kc0
	7LSoH9phN9V/yPqyPL/aGwNRfiHQXenW8nyBODlMmeQnCqG0XQBan+dXeIs2z1zcdyMxbOvn4e1
	I7oYZKj3N27zmBuHDybD/D6eyLEtwzUFBbU5mYAVGjsDCpRrcVmhpZGquGP58GUawD2X9gnTv0t
	8DdQ1S6l/ABr/tSXfrv9cZy5I7AvzMT1coAyqk9sJU/U7XJQtbt+CBI7NBgYz8l11HdgvgnQeey
	z64bEAjvyqLT4zSJc4tEohc5en0TVQENq8+ngipU2g5KBiuMzILDepjg7PzWjI4UaqP1LLceSfd
	qWXx0jNe+
X-Google-Smtp-Source: AGHT+IHiiJqDXqIfUK/CVTI1rCS7/zKGfwuR4j+jwP7Uw2SRUCzehVJJV8FDhIdmPV4bfql6Mc8Hcw==
X-Received: by 2002:a05:6602:c8a:b0:85a:eff8:4ce0 with SMTP id ca18e2360f4ac-85b1cf7fbb6mr661020739f.1.1741389161258;
        Fri, 07 Mar 2025 15:12:41 -0800 (PST)
Received: from google.com (26.80.59.108.bc.googleusercontent.com. [108.59.80.26])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f216f55378sm681019173.109.2025.03.07.15.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 15:12:40 -0800 (PST)
Date: Fri, 7 Mar 2025 15:12:35 -0800
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Hao Luo <haoluo@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Bill Wendling <morbo@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] ubsan/overflow: Enable pattern exclusions
Message-ID: <yduqbthmtpc5e2n4u73ofbp326chk3qdkgdiyrgmwcbhgeqceq@yybbkifwt4zk>
References: <20250307040948.work.791-kees@kernel.org>
 <20250307041914.937329-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307041914.937329-2-kees@kernel.org>

Hi,

On Thu, Mar 06, 2025 at 08:19:10PM -0800, Kees Cook wrote:
> To make integer wrap-around mitigation actually useful, the associated
> sanitizers must not instrument cases where the wrap-around is explicitly
> defined (e.g. "-2UL"), being tested for (e.g. "if (a + b < a)"), or
> where it has no impact on code flow (e.g. "while (var--)"). Enable
> pattern exclusions for the integer wrap sanitizers.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: kasan-dev@googlegroups.com
> Cc: linux-hardening@vger.kernel.org
> ---
>  lib/Kconfig.ubsan      | 1 +
>  scripts/Makefile.ubsan | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 63e5622010e0..888c2e72c586 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -120,6 +120,7 @@ config UBSAN_INTEGER_WRAP
>  	bool "Perform checking for integer arithmetic wrap-around"
>  	default UBSAN
>  	depends on !COMPILE_TEST
> +	depends on $(cc-option,-fsanitize-undefined-ignore-overflow-pattern=all)

This option group "all" may be expanded in the future, e.g., negations
of unsigned integers (not just unsigned integer literals). As these are
deliberately designed for the kernel, I think we will want them anyways.
So, all is good.

>  	depends on $(cc-option,-fsanitize=signed-integer-overflow)
>  	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
>  	depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 4fad9afed24c..233379c193a7 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -15,6 +15,7 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined
>  export CFLAGS_UBSAN := $(ubsan-cflags-y)
>  
>  ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
> +	-fsanitize-undefined-ignore-overflow-pattern=all	\
>  	-fsanitize=signed-integer-overflow			\
>  	-fsanitize=unsigned-integer-overflow			\
>  	-fsanitize=implicit-signed-integer-truncation		\
> -- 
> 2.34.1
> 

Reviewed-by: Justin Stitt <justinstitt@google.com>

Justin

