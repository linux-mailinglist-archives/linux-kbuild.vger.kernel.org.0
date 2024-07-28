Return-Path: <linux-kbuild+bounces-2692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774E93E3EB
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 09:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDD2E281E16
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 07:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538B5AD5B;
	Sun, 28 Jul 2024 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4GggznD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAFB9475;
	Sun, 28 Jul 2024 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722151266; cv=none; b=d4n/RwznjG4CO8iw0iPm0epp6wM0usoFqC8/5G9X9eyE5AL5TY36eAVQAaI6lOZow1k/Kxf97M1/ckoRszDRjZouV/5lV4cFi3u7rlkZqlsS8IyeR4pfvO+YPnasoPf/9EAoBDTbbj5r6WoiXEqEqJ4moUgHTdTVYsvDM08U9EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722151266; c=relaxed/simple;
	bh=GG5jFH9fLcS8G24YwDi2MBNErZaorWB+Mf6iZebzfCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvP8XYlHOK0Q256ZUebn7Z616jtSsd9alWg02iR1wcHTftA+3UrbbQScOvB5dsF08WpNzV1azwMxigcutFwKjX5dj2WJYJjj5S2slq6xA2UR5UFVrTYCQWnWMWrLB88htZO2Ryu6EgdSQnwIy7gsw0GN8Y3VAaSZzK42dg0A+WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4GggznD; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f04c1e58eso3174306e87.3;
        Sun, 28 Jul 2024 00:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722151262; x=1722756062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4zxJCQGItJM4cJnL8e4bqJxqyn3oTDAKU3y3PFgwvo=;
        b=J4GggznDy8iNOP6zo3Lpq01SnLLei7K8zsujW9+ZEIqvaSGiDD7w/OAb1y9WN4vQLq
         Y64Jq4ANgno27LW1qq95aPIqteZ7WA47jpGlW2K8myAOaSQGav2TzJR5JQuOv7gdwffr
         OJ0aex7Re45j0fAKi2go8dMyK/1epcdcwvmbhJNYLmennPaeB5UBKF/ynkiwaAOYGtPS
         XAcI8gQvRy4WjKS3MzNc8KInRlaI+FIyBUwRlqKaYo6eHcnJsCyFcKOrN059zfvyfiy1
         VcALN7+NbsYeEE5WuBSFZIx5jEbJmdYdy03rByUjcjUuy0gZVb18IEUBnyaU10gXr2VT
         z5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722151262; x=1722756062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4zxJCQGItJM4cJnL8e4bqJxqyn3oTDAKU3y3PFgwvo=;
        b=FI1DURkLV0AkFeTnqK2btX4mwiJv/5DNbYCefv/evXLAFAXC8WQqw0cVWqq/JNEojm
         bBF7I/wBwUsyjtMukBzQKdNstwyWWsWgMg4S39QAI4QR4vGfgAxop92l6lizqCRPfzjU
         vlFVh8tvZCL5nLza1lFTT2wHVmf0+LK6xDJqw3OIYdYa1snd7UhEpRinF7stBpXTBnyC
         dyaNdQIIIs4Do7BttOWhH8KpJnaqAYmpXZTtDcDv+RIrRzY12mrQOzeONjEyDu8rN7SF
         d4eDq8SWHjoKpqZb99DaOR9g+9TBixd1LSi4FOyMUnBCXvCdShyUhWVYXmN0FnyvDmI4
         hZDg==
X-Forwarded-Encrypted: i=1; AJvYcCUj2cOMS/s1LSpJ9ETTuINL25OQ+Wor0gi2+uDyi+DIQvufMCGabKMvW2XexINr+3XnFFfdl+nkSioPlS6P6Eo8kf0c1DQM5VNIu3T14WOKdZieEMfIA+T7MIcYuGcSsNWHliMOUu6Zw7d0U5a76fK63GAczxOCL76M0d2JXzHKltzJ
X-Gm-Message-State: AOJu0YwuPlASSSTP/xVpary0bgBth73v+QIRlJKTbkPUCqQbZP/aguaN
	Sc8MpXNjXLPe0VquRJPqHUVEwnyKyc25YMHtPrGPJ4NlLfjQfGjrI9DQ/nVCHf0ZsOE6RJCJgb4
	BcGRRxDT8uPAO1t9n0cAHDZ//NTTn
X-Google-Smtp-Source: AGHT+IE3KZlyMjLAe5MDRiJ4zEfUTV2a7YgnW8Wfv+fDZR89gbai9KqCjOPG0O2c7Dd4ZVvhaLaqM/KPOJ60tRdSeL8=
X-Received: by 2002:a05:6512:2c0f:b0:52c:deea:57cb with SMTP id
 2adb3069b0e04-5309b269215mr3547186e87.3.1722151262076; Sun, 28 Jul 2024
 00:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
 <CAMzpN2hRVzWOF5YDvE8pPKfogdcuou8REsY+uXzkdORnFn=buQ@mail.gmail.com>
 <CAK7LNARjggcomzGMgHxuYE=Lm0_zsZS5dvjo3g4tjKJaM2oydg@mail.gmail.com>
 <CAMzpN2i6_-tiYKuXgq0ppowtfB8JipZvkMLmT8Mn02YE5shC5g@mail.gmail.com> <CAK7LNAQiL=swKikuquFW9BrTftxNGHkwhLZVqQq3oNTYByEDxA@mail.gmail.com>
In-Reply-To: <CAK7LNAQiL=swKikuquFW9BrTftxNGHkwhLZVqQq3oNTYByEDxA@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Sun, 28 Jul 2024 03:20:50 -0400
Message-ID: <CAMzpN2iXMtzvyvwjLHMDz2DR-Me8exU_DtQpfO3MJS5BzTnJfg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix '-S -c' in x86 stack protector scripts
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, nicolas@fjasle.eu, 
	maskray@google.com, morbo@google.com, justinstitt@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 2:24=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sun, Jul 28, 2024 at 12:13=E2=80=AFPM Brian Gerst <brgerst@gmail.com> =
wrote:
> >
> > On Sat, Jul 27, 2024 at 10:36=E2=80=AFPM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Sun, Jul 28, 2024 at 5:43=E2=80=AFAM Brian Gerst <brgerst@gmail.co=
m> wrote:
> > > >
> > > > On Fri, Jul 26, 2024 at 2:05=E2=80=AFPM Nathan Chancellor <nathan@k=
ernel.org> wrote:
> > > > >
> > > > > After a recent change in clang to stop consuming all instances of=
 '-S'
> > > > > and '-c' [1], the stack protector scripts break due to the kernel=
's use
> > > > > of -Werror=3Dunused-command-line-argument to catch cases where fl=
ags are
> > > > > not being properly consumed by the compiler driver:
> > > > >
> > > > >   $ echo | clang -o - -x c - -S -c -Werror=3Dunused-command-line-=
argument
> > > > >   clang: error: argument unused during compilation: '-c' [-Werror=
,-Wunused-command-line-argument]
> > > > >
> > > > > This results in CONFIG_STACKPROTECTOR getting disabled because
> > > > > CONFIG_CC_HAS_SANE_STACKPROTECTOR is no longer set.
> > > > >
> > > > > '-c' and '-S' both instruct the compiler to stop at different sta=
ges of
> > > > > the pipeline ('-S' after compiling, '-c' after assembling), so ha=
ving
> > > > > them present together in the same command makes little sense. In =
this
> > > > > case, the test wants to stop before assembling because it is look=
ing at
> > > > > the textual assembly output of the compiler for either '%fs' or '=
%gs',
> > > > > so remove '-c' from the list of arguments to resolve the error.
> > > > >
> > > > > All versions of GCC continue to work after this change, along wit=
h
> > > > > versions of clang that do or do not contain the change mentioned =
above.
> > > > >
> > > > > Cc: stable@vger.kernel.org
> > > > > Fixes: 4f7fd4d7a791 ("[PATCH] Add the -fstack-protector option to=
 the CFLAGS")
> > > > > Fixes: 60a5317ff0f4 ("x86: implement x86_32 stack protector")
> > > > > Link: https://github.com/llvm/llvm-project/commit/6461e537815f7fa=
68cef06842505353cf5600e9c [1]
> > > > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > > > ---
> > > > > I think this could go via either -tip or Kbuild?
> > > > >
> > > > > Perhaps this is an issue in the clang commit mentioned in the mes=
sage
> > > > > above since it deviates from GCC (Fangrui is on CC here) but I th=
ink the
> > > > > combination of these options is a little dubious to begin with, h=
ence
> > > > > this change.
> > > >
> > > > As part of my stack protector cleanup series, I found that these
> > > > scripts can simply be removed.  I can repost those patches as a
> > > > standalone cleanup.
> > > >
> > > > https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.c=
om/
> > > >
> > > > Brian Gerst
> > >
> > > Judging from the Fixes tags, Nathan meant this patch is
> > > a back-port candidate so that the latest LLVM can be used for stable =
kernels.
> > >
> > > You are making big changes, and do you mean they can be back-ported?
> >
> > I was referring to just the first two patches of that series.  That
> > said, it would be simpler to take Nathan's fix for backporting.
>
>
>
> Even the first two patches are not trivial.
>
> The second patch 02/16:
> https://lore.kernel.org/lkml/20240322165233.71698-3-brgerst@gmail.com/
>
> is completely removing scripts/gcc-x86_64-has-stack-protector.sh,
>
>
> In fact, I also noticed it was a workaround for old buggy compilers.
> I attempted to do the equivalent clean up, then it was rejected.
> https://lore.kernel.org/lkml/1541992013-18657-1-git-send-email-yamada.mas=
ahiro@socionext.com/
>
> It was 6 years ago, so the situation might have changed.
> Good luck.

It's a workaround for an old buggy compiler that isn't even supported
by the kernel anymore.

Brian Gerst
>
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

