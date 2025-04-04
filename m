Return-Path: <linux-kbuild+bounces-6402-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73388A7B8F3
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 10:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F2AD3ADF87
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 08:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19A6190462;
	Fri,  4 Apr 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mztqQV12"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A702D18B463;
	Fri,  4 Apr 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755601; cv=none; b=X54I0ruiTgJfiAFH9kuyU4Xnif4HXFmvOerZXo7siylbQQMR8FqpH0lt6CBTrqqhvD5Vxl5/nXTqrpXHUwNA1lfAWV5vogVzwx9Ce4BuMHAOV7oEdKUlhu6i9q8KX6iWvA1Rqa2cINVXsRnH/vFg5/2PSkwUY9+f42e+j+cGwVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755601; c=relaxed/simple;
	bh=y1JfU3/JoaxSHCn/U0NYNOAABCIr8CbkptpxzLbR11c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ST29vgN9oAs4gYBd2IYeCgkQisw4M53wg9EAnr/azU8WaC+AGJspjJWm1Xhfrcn14GkqRDNUuQ7jChZJGcfodY5hDoqh/f0usYdDXSadJ6jTOahZXVF2no8aYuT5sRIr7cuZRM9tMTnnCJPZR/HpbWMdmCyHafJsSxWKbDEMVrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mztqQV12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B821C4CEDD;
	Fri,  4 Apr 2025 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743755601;
	bh=y1JfU3/JoaxSHCn/U0NYNOAABCIr8CbkptpxzLbR11c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mztqQV125JbRWALt5htTuj9OXF/xE5+kyxw/5VvL/wtzY9W9pwTRC6nyDzZw+6cs9
	 1Z7AoHYKGijBBBgd/CSuIDz+uzxjjKAJA2Ru0c9oNXmDrYl2m7JhhygkGmeFtCwNuR
	 CvvLqHwAx3dNRvxn+int6sZxVGgtA1wIXIVjws9ys7NJRLbrdSsdvjyOU342ff1mGR
	 quwSAdeSzF3kwFYn9JyETxFlSrNiBt+8wKlPuEo0N/lUvE1Ws4nrtpZuxeMB0/2sFt
	 LFODiNFuTy/b79KfOaAGVRf4xc44vmFJU/8yAPar2x0GKmWWK1lkfHMPqJHdto8Yzr
	 7T/PPQfr1huCQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so1960809e87.1;
        Fri, 04 Apr 2025 01:33:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUElh3IMASvE7zX33Y+2VMGzG8U7TFLmbvExC0Cb0LsI5J5Ob8nWw7JKCv+C7yIWUfkJLQB3B6/0HiSrA8j@vger.kernel.org, AJvYcCUVQG4kpIjm6MXyeghvZ8YVgSQzu2bs7DjL7h58yr2zeC4FZiKMrNTYs64qUCGwqBNbBpZCjHu4hhu3HOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHX3mr7yaYIdmblcPd+j6ecEG99yrNDb17Pn4JQJCTvfs8qgi
	9CfAZDWDMgl6ZQ6wMkQytKzmtuiFRssFojhEWLlTZ2X7Uj8v20qViPVfQ7zrv1hi9Rx5xzzAdCP
	U8EGOawHOXOkRzXCVY7DvyXyZi50=
X-Google-Smtp-Source: AGHT+IFRrBP/La+jpbM1fD1/Ql5J5r2JDnyokkCQmtIdTYzZIsH4W1MX/ASedmmxMsHd49K0otRSzivXgHoADsOhB2o=
X-Received: by 2002:a05:651c:146e:b0:30b:b956:53e5 with SMTP id
 38308e7fff4ca-30f0a118fa3mr6771721fa.12.1743755599733; Fri, 04 Apr 2025
 01:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-debuginfo-v2-1-fb460999a5b3@purestorage.com>
In-Reply-To: <20250331-debuginfo-v2-1-fb460999a5b3@purestorage.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 4 Apr 2025 17:32:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNASo3uQ1BRDKy0JSiQdzkaH4DTa88aAGshUrDEXSUeRXxg@mail.gmail.com>
X-Gm-Features: AQ5f1Jpzuam8FQm3KFwHGvqS1DchsEYndDcMKm4g_N_zpDdD_jUqwJa0W7PAY1A
Message-ID: <CAK7LNASo3uQ1BRDKy0JSiQdzkaH4DTa88aAGshUrDEXSUeRXxg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rpm-pkg: build a debuginfo RPM
To: Uday Shankar <ushankar@purestorage.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 7:46=E2=80=AFAM Uday Shankar <ushankar@purestorage.c=
om> wrote:
>
> The rpm-pkg make target currently suffers from a few issues related to
> debuginfo:
> 1. debuginfo for things built into the kernel (vmlinux) is not available
>    in any RPM produced by make rpm-pkg. This makes using tools like
>    systemtap against a make rpm-pkg kernel impossible.
> 2. debug source for the kernel is not available. This means that
>    commands like 'disas /s' in gdb, which display source intermixed with
>    assembly, can only print file names/line numbers which then must be
>    painstakingly resolved to actual source in a separate editor.
> 3. debuginfo for modules is available, but it remains bundled with the
>    .ko files that contain module code, in the main kernel RPM. This is a
>    waste of space for users who do not need to debug the kernel (i.e.
>    most users).
>
> Address all of these issues by additionally building a debuginfo RPM
> when the kernel configuration allows for it, in line with standard
> patterns followed by RPM distributors. With these changes:
> 1. systemtap now works (when these changes are backported to 6.11, since
>    systemtap lags a bit behind in compatibility), as verified by the
>    following simple test script:
>
>    # stap -e 'probe kernel.function("do_sys_open").call { printf("%s\n", =
$$parms); }'
>    dfd=3D0xffffffffffffff9c filename=3D0x7fe18800b160 flags=3D0x88800 mod=
e=3D0x0
>    ...
>
> 2. disas /s works correctly in gdb, with source and disassembly
>    interspersed:
>
>    # gdb vmlinux --batch -ex 'disas /s blk_op_str'
>    Dump of assembler code for function blk_op_str:
>    block/blk-core.c:
>    125     {
>       0xffffffff814c8740 <+0>:     endbr64
>
>    127
>    128             if (op < ARRAY_SIZE(blk_op_name) && blk_op_name[op])
>       0xffffffff814c8744 <+4>:     mov    $0xffffffff824a7378,%rax
>       0xffffffff814c874b <+11>:    cmp    $0x23,%edi
>       0xffffffff814c874e <+14>:    ja     0xffffffff814c8768 <blk_op_str+=
40>
>       0xffffffff814c8750 <+16>:    mov    %edi,%edi
>
>    126             const char *op_str =3D "UNKNOWN";
>       0xffffffff814c8752 <+18>:    mov    $0xffffffff824a7378,%rdx
>
>    127
>    128             if (op < ARRAY_SIZE(blk_op_name) && blk_op_name[op])
>       0xffffffff814c8759 <+25>:    mov    -0x7dfa0160(,%rdi,8),%rax
>
>    126             const char *op_str =3D "UNKNOWN";
>       0xffffffff814c8761 <+33>:    test   %rax,%rax
>       0xffffffff814c8764 <+36>:    cmove  %rdx,%rax
>
>    129                     op_str =3D blk_op_name[op];
>    130
>    131             return op_str;
>    132     }
>       0xffffffff814c8768 <+40>:    jmp    0xffffffff81d01360 <__x86_retur=
n_thunk>
>    End of assembler dump.
>
> 3. The size of the main kernel package goes down substantially,
>    especially if many modules are built (quite typical). Here is a
>    comparison of installed size of the kernel package (configured with
>    allmodconfig, dwarf4 debuginfo, and module compression turned off)
>    before and after this patch:
>
>    # rpm -qi kernel-6.13* | grep -E '^(Version|Size)'
>    Version     : 6.13.0postpatch+
>    Size        : 1382874089
>    Version     : 6.13.0prepatch+
>    Size        : 17870795887
>
>    This is a ~92% size reduction.
>
> Note that a debuginfo package can only be produced if the following
> configs are set:
> - CONFIG_DEBUG_INFO=3Dy
> - CONFIG_MODULE_COMPRESS=3Dn
> - CONFIG_DEBUG_INFO_SPLIT=3Dn
>
> The first of these is obvious - we can't produce debuginfo if the build
> does not generate it. The second two requirements can in principle be
> removed, but doing so is difficult with the current approach, which uses
> a generic rpmbuild script find-debuginfo.sh that processes all packaged
> executables. If we want to remove those requirements the best path
> forward is likely to add some debuginfo extraction/installation logic to
> the modules_install target (controllable by flags). That way, it's
> easier to operate on modules before they're compressed, and the logic
> can be reused by all packaging targets.
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
> Changes in v2:
> - Check config requirements more explicitly (Masahiro Yamada)
> - Ensure modules stay non-executable (Masahiro Yamada)
> - Always combine debuginfo and debugsource package
> - Link to v1: https://lore.kernel.org/r/20250210-debuginfo-v1-0-368feb582=
92a@purestorage.com
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/package/kernel.spec | 46 +++++++++++++++++++++++++++++++++++++++=
++++--
>  scripts/package/mkspec      | 10 ++++++++++
>  2 files changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index ac3e5ac01d8a4daa031bc9e70b792a68f74c388b..726f34e1196018165adf35093=
3a5f816faeeef0b 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -2,8 +2,6 @@
>  %{!?_arch: %define _arch dummy}
>  %{!?make: %define make make}
>  %define makeflags %{?_smp_mflags} ARCH=3D%{ARCH}
> -%define __spec_install_post /usr/lib/rpm/brp-compress || :
> -%define debug_package %{nil}
>
>  Name: kernel
>  Summary: The Linux Kernel
> @@ -46,6 +44,36 @@ This package provides kernel headers and makefiles suf=
ficient to build modules
>  against the %{version} kernel package.
>  %endif
>
> +%if %{with_debuginfo}
> +# list of debuginfo-related options taken from distribution kernel.spec
> +# files
> +%undefine _include_minidebuginfo
> +%undefine _find_debuginfo_dwz_opts
> +%undefine _unique_build_ids
> +%undefine _unique_debug_names
> +%undefine _unique_debug_srcs
> +%undefine _debugsource_packages
> +%undefine _debuginfo_subpackages
> +%global _find_debuginfo_opts -r
> +%global _missing_build_ids_terminate_build 1
> +%global _no_recompute_build_ids 1
> +%{debug_package}
> +%endif
> +# some (but not all) versions of rpmbuild emit %%debug_package with
> +# %%install. since we've already emitted it manually, that would cause
> +# a package redefinition error. ensure that doesn't happen
> +%define debug_package %{nil}
> +
> +# later, we make all modules executable so that find-debuginfo.sh strips
> +# them up. but they don't actually need to be executable, so remove the
> +# executable bit, taking care to do it _after_ find-debuginfo.sh has run
> +%define __spec_install_post \
> +       %{?__debug_package:%{__debug_install_post}} \
> +       %{__arch_install_post} \
> +       %{__os_install_post} \
> +       find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type=
 f \\\
> +               | xargs --no-run-if-empty chmod u-x
> +
>  %prep
>  %setup -q -n linux
>  cp %{SOURCE1} .config
> @@ -89,8 +117,22 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot=
}/lib/modules/%{KERNELRELEA
>         echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
>  } > %{buildroot}/kernel.list
>
> +# make modules executable so that find-debuginfo.sh strips them. this
> +# will be undone later in %%__spec_install_post
> +find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \
> +       | xargs --no-run-if-empty chmod u+x
> +
> +%if %{with_debuginfo}
> +# copying vmlinux directly to the debug directory means it will not get
> +# stripped (but its source paths will still be collected + fixed up)
> +mkdir -p %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
> +cp vmlinux %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
> +%endif
> +
>  %clean
>  rm -rf %{buildroot}
> +rm -f debugfiles.list debuglinks.list debugsourcefiles.list debugsources=
.list \
> +       elfbins.list
>
>  %post
>  if [ -x /usr/bin/kernel-install ]; then
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index 4dc1466dfc815c110eb7206f83dd874b17f5170f..c7375bfc25a9ad3ae98c08827=
3bd76375ea6962e 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -23,6 +23,16 @@ else
>  echo '%define with_devel 0'
>  fi
>
> +# debuginfo package generation uses find-debuginfo.sh under the hood,
> +# which only works on uncompressed modules that contain debuginfo
> +if grep -q CONFIG_DEBUG_INFO=3Dy include/config/auto.conf &&
> +   (! grep -q CONFIG_MODULE_COMPRESS=3Dy include/config/auto.conf) &&
> +   (! grep -q CONFIG_DEBUG_INFO_SPLIT=3Dy include/config/auto.conf); the=
n
> +echo '%define with_debuginfo %{?_without_debuginfo: 0} %{?!_without_debu=
ginfo: 1}'
> +else
> +echo '%define with_debuginfo 0'
> +fi
> +
>  cat<<EOF
>  %define ARCH ${ARCH}
>  %define KERNELRELEASE ${KERNELRELEASE}
>
> ---
> base-commit: 2c8725c1dca3de043670b38592b1b43105322496
> change-id: 20250209-debuginfo-cd3d9417af21
>
> Best regards,
> --
> Uday Shankar <ushankar@purestorage.com>
>
>


--=20
Best Regards
Masahiro Yamada

