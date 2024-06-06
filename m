Return-Path: <linux-kbuild+bounces-2019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E758FF4C8
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 20:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2841F2142B
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 18:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF7547A62;
	Thu,  6 Jun 2024 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULf0WGTz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AEA45C06;
	Thu,  6 Jun 2024 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717698857; cv=none; b=SjUlW5+yrh2jF1q8k6V2T6B9eTG17rypV2WFj+s9DhOGjgcLDpQiprD/zUKTv6F8sfX2SRA+iFKSosyOruqQroKHw0ImqwmXtR0NovYH1sumidBGp2xar8iZybJTzF0TlrARCcnjUNAAbU3QULYPh/gFiz+gEKGXdEhq8Vf1yfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717698857; c=relaxed/simple;
	bh=eLA3hGrikxSjRA0dX5ZlSKkNK5iKwOp6dxliFmBtumA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bljIxg/Ddakrghg/MHoJELHWee9jY8Nmh2xYEC+Xu0pZ+9vx0sAyUhadPGH+Apzz9T0jfO/ThJ8GHUcOr/KVEnmrATWuEFvH9vVRGxiX2o1IhVhHmf0h/U4ro6x3SN/zrfqOrlr+mqT0AYtGFX0zm4fDhv5KI5TGQLix+ViiEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULf0WGTz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF624C4AF08;
	Thu,  6 Jun 2024 18:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717698856;
	bh=eLA3hGrikxSjRA0dX5ZlSKkNK5iKwOp6dxliFmBtumA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ULf0WGTz0swzxQgOAhaYK+hyN5nKqiIblIJujeFu3gROjfwyUwBRyl0PITl1ZJz6B
	 czxSEejDvqR2/gCq2KAEG4MjoRNiQlkrXXb8BL1CNeGnNQzjEI7jgfS2VNuVZa/kOE
	 qmghczPgsyvRxmwLaOcMwK/zJQjnGdKQB53MfN3srzCZfHI6VW4JJiL0LbVrcAuAwW
	 saIVECwUxHqPLLmkAlVSo13GeMRC3NitPhWL8oIVS5iHQd8UgYIeO3k6aFl/oqgdzu
	 XLl90ErlfLehFqZxc6IHmwPRdtWJ80l2okiBtlJ5IDgvFLxmJnZEJPhmYl1XLs97K6
	 rzhVdHKAa5VNw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso13546981fa.2;
        Thu, 06 Jun 2024 11:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLyaFIGGvtg0oRBiHUIrRYQtfC+0HVmDqtzrb0JRdL77xqIJ5Sxe+7KHfywxLX9fvUB/kF8o6xAhKkRbZqDHMvnh+4SKXE8DMhxMqPmdtlbe0c+PmZvnWY6lka4bgK5mP0Mls6HeiIefOn
X-Gm-Message-State: AOJu0YzKzyFGGqXmAh1GtDMaYbEWPl7dQqg+an9Cpbv3xXYHBWD7F5+6
	xVz+Y5a9RgjNzh+AiGTvBP5V50KMzS5+PTGhDp5aHe3XigmrJbuJBvGHaiNKjKsTkEYGCEqM0Jy
	WhSe/4ywGJUbM/47ALoq9mdKlCck=
X-Google-Smtp-Source: AGHT+IGmR5hJAgJwzgLflbgZnFKyK2gSaisKSeqI/RO1KbxRjDAVMP2L6QGVJbgbifcrb9x1Q49GG4+1eM9c+JmRo30=
X-Received: by 2002:a2e:b00d:0:b0:2ea:7d38:d4a9 with SMTP id
 38308e7fff4ca-2eadce83856mr3349231fa.52.1717698855540; Thu, 06 Jun 2024
 11:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606124705.822451-1-illevi@habana.ai> <171767982099.22567.196132369501507254@a6498e030952>
 <efbt3hl22g73r3372agpzowfejrpxzvaiqu2ysscntwa6dtioe@2ao55jz262rs>
In-Reply-To: <efbt3hl22g73r3372agpzowfejrpxzvaiqu2ysscntwa6dtioe@2ao55jz262rs>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 7 Jun 2024 03:33:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYmmNj2bmQru22BiOFFbCmAaQ0ohmjyogOUsQmBc+4fw@mail.gmail.com>
Message-ID: <CAK7LNATYmmNj2bmQru22BiOFFbCmAaQ0ohmjyogOUsQmBc+4fw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EHooks=3A_failure_for_drm=2Fxe=2Firq=3A_remove_xe=5F?=
	=?UTF-8?Q?irq=5Fshutdown?=
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Ilia Levi <illevi@habana.ai>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 2:02=E2=80=AFAM Lucas De Marchi <lucas.demarchi@inte=
l.com> wrote:
>
> Cc'ing kbuild + lkml and maintainers.
>
> On Thu, Jun 06, 2024 at 01:17:00PM GMT, Patchwork wrote:
> >=3D=3D Series Details =3D=3D
> >
> >Series: drm/xe/irq: remove xe_irq_shutdown
> >URL   : https://patchwork.freedesktop.org/series/134565/
> >State : failure
> >
> >=3D=3D Summary =3D=3D
> >
> >run-parts: executing /workspace/ci/hooks/00-showenv
> >+ export
> >+ grep -Ei '(^|\W)CI_'
> >declare -x CI_KERNEL_BUILD_DIR=3D"/workspace/kernel/build64-default"
> >declare -x CI_KERNEL_SRC_DIR=3D"/workspace/kernel"
> >declare -x CI_TOOLS_SRC_DIR=3D"/workspace/ci"
> >declare -x CI_WORKSPACE_DIR=3D"/workspace"
> >run-parts: executing /workspace/ci/hooks/10-build-W1
> >+ SRC_DIR=3D/workspace/kernel
> >+ RESTORE_DISPLAY_CONFIG=3D0
> >+ '[' -n /workspace/kernel/build64-default ']'
> >+ BUILD_DIR=3D/workspace/kernel/build64-default
> >+ cd /workspace/kernel
> >++ nproc
> >+ make -j48 O=3D/workspace/kernel/build64-default modules_prepare
> >make[1]: Entering directory '/workspace/kernel/build64-default'
> >  GEN     Makefile
> >  UPD     include/generated/compile.h
> >  UPD     include/config/kernel.release
> >mkdir -p /workspace/kernel/build64-default/tools/objtool && make O=3D/wo=
rkspace/kernel/build64-default subdir=3Dtools/objtool --no-print-directory =
-C objtool
> >  UPD     include/generated/utsrelease.h
> >  HOSTCC  /workspace/kernel/build64-default/tools/objtool/fixdep.o
> >  CALL    ../scripts/checksyscalls.sh
> >  HOSTLD  /workspace/kernel/build64-default/tools/objtool/fixdep-in.o
> >  LINK    /workspace/kernel/build64-default/tools/objtool/fixdep
> >  INSTALL libsubcmd_headers
> >  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/exec=
-cmd.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/help=
.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/page=
r.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/pars=
e-options.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/run-=
command.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/sigc=
hain.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/subc=
md-config.o
> >  LD      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libs=
ubcmd-in.o
> >  AR      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libs=
ubcmd.a
> >  CC      /workspace/kernel/build64-default/tools/objtool/weak.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/check.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/special.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.=
o
> >  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/speci=
al.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decod=
e.o
> >  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/orc.o
> >  LD      /workspace/kernel/build64-default/tools/objtool/arch/x86/objto=
ol-in.o
> >  LD      /workspace/kernel/build64-default/tools/objtool/objtool-in.o
> >  LINK    /workspace/kernel/build64-default/tools/objtool/objtool
> >make[1]: Leaving directory '/workspace/kernel/build64-default'
> >++ nproc
> >+ make -j48 O=3D/workspace/kernel/build64-default M=3Ddrivers/gpu/drm/xe=
 W=3D1
> >make[1]: Entering directory '/workspace/kernel/build64-default'
> >../scripts/Makefile.build:41: drivers/gpu/drm/xe/Makefile: No such file =
or directory




This is because b1992c3772e6 stopped adding VPATH for external module build=
s.

You can manually add it, though.



$ make -j48 O=3D/workspace/kernel/build64-default M=3Ddrivers/gpu/drm/xe
W=3D1 VPATH=3D$(pwd)


will work like before.







>
> This started happening since commit b1992c3772e6 ("kbuild: use $(src)
> instead of $(srctree)/$(src) for source directory"). For context: after
> building the entire kernel our CI tries to build just the xe module with
> additional CFLAGS... in this case by passing W=3D1.
>
> Trying to build just xe.ko by path doesn't work:
>
>         make O=3Dbuild64 W=3D1 drivers/gpu/drm/xe/xe.ko
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> ERROR: modpost: "ttm_bo_vm_dummy_page" [drivers/gpu/drm/xe/xe.ko] undefin=
ed!
> ERROR: modpost: "drm_mode_is_420_also" [drivers/gpu/drm/xe/xe.ko] undefin=
ed!
> ERROR: modpost: "drm_dp_downstream_max_dotclock" [drivers/gpu/drm/xe/xe.k=
o] undefined!
> ERROR: modpost: "drm_dp_mst_topology_mgr_set_mst" [drivers/gpu/drm/xe/xe.=
ko] undefined!
> ERROR: modpost: "drm_atomic_state_init" [drivers/gpu/drm/xe/xe.ko] undefi=
ned!
> ERROR: modpost: "drm_atomic_set_fb_for_plane" [drivers/gpu/drm/xe/xe.ko] =
undefined!
> ERROR: modpost: "drm_dp_remove_payload_part2" [drivers/gpu/drm/xe/xe.ko] =
undefined!
> ERROR: modpost: "drm_dp_channel_eq_ok" [drivers/gpu/drm/xe/xe.ko] undefin=
ed!
> ERROR: modpost: "drm_dp_downstream_debug" [drivers/gpu/drm/xe/xe.ko] unde=
fined!
> ERROR: modpost: "drm_modeset_lock_all_ctx" [drivers/gpu/drm/xe/xe.ko] und=
efined!
> WARNING: modpost: suppressed 507 unresolved symbol warnings because there=
 were too many)
> make[3]: *** [../scripts/Makefile.modpost:145: Module.symvers] Error 1
> make[2]: *** [/home/lucas/p/linux-dim/src/Makefile:1916: single_modules] =
Error 2
> make[1]: *** [/home/lucas/p/linux-dim/src/Makefile:240: __sub-make] Error=
 2
> make[1]: Leaving directory '/home/lucas/p/linux-dim/src/build64'
> make: *** [Makefile:240: __sub-make] Error 2



If you build a single module, modpost cannot resolve references to
other modules.

KBUILD_MODPOST_WARN=3D1 turns the errors into warnings, though.


$ make O=3D/tmp/abc  drivers/gpu/drm/xe/xe.ko KBUILD_MODPOST_WARN=3D1





> Alternatives that seem to work:
>
> 1) pass the absolute path to M=3D:
>
>         make O=3Dbuild64 W=3D1 M=3D$PWD/drivers/gpu/drm/xe/


This is a simpler solution than VPATH=3D$(pwd)



>
> 2) just pass the directory:
>
>         make O=3Dbuild64 W=3D1 drivers/gpu/drm/xe/
>
> I think we avoided (2) due to it not working if we were building commit
> by commit and something touched things outside xe. But for this current
> use case it seems it's the more correct approach since Makefile says:
>
>         # Use make M=3Ddir or set the environment variable KBUILD_EXTMOD =
to specify the
>         # directory of external module to build. Setting M=3D takes prece=
dence.


I agree.
If you are only interested in extra compiler warnings,
you do not need to link the final *.ko file.











>
> Lucas De Marchi
>
> >make[3]: *** No rule to make target 'drivers/gpu/drm/xe/Makefile'.  Stop=
.
> >make[2]: *** [/workspace/kernel/Makefile:1934: drivers/gpu/drm/xe] Error=
 2
> >make[1]: Leaving directory '/workspace/kernel/build64-default'
> >make[1]: *** [/workspace/kernel/Makefile:240: __sub-make] Error 2
> >make: *** [Makefile:240: __sub-make] Error 2
> >run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2
> >
> >



--=20
Best Regards
Masahiro Yamada

