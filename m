Return-Path: <linux-kbuild+bounces-2686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD593E0F9
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 22:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B20E0281CD2
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 20:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D709C38396;
	Sat, 27 Jul 2024 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCO/TTwr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E92D05D;
	Sat, 27 Jul 2024 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722112995; cv=none; b=LP7Ukl/4Q9CuKNVCwmZLowd721sKNk+xnzD2UsDGYsIbrE6Bxb6/R68POl7B2SgvdmlteE3HiYJBcLcH9XwgI8T2tcnOLxBrevZvz8TskmK1H+slIz+dqVw/LQq+RcTDO/DKakfTjRk/z0Nr8V22Iwj/IcJxtxt6lxy06p9acV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722112995; c=relaxed/simple;
	bh=pCLrAC0c7kI1WPvw+F3AOPdqNfHw/TdcPzhDI1T0wGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abDA6NZgDlYS9MxRQsi+biQw/t9ygowrXGW0Nkm1RH674U7gxUjLN14OgbSk/aHCrv3nNj2eVRDIONqXSiTj+m7mFQGhuiBgNd+ENEyw5r/ayhebeMTcHEIMU9+PNac/L6klxIuY6n1lxjAphcZmhr4BwgRcMqg0tgfwSsrCxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCO/TTwr; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f042c15e3so2092489e87.0;
        Sat, 27 Jul 2024 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722112992; x=1722717792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bv4ok3GIewx2d9Yx1/BgjuhSzkHnMJiT1FqXF1qlCKw=;
        b=iCO/TTwr4b00nlVrp/wYaJ2hQ1Y8KrnzJe0yZ7gwSMoufaDcpaE+13Mkbz3j4630sy
         A/FNCmY883Fb+d1TMDE8he42/UffaFJuNiSRTwA3+4ZB88d2mIAOFX/rE2N6dA840jQA
         xxMuYtO+tJI+xWZ9WuJ1naKZ4io9XOL14vFbjnYnXw3SxNWQV27HxnM4yOaAaHfYN2/Y
         V2AE3cspGCCk3/avmLUZTQgJeeDv/+ya0HbdJO4vvmrALD4SBFk6UcBTUSC3O+EZAK4X
         HV35x3nz462KB2hbg+3imLTMoJIz2jz9LRlKAKKQtjgGR8xRWSnUKhrU7IaCioBO1ADM
         Fzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722112992; x=1722717792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bv4ok3GIewx2d9Yx1/BgjuhSzkHnMJiT1FqXF1qlCKw=;
        b=bcig4AP1fnBiPi076T49wPJz38e3/fSgqt6Kc/Jok3QCekp5KKW4Q1hPBY7CS8k8C2
         nG0rlcOaRp+ZpCNtBEzOyghg6z8yj4UiMRhG0AZcEZf8XjprX88gFqNiYE2wmHZPCFhA
         9UiDrjODxSoGIzgVjYr/KxP6hycO6+Nn1her7bLI5N3sbhzFf+ZtKwZN2XXK7wWUvyqv
         mDSK13EACpq1qT3rGtEeYZN8fgePyE63B/uEdFiESkCLg3l8umHELySPeEL5fU02XROG
         N7otUwP8UEy8U9QubXlhqzrBmDLRVGMIKopFOzXgETS2mBpWPkomRnpto4PjiFWSXCtk
         x8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7md3Rz7qZi/ivYmRuhruJYG7W+LUKLJHpY7maX95/BO0nrr2u1xDh/6EkEb47Yxpx5oLaFY8iyJmO+13I41G4OhvI360JAy5n4GL+412QjFOk3CRs2NGjxryZCSLvmuccXdkHjT5kAUKBw+o1J2lWjDmBNvC6YIx5uSPrB21nGAQP
X-Gm-Message-State: AOJu0YyoskNO2bfEdT3YLpzqqTSiNh3FYWSrsFqY7QxwCs02Bg5rU4vp
	5nta3KDd2yfwT3WX76+6aysHe5MOolYH/CnDvlboAfC6fRKNZ3WMxhetL7g+WlNod9njxvEAqgS
	0qJGzXdOMX2a34ZSFtX1LxQhlUA==
X-Google-Smtp-Source: AGHT+IGP71xKWMKOJHw+6eAC+0bfS2GCggw5OubOUU2ooeGmpjLgTwO9dToD28ptkFTPF8afYXAbZ5d0nh1LLHWoUjg=
X-Received: by 2002:a05:6512:3ca9:b0:52e:8161:4ce6 with SMTP id
 2adb3069b0e04-5309b718bebmr1011788e87.25.1722112991729; Sat, 27 Jul 2024
 13:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
In-Reply-To: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 27 Jul 2024 16:43:00 -0400
Message-ID: <CAMzpN2hRVzWOF5YDvE8pPKfogdcuou8REsY+uXzkdORnFn=buQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix '-S -c' in x86 stack protector scripts
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, nicolas@fjasle.eu, 
	maskray@google.com, morbo@google.com, justinstitt@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 2:05=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
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
>
> Perhaps this is an issue in the clang commit mentioned in the message
> above since it deviates from GCC (Fangrui is on CC here) but I think the
> combination of these options is a little dubious to begin with, hence
> this change.

As part of my stack protector cleanup series, I found that these
scripts can simply be removed.  I can repost those patches as a
standalone cleanup.

https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com/

Brian Gerst

