Return-Path: <linux-kbuild+bounces-2700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D2593E8FC
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 21:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE00A1C20E7E
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 19:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF464CEC;
	Sun, 28 Jul 2024 19:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+rOGDyC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D002AD29;
	Sun, 28 Jul 2024 19:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722194044; cv=none; b=I4oYpXkSYHbc4s9DtCBinXYLgpr1IMKdoNO39qrJa8pa09LhDBwQZcS+A6oTqhww0REsrJ7pjRMKpenBOsHI3TVUYnOo+44+Kxi7XbmAJPGrI1x/POrNi+YgmFDiVCLqJNMwndKECqA2/BX4pcTlOlnJaONIOCfGvks+nh9mgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722194044; c=relaxed/simple;
	bh=sMmbh7cUTqqovrR2AT6BBqOajFBHUkdjDZtKSwNRZH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVNL/4RUqJmXzfqLCGUxgyh6gO3A/MqoGsTbXWYxoJoZNpDFoRmpeVWukwIUte2aJ658TQSWR3TarXcXUqIz4CszGpEpfkO9/eN3FwLyejrjbydw3NqlA/z+5jaDEsEFF7Z8p82b/c98u94ZOs45LtajYNsbY/VLUDBQi3zmwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+rOGDyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA4DC4AF0C;
	Sun, 28 Jul 2024 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722194043;
	bh=sMmbh7cUTqqovrR2AT6BBqOajFBHUkdjDZtKSwNRZH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R+rOGDyCe/5nYkHqIkfoDxNCUuoXBD0w/ddqWWoF1jhS+B0Kyyuk2m3W5Q7WwKFWV
	 HbXJ3Kegb1sa2iHUflKafhsKDBBrSjNfcZOxQmrCmqsRXuDtLezhnPmzBaeYri/RA3
	 avGCIFWWgJX9vQri9/mHE74oVZ+ao9vDhuVVZsrPQeKzmHZ/pAd180RTlLCb2MYBXz
	 v1JbHi8QMBQ4b5WT/KcNvvgrF8gwEhmrr3sjnfEemv8lOFspEzRQNO5IldgpTGfQX7
	 k8aJDu0T5XZr7GDlnvV75DaOGAl+fpgBrzWXxtAqxH82LAVa4mWcwlgtcukGhKwyto
	 u0y1ulq4tUitg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efd530a4eso4371354e87.0;
        Sun, 28 Jul 2024 12:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhcvvic3fv9PtKB834sFxKQFCsobiDz1uO691QIlWev1vJjB7v9p9F56KYMMPTZ97pP8D+a5P1BLXWj49OQLLybzKH7/yHCyqhLTrh1r6RVYlbpQr/3WcXECdXEt9pBtyq/Cio4QdA28H8ho3aGA1VPnpiaPvC9iiwbRNQZQvxT4Dh
X-Gm-Message-State: AOJu0YyYRudiaVrWC1CQWfbS0XFKAzBP0UfiStytc2RZq/N+xxeReu5O
	liRPeOLiAoIHPe4XNzh5qBPApHn6pMYiOlA7dStglQnPmK57EoV5en8cbGDqaIkgkGou4fskcsN
	BPhLzixzgxBeLvJ2bpeJucCurEEA=
X-Google-Smtp-Source: AGHT+IEkz1TnHDlE9ler9A80e9defPOv4OL1EPJyuZN5JVOtMoef4fgodh9s71/x3g0iffQ+5rn3J1ZmWw+wvfxkaGI=
X-Received: by 2002:a05:6512:1289:b0:52e:f95c:8b with SMTP id
 2adb3069b0e04-5309b279f98mr4853691e87.16.1722194042594; Sun, 28 Jul 2024
 12:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
In-Reply-To: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 Jul 2024 04:13:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWv-OJM0oW8qbMk-HL0GgRkYKcRt+yZadhHB3NGR22uQ@mail.gmail.com>
Message-ID: <CAK7LNATWv-OJM0oW8qbMk-HL0GgRkYKcRt+yZadhHB3NGR22uQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix '-S -c' in x86 stack protector scripts
To: Nathan Chancellor <nathan@kernel.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, nicolas@fjasle.eu, 
	maskray@google.com, morbo@google.com, justinstitt@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 3:05=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After a recent change in clang to stop consuming all instances of '-S'
> and '-c' [1], the stack protector scripts break due to the kernel's use
> of -Werror=3Dunused-command-line-argument to catch cases where flags are
> not being properly consumed by the compiler driver:
>
>   $ echo | clang -o - -x c - -S -c -Werror=3Dunused-command-line-argument
>   clang: error: argument unused during compilation: '-c' [-Werror,-Wunuse=
d-command-line-argument]
>
> This results in CONFIG_STACKPROTECTOR getting disabled because
> CONFIG_CC_HAS_SANE_STACKPROTECTOR is no longer set.
>
> '-c' and '-S' both instruct the compiler to stop at different stages of
> the pipeline ('-S' after compiling, '-c' after assembling), so having
> them present together in the same command makes little sense. In this
> case, the test wants to stop before assembling because it is looking at
> the textual assembly output of the compiler for either '%fs' or '%gs',
> so remove '-c' from the list of arguments to resolve the error.
>
> All versions of GCC continue to work after this change, along with
> versions of clang that do or do not contain the change mentioned above.
>
> Cc: stable@vger.kernel.org
> Fixes: 4f7fd4d7a791 ("[PATCH] Add the -fstack-protector option to the CFL=
AGS")
> Fixes: 60a5317ff0f4 ("x86: implement x86_32 stack protector")
> Link: https://github.com/llvm/llvm-project/commit/6461e537815f7fa68cef068=
42505353cf5600e9c [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I think this could go via either -tip or Kbuild?


Applied to linux-kbuild/fixes, and included in the pull request.
Thanks!



--=20
Best Regards
Masahiro Yamada

