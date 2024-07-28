Return-Path: <linux-kbuild+bounces-2688-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA793E36A
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 04:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B491281F98
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 02:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EF81B86D2;
	Sun, 28 Jul 2024 02:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWYY1JO2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DD3257D;
	Sun, 28 Jul 2024 02:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722134004; cv=none; b=Xs69yIFVjoIDPBWoEP2oeBKN9iyRzgRzhEEmVwgxj+WxhaR3EFtPqPkJb0wy3Q4bXxgia4TSa7Ko8/utd/e3T8BAeD0ur3G+ClBKWU5S4b8/5yHcW2wkHb8/jm7uPLA6RBRd6R6XG8xKy0jR2yUSE/5TDtTftDZFKXzzxSL9Ei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722134004; c=relaxed/simple;
	bh=dvLYb2AwjmxROoaz81uFJ5THSLzFLGjVRrpOpr4/xIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmwjBB8X7Y3EJuPVJPgIhwjIjxG8x1D20BNvz8HlGYfoHRiduVK9NbUKTzsqm+Q0MZPZLl9hrA1Gf3rPGLBFeZIN2oXHeKEB0gLlWFGW+DcuFZd6zFw+QJVBOL8XvRolLu5eHyktWeRZtODGMVmvT8lCIxPVycHiLDieEv/3/AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWYY1JO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF16C4AF0C;
	Sun, 28 Jul 2024 02:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722134004;
	bh=dvLYb2AwjmxROoaz81uFJ5THSLzFLGjVRrpOpr4/xIQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sWYY1JO2TwB0Cg6/ZQiz90RAdgAul5x+S86ZarZXdT+wFisp0SVUUvUHeMWRgF7/S
	 V81/7RKwDFZj3G45dsYBUtrM/DYV9ZSfOAU2Xe/odkAn1RfCS/lanAzNQcRBVgQfEX
	 mWIi2/Awt9Q3GtnNYIT5bltTJdCvRJjhdui1NXwuryv/9sKwuJPQZqVBmgwMuHMY0o
	 iLGf9kb8GzgpPEr14yM5sFdLVVP8lDBNACuT1q7hf9Ra2ODFqcB/oS8YM7mGSH5pa4
	 qxoq3O8zZq30wk4CZz+4u9oizw8qORAeQEKCsDUA4hG4Mi8dL4cazYfKR6AyhT46Up
	 KdHVGHica/6FA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso30679511fa.2;
        Sat, 27 Jul 2024 19:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOc5kW80gsOcYnVTUfANaZJByysv7Xwuy7pse98PBGA50ODsOTWW6b5NpnZZnXbbgdcUGfNEy9QJNqvNn8UchIhLdoPfkXSnFodFlxufDbySIWlomygaR7+h+efa9UjkT7BX478h4nFzpJu8F4/GirSPzmnc+SvJaQuS/98QczI6ER
X-Gm-Message-State: AOJu0Yzav/Iya+Ddgg/l/ionLYjgOubaeWJHW1QF3Xyfiu0qAqCZXAAP
	z5ke1IQgNCv69l+ZWu7UcJ9HidSel7LThXfzs1B6cPHf2CRlFdYcQk2d6gd6pdbzRyAqqVEal7o
	WoIIdWKr5J6wtLdpCYLJp4pep9V8=
X-Google-Smtp-Source: AGHT+IF59mcPwmvHW5QIoNaU+VzASfC7TmJjeT9xXOw59vY0+rH1OwuY+pAGrYokLOLpn1+H+PfOljD/LCA+qPuGRKc=
X-Received: by 2002:a05:6512:3611:b0:52c:dd3d:85af with SMTP id
 2adb3069b0e04-5309b27a53emr2456906e87.25.1722134002858; Sat, 27 Jul 2024
 19:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
In-Reply-To: <20240726-fix-x86-stack-protector-tests-v1-1-a30fe80e8925@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jul 2024 11:32:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdVHz4961=NWxiXuxj-wEFozLMaXivBwse96PVO=49LA@mail.gmail.com>
Message-ID: <CAK7LNASdVHz4961=NWxiXuxj-wEFozLMaXivBwse96PVO=49LA@mail.gmail.com>
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
>
> Perhaps this is an issue in the clang commit mentioned in the message
> above since it deviates from GCC (Fangrui is on CC here) but I think the
> combination of these options is a little dubious to begin with, hence
> this change.


I agree.

I can offer to pick up this to kbuild/fixes.


If this goes somewhere else,
Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


> ---
>  scripts/gcc-x86_32-has-stack-protector.sh | 2 +-
>  scripts/gcc-x86_64-has-stack-protector.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/gcc-x86_32-has-stack-protector.sh b/scripts/gcc-x86_=
32-has-stack-protector.sh
> index 825c75c5b715..9459ca4f0f11 100755
> --- a/scripts/gcc-x86_32-has-stack-protector.sh
> +++ b/scripts/gcc-x86_32-has-stack-protector.sh
> @@ -5,4 +5,4 @@
>  # -mstack-protector-guard-reg, added by
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D81708
>
> -echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -m32 -O0=
 -fstack-protector -mstack-protector-guard-reg=3Dfs -mstack-protector-guard=
-symbol=3D__stack_chk_guard - -o - 2> /dev/null | grep -q "%fs"
> +echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -m32 -O0 -f=
stack-protector -mstack-protector-guard-reg=3Dfs -mstack-protector-guard-sy=
mbol=3D__stack_chk_guard - -o - 2> /dev/null | grep -q "%fs"
> diff --git a/scripts/gcc-x86_64-has-stack-protector.sh b/scripts/gcc-x86_=
64-has-stack-protector.sh
> index 75e4e22b986a..f680bb01aeeb 100755
> --- a/scripts/gcc-x86_64-has-stack-protector.sh
> +++ b/scripts/gcc-x86_64-has-stack-protector.sh
> @@ -1,4 +1,4 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
>
> -echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -m64 -O0=
 -mcmodel=3Dkernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q=
 "%gs"
> +echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -m64 -O0 -m=
cmodel=3Dkernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%=
gs"
>
> ---
> base-commit: 1722389b0d863056d78287a120a1d6cadb8d4f7b
> change-id: 20240726-fix-x86-stack-protector-tests-b542b1b9416b
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Best Regards
Masahiro Yamada

