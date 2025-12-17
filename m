Return-Path: <linux-kbuild+bounces-10128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5829CC695A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 09:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBA3430D08D7
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 08:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D907334C3C;
	Wed, 17 Dec 2025 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ayUeoPQB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044C733AD8A
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959388; cv=none; b=f6O5IGMYvBXUMvqfurUSDvirjA1wBeO/QqI7GUgSldcmtvJYpIO0yNs/pjxqR2Jb8kMXHVwuGIREJO8mBq3Z4YKdKbmieCYQncHJPSWBNVCML3RAzxLYaPdLSjmcomlzfiy4ZsqYGKMmogxJzmsOkGnRw+W74FurVnljsGtJYxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959388; c=relaxed/simple;
	bh=HrmkhODKvxn4lwmEaJbddNIbNA24U3WIS4xnezDHHJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MK6AKzFVaGFRvUjv1LCE+lMTM1XvJZS8/t46NedW42m7lktWjl4tJURd6c8WTlVKjNQ3Wp4JTkz9/9P3ziXict+t2YCS9YeK7Mcsp3n5l/xwEFlnrxdO48ybrV9fTp2WKQFn+4ly0es+IgCjPQWiMRUwdwBBWKYfakoD1/zeG98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ayUeoPQB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-598f59996aaso186121e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 00:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765959374; x=1766564174; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj1Qql5Edxq3mPVTrLbdon/fewAfsgf7zjBa/vJ2SzQ=;
        b=ayUeoPQBYos90pHwSQT84NJ5mBYsuBFmzRDm1HrAF5Hxiowvlh0GplBhbIUDUDTYws
         rhYEemu/21t4mcF9Ez6D8SuegGK97T58UzH9b6GGhvw4Y6Dj76CcgIFIFo14J6ppP40n
         3Md0bzBRzzK20MaMGK75EMAluszY8d22e389LrGC49zjmGTUK0lkkNnAP2YpWft3462k
         1Y4VoBRNmbbWZ6wCd4eDKYZ1WRiRrTvTL7Cc6abiwl9QlK7JEFcYaPQHeHRCScuH3nAJ
         u6LwBqRLA2Fu9TMiI65lDObpIGS1viubQS/pTN+j7b/UuJlguuoAcwmQB3RdSu1fLs53
         tHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765959374; x=1766564174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj1Qql5Edxq3mPVTrLbdon/fewAfsgf7zjBa/vJ2SzQ=;
        b=rsxMpBptVYCLngnuaLvw50myvkBpcfCobb+6+Ga/Nkb4wke/ya8FoTdOqnJCjZ6b9h
         aQ0QTCp1u3g3JyemyaB/JYrJSTUfcWzoAasQz7t3Udw7AqrFCXX2tuvamys6UtbKAUkj
         IU2U6bAEaol6GzvO4xHBEHPY0a4GebfnoLSXAvlxKkNuw4JoSEvntQ9yYRm6xmXNABz+
         feKLk5iuE/6k3qafxNuMsXbune1pnY6ky5vprj2VG1ksGOhqkQWUSp/RkS5PZSR1Kw4O
         zmM+WZk0CZtTd2ci4xNgVgCYHUdqq5VGft0tOX4j5G6bvVj80j6e9xBbF0vtruoIfGDc
         /gFg==
X-Forwarded-Encrypted: i=1; AJvYcCXT/6QdPRlACiVMpM1IYRwRfnd5PoI2Xtzt26/X8yoMfsWTV0jZvv3tmU6yyJCr2twq26bxGJ7AdEi7JKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhH0MinhXHmgeDfA7jE5MPPNs7XxlG/KdUeh1S1n31Ilfl0JGd
	/kVu/EoqT+ARrIMsXIMkGGsrkfkyAxbAZTEQ9pueLUhHCNZCZbWwYfbeAXGiKQc2aYNrikwDpmn
	rGpvXEUeTKDQtBB3zf7/JMjgK1DLYGGvkZrRmp3AQ
X-Gm-Gg: AY/fxX7rdmH9dd0QEWhQMOqe7XlaAkLV1xzz78PEE9inPIkharRKHC/zBAHVmCgRDMa
	UTVNFtUfSk97oITq2JbvpMej2vPj+BLA1bwrL3iCoDMpOfKHQFJN+Y8qyisVUP1IGFutyxT9GLp
	6jgySKbAVMTlfjS602Xxpq8a3aUmrNEnD1/Ncolqe3BDQKcXzQET1ms3r1YVNQWt9ksw4rueeWN
	kkTWlOrLzcbMipNSum9Jgdq3zUXUoA2KPt/yQ6GwBoOez+Y7lW001wpLbnIgYmYDPME/6hN4knL
	JiL09fUgvMlqYl1GMpiprR6FkQ==
X-Google-Smtp-Source: AGHT+IHmbMl+Ifg/xTf2MvNYy6RWKFMiDTeAxP2Vw6Hn1W+hFt/ZThwMLwBYlD3X27szZcPykn66XqQ854C4d9jiLb4=
X-Received: by 2002:a05:651c:50a:b0:381:a8d:3561 with SMTP id
 38308e7fff4ca-3810a8d3699mr3173611fa.19.1765959373888; Wed, 17 Dec 2025
 00:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aS22QhwdrHN24ToD@levanger>
In-Reply-To: <aS22QhwdrHN24ToD@levanger>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Dec 2025 17:16:02 +0900
X-Gm-Features: AQt7F2pRhmBHrT3aWtxHAN-phTtkj2tBHCKo-APn2oxJ0-DhUz0HlQDbB6L6B6A
Message-ID: <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v6.19
To: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Dec 2025 at 16:38, Nicolas Schier <nsc@kernel.org> wrote:
>
> Hi Linus,
>
> please pull these update to Kbuild for v6.19.  This is my first pull
> request, so please let me know if anything is incorrect and not matching
> your standards.
>
> All changes have been in -next, most for several cycles without reported
> problems.
>
> Non-native kbuild changes are related to addition of -fms-extensions and
> a conversion example; as well as for the userspace CC_CAN_LINK addition.
>
> Thanks and kind regards,
> Nicolas
>
>
> ----------------------------------------------------------------
>
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
>
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
>
> are available in the Git repository at:
>
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.19-1
>
> for you to fetch changes up to 2a9c8c0b59d366acabb8f891e84569376f3e2709:
>
>   kbuild: add target to build a cpio containing modules (2025-11-26 21:56:14 +0100)
>
> ----------------------------------------------------------------
> Kbuild updates for v6.19
>
>   - Enable -fms-extensions, allowing anonymous use of tagged struct or
>     union in struct/union (tag kbuild-ms-extensions-6.19).  An exemplary
>     conversion patch is added here, too (btrfs).
>
>   - Introduce architecture-specific CC_CAN_LINK and flags for userprogs
>
>   - Add new packaging target 'modules-cpio-pkg' for building a initramfs
>     cpio w/ kmods
>
>   - Handle included .c files in gen_compile_commands
>
>   - Minor kbuild changes:
>     - Use objtree for module signing key path, fixing oot kmod signing
>     - Improve documentation of KBUILD_BUILD_TIMESTAMP
>     - Reuse KBUILD_USERCFLAGS for UAPI, instead of defining twice
>     - Rename scripts/Makefile.extrawarn to Makefile.warn
>     - Drop obsolete types.h check from headers_check.pl
>     - Remove outdated config leak ignore entries
>
> Signed-off-by: Nicolas Schier <nsc@kernel.org>
>
> ----------------------------------------------------------------
> Ahmad Fatoum (1):
>       initramfs: add gen_init_cpio to hostprogs unconditionally
>
> Gang Yan (1):
>       kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation
>
> Mikhail Malyshev (1):
>       kbuild: Use objtree for module signing key path
>
> Nathan Chancellor (4):
>       jfs: Rename _inline to avoid conflict with clang's '-fms-extensions'
>       kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS
>       kbuild: Rename Makefile.extrawarn to Makefile.warn
>       kbuild: uapi: Drop types.h check from headers_check.pl
>
> Nicolas Schier (3):
>       Merge tag 'kbuild-ms-extensions-6.19' into kbuild-next
>       MAINTAINERS, .mailmap: Update mail address for Nicolas Schier
>       scripts: headers_install.sh: Remove two outdated config leak ignore entries
>
> Pat Somaru (1):
>       scripts/clang-tools: Handle included .c files in gen_compile_commands

/\/\/\/\/\/\/\

This commit breaks invocation of clang tools for me.

For example I now have this fake entry for mock_uncore.c which
pretends to produce intel_uncore.o (along with 2 other commands which
produce the same object file):

  {
    "command": "clang -Wp,-MMD,drivers/gpu/drm/i915/.intel_uncore.o.d
-nostdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude
-I./include -Iarch/x86/include/uapi
-I./arch/x86/include/generated/uapi -Iinclude/uapi
-I./include/generated/uapi -include include/linux/compiler-version.h
-include include/linux/kconfig.h -include
include/linux/compiler_types.h -D__KERNEL__ --target=x86_64-linux-gnu
-fintegrated-as -Werror=unknown-warning-option
-Werror=ignored-optimization-argument -Werror=option-ignored
-Werror=unused-command-line-argument -fmacro-prefix-map== -std=gnu11
-fshort-wchar -funsigned-char -fno-common -fno-PIE
-fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
-mno-sse4a -fcf-protection=branch -fno-jump-tables -m64
-falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mstack-alignment=8
-mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone
-mcmodel=kernel -mstack-protector-guard-reg=gs
-mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare
-fno-asynchronous-unwind-tables -mretpoline-external-thunk
-mindirect-branch-cs-prefix -mfunction-return=thunk-extern
-fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2
-fstack-protector-strong -fomit-frame-pointer
-ftrivial-auto-var-init=zero -fno-stack-clash-protection
-falign-functions=16 -fstrict-flex-arrays=3 -fms-extensions
-fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall
-Wextra -Wundef -Werror=implicit-function-declaration
-Werror=implicit-int -Werror=return-type -Werror=strict-prototypes
-Wno-format-security -Wno-trigraphs -Wno-frame-address
-Wno-address-of-packed-member -Wmissing-declarations
-Wmissing-prototypes -Wframe-larger-than=2048 -Wno-gnu
-Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf
-Wno-format-truncation-non-kprintf -Wno-pointer-sign
-Wcast-function-type -Wimplicit-fallthrough -Werror=date-time
-Werror=incompatible-pointer-types -Wenum-conversion -Wunused
-Wno-unused-but-set-variable -Wno-unused-const-variable
-Wno-format-overflow -Wno-override-init -Wno-pointer-to-enum-cast
-Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access
-Wno-enum-compare-conditional -Wno-missing-field-initializers
-Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion
-Wno-sign-compare -Wno-unused-parameter -g -gdwarf-4 -Wextra -Wunused
-Wno-unused-parameter -Wmissing-format-attribute
-Wold-style-definition -Wmissing-include-dirs
-Wunused-but-set-variable -Wunused-const-variable -Wformat-overflow
-Wno-missing-field-initializers -Wno-type-limits
-Wno-shift-negative-value -Wno-sign-compare -Wformat-truncation -DI915
-Idrivers/gpu/drm/i915    -fsanitize=kernel-address -mllvm
-asan-mapping-offset=0xdffffc0000000000  -mllvm
-asan-instrumentation-with-call-threshold=10000  -mllvm -asan-stack=1
  -mllvm -asan-globals=1  -mllvm -asan-kernel-mem-intrinsic-prefix=1
-fsanitize=array-bounds -fsanitize=shift
-fsanitize-coverage=trace-pc -fsanitize-coverage=trace-cmp
-Idrivers/gpu/drm/i915 -Idrivers/gpu/drm/i915
-DKBUILD_MODFILE='\"drivers/gpu/drm/i915/i915\"'
-DKBUILD_BASENAME='\"intel_uncore\"' -DKBUILD_MODNAME='\"i915\"'
-D__KBUILD_MODNAME=i915 -c -o drivers/gpu/drm/i915/intel_uncore.o
-include linux/pm_runtime.h -include drm/drm_managed.h -include
drm/drm_print.h -include
drivers/gpu/drm/i915/display/intel_display_core.h -include
drivers/gpu/drm/i915/gt/intel_engine_regs.h -include
drivers/gpu/drm/i915/gt/intel_gt.h -include
drivers/gpu/drm/i915/gt/intel_gt_regs.h -include
drivers/gpu/drm/i915/i915_drv.h -include
drivers/gpu/drm/i915/i915_iosf_mbi.h -include
drivers/gpu/drm/i915/i915_reg.h -include
drivers/gpu/drm/i915/i915_vgpu.h -include
drivers/gpu/drm/i915/i915_wait_util.h -include
drivers/gpu/drm/i915/i915_mmio_range.h -include
drivers/gpu/drm/i915/intel_uncore_trace.h
drivers/gpu/drm/i915/selftests/mock_uncore.c",
    "directory": "build/b405de752a64d7657dcad6b5042d7bf4327a3bd8",
    "file": "drivers/gpu/drm/i915/selftests/mock_uncore.c"
  },


An attempt to invoke a clang tool using this database legitimately
fails with the following errors (the file is not supposed and can't
compile on its own):

clang-tool: drivers/gpu/drm/i915/selftests/mock_uncore.c: exit status 1
drivers/gpu/drm/i915/selftests/mock_uncore.c:47:2: error: call to
undeclared function 'ASSIGN_RAW_WRITE_MMIO_VFUNCS'; ISO C99 and later
do not support implicit function declarations
[-Wimplicit-function-declaration]
   47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
      |         ^
drivers/gpu/drm/i915/selftests/mock_uncore.c:47:39: error: use of
undeclared identifier 'nop'; did you mean 'nopv'?
   47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
      |                                              ^~~
      |                                              nopv
/arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
   71 | extern bool nopv;
      |             ^
drivers/gpu/drm/i915/selftests/mock_uncore.c:48:2: error: call to
undeclared function 'ASSIGN_RAW_READ_MMIO_VFUNCS'; ISO C99 and later
do not support implicit function declarations
[-Wimplicit-function-declaration]
   48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
      |         ^
drivers/gpu/drm/i915/selftests/mock_uncore.c:48:38: error: use of
undeclared identifier 'nop'; did you mean 'nopv'?
   48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
      |                                             ^~~
      |                                             nopv
/arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
   71 | extern bool nopv;
      |             ^
4 errors generated.
Error while processing /drivers/gpu/drm/i915/selftests/mock_uncore.c.


What am I doing wrong?

#regzbot introduced: 9362d34acf91a706c543d919ade3e651b9bd2d6f
#regzbot title: scripts/clang-tools: included .c files don't compile

