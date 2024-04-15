Return-Path: <linux-kbuild+bounces-1575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B88A577D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 18:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 993942896DB
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 16:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D6580635;
	Mon, 15 Apr 2024 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L9dJsEwQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF857374F9
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Apr 2024 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713197818; cv=none; b=FY/G70z6lyC6vJ9ypyF1ARvp+8+Cwee3W6R9RK1aI2kxivUwsYDn6ElhV2VKLPcqVJFmE2T7ox1sfCb3ZN1WY/yWlmgZOWZeU8wuq8E8SeH6Kdt4jA71hP/DGO/XW4kOC2tMngwvPSGOKlTVYEoNbmftX3Ffa1CaWrVhpbd75w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713197818; c=relaxed/simple;
	bh=Lh5jHfeqmoxBPj80NPylZDokwvnjtT1xO7DB/e/QTl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/bjLXVykUHFo+UYPIZql7kkovVY5ZtB9vYPOpdJDy4BgQhXF5FSCWvGRri0/aCKACPrO+Uac8pRjFAZHXaFMxIPue8gOooIYFxQFH2W3xwSRcq069DSaZPjX4ra+471/Ph8Gx/kSsb/R2f9+LO+8Kc81Xp2sJM4W4Q+1nwv3W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L9dJsEwQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e2232e30f4so24790185ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Apr 2024 09:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713197816; x=1713802616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Wuy1kFscarp11LSwiP+LELXc8a3c+7S4sus+rZZCwg=;
        b=L9dJsEwQZUV7UF5qrsYmxyjgq4bd65AnkhOcLxH/X3VD9C4Pn2pH+6HJ8amWZ8MxeP
         ekAfUfaoHLLKytMXPdsLlxN0jdlh+QZRaDgPSp+gQlTxlCzFikPgXUun49QJZZ9tbawH
         AY84nyuhPjNrglxxRweBq5O9lMb/h694Lmk8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713197816; x=1713802616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Wuy1kFscarp11LSwiP+LELXc8a3c+7S4sus+rZZCwg=;
        b=mrgELYF0uAV8jkbk8+QWqRx7HKNwdyUtC2JBaOv4J1oh/4hQxSVo0XVS+1h8NXd4tF
         nke3VtPbI01sd5UAo5OrzFJNJ9dLBqt9/v2x3FpG0/pA/QzzA4RCmLGrAiAPVg5+Mjo5
         G5Sjy+Dnevd361lTFdXcvqcqJqIzVWqC29TJrwOmhzeCN+V3bjIR2GrdU5SvqFs7CSjx
         2XgWrxg2Lc2VM2hR+PjT0pSdJhY19OcPSIH9PRtjj3q9XK/mZ9US+CIY+STZQ2XMXQLg
         A1HSD4JNxkQw3otaoyK7CEOimBd/mFYfscPT9PVhtnGa0800UOyYW66yAbw/eFibf5DK
         mHkw==
X-Forwarded-Encrypted: i=1; AJvYcCVGhjryo/L7pJgPBMPU7uC7ewF1+lP3DMqybqecd1L2tscj0XCSam58FisFnY528NlZk8xfVEWEJrG2wnHqQ3VFqaIwgMlOyn7h5q6P
X-Gm-Message-State: AOJu0YzJiDyQ4ztUWxBKKsQLILcGVnglFEVghgnVKs+tZE168dzxYE4C
	uhfnj8gvomFBOgji4588DOWjpG8GlST14bKQOuKujirxt4kzE8U0xBLg+PWhpTsf+ExEd6NAtDc
	=
X-Google-Smtp-Source: AGHT+IGOZF6sdBlFUMf+8k4Lae5iNbktkJ7avY7Q4jWYEWVVyRkPV21G2LuPlS3REiioA0vSPOcfBg==
X-Received: by 2002:a17:902:b906:b0:1e3:e256:44e0 with SMTP id bf6-20020a170902b90600b001e3e25644e0mr8045502plb.31.1713197816058;
        Mon, 15 Apr 2024 09:16:56 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001e223b9eb25sm8109561plf.153.2024.04.15.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:16:55 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:16:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] [v3] kbuild: turn on -Wextra by default
Message-ID: <202404150916.7FD484FD4@keescook>
References: <20240415122037.1983124-1-arnd@kernel.org>
 <20240415122037.1983124-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415122037.1983124-2-arnd@kernel.org>

On Mon, Apr 15, 2024 at 02:20:32PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The -Wextra option controls a number of different warnings that differ
> slightly by compiler version. Some are useful in general, others are
> better left at W=1 or higher. Based on earlier work, the ones that
> should be disabled by default are left for the higher warning levels
> already, and a lot of the useful ones have no remaining output when
> enabled.
> 
> Move the -Wextra option up into the set of default-enabled warnings
> and just rely on the individual ones getting disabled as needed.
> 
> The -Wunused warning was always grouped with this, so turn it on
> by default as well, except for the -Wunused-parameter warning that
> really has no value at all for the kernel since many interfaces
> have intentionally unused arguments.
> 
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

