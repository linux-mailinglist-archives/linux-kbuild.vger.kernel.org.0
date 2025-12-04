Return-Path: <linux-kbuild+bounces-9989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06839CA39E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 13:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 597D2300F323
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 12:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528C833B945;
	Thu,  4 Dec 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k58/Q0JB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2B338587
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851619; cv=none; b=FqwQFJdIM7BeWNZ2A89oO+55b2+qRP/t00Ax2mFHXop1dM31af3u3f+IDwFvjpnQlJoF/1nUnOhheaF84sgUc6Rufdb1Hbry0D0lqqjy0VSzyrMOFjx/fY0xY9CA6arQuh+PizspD92fI8HR3URdbIG82DJFQYSAvctjvIpIoyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851619; c=relaxed/simple;
	bh=WfZZkVUD2KIfkMnmL+8RiPfvk8m+CchCTc2u15cbG9Y=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U4kek9eSj+kDuVKMlc5PjAZBxl4EPXuQXBlND4uUj5NcVlUW9jhylpZs+NRAAS3U68ZzBo6kTwKEPLgToUHEgypBdRqaDAagoN4C+CgtlZo7f4vSreR0LjV/omBMKa3F7V7MS0iUdzxd9jQkV6/Ep8a33+uO1dShPlJRM8VIk0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k58/Q0JB; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-786a822e73aso8674087b3.3
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764851611; x=1765456411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=k58/Q0JBEYWe+KJhx8snKI6/qcTbvf4HvI43lpn5+5z7rPY2sSgNWBTTxvhoW3uOFc
         goN9S1ef1YmXTOI4SLoXzIl+BcLzIJf8n9+/5ciIHUMtxEV/jWJAqgW9lB7G2u8BCbtp
         KMu+WUoL/5Zu3GNg0zklmqXCmKOsYxIzgaO8brrJO1ZX2eUTkFUp/pW0bUbEy5lcE9X8
         UcjDkgsbBUH7K9qnSANT5UWHDdYeUojS4SNmoNv2hb7Oyhg9n+j9qzOtvQjRTuNCrsUK
         fwmtu+D1kRj8ZTdy4XSRDi+teDA3e42c6+Cwjiakqb0ns9dF/D2bFrB7yHL6hPwEVcZ2
         inng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851611; x=1765456411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=Pnvr4Je59uIfpGDqqekAAZrpjXINFtZbkV1/3uOGQtd0Cs6PUYADFHIw+wgiYOJKxk
         /5aZUruJ2W7DDSQ7Ls7HqJVDwgYF3296Wejc0apIIKgpz1c+YCsMzw2lfxONUIUX6ADN
         nLUfJQPKtlVIeiCFZbIuNZ8+X/rKG2t08GXzxUPjS+rwnfWeIRps9EWVN/8WOewFMbFW
         MmEBtZls2e5imm2nIZf4voTQz9ymu8ZnO6CxAvK/8VJVmdVJQ575tI73zmdskSgQTeHd
         AJI3tjrpRF8ZDdPlQhxH9JYczDNxxuE3fnQJbB0+nj51wKcsMvlyv/sVIIRWfK5J6vPx
         kt3w==
X-Gm-Message-State: AOJu0YzWWbp3Alu3Wbhdm7+w3L5+g0Rqc8ua0j/+8wMAEq1J8m1Za2wQ
	/gr1uwLqk7UPVGyDAp12xlk8yCwz+7OCo+cQakgy3cBX2EoJDg4ddbXQ
X-Gm-Gg: ASbGncvLQXOybWtQYgztXTtgQDvsbTQLMnyJuZ5s10ADmRdmaumXG2mhGUSR8hx3in1
	4AasG4dnk/PKUt7/ruZ7ymMTlFugpnaq0hX027JXSvqOkSuBawznCYdAckr0lAJ5woFu8x8j4U7
	TUOfp4F0SZOUutlwFYUMxAnsWWJetnViW0yCLah9ycla6K7CvV23ucVfInLBVnZdSofaOPwsTUR
	epRe+qU9Nna7gav4d+2pJcqi/DFeG+dXfMx8dB4WvzgKs2I1RfXqSplYWmXx6uTJzrOZRB5bn69
	J3gk5V3XbX0AJ7VCyjF7SkjiEI8n0p8tofE/LB20zTR+FvquRSE2JwQIZ7lGSPPE1orCLSgHAmh
	CQ0+z6uGR4FBlWVqfMGH9rOkbgTouLRIBYhYpoKcNb2hK8Zf/pQhxB/ZmXPubI6PU1Vl1XEYQLa
	ffLJpixrdPOVfGNTDJclfqXck/KYdG3SsmM6EcvVFXyaegtwjl/Sc=
X-Google-Smtp-Source: AGHT+IHBUEbYkxJaVsA/zBTgJe8/H/sEcBnHGISwxVU3+cajLhUyQv9YXSpqaHkdOjyO4eiZ0/Xsyg==
X-Received: by 2002:a05:690c:6c0c:b0:78a:6dc9:8801 with SMTP id 00721157ae682-78c0c285f98mr45923627b3.51.1764851611217;
        Thu, 04 Dec 2025 04:33:31 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4d22bbsm4914897b3.21.2025.12.04.04.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:33:30 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
Date: Thu, 4 Dec 2025 20:33:22 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/25 5:06 PM, Vivian Wang wrote:

>> +
>> +# $(bindgen-backend-option,<flag>)
>> +# Return y if bindgen backend supports <flag>, n otherwise
>> +# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
>> +bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))
>>
> Can probably be simplified down to:
> 
> $(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1)
> 

bindgen is sensitive to file extensions. If the file is not .h or .hpp, 
it complains:

panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch

