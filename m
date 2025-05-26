Return-Path: <linux-kbuild+bounces-7262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E797AC3C57
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 11:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2733ACE50
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 09:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF39D1E3762;
	Mon, 26 May 2025 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THVST7+O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF31D63C0;
	Mon, 26 May 2025 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250347; cv=none; b=MsBGxNhvkKLFb6bPLubOumNyWIkKct978B/IJMiYBIeQRL3VTy5I9f2bn/quJFfSymd85yt0aBALJtcuc6pDVvtfX26qgtA+JFCeGKXL2MURnOQXRbTqX7HY2iNr0WP4pnHMlghlFcUGP8xpWvBkYaO6lOWehqWEWMGJRM11iHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250347; c=relaxed/simple;
	bh=9wOnLXxDZ1Wrs3rYtiViGhzn6NOmefjdvruILugUX0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtzrXFF6VKOrKsl9w1btCAAyNHgLZUHm3s2Ge5Wsvdi8rtej/vTXKAVASZRBNIwX05hiAbE65QTS8pceVT2zMeRm2Kr8J+C6NApojGCEIYcWA4WQ0lAVhP/UdqzKQYG7JItCWYLZkNoVcuaVAqNSWcMJBaFU1feUfDGu3aHe55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THVST7+O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71403C4CEF9;
	Mon, 26 May 2025 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748250347;
	bh=9wOnLXxDZ1Wrs3rYtiViGhzn6NOmefjdvruILugUX0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=THVST7+OqS6hcwQJIQhahpJnTzgKRYCr83Ycszm4Ea6j7DWmmznU32Xc40HsHQy1K
	 7xLxsmk0Afy6gcf62l8ixFP+NtrxsVHGfJPnukE0i3hLRWA8KnO5xTjKe0n/DU/xcC
	 C0wOQmIovp5xpc8Pzw4QYsLUtnfGFMMJNNbt21s4QUR44btKn783+v0zXcSAXChzAz
	 INYcSAe93dct1j0n+BfDUwlhPd5EILmhLEGmBSgxfPFum2JQRdiKby6UsAqWScFAlJ
	 9aE1+LX/Zj+XimzkYGxNwet/E3uPTc/I7gNcNEsqt5Xmdf1h1lu1MJo1kujYRReqvR
	 aVADljZD+6Xow==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553241d30b3so477798e87.3;
        Mon, 26 May 2025 02:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjlFPAHBX30RVVI0qBWMBY7/U3mhyGIoAwleWPAEueMw5EjNG7yfvvsy/aIkl8yUAPS6wz8JOtYB/ZJmQ=@vger.kernel.org, AJvYcCWEbnUtfBh9DNwp8P7kgccXllhjr8vYrkmy7a+xs470XvaFcpYSxbZWJsfY8c/xUZ0R6wqvqECJh/xZEDRP@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgkP/g5x2pzQVBzsjD0hSbkjZCEFHFVUq6DPHPfCl95VvbaOs
	hplWUIACCd3DF6ZLbeWllqEBGfh79rZGOeveMrQm9G4VMdC38EMRahh4JS6onehBOrEiHvq58Nx
	g1idIqGNpkpXLegcnEd1js0eO4Uv9HIQ=
X-Google-Smtp-Source: AGHT+IGP1zNG8g+dyj8JR+p9XFl9imx6sdyc9r10JnXWp1rsRNGoGVcKfyiZqSpSr/Z/JXBUdoUqqMCxQDoH9kjC5UA=
X-Received: by 2002:ac2:4e06:0:b0:54d:68d3:eeec with SMTP id
 2adb3069b0e04-5521cbb5e02mr1896414e87.52.1748250345929; Mon, 26 May 2025
 02:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521213534.3159514-1-xur@google.com>
In-Reply-To: <20250521213534.3159514-1-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 26 May 2025 18:05:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6jy7FfNZqJ89UyvO4BbbbcFUne-aG3cmw58ucZWoHTg@mail.gmail.com>
X-Gm-Features: AX0GCFvxxHytwfz5OLNa5ao2UsLmkBZ8Z_9nLP-82KsHhHQz8UnPtBU5G6MI8qI
Message-ID: <CAK7LNAQ6jy7FfNZqJ89UyvO4BbbbcFUne-aG3cmw58ucZWoHTg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
To: xur@google.com
Cc: Nathan Chancellor <nathan@kernel.org>, Eric Naim <dnaim@cachyos.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 6:35=E2=80=AFAM <xur@google.com> wrote:

> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +# Generate .o_thinlto_native (obj) from .o (bitcode) file
> +# ----------------------------------------------------------------------=
-----
> +quiet_cmd_cc_o_bc =3D CC $(quiet_modtag) $@
> +
> +cmd_cc_o_bc      =3D $(if $(filter bitcode, $(shell file -b $<)),$(CC) \
> +                  $(filter-out -Wp% $(LINUXINCLUDE) %.h.gch %.h -D% \
> +                  -flto=3Dthin, $(c_flags)) \

I think this filter-out is fragile.

I think it is better to use $(_c_flags), like this:

    $(filter-out -flto=3Dthin, $(_c_flags))












> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb..9cfd23590334d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -34,8 +34,13 @@ else
>  obj-m :=3D $(filter-out %/, $(obj-m))
>  endif
>
> +builtin_suffix :=3D $(if $(filter %.a_thinlto_native, $(MAKECMDGOALS)),.=
a_thinlto_native,.a)
> +ifeq ($(thinlto_final_pass),1)
> +        builtin_suffix :=3D.a_thinlto_native
> +endif
> +
>  ifdef need-builtin
> -obj-y          :=3D $(patsubst %/, %/built-in.a, $(obj-y))
> +obj-y          :=3D $(patsubst %/, %/built-in$(builtin_suffix), $(obj-y)=
)
>  else
>  obj-y          :=3D $(filter-out %/, $(obj-y))
>  endif
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index b024ffb3e2018..f9abc45a68b36 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -9,6 +9,14 @@ include $(srctree)/scripts/Kbuild.include
>  # for objtool
>  include $(srctree)/scripts/Makefile.lib
>
> +ifeq ($(thinlto_final_pass),1)
> +vmlinux_a :=3D vmlinux.a_thinlto_native
> +vmlinux_libs :=3D $(patsubst %.a,%.a_thinlto_native,$(KBUILD_VMLINUX_LIB=
S))
> +else
> +vmlinux_a :=3D vmlinux.a
> +vmlinux_libs :=3D $(KBUILD_VMLINUX_LIBS)
> +endif
> +
>  # Generate a linker script to ensure correct ordering of initcalls for C=
lang LTO
>  # ----------------------------------------------------------------------=
-----
>
> @@ -18,7 +26,7 @@ quiet_cmd_gen_initcalls_lds =3D GEN     $@
>         $(PERL) $(real-prereqs) > $@
>
>  .tmp_initcalls.lds: $(srctree)/scripts/generate_initcall_order.pl \
> -               vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +               $(vmlinux_a) $(vmlinux_libs) FORCE
>         $(call if_changed,gen_initcalls_lds)
>
>  targets :=3D .tmp_initcalls.lds
> @@ -59,8 +67,8 @@ quiet_cmd_ld_vmlinux.o =3D LD      $@
>         $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
>         $(vmlinux-o-ld-args-y) \
>         $(addprefix -T , $(initcalls-lds)) \
> -       --whole-archive vmlinux.a --no-whole-archive \
> -       --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> +       --whole-archive $(vmlinux_a) --no-whole-archive \
> +       --start-group $(vmlinux_libs) --end-group \
>         $(cmd_objtool)
>
>  define rule_ld_vmlinux.o
> @@ -68,7 +76,7 @@ define rule_ld_vmlinux.o
>         $(call cmd,gen_objtooldep)
>  endef
>
> -vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +vmlinux.o: $(initcalls-lds) $(vmlinux_a) $(vmlinux_libs) FORCE
>         $(call if_changed_rule,ld_vmlinux.o)
>
>  targets +=3D vmlinux.o
> diff --git a/scripts/Makefile.vmlinux_thinlink b/scripts/Makefile.vmlinux=
_thinlink
> new file mode 100644
> index 0000000000000..13e4026c7d45b
> --- /dev/null
> +++ b/scripts/Makefile.vmlinux_thinlink
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +PHONY :=3D __default
> +__default: vmlinux.thinlink
> +
> +include include/config/auto.conf
> +include $(srctree)/scripts/Kbuild.include
> +
> +
> +# Generate a linker script to ensure correct ordering of initcalls for C=
lang LTO
> +# ----------------------------------------------------------------------=
-----
> +
> +quiet_cmd_gen_initcalls_lds =3D GEN     $@
> +      cmd_gen_initcalls_lds =3D \
> +       $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +       $(PERL) $(real-prereqs) > $@


This is a copy-paste from scripts/Makefile.vmlinux_o.

Is this linker script critical when generating the index file?



--=20
Best Regards
Masahiro Yamada

