Return-Path: <linux-kbuild+bounces-2795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747189469E5
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 15:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01ED2B2104B
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 13:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2F014D28E;
	Sat,  3 Aug 2024 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATOwCuZo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A749659;
	Sat,  3 Aug 2024 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722692865; cv=none; b=gUaVWVJD3toNCqtm4bO4H3lwSi/Vv+068sLuPp+/V6WZJVC86RNgOkV2RQ3iBu4ILnR53CpeNRcomeJ4G+JdG6XmrkYU2jWUwpUZio+yGqyg4bJSsXmaF6ARPH0AOxGg/BRI4VaRm1sLhknx4vTus8kvD/mIWbHimBLvd3bMP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722692865; c=relaxed/simple;
	bh=BZf+J9P3xhGu1F+Y38BajrpKDPEIjgThvCzDJeE7SqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6IuzYXvzvCqthG+qaqoch7CIldxn7mZcZlix94IydW/9vtofhMIw4712gV9gR2lWKkQuFgE3/E92EirRAHwQmGPP/vtvWxeAevuZjHSUOUGPNg1LfLHp2Jl6+tsmWv1IGsmUjiPhh5tKDHH9bvFx7q2urH7rBoia7kbjLv/9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATOwCuZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871A0C4AF09;
	Sat,  3 Aug 2024 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722692864;
	bh=BZf+J9P3xhGu1F+Y38BajrpKDPEIjgThvCzDJeE7SqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ATOwCuZoOgw1zJXf6grKcPaDHHpBwSZlraegviNB5tyDb8bW9GBtUjGSKJijqQbIz
	 kcEwhHz5YVWkyQwnyxf2oHz4Svden6fYT2sY2ftdeloG/bTJOSzzF9qBcs4x1884Fz
	 o1SZO2Rfhe/kQ7tbwC4zuc09ZfoXpxJG2rzwEQx9tRCjU/9ejUeOXOftyOozI5hy5E
	 Fc7Im9vZfxnlf8qI/OqxA2kzexzwkSN53sKBQRQOZ2Uou89lXongptRTGTWUDC5cRE
	 E5gDbhcw4GNCdxIUOyRFfC40POqO7TKD3rGFlY5rdb7ZOseAVZOqWrZEmrYNjNa3dE
	 6KLtr/c60YBwg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52efd8807aaso13309195e87.3;
        Sat, 03 Aug 2024 06:47:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8q8zUW/Vany8GViXkG5AbKXLVsnqCBMLsmXbW07K3mv66ybwbyYI950zttx6ZaM9pso3XCAVWlKlMatF8X399i96FffLoXn2wdsxL3P/QjuxoVXpHw4dKByIBrvsx9NOXq+ABx3Y4vZQE
X-Gm-Message-State: AOJu0YzS1qhQ2r106QOohGxXD+zZ1gA4uKIKN+k/ZwRaQjd01/fJoYr/
	jxR+GhK9eOB89wNkIY2hjX7HZjibmc6SBbtRFs8GNSy+b1fuJhKVAu7Fc1VqDen5Yisx8JEr80+
	fNSszYT5Ytb32GPS5+oJSMBDePtQ=
X-Google-Smtp-Source: AGHT+IG8xP76Vy2XB1+MNTptxFgNCsuauG1HUx4DRy/VulZ7r2UUrbHzMwxe8p8+FAtDLbj18/WEL/k8P1G9i8p8ooc=
X-Received: by 2002:a05:6512:3d89:b0:52e:987f:cfe4 with SMTP id
 2adb3069b0e04-530bb396e7amr3994896e87.30.1722692863130; Sat, 03 Aug 2024
 06:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240803125153.216030-1-gnurou@gmail.com>
In-Reply-To: <20240803125153.216030-1-gnurou@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 Aug 2024 22:47:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS83xr+MUMjQXj7LE1b1ZbRUOd4c+FYHUQv=y97O4Ymqg@mail.gmail.com>
Message-ID: <CAK7LNAS83xr+MUMjQXj7LE1b1ZbRUOd4c+FYHUQv=y97O4Ymqg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add $(srctree) to dependency of
 compile_commands.json target
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 3, 2024 at 9:52=E2=80=AFPM Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>
> When trying to build the compile_commands.json target from an external
> module's directory, the following error is displayed:
>
>         make[1]: *** No rule to make target 'scripts/clang-tools/gen_comp=
ile_commands.py',
>         needed by 'compile_commands.json'. Stop.


Good catch.

But, to reproduce this, O=3D option is also needed, right?

e.g.

  $ make O=3Dpath/to/build/dir M=3Dpath/to/external/module/dir




> This appears to be because gen_compile_commands.py is looked up using
> relative path, which doesn't exist from the module's source tree.


The phrase "appears to be ..." is somewhat modest.


You can reword this to pin-point the first bad commit.


For example:

gen_compile_commands.py was previously looked up using a relative path
to $(srctree), but commit b1992c3772e6 ("kbuild: use $(src) instead of
$(srctree)/$(src) for source directory") stopped defining VPATH for
external module builds.



> Prefixing the dependency with $(srctree) fixes the problem.



This needs back-porting.


Please add this:

Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src)
for source directory")


Thanks.




> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 8ad55d6e7b60..52d7dfe4212a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1980,7 +1980,7 @@ nsdeps: modules
>  quiet_cmd_gen_compile_commands =3D GEN     $@
>        cmd_gen_compile_commands =3D $(PYTHON3) $< -a $(AR) -o $@ $(filter=
-out $<, $(real-prereqs))
>
> -$(extmod_prefix)compile_commands.json: scripts/clang-tools/gen_compile_c=
ommands.py \
> +$(extmod_prefix)compile_commands.json: $(srctree)/scripts/clang-tools/ge=
n_compile_commands.py \
>         $(if $(KBUILD_EXTMOD),, vmlinux.a $(KBUILD_VMLINUX_LIBS)) \
>         $(if $(CONFIG_MODULES), $(MODORDER)) FORCE
>         $(call if_changed,gen_compile_commands)
> --
> 2.46.0
>


--
Best Regards

Masahiro Yamada

