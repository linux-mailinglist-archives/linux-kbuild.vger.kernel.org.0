Return-Path: <linux-kbuild+bounces-3807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8257A986E28
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 09:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B4B283C74
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 07:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D11618A6CC;
	Thu, 26 Sep 2024 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="dHoWMISb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853BC187FFC;
	Thu, 26 Sep 2024 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337032; cv=none; b=K2xkxPSPiHEmj50I9Ks4qenCTIZb5s8CNEZuACPscl7wnMtnnQjFntmfy1ybcS8KOTlQZKX3MK2tQt+nm1gjLg2YX5uV8SrYsTLovkP8fOZsGtfevoNG6kYzFz6Jy9w42CuVqdcBsquhbbh6DpI4b4Jqi0KjtbLALG+zd23K3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337032; c=relaxed/simple;
	bh=l1D7H8k3UWbb9HZSOKhbsMvyIYn05baFXQ7m3jm17rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qbb9OgmBq8Ahl9A8r6dV87W9i6ekVHuYs/Cpq8f2ri2iGRfHR0r8kmzO8U6utMaX/nRDlhwXfU2JYFTMEYN2lyG75XVuLjkZJTx6Hp2nZhS1FynpZG6AlLsdCRfl/BJIZOrGQtI+7kljRIOcVYAl5nOSD0BRjyUROoFz30yUXBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=dHoWMISb; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/64oQO0+82AsF19pq77f1GsXh2trAUcBXVw1xgF7N/U=; b=dHoWMISb1bJhvCAGnMdA5S6DT+
	LSRJeBXSZsmGIXaQg0HD1lEF9fu1JaKMRyfMX3o7uMC17DKdTvC14dTXJ0HRdXptagfzLuUn0sGow
	LaAdZyqpGHd6XCbXLeDs967i61wyMCVViiJApPDvVO9ATdbvbFnJ7IMeuZM0uMIZwmtv7nr0IG/JO
	3RYDPZjN2Iv3pwGYxBsjVhPNofWsCuAEWLK5fBN7sDk7BfOmunMPcRfsncJxN47mE3nOs1S/1KNkn
	hjuWVwO8mPeC799jqiTCvIoue6eAJlpy8e77ZCdQ9kXWDrFUm2a4jbCqfcc1QxZx+q2uxBYbCDhZ2
	u9TmZlIw==;
Received: from [2001:9e8:9d8:901:3235:adff:fed0:37e6] (port=33682 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1stjGU-0093hB-U9;
	Thu, 26 Sep 2024 09:50:19 +0200
Date: Thu, 26 Sep 2024 09:50:16 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 14/23] kbuild: add $(objtree)/ prefix to some in-kernel
 build artifacts
Message-ID: <20240926-adamant-griffin-of-patience-fe83b9@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-15-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-15-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:42PM +0900, Masahiro Yamada wrote:
> $(objtree) refers to the top of the output directory of kernel builds.
> 
> This commit adds the explicit (objtree)/ prefix to build artifacts
> needed for building external modules.
> 
> This change has no immediate impact, as the top-level Makefile
> currently defines:
> 
>   objtree         := .
> 
> However, it prepares for supporting the building of external modules
> in a different directory.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile                  | 10 +++++-----
>  scripts/Kbuild.include    |  2 +-
>  scripts/Makefile.build    |  4 ++--
>  scripts/Makefile.modfinal | 14 +++++++-------
>  scripts/Makefile.modinst  |  2 +-
>  scripts/Makefile.modpost  | 12 ++++++------
>  scripts/depmod.sh         |  4 ++--
>  7 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ee9ad0f0960f..c923bea7043b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -354,7 +354,7 @@ else # !mixed-build
>  include $(srctree)/scripts/Kbuild.include
>  
>  # Read KERNELRELEASE from include/config/kernel.release (if it exists)
> -KERNELRELEASE = $(call read-file, include/config/kernel.release)
> +KERNELRELEASE = $(call read-file, $(objtree)/include/config/kernel.release)
>  KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
>  export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
>  
> @@ -717,7 +717,7 @@ endif
>  export KBUILD_MODULES KBUILD_BUILTIN
>  
>  ifdef need-config
> -include include/config/auto.conf
> +include $(objtree)/include/config/auto.conf
>  endif
>  
>  ifeq ($(KBUILD_EXTMOD),)
> @@ -780,13 +780,13 @@ else # !may-sync-config
>  # and include/config/auto.conf but do not care if they are up-to-date.
>  # Use auto.conf to show the error message
>  
> -checked-configs := include/generated/autoconf.h include/generated/rustc_cfg include/config/auto.conf
> +checked-configs := $(addprefix $(objtree)/, include/generated/autoconf.h include/generated/rustc_cfg include/config/auto.conf)
>  missing-configs := $(filter-out $(wildcard $(checked-configs)), $(checked-configs))
>  
>  ifdef missing-configs
> -PHONY += include/config/auto.conf
> +PHONY += $(objtree)/include/config/auto.conf
>  
> -include/config/auto.conf:
> +$(objtree)/include/config/auto.conf:
>  	@echo   >&2 '***'
>  	@echo   >&2 '***  ERROR: Kernel configuration is invalid. The following files are missing:'
>  	@printf >&2 '***    - %s\n' $(missing-configs)
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index ed8a7493524b..8c311b997e24 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -205,7 +205,7 @@ if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
>  
>  cmd_and_fixdep =                                                             \
>  	$(cmd);                                                              \
> -	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
> +	$(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
>  	rm -f $(depfile)
>  
>  # Usage: $(call if_changed_rule,foo)
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8403eba15457..6e8954cbf53a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -34,7 +34,7 @@ subdir-asflags-y :=
>  subdir-ccflags-y :=
>  
>  # Read auto.conf if it exists, otherwise ignore
> --include include/config/auto.conf
> +-include $(objtree)/include/config/auto.conf
>  
>  include $(srctree)/scripts/Kbuild.include
>  include $(srctree)/scripts/Makefile.compiler
> @@ -107,7 +107,7 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
>  $(obj)/%.i: $(obj)/%.c FORCE
>  	$(call if_changed_dep,cpp_i_c)
>  
> -genksyms = scripts/genksyms/genksyms		\
> +genksyms = $(objtree)/scripts/genksyms/genksyms	\
>  	$(if $(1), -T $(2))			\
>  	$(if $(KBUILD_PRESERVE), -p)		\
>  	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 1482884ec3ca..6d8aa3059ee2 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -6,7 +6,7 @@
>  PHONY := __modfinal
>  __modfinal:
>  
> -include include/config/auto.conf
> +include $(objtree)/include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>  
>  # for c_flags
> @@ -37,15 +37,15 @@ quiet_cmd_ld_ko_o = LD [M]  $@
>        cmd_ld_ko_o =							\
>  	$(LD) -r $(KBUILD_LDFLAGS)					\
>  		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
> -		-T scripts/module.lds -o $@ $(filter %.o, $^)
> +		-T $(objtree)/scripts/module.lds -o $@ $(filter %.o, $^)
>  
>  quiet_cmd_btf_ko = BTF [M] $@
>        cmd_btf_ko = 							\
> -	if [ ! -f vmlinux ]; then					\
> +	if [ ! -f $(objtree)/vmlinux ]; then				\
>  		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
>  	else								\
> -		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base vmlinux $@; \
> -		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
> +		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $(objtree)/vmlinux $@; \
> +		$(RESOLVE_BTFIDS) -b $(objtree)/vmlinux $@;		\
>  	fi;
>  
>  # Same as newer-prereqs, but allows to exclude specified extra dependencies
> @@ -57,8 +57,8 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>  	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
>  
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -%.ko: %.o %.mod.o $(extmod_prefix).module-common.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
> -	+$(call if_changed_except,ld_ko_o,vmlinux)
> +%.ko: %.o %.mod.o $(extmod_prefix).module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
> +	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
>  endif
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 4d81ed9af294..2d39d452c49e 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -6,7 +6,7 @@
>  PHONY := __modinst
>  __modinst:
>  
> -include include/config/auto.conf
> +include $(objtree)/include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>  
>  install-y :=
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 44936ebad161..12e7c15d099c 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -35,10 +35,10 @@
>  PHONY := __modpost
>  __modpost:
>  
> -include include/config/auto.conf
> +include $(objtree)/include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>  
> -MODPOST = scripts/mod/modpost
> +MODPOST = $(objtree)/scripts/mod/modpost
>  
>  modpost-args =										\
>  	$(if $(CONFIG_MODULES),-M)							\
> @@ -119,11 +119,11 @@ include $(kbuild-file)
>  
>  output-symdump := $(KBUILD_EXTMOD)/Module.symvers
>  
> -ifeq ($(wildcard Module.symvers),)
> -missing-input := Module.symvers
> +ifeq ($(wildcard $(objtree)/Module.symvers),)
> +missing-input := $(objtree)/Module.symvers
>  else
> -modpost-args += -i Module.symvers
> -modpost-deps += Module.symvers
> +modpost-args += -i $(objtree)/Module.symvers
> +modpost-deps += $(objtree)/Module.symvers
>  endif
>  
>  modpost-args += -e $(addprefix -i , $(KBUILD_EXTRA_SYMBOLS))
> diff --git a/scripts/depmod.sh b/scripts/depmod.sh
> index e22da27fe13e..3c34fecacbc8 100755
> --- a/scripts/depmod.sh
> +++ b/scripts/depmod.sh
> @@ -12,7 +12,7 @@ KERNELRELEASE=$1
>  
>  : ${DEPMOD:=depmod}
>  
> -if ! test -r System.map ; then
> +if ! test -r "${objtree}/System.map" ; then
>  	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
>  	exit 0
>  fi
> @@ -25,7 +25,7 @@ if [ -z $(command -v $DEPMOD) ]; then
>  	exit 0
>  fi
>  
> -set -- -ae -F System.map
> +set -- -ae -F "${objtree}/System.map"
>  if test -n "$INSTALL_MOD_PATH"; then
>  	set -- "$@" -b "$INSTALL_MOD_PATH"
>  fi
> -- 
> 2.43.0
> 
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


