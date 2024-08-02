Return-Path: <linux-kbuild+bounces-2790-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6313946638
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 01:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0984B1C20CFA
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 23:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDC16CDBA;
	Fri,  2 Aug 2024 23:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="e6V0++1/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4251ABEA4;
	Fri,  2 Aug 2024 23:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722642120; cv=none; b=q/ZrndnNJ6bJ2JsJ8cswA8sZrUq4eUU0QJEtr9FrdbTYKOpiitGYTCt0ii3yujDA3YD6a9RFyl072h80FPlYVsMrh7rtIZm9TBNkaFVWuinl5dbAvhbdnuHf7iEU0gZ5WGNTuDeO4U0XGwXIgn6nC89n2/VXdbfa36r6sbDklbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722642120; c=relaxed/simple;
	bh=DHCunDeog0Za9ks5cIJvcWeyEcT/xkyRWMfGn6wuHEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsX4cdbBxmFRJJhgp26GytNEYVtaQP5CSd80v/l9FexcyMpjB6uHVTbsHH0Bm7ra6kdUKyjwdYePjJCsboqppU1Kc06RrdnRZyfEdseEiLfZa9bbzzyRsqtnhc4VdZfuAn3Zg+rzfrcrYWaTdtR/oXxRR8efBkl9KfY3a7/3yAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=e6V0++1/; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wNFhIznygtRVPXC8Af2d5TRRPA6ucixBU45ohUiuQ2o=; b=e6V0++1/C292sJZhWCfThTh2aX
	56V8OmzYUAEmz5ddqfu89Pw6pZbl9/CoWtsGQ1DXFl6WhJkhaQXIwFOBAjGJCxFf0N9d1e6s2G02k
	MscYXtS6H/JzgcEsc5iVwQGWKTmREJ9eYwdhgWDOo/myX/V+MlbL0mD1oP44cNP7Z5+AZ89AqjtcK
	eTj/TBXOZooZujdWoXXkreN4WOgba+cdJfMP7OHOZOTz26UtoMUaXxHRYVGebcamB9cqMruIO1+9P
	9wq32o+Dv7/JP46+rDmcgNO+OtpQMtL4ECEr6keSca3BjuKkdVjjTRLlz/3dFFKNCgbB/lVvi+xvI
	tS1mqrNA==;
Received: from [2001:9e8:9c5:5401:3235:adff:fed0:37e6] (port=53854 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sa1u3-002FTi-Rw;
	Sat, 03 Aug 2024 01:41:44 +0200
Date: Sat, 3 Aug 2024 01:41:40 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] kbuild: clean up code duplication in cmd_fdtoverlay
Message-ID: <20240803-cryptic-tan-emu-7c58ce@lindesnes>
References: <20240725192317.258132-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725192317.258132-1-masahiroy@kernel.org>

On Fri, Jul 26, 2024 at 04:23:14AM +0900, Masahiro Yamada wrote:
> When resolving a merge conflict, Linus noticed the fdtoverlay command
> duplication introduced by commit 49636c5680b9 ("kbuild: verify dtoverlay
> files against schema"). He suggested a clean-up.
> 
> I eliminated the duplication and refactored the code a little further.
> 
> No functional changes are intended, except for the short logs.
> 
> The log will look as follows:
> 
>   $ make ARCH=arm64 defconfig dtbs_check
>       [ snip ]
>     DTC [C] arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb
>     DTC [C] arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb
>     DTC [C] arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb
>     DTC [C] arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb
>     DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtbo
>     OVL [C] arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb
> 
> The tag [C] indicates that the schema check is executed.
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wiF3yeWehcvqY-4X7WNb8n4yw_5t0H1CpEpKi7JMjaMfw@mail.gmail.com/#t
> Requested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.lib | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index fe3668dc4954..207325eaf1d1 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -400,26 +400,23 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>  $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
>  	$(call if_changed,wrap_S_dtb)
>  
> -quiet_cmd_dtc = DTC     $@
> +quiet_dtb_check_tag = $(if $(dtb-check-enabled),[C],   )
> +cmd_dtb_check = $(if $(dtb-check-enabled),; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true)
> +
> +quiet_cmd_dtc = DTC $(quiet_dtb_check_tag) $@
>  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>  	$(DTC) -o $@ -b 0 \
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
> -	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> -
> -DT_CHECK_CMD = $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA)
> +	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile) \
> +	$(cmd_dtb_check)
>  
>  # NOTE:
>  # Do not replace $(filter %.dtb %.dtbo, $^) with $(real-prereqs). When a single
>  # DTB is turned into a multi-blob DTB, $^ will contain header file dependencies
>  # recorded in the .*.cmd file.
> -ifneq ($(CHECK_DTBS),)
> -quiet_cmd_fdtoverlay = DTOVLCH $@
> -      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
> -else
> -quiet_cmd_fdtoverlay = DTOVL   $@
> -      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^)
> -endif
> +quiet_cmd_fdtoverlay = OVL $(quiet_dtb_check_tag) $@
> +      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) $(cmd_dtb_check)
>  
>  $(multi-dtb-y): FORCE
>  	$(call if_changed,fdtoverlay)
> @@ -430,16 +427,11 @@ DT_CHECKER ?= dt-validate
>  DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
>  DT_BINDING_DIR := Documentation/devicetree/bindings
>  DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
> -
> -quiet_cmd_dtb =	DTC_CHK $@
> -      cmd_dtb =	$(cmd_dtc) ; $(DT_CHECK_CMD) $@ || true
> -else
> -quiet_cmd_dtb = $(quiet_cmd_dtc)
> -      cmd_dtb = $(cmd_dtc)
> +dtb-check-enabled = $(if $(filter %.dtb, $@),y)
>  endif
>  
>  $(obj)/%.dtb: $(obj)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
> -	$(call if_changed_dep,dtb)
> +	$(call if_changed_dep,dtc)
>  
>  $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
>  	$(call if_changed_dep,dtc)
> -- 
> 2.43.0
> 

Looks good to me, thanks.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

