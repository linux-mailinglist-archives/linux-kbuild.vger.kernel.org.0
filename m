Return-Path: <linux-kbuild+bounces-4119-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230D99E231
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 11:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B8E2812FC
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 09:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC881E32CF;
	Tue, 15 Oct 2024 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ScLJNoIJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2421E2850;
	Tue, 15 Oct 2024 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983153; cv=none; b=IsfqTyRAZFh7aspPBpP1wPk18CKMk426L7F+9xGjrZAGrhroIIy0LA9FaHxaIVN33n/8jU4txGiofaYSSZsL/W35boubm/N+QKN5u8UIvbwYjCDE0BqiWKfg+Evn0rBwDqd1TWwE6Jh+lIF5Z4Fe6uM/q1YUlmE4XvifvqoCErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983153; c=relaxed/simple;
	bh=xpt5/P5gxckwngVS4eHLKkUF3nHcEvbihEL3m6a1BNA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CEeqpjWDE+VIHZUtu5SutqnMYH7zXxDugLZRuEEl6y7PS85G7JUQWaUhuBF84//6W4vHU2v9IvHzbJfHjcCjWkAfWTX0CTdCLUXKY2pZK6ZhJz+ZH2FR3kfXnQvXm74WCaZMVblWiEZrbRHMUjw1/cRuEfnx8OVwTzu+Sx0KM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ScLJNoIJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728983152; x=1760519152;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xpt5/P5gxckwngVS4eHLKkUF3nHcEvbihEL3m6a1BNA=;
  b=ScLJNoIJqZrrqoUyP3zX4LbO0yYX06nLbO+sSwsWxS7TLvqt3I6tZfYr
   oq+D9/O4mcVFPcodoIIVDxONavltFM+hU6j4noRyHmJGxs38Z/5/21q1g
   nsJkxFLkehPvZyp3Gz2l6LjxyCoJ+rHqsmimDuWaOE04MK+Vc/+xnawG/
   mBZP3yfXDdCHwxxsynDe6C0xe2VEh3hCfEae/iLl59QpDhW4ONACOuz6p
   O2R+M9bV3/jbkS83b7TVtIPbE7XUaX1zsRI6FMXJhldu7C+qnL/y8utqb
   BdRv40ZcCXq7M6Qa2byKqaGc1uhLd17IGJR3DEfxDu4XZk1ercBho0fGj
   w==;
X-CSE-ConnectionGUID: 3Jtg0LYPTwGxd5XoQeZPhA==
X-CSE-MsgGUID: PNLorBRQTFqkndaOC0+BLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="38938132"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="38938132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 02:05:51 -0700
X-CSE-ConnectionGUID: qWcthfRdTym9/EPxMYssig==
X-CSE-MsgGUID: /yrrZ0CgRdymVI3tZzVSLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77847197"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.12])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 02:05:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Oct 2024 12:05:45 +0300 (EEST)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    linux-kbuild@vger.kernel.org
cc: Tero Kristo <tero.kristo@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, David Gow <davidgow@google.com>, 
    Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [rfc, PATCH v1 1/1] platform/x86: intel: Add 'intel' prefix to
 the modules automatically
In-Reply-To: <20241011172531.3407093-1-andriy.shevchenko@linux.intel.com>
Message-ID: <caa4b5e0-742b-a4f4-d4c8-8e14cc99eefc@linux.intel.com>
References: <20241011172531.3407093-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Oct 2024, Andy Shevchenko wrote:

> Rework Makefile to add 'intel' prefix to the modules automatically.
> This removes a lot of boilerplate code in it and also makes robust
> against mistypos in the prefix.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Send as RFC because TBH I rather want to have something like this to be
> available on the level of Kbuild for any of the subdirectories in
> question. Also I haven't done any comprehensive build tests on this,
> let's see what CIs think about this...

It feels useful to have this automatically available for the folder one 
level towards root... (perhaps two levels).

But you didn't include kbuild ML (now added).

>  drivers/platform/x86/intel/Makefile           | 68 ++++++++-----------
>  .../intel/{intel_plr_tpmi.c => plr_tpmi.c}    |  0
>  2 files changed, 29 insertions(+), 39 deletions(-)
>  rename drivers/platform/x86/intel/{intel_plr_tpmi.c => plr_tpmi.c} (100%)
> 
> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
> index 74db065c82d6..21e9e21e0142 100644
> --- a/drivers/platform/x86/intel/Makefile
> +++ b/drivers/platform/x86/intel/Makefile
> @@ -17,50 +17,40 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)	+= uncore-frequency/
>  
>  
>  # Intel input drivers
> -intel-hid-y				:= hid.o
> -obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
> -intel-vbtn-y				:= vbtn.o
> -obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
> +intel-target-$(CONFIG_INTEL_HID_EVENT)		+= hid.o
> +intel-target-$(CONFIG_INTEL_VBTN)		+= vbtn.o
>  
>  # Intel miscellaneous drivers
> -obj-$(CONFIG_INTEL_ISHTP_ECLITE)	+= ishtp_eclite.o
> -intel_int0002_vgpio-y			:= int0002_vgpio.o
> -obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
> -intel_oaktrail-y			:= oaktrail.o
> -obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
> -intel_sdsi-y				:= sdsi.o
> -obj-$(CONFIG_INTEL_SDSI)		+= intel_sdsi.o
> -intel_vsec-y				:= vsec.o
> -obj-$(CONFIG_INTEL_VSEC)		+= intel_vsec.o
> +intel-target-$(CONFIG_INTEL_ISHTP_ECLITE)	+= ishtp_eclite.o
> +
> +intel-target-$(CONFIG_INTEL_INT0002_VGPIO)	+= int0002_vgpio.o
> +intel-target-$(CONFIG_INTEL_OAKTRAIL)		+= oaktrail.o
> +intel-target-$(CONFIG_INTEL_SDSI)		+= sdsi.o
> +intel-target-$(CONFIG_INTEL_VSEC)		+= vsec.o
>  
>  # Intel PMIC / PMC / P-Unit drivers
> -intel_bxtwc_tmu-y			:= bxtwc_tmu.o
> -obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
> -intel_crystal_cove_charger-y		:= crystal_cove_charger.o
> -obj-$(CONFIG_X86_ANDROID_TABLETS)	+= intel_crystal_cove_charger.o
> -intel_bytcrc_pwrsrc-y			:= bytcrc_pwrsrc.o
> -obj-$(CONFIG_INTEL_BYTCRC_PWRSRC)	+= intel_bytcrc_pwrsrc.o
> -intel_chtdc_ti_pwrbtn-y			:= chtdc_ti_pwrbtn.o
> -obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
> -intel_chtwc_int33fe-y			:= chtwc_int33fe.o
> -obj-$(CONFIG_INTEL_CHTWC_INT33FE)	+= intel_chtwc_int33fe.o
> -intel_mrfld_pwrbtn-y			:= mrfld_pwrbtn.o
> -obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
> -intel_punit_ipc-y			:= punit_ipc.o
> -obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
> +intel-target-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= bxtwc_tmu.o
> +intel-target-$(CONFIG_X86_ANDROID_TABLETS)	+= crystal_cove_charger.o
> +intel-target-$(CONFIG_INTEL_BYTCRC_PWRSRC)	+= bytcrc_pwrsrc.o
> +intel-target-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= chtdc_ti_pwrbtn.o
> +intel-target-$(CONFIG_INTEL_CHTWC_INT33FE)	+= chtwc_int33fe.o
> +intel-target-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= mrfld_pwrbtn.o
> +intel-target-$(CONFIG_INTEL_PUNIT_IPC)		+= punit_ipc.o
>  
>  # TPMI drivers
> -intel_vsec_tpmi-y			:= tpmi.o
> -obj-$(CONFIG_INTEL_TPMI)		+= intel_vsec_tpmi.o
> -obj-$(CONFIG_INTEL_PLR_TPMI)		+= intel_plr_tpmi.o
> -
> -intel_tpmi_power_domains-y		:= tpmi_power_domains.o
> -obj-$(CONFIG_INTEL_TPMI_POWER_DOMAINS)	+= intel_tpmi_power_domains.o
> +intel-target-$(CONFIG_INTEL_TPMI)		+= vsec_tpmi.o
> +intel-target-$(CONFIG_INTEL_PLR_TPMI)		+= plr_tpmi.o
> +intel-target-$(CONFIG_INTEL_TPMI_POWER_DOMAINS)	+= tpmi_power_domains.o
>  
>  # Intel Uncore drivers
> -intel-rst-y				:= rst.o
> -obj-$(CONFIG_INTEL_RST)			+= intel-rst.o
> -intel-smartconnect-y			:= smartconnect.o
> -obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
> -intel_turbo_max_3-y			:= turbo_max_3.o
> -obj-$(CONFIG_INTEL_TURBO_MAX_3)		+= intel_turbo_max_3.o
> +intel-target-$(CONFIG_INTEL_RST)		+= rst.o
> +intel-target-$(CONFIG_INTEL_SMARTCONNECT)	+= smartconnect.o
> +intel-target-$(CONFIG_INTEL_TURBO_MAX_3)	+= turbo_max_3.o
> +
> +define INTEL_OBJ_TARGET
> +intel-$(1)-y := $(1).o
> +obj-$(2) += intel-$(1).o
> +endef
> +
> +$(foreach target-y, $(basename $(intel-target-m)), $(eval $(call INTEL_OBJ_TARGET,$(target-y),y)))
> +$(foreach target-m, $(basename $(intel-target-m)), $(eval $(call INTEL_OBJ_TARGET,$(target-m),m)))
> diff --git a/drivers/platform/x86/intel/intel_plr_tpmi.c b/drivers/platform/x86/intel/plr_tpmi.c
> similarity index 100%
> rename from drivers/platform/x86/intel/intel_plr_tpmi.c
> rename to drivers/platform/x86/intel/plr_tpmi.c

Why call these intel-target-*, wouldn't intel-obj-* be more consistent?

-- 
 i.



