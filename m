Return-Path: <linux-kbuild+bounces-8730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F843B44A45
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 01:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C82BA3BC75F
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 23:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE2023BCFD;
	Thu,  4 Sep 2025 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhQEkQZh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B832264A1;
	Thu,  4 Sep 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027729; cv=none; b=RkkuwTr53oUI7n+8aR7Gu6PmMl/QiuGGeAtGWMOlFc8OVqcDjhYsrcu1PqmNfld88Rc24TbHUynUqlJ/3Z9E1CQjiFYZpltXTSOGieK2Oqjxj58Ip+bl30YmSsfF962SyrQJP87M3yMwmSgiud5+zCuJMc0P9iJ2ze5/y2hWJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027729; c=relaxed/simple;
	bh=ObU4Wx3QtgVq3rqd74BvUsTOrGB5gvFPA6dTxle016M=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GScQ1vq5IKg+xFxfxBsEFodYYHbFBAjynZwgrOQEv4r/9eTSrhGJ+ko4FLdWhMU6aBCOt5prGFVE7Mk7RPkkXX4n/WhXSp87IaInCtNcTFBRPMpTcNtrlp5eh1d2dluDvfdfLBPCpN56LZ49I2SRGWUqZsyBUC0ohLFY+aJEOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhQEkQZh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-723ad237d1eso15394367b3.1;
        Thu, 04 Sep 2025 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027726; x=1757632526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tpsuh96BYhE6mmizhC+t09E/UhsUORGOygG5WIux6Ag=;
        b=NhQEkQZhkLWdwaV87CTnL2hh78ZuS+VE0KpVnQMF+dkqESdCjnUbwg3AUteCGVlubW
         4N6SYe4ATZ7hcFsmV9Tn6cVKF28MUe56owovbFu9RE5bPy0l4OQIka7i5QZ5MTg8T5Wr
         AzN5yXI2FUhrXk8y7g73S1bLtx4Y6Sek5Ap93z1W+q1Wc9/7mHtjRydYvv0IJcPb/zYT
         RKTSX/4Dne2/OB++wCj/tGcu3T0r4rePdVwwegO+gk3kk5arKzUK0UQO5J/mUq/lP/0k
         HnshEoQg6yw7WU3TPMWSjKAqbjFSk50kcFz3CydiqvMqci1pprW6ZVgdJKUiaH/pcaG0
         PEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027726; x=1757632526;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpsuh96BYhE6mmizhC+t09E/UhsUORGOygG5WIux6Ag=;
        b=IAkoxqaBQfQaIV7+yFgBJeoTYQKTl80KbE3Cix3Z8HIxlLEHqlPrPPoO8VfIPaLaLz
         P0tzb+SasMSwNd+xRlnpioDoSmp3khoTK25yjW8+k4EoBCoIOkFxPqeDtRhzqoD9pXHf
         u0/W6iWTZZGXGmPEY4AyXP9nVFpErPqADWqTwH4cJF4xEBHDPDU9uMGzmy9AoYao5tLC
         PehTKEoiJltPkZ6uGJrZFIBSm8rB3eM+XJZ5he3qOsfRyKj5fN3MKrAYqo2vxSOiNY8/
         h9B5Ck/NIqcUkubdKhj6dCYkSUIk8Mwh4lqa1bJv2hoyJUhRjwk4qqgowfam/kVs3tZU
         vmaA==
X-Forwarded-Encrypted: i=1; AJvYcCUMwyiplu6FUBexapOv9CnzWMofQQ7QWsizgFyqsVMOFiBthPqHU0d2/J+aVSMp9sXpAsJuVYrEO84HUQd3@vger.kernel.org, AJvYcCVe5MDt9SFzprgBHLAkWAWupAp+q+EZ9mBVQxjwgud/Q/+3HnXfNZDdwxM/fNxPlkjMcZZ7hQHzSikURFQsKKw=@vger.kernel.org, AJvYcCWpmzpP9ELwZ78l9vyZeSyK0gu33Fyyw5wVoG609uG4eIMZXSa2td66Nd3hVe28ri/IkYRDXqZLpC3w5G37@vger.kernel.org, AJvYcCXAh6FoMg8JGfiz22uxz7+Bf3NPLuXaPZEjoAjWvlfU63QkWd35LeOeNB675lr5IbuPbq77b/ESScQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zIvtYKoZNk6Xdi0t5ifk3CEiDImbpi+D23vopeA078FtJLT0
	ulK1a95IbYi3Ktg4jqyXIUmNrqtJdoF+lni8DnHtQKx715dNXBKMDl02
X-Gm-Gg: ASbGncvccnw9hwEb4F+A9dB4VLfFh7+U0dGEj6OvgGIabr+kSCbi12XXpfZcRwwbGQG
	Q4ZG5SZdN0rkhRGh/sa8O9maM//RzJmopylYN949mToO2pTcnEUrtFutL4r4ziMZDlCfvpumnzO
	q/wuKbd9/x5Tbvmp07PYz81Z0SRsW8aw9Jz5HXdae0HX2wdOchgFPW0AX5rv6Zcc2XDIJ29brjl
	QjtMz4wgk0LvMsEKDRI91ShDP89WLSqB/THfzBUHS9Fh1o95Xr52BC1S9BvIjgqHUOiDsm0ZJFg
	F4U69UJ9tUfvKuOrHrTAUNn1hJCctiNNeRvAi9v1Bv3Db5n4AATimwUTej4km23eRpYJvY6FWEg
	BPZ4YjHh8cVm133mE5yRjbBrXVwllFnhoRpseGZYvxJ5a0dRehSwHK3L4vAtLSLc=
X-Google-Smtp-Source: AGHT+IHnQqPIbJOAu33e4UiDHC0K7E2hrlF3HKVf3SiLs0oAF7WqPL0Qhjae/HNmcjm8lQ9kydnXvQ==
X-Received: by 2002:a05:690c:630e:b0:71f:e154:7aa2 with SMTP id 00721157ae682-722764d161fmr242712347b3.25.1757027725963;
        Thu, 04 Sep 2025 16:15:25 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a82d6abbsm24968377b3.15.2025.09.04.16.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:15:25 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <fb47fe55-7e9c-4d2b-91d2-1c6f29a77f79@gmail.com>
Date: Fri, 5 Sep 2025 07:15:15 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: get the version of libclang used by bindgen in
 a separate script
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Tejun Heo <tj@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Jan Hendrik Farr <kernel@jfarr.cc>,
 Shakeel Butt <shakeel.butt@linux.dev>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/25 7:24 AM, Miguel Ojeda wrote:
> Hmm... I am not sure it is a good idea to move that into another
> script. Do we really need to intertwine these two scripts? The rename
> isn't great either.
>
Because of adding a new Kconfig symbol for the Rust bindgen libclang 
version, then we have three places manually calling bindgen for 
rust_is_available_bindgen_libclang.h to get the version. I'd like to 
merge them into one script so that it's easy to maintain in the future. 
But if you prefer not to, I'd also be willing to revert it.

For this approach and naming, I referred to script/cc-version.sh 
rustc-version.sh and rustc-llvm-version.sh.

