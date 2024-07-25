Return-Path: <linux-kbuild+bounces-2652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D341693BF3D
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 11:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54D94B217FD
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 09:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D1C19882B;
	Thu, 25 Jul 2024 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iYp9Z+9l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC7D19753B
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721900624; cv=none; b=jlCXXO78bFArO6edh0kRhyb14NUEv99asYgDML0RXLpEh49zOjkND/m5uCFuywJJjpJLLLzb7aSKfNNBgp5I5e3M0ascwQdWwhkBOPolcyeBH+TXYvuXPxgXg9+72kbWM6nWPDxzu90t0R6LMH4rxWV2QLQa7rbtC1Qb5QLd69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721900624; c=relaxed/simple;
	bh=OfRkrMGGgNibJB9z9Co5Oyh5Kyaj4J7TqHXMn4wIC+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEAauWSCYnfX17fnF7oNvKB01MyIaYsGwI456Yz7ikp/3IZ+DSAySVO7tsiSiWpVAXLmMAEmY/UwaX3QVk5c4dIxeMghHZynrIM88remZFEi2NnIOda7aUruft5RFaNW9tlXr9dfuXEBvRDgUY3qqg4g0FJm854GbYZeNLKlmSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iYp9Z+9l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428035c0bb2so4170825e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721900620; x=1722505420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=084GPfdeuP46Jz6Dyrdsi8DzZT3jnbvpNucHJZ1TuaA=;
        b=iYp9Z+9lo2Uo2yb2ZX65AhT1LXOZ7NhKsLiJmlLfttNBUDKPOsLqrm//gEpQfDu5GJ
         ebCGmyojB9bR92eXCaLLdZVgTb03fibtsPRPrIjJ2+pGXCgsZKbZ/mi0989O47IloXmR
         nqaDZpyUbmjA6aLjwdX+dGURagKwF/84nl5cmDcMNc4UrdKlIxNx5YnkaRq5JcrTap+s
         mzvybc5TP8uXA1O0ERowcthPUU0rD4npO8AbxshEMxwW+nz9vFHz6ec4Iz7a9aPAlh0a
         C1sON7N1Ae6iwlOWBNFya2YvNOJjfX5mCkmHHxo/AJUSTWBvzr3Gb0my7WcsByr22reJ
         PERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721900620; x=1722505420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=084GPfdeuP46Jz6Dyrdsi8DzZT3jnbvpNucHJZ1TuaA=;
        b=ZywjnLYHC7N2Az2PxIrS+bdvW3oWf4z2bH1tCwaeOln8gKUh4DN749L9Kwo9Tbz8fR
         D5OohaPWEl+Mjt1DIUAJ5JaDTUT6HYY2JkcAT2xgSa+/lQfz1DKXPVOtpzTpXuMLNIpQ
         CDKV+rqDqrOkjLy5CkLDxVSxfC6CiZri4S/mWiXSlTY5/nQ+zLgyV89+MlSDoxFYoGKp
         xlostNpxVWHdFCy1eknKMzuGeUCswOUYakfoImMPrCx2XD7/64IZukEWYdkd0YYijZBD
         oo8pPDIMxZO1D9B7Ib80CW0E8I/CMLbotZPBkQybj40Z3VXpuDsQ6w/pnelI/7YMGyMh
         aA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWb1GnERbCwZmvFiaAdFWBsCQ4Ry1wIZaBG75C+BzMxryDOZ6m9sQs1SGpaGbpZLk9fJx7R1u057381KzNBJwYO9ccXC7m2qzWo2gGr
X-Gm-Message-State: AOJu0YyFMgwQy9skfmZ7noPp4vg6k3F6GvSpC9saySba9WpopeMJ6SiT
	Kn6C6xbte4nTBsG7HcfCdvd9h1wg+/eNmNTN7SVRo5XWJ1fw1Eas5t8JgbZMMR2yw7w3Gm0FW3F
	jsm9eMhV7lwWy43Wv4mosbLV9yNvJkZl/fwN8
X-Google-Smtp-Source: AGHT+IE6X14IZDQ5Pvi0EHuAL+bLPA+DtdyDVXsBLCAhdXaKVx0/zepn3uPZTG5qlk+pSFE1iO35aByaX/zvkbfjpw4=
X-Received: by 2002:a05:6000:b81:b0:360:8c88:ab82 with SMTP id
 ffacd0b85a97d-36b31baa2d5mr1493373f8f.30.1721900619824; Thu, 25 Jul 2024
 02:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724161501.1319115-1-ojeda@kernel.org>
In-Reply-To: <20240724161501.1319115-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Jul 2024 11:43:28 +0200
Message-ID: <CAH5fLgiCLxe3bjHtf3frY3vOsYucu4cFDtDR1UUZYXCGwxLv8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 6:15=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Hi,
>
> This is an updated series to the CPU mitigations support for Rust. It
> also has the patch to enable `objtool`, so that we can start running it
> for Rust.
>
> It would be nice to get this applied soon, so that we start being
> warning-free (since we already get warnings under IBT builds via
> `vmlinux.o`). I am happy to take it through the Rust tree if the x86 and
> objtool maintainers give an Acked-by, or through any of the other trees,
> as you prefer. Otherwise, I think at this point we would need to make
> Rust exclusive to the mitigations, which isn't great.
>
> With this series, again, x86_64 is warning-free with `objtool` enabled. I
> tested `-O2`/`-Os` and the Rust versions we support under `-O2` (mainly
> for the `noreturn` patch, which uses heuristics), as well as IBT vs. no
> IBT (i.e.  running on individual object files vs. in `vmlinux`). I also
> did an arm64 build.
>
> Testing is very welcome for this one!

Verified that this eliminates the relevant warnings in an x86 build of
the android-mainline kernel.

Tested-by: Alice Ryhl <aliceryhl@google.com>

