Return-Path: <linux-kbuild+bounces-12348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADgGNf5IymkQ7QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12348-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 11:57:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDDA358AEE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 11:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4FB3008222
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 09:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93BB382394;
	Mon, 30 Mar 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VagEVB5I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630737C92A;
	Mon, 30 Mar 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864216; cv=none; b=LyCunEF/m6Rp3IZU50hSrhjA8cpJ9NxVqp/+2+mHlx42jJH+TnQQPrl4nlv1BxiWC8QEBCcsvol9tNoKf8bmGkKgYOQV3fRUoKcXweVEyb4wWIN4uC3VKoz5UWFTaklxSEDFRPwjRMO+I2yiwS+pLHkhZrZ2PLywtn4Msv3dVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864216; c=relaxed/simple;
	bh=Hv9IV6Wp068/+KeVrs7CdaIK/xvojXKAPyMjAr29310=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0cbl8x/zZklL69kqeMzur8c7EtNbufuu4glmfMmFK9bIDSu5PKnhqcWmB2xgi0QSKuVJfuICi2KbYwtHtxSuR2pZ53cc2IgVJ1+Rdi+zJuEsJVgB0nazZXXnA48VQnTQHjhXcApWOlBv4AHJcKRfGoe3lz7nfO0GEOkyeoy1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VagEVB5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4E7C4CEF7;
	Mon, 30 Mar 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774864216;
	bh=Hv9IV6Wp068/+KeVrs7CdaIK/xvojXKAPyMjAr29310=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VagEVB5IGW/2Bh4fQeZWxV7TpVDKtGJ8TEb07xCYyd/YnHtvl/yZN+pZxj6ohf/DI
	 Ln8i8HjcuWWTo79ggCaKKCxfsQ3GUgyew75gXpQ0nFSId2OzdW8LPoheIz6+BhtMJh
	 n9DZ6EIpjiDlQXrjiuQjr5+1S1KvQ/AV/0QvyReK4H+GY/HN7lEHdkI3Z5W5BmcH7x
	 l8/eTalinv22ycDFB/x8xf2+9EqwdDWqDXG1oZ/ZG1j1HwBjnzGMjOBhA5pvsFPNGF
	 ywNHlOwbAnexcBXv2K7jq3oiiPyFTTq6UzAf+KOuSwSUFKj0YXVcQfEItQXrDbwZz4
	 k71mL69u/Uz1w==
Date: Mon, 30 Mar 2026 11:50:11 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH 02/15] scripts/sbom: integrate script in make process
Message-ID: <20260330095011.GA1458050@ax162>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
 <20260210205424.11195-3-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210205424.11195-3-luis.augenstein@tngtech.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12348-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,o.map:url]
X-Rspamd-Queue-Id: 2DDDA358AEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luis,

On Tue, Feb 10, 2026 at 09:54:11PM +0100, Luis Augenstein wrote:
> integrate SBOM script into the kernel build process.
> 
> Assisted-by: Claude Sonnet 4.5
> Assisted-by: GLM-4.7
> Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
...
> diff --git a/Makefile b/Makefile
> index 9d38125263fb..46d4be490d7f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,7 +772,7 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>  
> -ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +ifneq ($(filter all modules nsdeps compile_commands.json clang-% sbom,$(MAKECMDGOALS)),)
>    KBUILD_MODULES := y
>  endif
>  
> @@ -1612,7 +1612,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
>  	       compile_commands.json rust/test \
>  	       rust-project.json .vmlinux.objs .vmlinux.export.c \
> -               .builtin-dtbs-list .builtin-dtb.S
> +	       .builtin-dtbs-list .builtin-dtb.S sbom-*.spdx.json

Does sbom-roots.txt need to be cleaned up as well?

A note for Greg: this will conflict with commit a76e30c2479c ("kbuild:
Delete .builtin-dtbs.S when running make clean").

>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
> @@ -1728,6 +1728,7 @@ help:
>  	@echo  ''
>  	@echo  'Tools:'
>  	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
> +	@echo  '  sbom            - Generate Software Bill of Materials'
>  	@echo  ''
>  	@echo  'Kernel selftest:'
>  	@echo  '  kselftest         - Build and run kernel selftest'
> @@ -2108,6 +2109,12 @@ nsdeps: export KBUILD_NSDEPS=1
>  nsdeps: modules
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
>  
> +# Script to generate .spdx.json SBOM documents describing the build
> +# ---------------------------------------------------------------------------
> +PHONY += sbom
> +sbom: all
> +	$(Q)$(MAKE) $(build)=scripts/sbom
> +
>  # Clang Tooling
>  # ---------------------------------------------------------------------------
>  
> diff --git a/scripts/sbom/Makefile b/scripts/sbom/Makefile
> new file mode 100644
> index 000000000000..6c8ec7356293
> --- /dev/null
> +++ b/scripts/sbom/Makefile
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR MIT
> +# Copyright (C) 2025 TNG Technology Consulting GmbH
> +
> +SBOM_SOURCE_FILE := $(objtree)/sbom-source.spdx.json
> +SBOM_BUILD_FILE := $(objtree)/sbom-build.spdx.json
> +SBOM_OUTPUT_FILE := $(objtree)/sbom-output.spdx.json
> +SBOM_ROOTS_FILE := $(objtree)/sbom-roots.txt
> +
> +
> +ifeq ($(srctree),$(objtree))
> +    SBOM_TARGETS := $(SBOM_BUILD_FILE) $(SBOM_OUTPUT_FILE)
> +else
> +    SBOM_TARGETS := $(SBOM_SOURCE_FILE) $(SBOM_BUILD_FILE) $(SBOM_OUTPUT_FILE)
> +endif

This might be easier to read if it were

ifeq ($(srctree),$(objtree))
SBOM_TARGETS := $(SBOM_SOURCE_FILE)
endif
SBOM_TARGETS += $(SBOM_BUILD_FILE) $(SBOM_OUTPUT_FILE)

> +SBOM_DEPS := $(objtree)/$(KBUILD_IMAGE) $(objtree)/include/generated/autoconf.h
> +ifdef CONFIG_MODULES
> +    SBOM_DEPS += $(objtree)/modules.order
> +endif

Is $(objtree)/ necessary on these? You might be able to turn this into

  SBOM_DEPS := $(KBUILD_IMAGE) include/generated/autoconf.h $(if $(CONFIG_MODULES),modules.order)

> +$(SBOM_TARGETS) &: $(SBOM_DEPS)

&: is a feature from make 4.3 but the kernel supports make 4.0 and
newer, so you should probably make this

  # Use
  #     $(SBOM_TARGETS) &: $(SBOM_DEPS)
  # when make 4.3 is the minimum.
  $(SBOM_BUILD_FILE): $(SBOM_DEPS)

  $(obj)/: $(SBOM_BUILD_FILE)

> +	$(Q)echo "  GEN     $(notdir $(SBOM_TARGETS))"

> +	$(Q)if [ "$(CONFIG_MODULES)" = "y" ]; then \
> +		sed 's/\.o$$/.ko/' $(objtree)/modules.order >> $(SBOM_ROOTS_FILE); \
> +	fi
> +
> +	$(Q)$(PYTHON3) $(srctree)/scripts/sbom/sbom.py
> +
> +	$(Q)rm $(SBOM_ROOTS_FILE)

I think this would look better if it used the standard quiet_cmd_ and
cmd_ syntax:

quiet_cmd_sbom = GEN     $(notdir $(SBOM_TARGETS))
      cmd_sbom = printf "%s\n" "$(KBUILD_IMAGE)" >$(SBOM_ROOTS_FILE); \
                 $(if $(CONFIG_MODULES),sed 's/\.o$$/.ko/' $(objtree)/modules.order >> $(SBOM_ROOTS_FILE);) \
                 $(PYTHON3) $(srctree)/scripts/sbom/sbom.py \
                     --src-tree $(abspath $(srctree)) \
                     --obj-tree $(abspath $(objtree)) \
                     --roots-file $(SBOM_ROOTS_FILE) \
                     --output-directory $(abspath $(objtree)) \
                     --generate-spdx \
                     --package-license "GPL-2.0 WITH Linux-syscall-note" \
                     --package-version "$(KERNELVERSION)"; \
                 rm $(SBOM_ROOTS_FILE)

$(SBOM_BUILD_FILE): $(SBOM_DEPS)
	$(call cmd,sbom)

> +$(obj)/: $(SBOM_TARGETS)

It seems like this could use the standard always-y Kbuild syntax but I
am not sure. Honestly, looking at the bigger picture, it feels like most
of this Makefile could be moved into the main Makefile under the sbom
target? scripts/sbom is not actually used as an output directory and the
generated files do not really need to be listed as targets since their
names are hardcoded in scripts/sbom/sbom/config.py?

# Script to generate .spdx.json SBOM documents describing the build
# ---------------------------------------------------------------------------

ifdef building_out_of_srctree
sbom_targets := sbom-source.spdx.json
endif
sbom_targets += sbom-build.spdx.json sbom-output.spdx.json
sbom_roots_file := $(objtree)/sbom-roots.txt

quiet_cmd_sbom = GEN     $(notdir $(sbom_targets))
      cmd_sbom = printf "%s\n" "$(KBUILD_IMAGE)" >$(sbom_roots_file); \
                 $(if $(CONFIG_MODULES),sed 's/\.o$$/.ko/' $(objtree)/modules.order >> $(sbom_roots_file);) \
                 $(PYTHON3) $(srctree)/scripts/sbom/sbom.py \
                     --src-tree $(abspath $(srctree)) \
                     --obj-tree $(abspath $(objtree)) \
                     --roots-file $(sbom_roots_file) \
                     --output-directory $(abspath $(objtree)) \
                     --generate-spdx \
                     --package-license "GPL-2.0 WITH Linux-syscall-note" \
                     --package-version "$(KERNELVERSION)"; \
                 rm $(sbom_roots_file)
PHONY += sbom
sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if $(CONFIG_MODULES),modules modules.order)
	$(call cmd,sbom)

appears to do the right thing for me?

FWIW, I get errors like

  $ make -kj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- O=build mrproper defconfig sbom
  ...
    GEN     sbom-source.spdx.json sbom-build.spdx.json sbom-output.spdx.json
  [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py", line 630, in log_error_or_warning
  Skipped parsing command ccache aarch64-linux-gcc ... -o init/main.o /src/init/main.c because no matching parser was found
  [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py", line 630, in log_error_or_warning
  Skipped parsing command ccache aarch64-linux-gcc ... -o arch/arm64/kernel/asm-offsets.s /src/arch/arm64/kernel/asm-offsets.c because no matching parser was found
  [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser.py", line 630, in log_error_or_warning
  Skipped parsing command ccache aarch64-linux-gcc ... -o kernel/bounds.s /src/kernel/bounds.c because no matching parser was found
  ... (Found 10435 more instances of this error)

when testing the whole series without any modifications, am I doing
something wrong?

Cheers,
Nathan

