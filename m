Return-Path: <linux-kbuild+bounces-2690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5551893E378
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 05:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AE241C21136
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 03:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7760823A0;
	Sun, 28 Jul 2024 03:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMuYGk90"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DA1878;
	Sun, 28 Jul 2024 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722136418; cv=none; b=AlesSz3mrVTFAQg7B69DU+Jc2gqw1oHEvUtExP4e5WudwsrnXU8BMmLZp+zCLzjOSTL3Y9UZ56fR7JwEzQoJ8tQA7b++hv8u2n7HwF3aI1VWdN4uv8PBAcF1HM484gYYKYiTuDhac6nBjTxnwpc8Lkl0I6TehAXwaW36lBFUWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722136418; c=relaxed/simple;
	bh=dxAiWiD2kN5NPOYoa1Wg9mD6ZtfxLFrPDEAvSnCXYvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZd9ovaxi0dumc+NzyX7o9lTEpr1d36CDv3xwfjtw3VjR6Gn273cUN+Dy0FEhMSxZQgkF1v7IGzXF7Fk7SPsC/XGSYzvaH/wzNqUlTkLMXim5PPd7ujaOXeO3JXzCAfo/l0BzvSXCJUn9InS6VnWUT/Hjh6JN8Nxdccu3tB/JHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMuYGk90; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so3399021e87.0;
        Sat, 27 Jul 2024 20:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722136415; x=1722741215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1a761+r7QAGh3/ol80lxTwi2CiAb1Lq7e0V/KssodI=;
        b=cMuYGk90fdOBg/vWHUJDqNBSNpRvTh+CxDL38uCXmqE6jKcb5+vHxfXdO/lH3xpr8v
         bGFSii4dTk/WUGOp5P4zDrxoUgyMIll6oB9vp5Epa9I8ub+sFX6AGcs3Lnz6kajSvXTd
         h8J6Vc3LmTzVHrFLUeGTy/eXagBmijQlYhg8bhalXkJW461NCfurq911diceCvROlrTq
         fQaWV8Qbbww78dqoFZkzDP3eCnD2PZ0yb3eEn9jxtRRuNo9qGpynIWy5vRRx4stPSFzL
         Ak89MFZ3yu4GH9Q3U8T5RUAZfNadnXixb1/Dg/jVl79PcNNLGx3cn7FC/V/ST8kF2spJ
         WMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722136415; x=1722741215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1a761+r7QAGh3/ol80lxTwi2CiAb1Lq7e0V/KssodI=;
        b=ktcdL313c1m8cYrLStisPliVHY69lKq7vOgvCTY7WmMzmXqiubVgt9bh2AmOLC5ItH
         TTEks2Cb+MzxysKP+ZtIdVdWGLju2Wax7gVjcwwtCU+Wf7SGX32vFt60p101e7MEt15n
         D/tDqrMsirT/Jy5EImyhVLx0Nqhgnvqk3N479yYio0VWKwVWiCfQ7vKx0qPbEzFyN9y3
         hHqfPJXuCyJONJ7za95h+lo5H9OlAE7MgOD8TZ4a5ZhYONOrZT/PnBrVSN47AVIIpxAw
         5e+lx1y38Hh+KXyQwCT+1aUQtgXNJ/roqmo3FyiZUJZw1sMTIULQfVIF6MR9lwchG2jc
         a5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUGxxdos/3EOpeb1l19KDXtNXj30yoKv0KLAJG6v5SGv9SXrxUuUXtIee6GyGOujk+BlTXA39FYo3+apyTNs7ytiBF77Od/xdxCHvTOsXH8baKI8uJk1RrNaZ7cbjOJQ1Ijpa4YuMlA7o43Deb3NJqYX4IUkQgBzNlAAwXfXrtBMHiL
X-Gm-Message-State: AOJu0YyzcJp4kdx3CJMkTyzFTAAb7oS19ACSbOOE5ttSVVVqSJiTwAzO
	s8f0TXM6qHuEeuTWqln/VjcRdugL847c8kv1a1aPwPlzxs/4SpkCiZDXsBGqRrc9epJXSPPIBtd
	Uycj382Hi0Y+1qNj1bQEmU4GsVqe7
X-Google-Smtp-Source: AGHT+IHwdJ/GGFwNwHrHqImp87bRmzlbCkmdBesKSKpVIxf1IZOyEMy384mSKBlU42fWO/aAdLYebQartIGMAqBrChM=
X-Received: by 2002:a05:6512:280d:b0:52e:fa98:d89c with SMTP id
 2adb3069b0e04-5309b26ac72mr2697514e87.14.1722136414377; Sat, 27 Jul 2024
 20:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
 <CAMzpN2hRVzWOF5YDvE8pPKfogdcuou8REsY+uXzkdORnFn=buQ@mail.gmail.com> <CAK7LNARjggcomzGMgHxuYE=Lm0_zsZS5dvjo3g4tjKJaM2oydg@mail.gmail.com>
In-Reply-To: <CAK7LNARjggcomzGMgHxuYE=Lm0_zsZS5dvjo3g4tjKJaM2oydg@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 27 Jul 2024 23:13:23 -0400
Message-ID: <CAMzpN2i6_-tiYKuXgq0ppowtfB8JipZvkMLmT8Mn02YE5shC5g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix '-S -c' in x86 stack protector scripts
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, nicolas@fjasle.eu, 
	maskray@google.com, morbo@google.com, justinstitt@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 10:36=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Sun, Jul 28, 2024 at 5:43=E2=80=AFAM Brian Gerst <brgerst@gmail.com> w=
rote:
> >
> > On Fri, Jul 26, 2024 at 2:05=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > >
> > > After a recent change in clang to stop consuming all instances of '-S=
'
> > > and '-c' [1], the stack protector scripts break due to the kernel's u=
se
> > > of -Werror=3Dunused-command-line-argument to catch cases where flags =
are
> > > not being properly consumed by the compiler driver:
> > >
> > >   $ echo | clang -o - -x c - -S -c -Werror=3Dunused-command-line-argu=
ment
> > >   clang: error: argument unused during compilation: '-c' [-Werror,-Wu=
nused-command-line-argument]
> > >
> > > This results in CONFIG_STACKPROTECTOR getting disabled because
> > > CONFIG_CC_HAS_SANE_STACKPROTECTOR is no longer set.
> > >
> > > '-c' and '-S' both instruct the compiler to stop at different stages =
of
> > > the pipeline ('-S' after compiling, '-c' after assembling), so having
> > > them present together in the same command makes little sense. In this
> > > case, the test wants to stop before assembling because it is looking =
at
> > > the textual assembly output of the compiler for either '%fs' or '%gs'=
,
> > > so remove '-c' from the list of arguments to resolve the error.
> > >
> > > All versions of GCC continue to work after this change, along with
> > > versions of clang that do or do not contain the change mentioned abov=
e.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 4f7fd4d7a791 ("[PATCH] Add the -fstack-protector option to the=
 CFLAGS")
> > > Fixes: 60a5317ff0f4 ("x86: implement x86_32 stack protector")
> > > Link: https://github.com/llvm/llvm-project/commit/6461e537815f7fa68ce=
f06842505353cf5600e9c [1]
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > > I think this could go via either -tip or Kbuild?
> > >
> > > Perhaps this is an issue in the clang commit mentioned in the message
> > > above since it deviates from GCC (Fangrui is on CC here) but I think =
the
> > > combination of these options is a little dubious to begin with, hence
> > > this change.
> >
> > As part of my stack protector cleanup series, I found that these
> > scripts can simply be removed.  I can repost those patches as a
> > standalone cleanup.
> >
> > https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com/
> >
> > Brian Gerst
>
> Judging from the Fixes tags, Nathan meant this patch is
> a back-port candidate so that the latest LLVM can be used for stable kern=
els.
>
> You are making big changes, and do you mean they can be back-ported?

I was referring to just the first two patches of that series.  That
said, it would be simpler to take Nathan's fix for backporting.

Brian Gerst

