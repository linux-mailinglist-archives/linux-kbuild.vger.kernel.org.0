Return-Path: <linux-kbuild+bounces-5578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0EA23EFF
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 15:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACB9A7A15EF
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 14:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559BF1C54A5;
	Fri, 31 Jan 2025 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR6ITnMP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF81B87E9
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332539; cv=none; b=i0LnzlNeJR77Bsw+qz9pwivwt0t2WI2YcQ0edDqwhp2120u5rEgR04GjFkWASqFP7RB1+oPpq4lESF/c9YUdggVUuOzy7Hu1z/CRCDxEi3+4ZYd0F9Ycpd9b5ekiSVWbYtNDTpq4kkDRn/DhQ0W3L7/LxGbohdoFAwI1tEIT9OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332539; c=relaxed/simple;
	bh=JdoDOd+Sz2DyGnWOyv3bohrx44bhd2vMDVy8VkX7+zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZDP6SyFY5LxEy7d4rvPq5ZzXV/prx5kby7MycnrSScWSm/9atXW+ae9C4ku2YbRFJWWgCC4QXcTUrOqVqdwlBB4PmLtm/+AX0yY89Jg3dv/5b0oCAWlptrZ6QfDWeB/Wz5WCQ1kPbTcWAAfF7WFrDBQlZ0xBaCXoI58R4UveaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR6ITnMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9181DC4CEE6
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738332538;
	bh=JdoDOd+Sz2DyGnWOyv3bohrx44bhd2vMDVy8VkX7+zg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OR6ITnMPB1Gee8iA7KHwjWk7N+a/pSQRzS7wEdUuYjP6NsUaYdObSgakxAF15WiCo
	 3dwRckd5poJp2dTUfR+7TpQj9am98vQ8epQi8EV1Eg3hKyk/GukLzRmd/OcfK+xT0e
	 7FWgZpNl8DVmxFzzq+KO4VKj+F6I3zJDZw8P1TpiRWovyYXcubdOW+RNKjbYLGRKEN
	 CA8RcQrLZOCtSu4QY0te1gkMT8V85ik0kVTfnmkrt5jjMAV6tKMwYccLvlqr58jd2H
	 F+kcFULTa3Q+w/XnqEllDccD+dZAtbLMm1KE2/FSO/gWlG8wv5H5FUcYFCb5yZCUdA
	 48Ui1zZziD3Dw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so2115833e87.2
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 06:08:58 -0800 (PST)
X-Gm-Message-State: AOJu0Yy8PUasxOvrvyGRkLuCTlCkyOKdowuCOdyUOTnsuiwcDSjJVWh4
	BzsJFfvQCzAmPSivWyzhUEbo6RfZFbGGcFDv3TnGBXFaTUwlsvHu0OhfiVi9yD/Z4NIPHq5L6Px
	ErFD/9Pd4Eqeu+HcF9EMUxbSOsUw=
X-Google-Smtp-Source: AGHT+IEquIz2FMWel9gLSb926T0KPyEhxAL1gxYaW3gNrvj20FSIAXW8udRQ4hswH9s7ql9IFQ1RS4qdG6EEinjznNE=
X-Received: by 2002:a05:6512:3b95:b0:542:28b7:2701 with SMTP id
 2adb3069b0e04-543e4be9bc6mr3971060e87.18.1738332537104; Fri, 31 Jan 2025
 06:08:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130222208.4109974-1-yonghong.song@linux.dev>
In-Reply-To: <20250130222208.4109974-1-yonghong.song@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 31 Jan 2025 23:08:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNASOKf=VWcgvncLqkCwq8bZOe-9y=zydJhRwy+sQr1jf=Q@mail.gmail.com>
X-Gm-Features: AWEUYZnQMXoTmSE6vj1-CnXWl3LszhEI9kDz6Oc-sSt6KupJJziJv2TAcesnfic
Message-ID: <CAK7LNASOKf=VWcgvncLqkCwq8bZOe-9y=zydJhRwy+sQr1jf=Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix lto build issue for aarch64
To: Yonghong Song <yonghong.song@linux.dev>
Cc: linux-kbuild@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, kernel-team@fb.com, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nikolay Borisov <nik.borisov@suse.com>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 7:25=E2=80=AFAM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
> Commit bede169618c6 ("kbuild: enable objtool for *.mod.o and additional k=
ernel objects")
> added objtool support for various files like *.mod.o, vmlinux.export.o, e=
tc.
> But unfortunately it also breaks lto build for aarch64 where a common sou=
rce file,
> e.g., kernel/bpf/syscall.c, is compiled with command:
>   clang ... -flto=3Dthin ... -c -o kernel/bpf/syscall.o /home/yhs/work/bp=
f-next/kernel/bpf/syscall.c  ;
>   ld.lld -EL  -maarch64elf -z norelro -mllvm -import-instr-limit=3D5 -z n=
oexecstack   \
>       -r -o kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o;
>   mv kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o
>
> The above command line completely destroyed thin-lto since file kernel/bp=
f/syscall.o
> is expected to be a llvm bitcode file and later ld.lld can do cross-file =
inlining.
>
> The issue has been reported in [1] and Masahiro actually provided a sugge=
sted fix.
> But unfortunately that suggested fix does not work.

Thanks for the report, but your patch does not fix the real issue.

I think my original [1] worked, although it was a bit redundant
(extra $(LD) is executed where it is unnecessary).


> This patch made improvement on top of [2] and the issue for aarch64 lto i=
s fixed.
> The x86_64 is also tested without any issue.

You are not fixing the issue.
You are just disabling objtool (i.e. reverting  bede169618c6).


>
> In [1], commit 1b466b29a3bf ("kbuild: re-enable KCSAN for autogenerated *=
.mod.c intermediaries")
> enabled kcsan for *.mod.c files. This patch actually disabled that.
> Should we revert commit 1b466b29a3bf as well?

No.
I do not want to revert 1b466b29a3bf.

If 1b466b29a3bf were reverted, there would be no point
in applying bede169618c6.


>
>   [1] https://lore.kernel.org/lkml/20241113234526.402738-1-masahiroy@kern=
el.org/
>   [2] https://lore.kernel.org/lkml/CAK7LNATpu5zYwx7kmaknsPGLXt8n8uCXyFpdi=
5vZeFZiBxYkGw@mail.gmail.com/
>
> Fixes: bede169618c6 ("kbuild: enable objtool for *.mod.o and additional k=
ernel objects")
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
> ---
>  scripts/Makefile.build | 2 ++
>  scripts/Makefile.lib   | 4 +---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index c16e4cf54d77..e9ae38b71a08 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -129,6 +129,8 @@ $(obj)/%.ll: $(obj)/%.c FORCE
>
>  is-single-obj-m =3D $(and $(part-of-module),$(filter $@, $(obj-m)),y)
>
> +need-ld-single =3D $(is-single-obj-m)
> +
>  ifdef CONFIG_MODVERSIONS
>  # When module versioning is enabled the following steps are executed:
>  # o compile a <file>.o from <file>.c
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 7395200538da..f04672bfe068 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -302,11 +302,9 @@ endef
>  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  # These are shared by some Makefile.* files.
>
> -objtool-enabled :=3D y
> -

This is wrong.

You are simply disabling objtool for *.mod.o

I am pretty sure the problem reported by 54babdc
will come back.


I submitted a proper fix.



>  ifdef CONFIG_LTO_CLANG
>  # objtool cannot process LLVM IR. Make $(LD) covert LLVM IR to ELF here.
> -cmd_ld_single =3D $(if $(objtool-enabled), ; $(LD) $(ld_flags) -r -o $(t=
mp-target) $@; mv $(tmp-target) $@)
> +cmd_ld_single =3D $(if $(need-ld-single), ; $(LD) $(ld_flags) -r -o $(tm=
p-target) $@; mv $(tmp-target) $@)
>  endif
>
>  quiet_cmd_cc_o_c =3D CC $(quiet_modtag)  $@
> --
> 2.43.5
>


--
Best Regards

Masahiro Yamada

