Return-Path: <linux-kbuild+bounces-3414-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B996E696
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 01:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40AA1F212F4
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 23:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043201B86E6;
	Thu,  5 Sep 2024 23:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3xM7nu4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60218EFF8;
	Thu,  5 Sep 2024 23:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725580785; cv=none; b=c+Ck3j1eeDcLF6Won2DpYhT+u35muqMMKsEHUvSCKtfzJ9mGjwx2UyV5A8PaO0ncO51vpGbOaQBD7giUpWNfrplo102QHIb1oyF+AB0veQ3+tmWBNMFU5nNfGt3BsFWbHaBI0yF98fwcMzNWzSFe4KbXz8qWHDNjMVZ+oyJtTXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725580785; c=relaxed/simple;
	bh=JYI3PA3KgTPpVbsypC8aLWWteQaLMLXfffjyWBRuqS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k74sMwgdjONcSygIa0lUMcSuT+KmC4/GdOv/cafiOijiXwMxyPdRPPHAO8G1zJPjSvSmsJHz7qEEfr9zoc3J208NNU38GVypCgNVuy7P4kD4K7G9/Pz6rARJPTnF/B21F+bWeGj3h8f3Oq6z8fLa94dsO97h4I74+EYHMlm0HlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3xM7nu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B135C4AF0E;
	Thu,  5 Sep 2024 23:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725580785;
	bh=JYI3PA3KgTPpVbsypC8aLWWteQaLMLXfffjyWBRuqS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O3xM7nu4IFH02RfX1ORJK79OOJl/TOM/ptr3rsOmFhoMyHwKW68AMEXGeSRU9HXer
	 jc1ORwm0OyttgqBVliQx09jkS9nKjmsp1vfySnAF8ZOxEN5iCZAf/tPXIfgeprrDVW
	 Ec9tlCWCMltZVByRL2khg2ufNSCs8K6ytYqwBPOZwr/io8TKcpkrnAL0fcXgMun+k0
	 Vr+ZkrRJksaQ1/lS3BBkNLJBNIjs4gl0f72ZPWOdKo11EYsaF23EnaVNEgGxLGqLkX
	 HeLxh6HkY5hSYRmlt8k8YoMKQtkOUMWEm1GtlCdki2bfuq4JKkN9QOJkXbkgulT7R5
	 i+R2GYy962TCQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334879ba28so1638905e87.3;
        Thu, 05 Sep 2024 16:59:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpjiC52x5Cqs/W8QEj/Ztk2Ezf6SJU9LUEv6GHySuBA3ZJUg5jkbuK4TttANrkQsVQIM4kVQMBFKNQ5AA=@vger.kernel.org, AJvYcCXB5FNUsNZvrHu49GBzvIZzE6ccWCFdgPPoyiBFI6WsyAXvnzXHR6QtxlWBsrBzi6Ck5IO9QzEtru41XgaBxZc=@vger.kernel.org, AJvYcCXqh8mt8VRE1BfMulQnZTC3yiyse//k/z0/OrvlgkjorCxr8zoBDJlOkuhnzWYEJYDYKvEQ1jy+CDd3RR+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nyl6efm3f/Z7LSQRXB1ZaOojTHCNX1ErxIHgRj6RjJeXaWYZ
	wLMeOMlPe7cIYtSr29ffPkBvebxQIOUPoZTOSBsBno5gL0/LU7gF6DjHMYIwhDceuYa980nkEYi
	O4Ch5qwdRMANuyFXNVMXeV3R9Peg=
X-Google-Smtp-Source: AGHT+IFR8+IjtzXyDib8ZC6nUZHJtS5vrZ7G8gpcaYWONjJmQhbrk3/4JYCN102Pa4oHRqA2GKKSGJ1QjnvP2cUV3b0=
X-Received: by 2002:a05:6512:124e:b0:533:3268:b959 with SMTP id
 2adb3069b0e04-53658805f76mr262083e87.53.1725580784084; Thu, 05 Sep 2024
 16:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <CAH5fLgh9Moq_9M+zMu300ohK=mPqkLyS6cpQ6An2Q3THCPFjaA@mail.gmail.com>
 <CANiq72kUBPnua1Pob++-6SJ8MeGxQMfrePY9SQVd0DZp5VU-2A@mail.gmail.com>
 <CAK7LNASHdd8Gv6OpXnP3tywrTA6iEZVqZGLb0V-vV_VUR-ksWQ@mail.gmail.com> <CANiq72mtaSGtDx5fn2VPYfyBNGVDm7adQAYxJh3tvd6esLiaRA@mail.gmail.com>
In-Reply-To: <CANiq72mtaSGtDx5fn2VPYfyBNGVDm7adQAYxJh3tvd6esLiaRA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Sep 2024 08:59:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgbZB7e+3D+Mj2fAA-HXTOdsnf-AKcCzxL7DoE2cWdXg@mail.gmail.com>
Message-ID: <CAK7LNATgbZB7e+3D+Mj2fAA-HXTOdsnf-AKcCzxL7DoE2cWdXg@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: rust: add `RUSTC_VERSION` and
 reconfig/rebuild support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 5:47=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 5, 2024 at 3:19=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > With the nit in 1/6 fixed (No need to resend if you fix it locally)
> >
> > Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks a lot Masahiro (nit fixed and tag applied). I guess you meant
> to reply to v2?


Yes, I meant Ack to v2.

Sorry for confusion.





--=20
Best Regards
Masahiro Yamada

