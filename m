Return-Path: <linux-kbuild+bounces-2691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D793E3B4
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 08:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9936F281EFB
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 06:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F4F4C85;
	Sun, 28 Jul 2024 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzc1DnWl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11728472;
	Sun, 28 Jul 2024 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722147856; cv=none; b=kHsnRwp5/OUQlACW8s+KI85kwnKV8tC43Xj2XCet9TzCuhRz/JrHJNVYtfGxt75JDjWGipUxx7n3iQll4cR2p9iymKwFzW8WuURVYmq7A7bIO1/kcK8xxoh74Ew6gBRQf95BTJzOIXZvYXSYRtcFVs7i0pcrYj4PYJu39KDAn+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722147856; c=relaxed/simple;
	bh=ImUcFjkydUuUQ924R1A8XHHR0JWttQhOnZzfzif7Bps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFfr+XduzpQz5eXlWe6rToiIqsqfVyyjN4K4U/nS8lBxblmY1TU6FfSnxaHAzTPEvfSSjjA5Fu45eiho/YoPQ1Wa+NDI11oyyjAZV2tUblWuFDDl660b4s9fNL7UiqvyQfK9S6RM2JWgV5rqCQwaqSNxNsAGV3yRoU0GgmqPMkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzc1DnWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C96C4AF13;
	Sun, 28 Jul 2024 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722147856;
	bh=ImUcFjkydUuUQ924R1A8XHHR0JWttQhOnZzfzif7Bps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hzc1DnWlvCokjGQVKqGosmjJyGR4DBzSa3OkWfuY//4qYtqgrrUbc7fKm6Dq65WzK
	 XAn+Uq/EupMRiJHSr0AavfJNyZef9YipKozM/wBSdPvMLrM7cdIx3xMW8O9WfBN9c4
	 1Q4OVaWU8Vrv9oIPTTIOWUmZDEyJgfg7Oh0KXfCHLqYnID72JxfnAQDzP8uVeyIuwt
	 kAh08P8UYRHYf7cWC+9B9PgA/Q/1LiSAEmG7sFM/QIc82xxFA+7LzkSxlQOqzYmhHW
	 TS8vPBsmRE+1WyENydDzPoRN3xjgPVvt5/0N38MiYkPKyHAAPCT+tGhbiZ6pTPbJIF
	 LKzQAhX11+G8g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f136e23229so4181761fa.1;
        Sat, 27 Jul 2024 23:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHV5D01eQZZj7NuUALIJ/nTB8pFArQZ4Mly/PyA32s8gidDfXTfUz96vXrtUXypBkdjeB/GgTW/w2FMHeZb7UbWS1o8E916xpo8KJshzXwcnUgs+qLj4RYxi5uphbdDiJaKKfdRtyjUgPSsA/RabRKIOfq+A9C0rigUMCmopHOiITV
X-Gm-Message-State: AOJu0YxUri4vSpHurcuvuutXoXA4K25PuEOwf+k4eamtStpToqB+d5eB
	x63zu+ZKDTvqhELbBEkE8/Pv7dF34PVhp85sHLmERvZOjAq0JX9YeHQnwVGI38aZHk8d7zP/hNh
	p84qyaVCHAGrCUp1n9T1aIE2icPI=
X-Google-Smtp-Source: AGHT+IEWKcl1IkDbAMgGyH1XvzNtiqtMNP8K6l6mTC7aGLzr2Nlspyt0qPyssjl/o8jZ6fH+Ozsru7FESzZ58JbySS4=
X-Received: by 2002:a2e:9091:0:b0:2ef:29b7:18a7 with SMTP id
 38308e7fff4ca-2f12ee5bc21mr25237531fa.37.1722147854960; Sat, 27 Jul 2024
 23:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
 <CAMzpN2hRVzWOF5YDvE8pPKfogdcuou8REsY+uXzkdORnFn=buQ@mail.gmail.com>
 <CAK7LNARjggcomzGMgHxuYE=Lm0_zsZS5dvjo3g4tjKJaM2oydg@mail.gmail.com> <CAMzpN2i6_-tiYKuXgq0ppowtfB8JipZvkMLmT8Mn02YE5shC5g@mail.gmail.com>
In-Reply-To: <CAMzpN2i6_-tiYKuXgq0ppowtfB8JipZvkMLmT8Mn02YE5shC5g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jul 2024 15:23:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQiL=swKikuquFW9BrTftxNGHkwhLZVqQq3oNTYByEDxA@mail.gmail.com>
Message-ID: <CAK7LNAQiL=swKikuquFW9BrTftxNGHkwhLZVqQq3oNTYByEDxA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix '-S -c' in x86 stack protector scripts
To: Brian Gerst <brgerst@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, nicolas@fjasle.eu, 
	maskray@google.com, morbo@google.com, justinstitt@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 12:13=E2=80=AFPM Brian Gerst <brgerst@gmail.com> wr=
ote:
>
> On Sat, Jul 27, 2024 at 10:36=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > On Sun, Jul 28, 2024 at 5:43=E2=80=AFAM Brian Gerst <brgerst@gmail.com>=
 wrote:
> > >
> > > On Fri, Jul 26, 2024 at 2:05=E2=80=AFPM Nathan Chancellor <nathan@ker=
nel.org> wrote:
> > > >
> > > > After a recent change in clang to stop consuming all instances of '=
-S'
> > > > and '-c' [1], the stack protector scripts break due to the kernel's=
 use
> > > > of -Werror=3Dunused-command-line-argument to catch cases where flag=
s are
> > > > not being properly consumed by the compiler driver:
> > > >
> > > >   $ echo | clang -o - -x c - -S -c -Werror=3Dunused-command-line-ar=
gument
> > > >   clang: error: argument unused during compilation: '-c' [-Werror,-=
Wunused-command-line-argument]
> > > >
> > > > This results in CONFIG_STACKPROTECTOR getting disabled because
> > > > CONFIG_CC_HAS_SANE_STACKPROTECTOR is no longer set.
> > > >
> > > > '-c' and '-S' both instruct the compiler to stop at different stage=
s of
> > > > the pipeline ('-S' after compiling, '-c' after assembling), so havi=
ng
> > > > them present together in the same command makes little sense. In th=
is
> > > > case, the test wants to stop before assembling because it is lookin=
g at
> > > > the textual assembly output of the compiler for either '%fs' or '%g=
s',
> > > > so remove '-c' from the list of arguments to resolve the error.
> > > >
> > > > All versions of GCC continue to work after this change, along with
> > > > versions of clang that do or do not contain the change mentioned ab=
ove.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 4f7fd4d7a791 ("[PATCH] Add the -fstack-protector option to t=
he CFLAGS")
> > > > Fixes: 60a5317ff0f4 ("x86: implement x86_32 stack protector")
> > > > Link: https://github.com/llvm/llvm-project/commit/6461e537815f7fa68=
cef06842505353cf5600e9c [1]
> > > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > > ---
> > > > I think this could go via either -tip or Kbuild?
> > > >
> > > > Perhaps this is an issue in the clang commit mentioned in the messa=
ge
> > > > above since it deviates from GCC (Fangrui is on CC here) but I thin=
k the
> > > > combination of these options is a little dubious to begin with, hen=
ce
> > > > this change.
> > >
> > > As part of my stack protector cleanup series, I found that these
> > > scripts can simply be removed.  I can repost those patches as a
> > > standalone cleanup.
> > >
> > > https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com=
/
> > >
> > > Brian Gerst
> >
> > Judging from the Fixes tags, Nathan meant this patch is
> > a back-port candidate so that the latest LLVM can be used for stable ke=
rnels.
> >
> > You are making big changes, and do you mean they can be back-ported?
>
> I was referring to just the first two patches of that series.  That
> said, it would be simpler to take Nathan's fix for backporting.



Even the first two patches are not trivial.

The second patch 02/16:
https://lore.kernel.org/lkml/20240322165233.71698-3-brgerst@gmail.com/

is completely removing scripts/gcc-x86_64-has-stack-protector.sh,


In fact, I also noticed it was a workaround for old buggy compilers.
I attempted to do the equivalent clean up, then it was rejected.
https://lore.kernel.org/lkml/1541992013-18657-1-git-send-email-yamada.masah=
iro@socionext.com/

It was 6 years ago, so the situation might have changed.
Good luck.








--
Best Regards
Masahiro Yamada

