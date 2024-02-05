Return-Path: <linux-kbuild+bounces-828-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A406849B22
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 13:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E7031F272C7
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 12:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9285E3CF58;
	Mon,  5 Feb 2024 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ol9gRZCp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E461BC3F
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Feb 2024 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137496; cv=none; b=eruEUYQyeHC7HXCqCSGnW9p61QhaNLwUXRGajeklwoRpQj09YmHTYigFBUIgJRzpMewliaVP7h1jJTKtXUQllwR/Eur4tktwPkZsbH47csZjCvZJXAmCEU/u/XdfBuEerY0a9mIExrh6MtmEzFRpVMoOUf/6jT1A7p53ZJ5U7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137496; c=relaxed/simple;
	bh=T9TcOLUmk4jSDDNFl7EpE3EkNKAhZxnLx2Ork+9fGjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/f+RRytXCbP5w8iG1U0YAQjLthu9rWUtTJ1rRfQ16paqa43eVFd4rKCGI/xzMhrmwRT/rvSDeqXRqgpvp/9ESBkItBQuVprQBBO0DMhJpcwCqPZNwp/1ZHwwQ8wH1orxaDfEh7q4VRaY4ssHlhWsMEJqQhiePTwFxHL+Mdyx8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ol9gRZCp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29661facbd0so1272589a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Feb 2024 04:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707137494; x=1707742294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAuOEn9XClUdiH1Uvm7Me/u+LDru9Z+XedI9uQ/DMIg=;
        b=Ol9gRZCptHGCb1dCBBeXTrtusNphfFx6rWJxJS/PY3Q/LJjvp1yOUPqrVv8LGxIPXh
         1FXZJEv7kyW2pBg4XHAB/d+OOabCxSngIW++ulSaLYA9u7/miYI/2R2zlly87m3Blh0O
         xq+KHaNW3Xilrl/UGdTg3m6OFmOdfkqNOSgOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137494; x=1707742294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAuOEn9XClUdiH1Uvm7Me/u+LDru9Z+XedI9uQ/DMIg=;
        b=HnrRIT4k1JlOxQJdyWUXkbaw/fD64XDMXgx5u0g2UUeFJfrb2JH9IGnzvQ1shzWPrL
         zU1VXGBgtO4khOK/cORGGuYEXs4OetzMFvInkXtu5S1voJFmyodemfPzIrbpFZgobI3c
         +kQpm3VisRmVwe4tBQWp2YC7yWM3yNiUSVCwDJhs7HiF69XG0Zl7YuO3M2U6NJiCqoSN
         lY6mM9b05up9B/DX5Yzd3w+4E97drcZPOp34Skj/hjhT9/4hbhMbnzMy0BHfIXXIS3c5
         uEHOeDJtUDaDHvP+fV1j9/3ZA77H689LLSxh17AHQ7nRpHi+QuMoaOBIY+Ih7EuyJjSt
         nDkQ==
X-Gm-Message-State: AOJu0YxT76aR7QHp2SOCloaPVZBjf8G5uUn+H38yW5+bXwR93pACmBQA
	3Kkati9/o3smsWJLfmVyrfnfziZb0vl6lCGDn+wIjfju0x1cZbIScaVlRpMjww==
X-Google-Smtp-Source: AGHT+IFpSvrgeNaOR9aNU1B8dbFKhTL7aTCDCk5blFR97YFpACYogH1EgmowT0wZ53YNgglBgo/IiA==
X-Received: by 2002:a17:90b:2348:b0:296:a76a:9711 with SMTP id ms8-20020a17090b234800b00296a76a9711mr1937769pjb.12.1707137494324;
        Mon, 05 Feb 2024 04:51:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXiDr027h34JyAnnlbBVWpPAWDZpuzcJBvVg61uZLSfkey6Ga3gEO4vzW8geoynvMjRpmilnd/TWS78wZJw+96i9pzUQCwSmpSuqHwoEo15tfbU6rcH7UVYklps9ooOyytmuS/xlI90immDWeyq3Fk9hFAGcYT/u2M1DCBv/kw+sMnnos/w097tCKBAZ1LRPFxNqM7uFMHakgxwdr8WwHez1xPq4lFRJjmqmD6dsgDdrV6qN8jpYIFJmnx7jmLo+WVJD8RevM3IWaISVxLWL4mz9/UQvoXn4cCSIMd1A6YgbgIvRSzOjKJB9GwyuGGjPG3Uq78Q7dWJ4ayOL44pmn4+p0vUy5m0jsc5lwVI3FenW4mxHFJ8G3B7xCyKFxLCIiHu7Z8ofnm6GZzHx73zVNasMLQ1UcALy/hVwVC8XUAYrHEulzG/h3e2dbt40BZqg2+REzKS9LJYKqKHVth6+Wayw073kKyFGoYFddC6lmaYEFr7/NnjAdouop2NLJ8J9yKNv0KrghI=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id nm23-20020a17090b19d700b0029464b5fcdbsm5049540pjb.42.2024.02.05.04.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:51:33 -0800 (PST)
Date: Mon, 5 Feb 2024 04:51:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Hao Luo <haoluo@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] ubsan: Reintroduce signed overflow sanitizer
Message-ID: <202402050448.0FB78C7C@keescook>
References: <20240205093725.make.582-kees@kernel.org>
 <CANpmjNO0QOsHQOqDf_87uXFB0a=p6BW+=zF_ypb5K0FbaObvzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNO0QOsHQOqDf_87uXFB0a=p6BW+=zF_ypb5K0FbaObvzA@mail.gmail.com>

On Mon, Feb 05, 2024 at 12:29:21PM +0100, Marco Elver wrote:
> On Mon, 5 Feb 2024 at 10:37, Kees Cook <keescook@chromium.org> wrote:
> >
> > In order to mitigate unexpected signed wrap-around[1], bring back the
> > signed integer overflow sanitizer. It was removed in commit 6aaa31aeb9cf
> > ("ubsan: remove overflow checks") because it was effectively a no-op
> > when combined with -fno-strict-overflow (which correctly changes signed
> > overflow from being "undefined" to being explicitly "wrap around").
> >
> > Compilers are adjusting their sanitizers to trap wrap-around and to
> > detecting common code patterns that should not be instrumented
> > (e.g. "var + offset < var"). Prepare for this and explicitly rename
> > the option from "OVERFLOW" to "WRAP".
> >
> > To annotate intentional wrap-around arithmetic, the add/sub/mul_wrap()
> > helpers can be used for individual statements. At the function level,
> > the __signed_wrap attribute can be used to mark an entire function as
> > expecting its signed arithmetic to wrap around. For a single object file
> > the Makefile can use "UBSAN_WRAP_SIGNED_target.o := n" to mark it as
> > wrapping, and for an entire directory, "UBSAN_WRAP_SIGNED := n" can be
> > used.
> >
> > Additionally keep these disabled under CONFIG_COMPILE_TEST for now.
> >
> > Link: https://github.com/KSPP/linux/issues/26 [1]
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: Marco Elver <elver@google.com>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Hao Luo <haoluo@google.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Looks good.
> 
> Reviewed-by: Marco Elver <elver@google.com>

Thanks!

> And just to double check, you don't think we need 'depends on EXPERT'
> (or DEBUG_KERNEL) to keep the noise down initially?

Not for signed, no. It's almost a no-op like this. Once Clang and GCC
support the wrap version (which will likely require changing the
command line argument), we can re-evaluate. So far in my testing, I've
not been able to trip it. I'm planning to get a local syzbot running
with the wrap sanitizer later this week to see how noisy it gets (if at
all).

-- 
Kees Cook

