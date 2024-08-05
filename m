Return-Path: <linux-kbuild+bounces-2811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543A947529
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 08:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BD89B20C09
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 06:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD431DFF7;
	Mon,  5 Aug 2024 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrAqV/XN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEF712B6C;
	Mon,  5 Aug 2024 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722838833; cv=none; b=ClJqANP4cJ5zeP1HGRQY3uFqXDFW/ohS/gv37BpjlLDMYki2ibnLTUMCu/vluN3NjJFm5jk+TmD8GLkLLnj7wyeGwBXev/MV+emrCWi8hAluqiMp5gfCcn/LWyAq2GhFsBBuOKh7Oq7KnWt6leq0Ktv4qIb/7g1IhJq/POvhBdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722838833; c=relaxed/simple;
	bh=NLQXuoTIOgBPBTB1o0UJlD/+CtpmcL+Z9C/EElt5I0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPapIve8dzkl1R4BS1CpUZyZ7N+Y+mvt3L+B7p8pDe/EU57dJFjnxQ+nAbpB+HGwKO2a8fsG6zntf8QbZk2ftW4ha/aN8sABBzIBSvNvU2GZOT5wsiTaCCr3TsPxq5NYiNTi/bgPKUkjfzMMfWNCJ+iwAk+50FGp66kdXM1LqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrAqV/XN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E82C4AF0E;
	Mon,  5 Aug 2024 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722838832;
	bh=NLQXuoTIOgBPBTB1o0UJlD/+CtpmcL+Z9C/EElt5I0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZrAqV/XNE13sbvJsOTVzGCpymzc8nC2p2lPCCIK7se4m+O+QngJVdjiVkaepeURB3
	 WiXrYXrG+CcDqFUzHdF0NJZmnqIze4uadkkDWU/PKD3Hqo2oU3GmR9Yc2tr6B5bG8b
	 UnQs1CS1MBfW90MqI/RABZHenMPRcHIxDFWIPLCXm3CxS+KTXRe5kC6L3PFGgkGvtW
	 10fSxN4JR5PO2u3Ck3Ot95Da+iSRSx6ErewRkq6dgAA2zdtWORRFJDwxoY8hao38T4
	 nZnBSs2d5CMtP/t/6FbVk6g+i1ChVZG7SqU6Z/T5Uk7uuknGwgUbQgR+iV85wutJam
	 OCzUxPkIoS2vg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso10093744e87.3;
        Sun, 04 Aug 2024 23:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWItEBWexH07IOdP2go3YgE9PBzeM/1mXwI0FTTingdfL1P7Fk8JOB4YwjQdE8un2gY3LSq7a5cpZKkSYAmNgqRwYQimgWJIZIUU1DKvDuJnT/2b5VfgRUkCk6jCWHJCRpHoIAXchCSdsMD
X-Gm-Message-State: AOJu0YxmoiAMPqYWzVgE/RRMweqdT4q+T4oOtK6xBg0xwgmal2Jh33zU
	DNqx5mh1wYWCju6otwHliU4g2VyxS6LPjoOpw4vT0KMoaSQfqC3oyvRqijshVCxTjjUZhfs5y3o
	pk5+JNSfuXm4WpbXga2suVejrJJ4=
X-Google-Smtp-Source: AGHT+IGZKS9zFzDzUdZrC3M3I+4q9ALgEMI9icHZxftrBAvP+h6Qu+bP+WbdxH5Tw+TdphfZdzmX84nUC31gNPEIRVk=
X-Received: by 2002:a05:6512:683:b0:52e:9f1b:517 with SMTP id
 2adb3069b0e04-530bb38c9dfmr9153742e87.25.1722838831545; Sun, 04 Aug 2024
 23:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240804055057.262682-1-gnurou@gmail.com>
In-Reply-To: <20240804055057.262682-1-gnurou@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 5 Aug 2024 15:19:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARHRjP0E-5GLJCWqyQHRURrJBgZO174thdokb5taW+qiQ@mail.gmail.com>
Message-ID: <CAK7LNARHRjP0E-5GLJCWqyQHRURrJBgZO174thdokb5taW+qiQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: add $(srctree) to dependency of
 compile_commands.json target
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 2:51=E2=80=AFPM Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>
> When trying to build the compile_commands.json target from an external
> module's directory, the following error is displayed:


As I mentioned in v1, this issue only happens when using the kernel
directory built in a separate output directory (O=3D).

Unless you have a opposition, I will reword this sentence as follows:

When trying to build compile_commands.json for an external module
against the kernel built in a separate output directory, the following
error is displayed:






>
>         make[1]: *** No rule to make target 'scripts/clang-tools/gen_comp=
ile_commands.py',
>         needed by 'compile_commands.json'. Stop.
>
> This is because gen_compile_commands.py was previously looked up using a
> relative path to $(srctree), but commit b1992c3772e6 ("kbuild: use
> $(src) instead of $(srctree)/$(src) for source directory") stopped
> defining VPATH for external module builds.
>
> Prefixing gen_compile_commands.py with $(srctree) fixes the problem.
>
> Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) for=
 source directory")
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
>


--=20
Best Regards
Masahiro Yamada

