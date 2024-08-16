Return-Path: <linux-kbuild+bounces-3039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84B95449A
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 10:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5DFF1C211F9
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4F713A258;
	Fri, 16 Aug 2024 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jp7sFJaa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB02112C53B
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Aug 2024 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797633; cv=none; b=ssE9cjRE79Hsovdx6EFb8H55sbMTZVSD1K+lLLEf9pZHNnesV2SPZPS45FCX2QKZ2SLdAuzsc/fzSmz8LLQn340I16AaoYDNBnfq9LepdTz9d+zNi2MtAWRqOqiLi2Yj7xEWFHRY44uOBo/xJjTGLV8HH1lud+sB7moVJgP6XlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797633; c=relaxed/simple;
	bh=iW79sM3hHo+mFnCCGnCj7nr83XhiO9hlT6whJOECIRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbNC53r3glKv8FzOAVBdC0WfmIIvSsvVqtb2ekqr5a1yP5Uv45K4fLnRO0sHHFez6+YGLORcM8H2OadX9pX3GV71JhSlhcM4L74VHQdlEvF5fW1g2uY3oZILRhVp7NkUlM72iNc7Z9YwCC819p16QNVByavtl6rezaRpjSWohPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jp7sFJaa; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so2433147e87.2
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Aug 2024 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723797629; x=1724402429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW79sM3hHo+mFnCCGnCj7nr83XhiO9hlT6whJOECIRc=;
        b=jp7sFJaa26Ez35yu9bTICY46dr5Gm5oJQ1lw5DSF6SnfhEcBYOMkGahNPbnR0rg//e
         FtJwiZ/aw/XnBjW8QaIjt54jnfLMttfIzXNcB7152mRTzHDiPWArjXzQ2Iv+fCr7O1dc
         8pU7UY5N9SNgxkYfr9nuZhVSYIO7gvoBCpvp9K/hF3kXiG7YGBklib6oxfX3vBVpLoTt
         3MrQ4cNMj9mz0SG7YyszmJP+7h8mgOwOyK1giiwwSq3lkVMwwTGpUHZCSM+DIGkZlree
         4FHXn9z3839/h/8aU5XoQhWfDCe73MUTEf7izRdGOlYv0tx/CWkBUT2If2EBMnPV83H8
         Jg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723797629; x=1724402429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iW79sM3hHo+mFnCCGnCj7nr83XhiO9hlT6whJOECIRc=;
        b=kmx0QcFL8UTkePTWnH6vi8knnCdDML7B+raxtkm2a2cW9X/m0euN1AU837wBYx6MYw
         Hg58QvO2hEgnhbhx+BOya9zw7ZE82LbXO0NPTJyL6MbWT77XlsUK743E8SYQb9n5Hp2W
         BwLgpxRtsp8zJWEsOORmTnF5MPrMksxroJF/jl4QjJ1rZaDVzIdWwSmoYcNbxuupa6MF
         KRpw8jALttBI5w9TWxrUBVvUGvc2jrxWTQz7N2xQEUCC6hKDviT4srwajn661mUVMCGi
         NF229U0tTcP4YvuL2qOgInGsQ8u9OpLH0JY3Ci2a6oaCpQmU6iJipe7UhpwwcwUZPZho
         DstA==
X-Forwarded-Encrypted: i=1; AJvYcCUEZOFjMosLc3FdSLqY0A+E0cowbqlYFGb7b/pNF+mQfl/ZQxeAqw5322/Wwg78j3s8X6+mm2KzYt3oFdiKm8SFORxh/H2IElCHu9NL
X-Gm-Message-State: AOJu0YyakTBx5GfFve9xHtOBVBP0jmhmlc73EGgC2w1kJHfPQQXvt9jW
	w1fFyNzouF7yiyMA4m5fmJ3z7bLMmAR3b+b+A3rMLwTU5fhdvljqRxB2SxwtsJlJqyihCCZqrtv
	9XccQ11TY3TCQ4a9RIrkE5ZS/jhRrUeI18RH2
X-Google-Smtp-Source: AGHT+IEK8j4hjMmZi4qGx/qKmnXlqNbCTjDDytBa54fmrI2TvjtsIb0RoEBYPjaEmcSo3NgCpHBPsW90ABxFXliAnbk=
X-Received: by 2002:a05:6512:6c6:b0:52f:228:cf80 with SMTP id
 2adb3069b0e04-5331c6dc7b4mr1255122e87.40.1723797628284; Fri, 16 Aug 2024
 01:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815103016.2771842-1-nmi@metaspace.dk>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Aug 2024 10:40:16 +0200
Message-ID: <CAH5fLghAMrKjCuJPEv6P8gTd7x0q=F2L+avfJC=XFA2QgGQBCw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: split up helpers.c
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 12:30=E2=80=AFPM Andreas Hindborg <nmi@metaspace.dk=
> wrote:
>
> From: Andreas Hindborg <a.hindborg@samsung.com>
>
> This patch splits up the rust helpers C file. When rebasing patch sets on
> upstream linux, merge conflicts in helpers.c is common and time consuming
> [1]. Thus, split the file so that each kernel component can live in a
> separate file.
>
> This patch lists helper files explicitly and thus conflicts in the file
> list is still likely. However, they should be more simple to resolve than
> the conflicts usually seen in helpers.c.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/=
topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

Looks good to me. Obviously this will cause some conflicts with other
stuff, but that's okay. Better to get it over with.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

