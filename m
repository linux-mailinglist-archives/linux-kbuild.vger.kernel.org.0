Return-Path: <linux-kbuild+bounces-1411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EF892E09
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 Mar 2024 00:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E19C1F21A97
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Mar 2024 23:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380BC446AE;
	Sat, 30 Mar 2024 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/FvMNA4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DADA2209F;
	Sat, 30 Mar 2024 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711839785; cv=none; b=E+Bp7itBBA98jvv4jw2tjNSjGUhg060qtFxQGAT6pEQQk+u7gV6R+WPytaS/Z0UlG3s9/IDjjBb8zKZJw5lYHtuTEXNVGnC5hfxY1VkjmijYP8hYMYS0S2/QsSz7ND5FBpEXZYLgnR/mwxY5hiRHntdqj81mblrGEv0tFac5UI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711839785; c=relaxed/simple;
	bh=Uk4iJZwSrM2dCVspPrkJGokzJ84YsOa1I77r4NRPHC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh1Yg4LoVM0aKqjJcGa8EnsuCvNza+l3cA2Bi1aXlQ77iX3SrTkyygfAPJJtbYujclh51KY7omJVY0+/lxyvlPU9vKKSBaTwF9NjuqoYpboCTvK/+oPtcG6Ob1nVQY1dZmJaw3Ih9s6FvqjF9TVPc61jk0mFHCcpvph2v0QIHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/FvMNA4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01C2C433A6;
	Sat, 30 Mar 2024 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711839784;
	bh=Uk4iJZwSrM2dCVspPrkJGokzJ84YsOa1I77r4NRPHC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i/FvMNA4ajDWw3JT6GuQSg3gc4xs2GzlA3SCsxisY2qLC3bGo80ykGUjUaTIiocLD
	 lRGCz3ydTGXWc9MoUWRBMJu/9FbZZJPWV12PoXqxsppdCXrU8hHh+NymV2yepcsJNC
	 K7BDfrHSAkC5V99trtRQNa/4PtPMQPBgn/CodlK8jj2un6YK+Gh99eL+areqP6zqQ1
	 QiWea0HfcnrJFuvlEt7hZs0IfqQYPAAQ9l2NHMn0IwN5a3qzpUzLflfgmLAO+6l3JU
	 uROY0jV31xGtHg33rUZY3YoG62cD0nvV34ZRuIAFZ5W4KdjCjb9KJrTAiQHOpfNyy0
	 jOpSWwWTNr3bg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso37397121fa.3;
        Sat, 30 Mar 2024 16:03:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2SqSP3j1rBLfgDXfkY69TItAkpakWYDE0m8dtqvP5KGZIkju6Nm3R6tVWh0KGMtYn/vzBOndZQyVB6rdWWK62z8+9DsR/dr5Zs+JGqdz5eUO2cx08IGlFdOfSXfvW23uDgD3H7cs9
X-Gm-Message-State: AOJu0YysQSs8wyHgdd2eycuByWgwUy8jqrRdQocFhmULn/Rz6R7H36Fy
	iIcVJ2Gky7jmDXknm9ehdiRJ3u70gPXYrYjkOVeaLOpH0tYX/6Iu5fs8wBDruw93zLFn/pPXTTO
	9Zay1+TsUdxCkuCAHTK2z7b2etBc=
X-Google-Smtp-Source: AGHT+IFd/LGv2PBoBuzAtx8igo0NJbXoa4v9MDGe5vtLEj5wDpfnPVtw0+ng93ETtALsKDvhhb4I7KxixPbeWm91ZZg=
X-Received: by 2002:a05:651c:b0d:b0:2d7:68a0:9b28 with SMTP id
 b13-20020a05651c0b0d00b002d768a09b28mr1710557ljr.7.1711839783412; Sat, 30 Mar
 2024 16:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-llvm-docs-s390-llvm-1-v1-1-56ad95d2bc27@kernel.org>
In-Reply-To: <20240327-llvm-docs-s390-llvm-1-v1-1-56ad95d2bc27@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 31 Mar 2024 08:02:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVoiek2kt7aAK=tL-y6RhbmSOeRyx_4W2vk=usyceu5A@mail.gmail.com>
Message-ID: <CAK7LNARVoiek2kt7aAK=tL-y6RhbmSOeRyx_4W2vk=usyceu5A@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Note s390 LLVM=1 support with LLVM
 18.1.0 and newer
To: Nathan Chancellor <nathan@kernel.org>
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	nicolas@fjasle.eu, corbet@lwn.net, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 2:20=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> As of the first s390 pull request during the 6.9 merge window,
> commit 691632f0e869 ("Merge tag 's390-6.9-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux"), s390 can be
> built with LLVM=3D1 when using LLVM 18.1.0, which is the first version
> that has SystemZ support implemented in ld.lld and llvm-objcopy.
>
> Update the supported architectures table in the Kbuild LLVM
> documentation to note this explicitly to make it more discoverable by
> users and other developers. Additionally, this brings s390 in line with
> the rest of the architectures in the table, which all support LLVM=3D1.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Applied to linux-kbuild/fixes.
Thanks.




--=20
Best Regards
Masahiro Yamada

