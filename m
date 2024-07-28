Return-Path: <linux-kbuild+bounces-2689-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABA793E36D
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 04:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA2C1F21A72
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 02:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DCE20ED;
	Sun, 28 Jul 2024 02:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPZr6xhH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970261FB5;
	Sun, 28 Jul 2024 02:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722134209; cv=none; b=ZG1HXzHQAqhUjJIHsYkOvrUhwV9pmXYQgIpjPfIJMuptY5+rc8OhLYDHCZ/t5eJTKvYx7tWP3YRMQ1gs1t6/ViDPC/8EbJTJ9tL/K/NNVnyAk4B6HlGkL6CjOpnsxNPay8+NudVC6fspsv6QCD4hd7DMKG+TqP58zWdFt2AlCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722134209; c=relaxed/simple;
	bh=lPxkY3qVwLK0kKFabLVukw2200akrFu9qfA81IjjY8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlN/aU794zcMnVWS+l2VGQscP/eDUai+hecgk2QjPTtJrMHrvW/O4n7YZSijUbPQ58jqfvFUvVz6Uix4k6aIKf0fGg4ltUD3epxB1g/U/eaWwHKKmftM025vVCBvYi6tLq5HHQSonFeR9qKoI+ujQn0BbrNxwQjn0+/l9ruOy9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPZr6xhH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205A3C4AF07;
	Sun, 28 Jul 2024 02:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722134209;
	bh=lPxkY3qVwLK0kKFabLVukw2200akrFu9qfA81IjjY8k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IPZr6xhHr/GKUNIVoBFnpYMsBgQNoobERiqAoXfTntloOlomwCmvYj/pJRBZyD9pv
	 PHe+p2Yq2bref6txZml5oB7pyQQwHpB9I99Ls9ZCnZVlnIQ3rwmhnM07GNapHkJjX9
	 HbiWqyV6Yq943l8WcM2gRlGQHhpUNGxVAcQudguYK61kIL4JMDrli1K3vbMwspWJrA
	 KlYvHxChjVQnZezlmPctNiBDgnISuMmMil9A8NK1zSJ43a/wqbCFtd2Xn/4nfA4VtI
	 MlAd6cdCu37Ty/KA+DfcueoLwFkbSsXCtfciys+zCQtcGvPmx6XLiuFUL6q4ZY3fQn
	 jJAwRNhh9dVVw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f01613acbso2707709e87.1;
        Sat, 27 Jul 2024 19:36:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPlFJhu1NSjUzArzWEn7Kl3f/W9fLoF6FcbWYK6C3UMDw/gDGO1jMztYNDg9JbafZ++lnGBG2PDfBiwGrS0PQdfJ4nS9STBMiZglPQa/CO2DC0JyAh5vcIXSVhDWHLOeF1L43vv3XgLN09twnlu3wZO6JEUi6gS8awfReC6RM2WG7J
X-Gm-Message-State: AOJu0YyRlRIfNP+eVD0moNhrSzj8ve0OvArZybVsZ8eo39K1yfHCR3rC
	9vM25AqFz32KU0870kCBiIcQYPYmzlbLfG7jb43ZW00yS8Nmp8tBj0OI7avcH/nSk0XXHGXXgAX
	veXZ3PWDNqXXu6WzlNsKH5TYToPE=
X-Google-Smtp-Source: AGHT+IH6QR8QP4Cqf+3Z57lIasrdOFIDGKLv/oIB3dzla38N6NrqbGo4mkccqPYAeKY+bL+H51vQbKVcLOqm7zjmvMg=
X-Received: by 2002:ac2:4c54:0:b0:52f:336:e846 with SMTP id
 2adb3069b0e04-5309b6edc1emr1064289e87.14.1722134207835; Sat, 27 Jul 2024
 19:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
 <CAMzpN2hRVzWOF5YDvE8pPKfogdcuou8REsY+uXzkdORnFn=buQ@mail.gmail.com>
In-Reply-To: <CAMzpN2hRVzWOF5YDvE8pPKfogdcuou8REsY+uXzkdORnFn=buQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jul 2024 11:36:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjggcomzGMgHxuYE=Lm0_zsZS5dvjo3g4tjKJaM2oydg@mail.gmail.com>
Message-ID: <CAK7LNARjggcomzGMgHxuYE=Lm0_zsZS5dvjo3g4tjKJaM2oydg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix '-S -c' in x86 stack protector scripts
To: Brian Gerst <brgerst@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, nicolas@fjasle.eu, 
	maskray@google.com, morbo@google.com, justinstitt@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 5:43=E2=80=AFAM Brian Gerst <brgerst@gmail.com> wro=
te:
>
> On Fri, Jul 26, 2024 at 2:05=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > After a recent change in clang to stop consuming all instances of '-S'
> > and '-c' [1], the stack protector scripts break due to the kernel's use
> > of -Werror=3Dunused-command-line-argument to catch cases where flags ar=
e
> > not being properly consumed by the compiler driver:
> >
> >   $ echo | clang -o - -x c - -S -c -Werror=3Dunused-command-line-argume=
nt
> >   clang: error: argument unused during compilation: '-c' [-Werror,-Wunu=
sed-command-line-argument]
> >
> > This results in CONFIG_STACKPROTECTOR getting disabled because
> > CONFIG_CC_HAS_SANE_STACKPROTECTOR is no longer set.
> >
> > '-c' and '-S' both instruct the compiler to stop at different stages of
> > the pipeline ('-S' after compiling, '-c' after assembling), so having
> > them present together in the same command makes little sense. In this
> > case, the test wants to stop before assembling because it is looking at
> > the textual assembly output of the compiler for either '%fs' or '%gs',
> > so remove '-c' from the list of arguments to resolve the error.
> >
> > All versions of GCC continue to work after this change, along with
> > versions of clang that do or do not contain the change mentioned above.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 4f7fd4d7a791 ("[PATCH] Add the -fstack-protector option to the C=
FLAGS")
> > Fixes: 60a5317ff0f4 ("x86: implement x86_32 stack protector")
> > Link: https://github.com/llvm/llvm-project/commit/6461e537815f7fa68cef0=
6842505353cf5600e9c [1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > I think this could go via either -tip or Kbuild?
> >
> > Perhaps this is an issue in the clang commit mentioned in the message
> > above since it deviates from GCC (Fangrui is on CC here) but I think th=
e
> > combination of these options is a little dubious to begin with, hence
> > this change.
>
> As part of my stack protector cleanup series, I found that these
> scripts can simply be removed.  I can repost those patches as a
> standalone cleanup.
>
> https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com/
>
> Brian Gerst

Judging from the Fixes tags, Nathan meant this patch is
a back-port candidate so that the latest LLVM can be used for stable kernel=
s.

You are making big changes, and do you mean they can be back-ported?



--=20
Best Regards
Masahiro Yamada

