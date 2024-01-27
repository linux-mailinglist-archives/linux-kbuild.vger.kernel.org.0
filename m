Return-Path: <linux-kbuild+bounces-685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C683EE07
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 16:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B810D1C212B1
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 15:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E89F28DD7;
	Sat, 27 Jan 2024 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeEO5kZ9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E998F28DD3;
	Sat, 27 Jan 2024 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706370277; cv=none; b=ifQ2VfcozPfhhqPEpqwobLIvy+YsoULe7Tz+wKBcKNkOYoOkZVp2w2BIDOJRYsK4aXu9K9V3NspCRSfheRCju8Iiu9hVV65LoPOUmL3nK2Bl0xtpZmbmOn86Dx8s8xyyYwjfdXyTV9qFjEDGq2SN5OP26ZZ8/C8Gy330qnbgzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706370277; c=relaxed/simple;
	bh=EELGZfz9lAK1loDeD8w+xVM+cCGtcqj7CLX+2eCWnjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiuEdf7b+iGuvFujrOe4xRS21OIZ9ps2IChVHr/70RmmVIySKMIumKyENs7FDm2CYzLS+9jb05D2PM5ZBCG7kthmUVajG9Go3N1G4V/STt+dKdsGu1TPT2C21HgeRGitk7D7jg9sZruo/nnlE/RjdFYT7dlTDjhNDcTmFEH1vv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeEO5kZ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D17EC433A6;
	Sat, 27 Jan 2024 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706370276;
	bh=EELGZfz9lAK1loDeD8w+xVM+cCGtcqj7CLX+2eCWnjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LeEO5kZ96OPVbvsuqrFBY5t8/3El+/M6PFnfIKMwYu3QQubqPuJck1PyNFQ+mDkLn
	 cXuT+OAiMpWPc2E6BmL0PoKc4Wop1BgdwWd1PAu7XdHsS2cnYb5b6AT0ieUC5YMreg
	 Yb/B0XWNT2Uc0gwv+K3ZdNs+mpYbYob+VoYLH7X5KsTEjTjNpQL3VKWZDDsOBueIiZ
	 v6JgTgQS9Eiiq60v7QeL2Fd3vuyWC2/Anrc0LCZwV95zSIeuhBpU0u/CO9U1zQ0ow3
	 vUrglhgVu0IkPrZ3v5lz5jvfyGuFC87O5FP11tNPgP2JsTU5FCIPz6wjOagpSpIZPR
	 W+DbkHjXFT7Rg==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2144ce7ff41so651422fac.3;
        Sat, 27 Jan 2024 07:44:36 -0800 (PST)
X-Gm-Message-State: AOJu0YxLtsrvqw9WpiFFG37p0yUxauSLqRlsmV5OUQa5rJ1njkvqo6A2
	FjRXqKBUMRVCDCP/p6uWc59kY89O+avoUdLIdTnp5v4NeeCJaWrlhZrYKYFWcmuJ+IciBub3jWJ
	we0dBthaigaW+ajwcTL1fbXS9ibo=
X-Google-Smtp-Source: AGHT+IHKu7J4sPa55OVECUcHBRCyx9ZzSiCi17gfOvi7AHAWXZs8rsCFKBZguK0vE3/J1lnVbJu5h3QeBTUduqR8Jpo=
X-Received: by 2002:a05:6871:5287:b0:214:7ef2:e8c with SMTP id
 hu7-20020a056871528700b002147ef20e8cmr1060638oac.0.1706370275802; Sat, 27 Jan
 2024 07:44:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org>
In-Reply-To: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jan 2024 00:43:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7VauHgJK+939QjtOLtOPDOyGsYfwj+9f+1-jkFdtWnQ@mail.gmail.com>
Message-ID: <CAK7LNAQ7VauHgJK+939QjtOLtOPDOyGsYfwj+9f+1-jkFdtWnQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix UML build with clang-18 and newer
To: Nathan Chancellor <nathan@kernel.org>
Cc: richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, linux-um@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 8:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi all,
>
> This series resolves two independent but related issues that were
> recently exposed by two LLVM changes.
>
> https://github.com/llvm/llvm-project/commit/ec92d74a0ef89b9dd46aee6ec8aca=
6bfd3c66a54
> exposes that '-no-pie' is not getting added to the linker flags with
> clang, resulting in building objects with '-fno-PIE' that are linked
> with '-pie', to which the linker rightfully errors with:
>
>   /usr/sbin/ld: init/main.o: relocation R_X86_64_32 against symbol `saved=
_command_line' can not be used when making a PIE object; recompile with -fP=
IE
>   /usr/sbin/ld: failed to set dynamic section sizes: bad value
>
> https://github.com/llvm/llvm-project/commit/4bf8a688956a759b7b6b8d94f42d2=
5c13c7af130
> adds '.ltext' (and '.ltext.*' with '-ffunction-sections') when using
> '-mcmodel=3Dlarge' (which UML does), which causes a segmentation fault
> with modpost.
>
> I have tested these patches with all supported versions of clang,
> noticing no regressions.


Both applied to linux-kbuild/fixes.

Thanks.




> ---
> Nathan Chancellor (2):
>       um: Fix adding '-no-pie' for clang
>       modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
>
>  arch/um/Makefile      | 4 +++-
>  scripts/mod/modpost.c | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> ---
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> change-id: 20240118-fix-uml-clang-18-e365b0503a29
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--=20
Best Regards
Masahiro Yamada

