Return-Path: <linux-kbuild+bounces-87-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AF7F1D85
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 20:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD5028260D
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 19:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE70358A4;
	Mon, 20 Nov 2023 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TytuiUM9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7B9A0
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2023 11:47:04 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c87acba73bso23277161fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2023 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700509623; x=1701114423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k63y0ImIMzxwhoXgElC40ZBYzHWgYpN897FOa0LAhXo=;
        b=TytuiUM9xjgmSrq8PTCyhB8GE4jNsAj4tXQqLg69j0RL9bfmFxBU5CJsbCO0PY5Wwc
         4l7JejFJMW5ooDzTjZllyKxd2RZPrt5YYDr78DAGE+bbsiXce+uPKuL3p270nVgqb+sp
         3oKtsat1WxlPSQHkTihWb63BYlwmwtTfsd2ypmN4TzF2AIZEdy59AZaBq7tETUtnSIAW
         CvrU716KpBfL7JabFqlanu37nhj739r7IeynpzZ0SJo/DzJyRJAoOrgrHgtxMq5i+yLF
         BAGdTZByHbBu9OT5idjwmQ5eHFOc0+IhrLNcRmRc14Md+K8p9imCrojKEKoJPj+iIU5m
         uXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700509623; x=1701114423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k63y0ImIMzxwhoXgElC40ZBYzHWgYpN897FOa0LAhXo=;
        b=m9viW1DOKTOgjBuVc4zWbn+6q0xF+9ynVpm3i0rV0E6xXCXaFvbE6EBWSLuMGlZKex
         ax5qFxsKOEqrTlMII3NCs12YYKupbgIDugKy+LLNLH0UVW4AmG6zLtPdiVCOjZ2ztrJR
         /XSFv92blRbyy0CXF7zxi8MXF85+BFnaeZtayfFhi7ZwKXyrpNp58w28+wnisyrU46on
         AdjHdFIfPv+hMWIYIevn9LuWQJgPmhrCxCrJB+K888Dy1wvWlsEGG07Bb9VsYFy98MMW
         V+3EK22eMbKCgLVNDVT9o8IosB+1Ciy0jJRtddR6wbx0cOGdyv2IOtyKttKHXd+0toxH
         cPeA==
X-Gm-Message-State: AOJu0YwxIV5gRLvYnUlmN/+/znjjII67hI0hIZyF46Y0BaVLAiLrzrZ6
	HS558YEvyN/p7jTjn6qEr80N2RlCkhZJEBZeywWofA==
X-Google-Smtp-Source: AGHT+IFcP9Bi77QpumgXWYcYlyZBFp9cVOTTuzfplw5aXvIURHzOjITODIQ80+1AZypInFxLgyl/s1nd/Te+pEN9yGs=
X-Received: by 2002:a2e:9912:0:b0:2c5:3a9:7467 with SMTP id
 v18-20020a2e9912000000b002c503a97467mr5808973lji.8.1700509622610; Mon, 20 Nov
 2023 11:47:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 20 Nov 2023 11:46:49 -0800
Message-ID: <CAFhGd8qLEoJGuur8KVO8=ijUF_O_XgcaABwTp+aZ2W6bxmfy5Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 11:24=E2=80=AFAM <ndesaulniers@google.com> wrote:
>
> As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux Plu=
mbers
> Conf '23), I'll be taking a step back from kernel work to focus on my gro=
wing
> family and helping Google figure out its libc story. So I think it's time=
 to
> formally hand over the reigns to my co-maintainer Nathan.
>
> As such, remove myself from reviewer for:
> - CLANG CONTROL FLOW INTEGRITY SUPPORT
> - COMPILER ATTRIBUTES
> - KERNEL BUILD
>
> For CLANG/LLVM BUILD SUPPORT I'm bumping myself down from maintainer to
> reviewer, adding Bill and Justin, and removing Tom (Tom and I confirmed t=
his
> via private email; thanks for the work done Tom, ++beers_owed).
>
> It has been my pleasure to work with everyone to improve the toolchain
> portability of the Linux kernel, and to help bring LLVM to the table as a
> competitor. The work here is not done.  I have a few last LLVM patches in=
 the
> works to improve stack usage of clang which has been our longest standing=
 open
> issue (getting "rm" inline asm constraints to DTRT is part of that). But
> looking back I'm incredibly proud of where we are to today relative to wh=
ere we
> were when we started the ClangBuiltLinux journey, and am confident that t=
he
> team and processes we have put in place will continue to be successful. I
> continue to believe that a rising tide will lift all boats.
>
> I identify first and foremost as a Linux kernel developer, and an LLVM de=
v
> second. May it be a cold day in hell when that changes.
>
> Wake me when you need me.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  MAINTAINERS | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 482d428472e7..1e6692697167 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5076,7 +5076,6 @@ CLANG CONTROL FLOW INTEGRITY SUPPORT
>  M:     Sami Tolvanen <samitolvanen@google.com>
>  M:     Kees Cook <keescook@chromium.org>
>  R:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <ndesaulniers@google.com>
>  L:     llvm@lists.linux.dev
>  S:     Supported
>  B:     https://github.com/ClangBuiltLinux/linux/issues
> @@ -5091,8 +5090,9 @@ F:        .clang-format
>
>  CLANG/LLVM BUILD SUPPORT
>  M:     Nathan Chancellor <nathan@kernel.org>
> -M:     Nick Desaulniers <ndesaulniers@google.com>
> -R:     Tom Rix <trix@redhat.com>
> +R:     Nick Desaulniers <ndesaulniers@google.com>
> +R:     Bill Wendling <morbo@google.com>
> +R:     Justin Stitt <justinstitt@google.com>
>  L:     llvm@lists.linux.dev
>  S:     Supported
>  W:     https://clangbuiltlinux.github.io/
> @@ -5242,7 +5242,6 @@ F:        drivers/platform/x86/compal-laptop.c
>
>  COMPILER ATTRIBUTES
>  M:     Miguel Ojeda <ojeda@kernel.org>
> -R:     Nick Desaulniers <ndesaulniers@google.com>
>  S:     Maintained
>  F:     include/linux/compiler_attributes.h
>
> @@ -11516,7 +11515,6 @@ F:      fs/autofs/
>  KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
>  M:     Masahiro Yamada <masahiroy@kernel.org>
>  R:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <ndesaulniers@google.com>
>  R:     Nicolas Schier <nicolas@fjasle.eu>
>  L:     linux-kbuild@vger.kernel.org
>  S:     Maintained
>
> ---
> base-commit: 6bc40e44f1ddef16a787f3501b97f1fff909177c
> change-id: 20231117-maintainers-88eac4c024a1
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>

Thanks for all the hard work Nick! The ClangBuiltLinux project wouldn't be
where it is today without your contributions and leadership.

Justin

