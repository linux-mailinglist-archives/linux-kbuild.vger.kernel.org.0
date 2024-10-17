Return-Path: <linux-kbuild+bounces-4173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7B9A2ED6
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 22:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82EA2284B92
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 20:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33171229107;
	Thu, 17 Oct 2024 20:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TRcCd71r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA62281DC
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729197537; cv=none; b=ZglQliYmIjTKXKsoG8PMUU6YV+1+2vdydyskg5drVPovtT6VouTZCifw0nCFMkC7p4AZv4JlB/VoXHF0ovkbAsPpbRTn6wc4GfXKBJr+26DxhJvqaC08w9mxrNpANiDfhW5xothL4JG29Osd/a7MaeAKrvzvGz6hVMTbeQ8TitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729197537; c=relaxed/simple;
	bh=cnQlnqdueLjUFXPl+rjNUrcziR/Uu37bRyAKm+ZnoQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Adk20p2oSX4RVMM8c1Jt9+7tOGFpy7tK7cKyGjLnf6vMz9xCE+kPTRu33h9MzH7sMm6Cau5fVGnXPOaQuAw0CCMU2kvKnE6Krf0CmzPJUw9ONuIN3PhqDQNvlgAjG1DD7JhtNsb94w+FlKBOOWbnyFo8q4AOU4saXWkW3dFvzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TRcCd71r; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d447de11dso1006418f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729197531; x=1729802331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrcUDqdyzXImioFxfeLr6A00K3sNtV9qNS2Npm9oScs=;
        b=TRcCd71rwrA/I9JsY4MTxlkiu20pWrGzR0kfgJlfzNyOqJz3LDBkFZ4UvwhO6IyQSd
         vEJSWALfF1mkDuUqc413LamRc0uE76wLitrPNsW9jKZv5qHZOZz5rlpYj6O5/ZqNFZmF
         lKCLabNufsvada+lUUZLuo/1A3Q+dA+/Q5L9RdQjUWlVRrXDY/65705qAENlBZ6S1+7y
         g+qXLdKCcGex5meAtsycLbyzafMT7N0J6d9Ygxyap02oUvacwOy5Ktq/ZAFK43M+gD/t
         i9TFto5a3K7F4trV84vCLssEi9jMwTfEBoQ639qFgVffedVw+5xLAG6BcKPUG00XdhIQ
         tkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729197531; x=1729802331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrcUDqdyzXImioFxfeLr6A00K3sNtV9qNS2Npm9oScs=;
        b=m308/N0Z3CanLoV4u7tR68G29ykzXoltrTrz9w2SFqb7+mE90JFmONyuGZbIgeu6tl
         RKqlwM+RMfAXyTXzNVA0Z2dQ7KgAt1qNYOa7h4uQmvL8jCfIYaWfR7sT7lmMvdGG9HaX
         IMmn5QkjrswqpRHtokHtYvE8XHPIm5yy48de361+GiqFd+E6fuopVT0ciqa72t1e3b/7
         Z29YGnGvh7RALRxL8PReJU4gZvFbQia8gFccvPFfyvGMNQlkG0AsDy8psMz/c1+7usuA
         D10asH89VDFufMNZ0Dh6tezfefLPcKgX0hLBg0GCltwklk7IzUHoFrprUYcVNrotkn9V
         O97A==
X-Forwarded-Encrypted: i=1; AJvYcCWwk3R0AKrSW3ftYkVDzKJUjr2o5LyAFzEZr6+KGlMfqkDrXEZhPvN/9I3F1fvfmbc3Y0WZgj3zV342tyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrHcfk/16JLDvxk5gMdQOcqsCozPbKUV7s65W/CmnlxDAQJpg
	O/4OClSBzvS0VNtecvkkek1c6n0g2BsXBRB9WiDE35tjfPWewHi7gK6DysKhSgnrKDFKbb+WrS+
	XWY1SYp3KGYL5JBDQQ1j8X+JNMd2U2bf7rhtk
X-Google-Smtp-Source: AGHT+IHcG3qFIxzTBgPLhK0vUVNvs8oMv5K7oaKrCVIEfYnMO/l//my7v70uumTSJb7AZ47qEdjZy5rUy4JTUVaI2bI=
X-Received: by 2002:a05:6000:1807:b0:37d:5035:451 with SMTP id
 ffacd0b85a97d-37eab4edef1mr132912f8f.10.1729197530525; Thu, 17 Oct 2024
 13:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017200138.2390077-2-elsk@google.com>
In-Reply-To: <20241017200138.2390077-2-elsk@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Oct 2024 22:38:36 +0200
Message-ID: <CAH5fLgh3JyY9L6Fg+LXVguyx8iPRbHVHqTyXSfM9gq6jdWRdtw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: add PROCMACROLDFLAGS
To: HONG Yifan <elsk@google.com>
Cc: mmaurer@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, kernel-team@android.com, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 10:01=E2=80=AFPM HONG Yifan <elsk@google.com> wrote=
:
>
> These are additional flags to be passed when linking proc macros for the
> Rust toolchain. If unset, it defaults to $(HOSTLDFLAGS).
>
> This is needed because the list of flags to link hostprogs is not
> necessarily the same as the list of flags used to link libmacros.so.
> When we build proc macros, we need the latter, not the
> former. To distinguish between the two, introduce this new variable
> to stand out from HOSTLDFLAGS used to link other host progs.
>
> Signed-off-by: HONG Yifan <elsk@google.com>
> ---
>  Documentation/kbuild/kbuild.rst | 5 +++++
>  Makefile                        | 1 +
>  rust/Makefile                   | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuil=
d.rst
> index 1796b3eba37b..d9866394bd98 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -91,6 +91,11 @@ HOSTRUSTFLAGS
>  -------------
>  Additional flags to be passed to $(HOSTRUSTC) when building host program=
s.
>
> +PROCMACROLDFLAGS
> +-------------
> +Additional flags to be passed when linking proc macros for the Rust tool=
chain.
> +If unset, it defaults to $(HOSTLDFLAGS).

It may be less confusing to say "when linking Rust proc macros" here.
Saying "for the Rust toolchain" could be confusing, as the proc macros
are "for" use with the various pieces of kernel source code. Most
people would not think of them as being "for the toolchain".

If you want to mention the toolchain, you could add a sentence: "Since
proc macros are loaded by rustc at build time, they must be linked in
a way that is compatible with the rustc toolchain being used."

Alice

