Return-Path: <linux-kbuild+bounces-7320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A81AC9E28
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 11:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15E617684E
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 09:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B313D145A03;
	Sun,  1 Jun 2025 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoeVqEND"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EFA79C0;
	Sun,  1 Jun 2025 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748769584; cv=none; b=BdXS1tTCDs57daoZF0QeNscIJ/yYPYEyeovYoaXgoe1BrXo2tD3EQHtr1fn/XChImIjAGPUCPLTqeNveCYrHjFuwH/bfC8Y2PSJBxlRGTYINdDW+w3Jb48sxe7MKrsGicUxqXjd0YOpY79yaASWyDm9xQGrw3l8c/0aVrIEj+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748769584; c=relaxed/simple;
	bh=b5N1y/m9Kj02uZmYFS8J+6nzkQrSosO020jsf8DYUmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSRA2TOi5BJS+wm0Bm3D+NwvND/zJalfz2eNGAm8rg+vJ49ZtOt7nwVdti2cGJKfNtdnu2IEIFDKqLJBhE9dkIZ1JlNjZb+AdiNwmmnOd3NM7Tv3rL/8b6mIpwm1VSXSsKfNZx+VNuCHawBNBixhYiA7o92oC+G+25yMdHNVAiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoeVqEND; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748769583; x=1780305583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5N1y/m9Kj02uZmYFS8J+6nzkQrSosO020jsf8DYUmo=;
  b=hoeVqEND+/akPbV7n01iC/zul8hW6kxFs8gIpSVQECc3O2mMVn0Myttu
   ez/f/ZwBu+ptTdQ0RTTv/Z1IiiUDW+pdDYQPUMPzCF6iNJJDR0tqgGC4B
   k2O2G5F0ErAYy2jXRrLPZo0Po11M24t06fP4fUoFusIH3060wffG9gzNU
   eCbYq2z6cDDJ1yJ0XlvbvZfLby7zum1AhnFb7J9NOIKjeZJJdbkoWxTQF
   /5lt1epUjeIizkjZY4lcZ7g8KawK17ThVLhi4XKdRhsA1FZoChrpq2dr1
   q3I6kSM6fdpwuNeFznpL4ng7CTWmkpz13vjmnVyt1XzorU/+BaYp/f2w/
   g==;
X-CSE-ConnectionGUID: A8n4DxWYT0iU82t2kxpHcw==
X-CSE-MsgGUID: gT1YOZ+cSy2tjPhc2+U2Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="76195004"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="76195004"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 02:19:42 -0700
X-CSE-ConnectionGUID: i3Sx3aFOT12D+hxT/eXBUQ==
X-CSE-MsgGUID: rbKEEwOPRKm6/djWPvCtbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="144254398"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2025 02:19:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLeqw-000Ysq-20;
	Sun, 01 Jun 2025 09:19:38 +0000
Date: Sun, 1 Jun 2025 17:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 3/3] scripts/misc-check: check unnecessary #include
 <linux/export.h>
Message-ID: <202506011712.L8Jfbz6T-lkp@intel.com>
References: <20250531183217.3844357-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531183217.3844357-3-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/scripts-misc-check-check-missing-include-linux-export-h/20250601-023341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250531183217.3844357-3-masahiroy%40kernel.org
patch subject: [PATCH 3/3] scripts/misc-check: check unnecessary #include <linux/export.h>
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250601/202506011712.L8Jfbz6T-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506011712.L8Jfbz6T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506011712.L8Jfbz6T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   grep: net/wireless/util.c: No such file or directory
   grep: net/wireless/wext-compat.c: No such file or directory
   grep: net/wireless/wext-core.c: No such file or directory
   grep: net/wireless/wext-sme.c: No such file or directory
   grep: net/x25/x25_proc.c: No such file or directory
   grep: net/xfrm/xfrm_proc.c: No such file or directory
   grep: net/xfrm/xfrm_replay.c: No such file or directory
   grep: rust/exports.c: No such file or directory
   grep: security/integrity/evm/evm_crypto.c: No such file or directory
   grep: security/integrity/ima/ima_mok.c: No such file or directory
   grep: security/integrity/platform_certs/platform_keyring.c: No such file or directory
   grep: security/keys/encrypted-keys/ecryptfs_format.c: No such file or directory
   grep: security/keys/key.c: No such file or directory
   grep: security/keys/keyring.c: No such file or directory
   grep: security/keys/permission.c: No such file or directory
   grep: security/keys/request_key.c: No such file or directory
   grep: security/keys/user_defined.c: No such file or directory
   grep: security/lockdown/lockdown.c: No such file or directory
   grep: security/security.c: No such file or directory
   grep: security/selinux/hooks.c: No such file or directory
   grep: security/selinux/netlink.c: No such file or directory
   grep: sound/core/ctljack.c: No such file or directory
   grep: sound/core/device.c: No such file or directory
   grep: sound/core/info_oss.c: No such file or directory
   grep: sound/core/isadma.c: No such file or directory
   grep: sound/core/memory.c: No such file or directory
   grep: sound/core/misc.c: No such file or directory
   grep: sound/core/pcm_drm_eld.c: No such file or directory
   grep: sound/core/pcm_iec958.c: No such file or directory
   grep: sound/core/pcm_lib.c: No such file or directory
   grep: sound/core/pcm_memory.c: No such file or directory
   grep: sound/core/pcm_misc.c: No such file or directory
   grep: sound/core/seq/oss/seq_oss_init.c: No such file or directory
   grep: sound/core/seq/seq_clientmgr.c: No such file or directory
   grep: sound/core/seq/seq_info.c: No such file or directory
   grep: sound/core/seq/seq_lock.c: No such file or directory
   grep: sound/core/seq/seq_memory.c: No such file or directory
   grep: sound/core/seq/seq_system.c: No such file or directory
   grep: sound/core/sound_oss.c: No such file or directory
   grep: sound/core/ump.c: No such file or directory
   grep: sound/core/ump_convert.c: No such file or directory
   grep: sound/core/vmaster.c: No such file or directory
   grep: sound/drivers/opl3/opl3_oss.c: No such file or directory
   grep: sound/drivers/opl3/opl3_synth.c: No such file or directory
   grep: sound/drivers/opl4/opl4_proc.c: No such file or directory
   grep: sound/firewire/iso-resources.c: No such file or directory
   grep: sound/firewire/packets-buffer.c: No such file or directory
   grep: sound/hda/hda_bus_type.c: No such file or directory
   grep: sound/hda/hdac_bus.c: No such file or directory
   grep: sound/hda/hdac_controller.c: No such file or directory
   grep: sound/hda/hdac_device.c: No such file or directory
   grep: sound/hda/hdac_regmap.c: No such file or directory
   grep: sound/hda/hdac_stream.c: No such file or directory
   grep: sound/hda/intel-sdw-acpi.c: No such file or directory
   grep: sound/isa/gus/gus_volume.c: No such file or directory
   grep: sound/isa/msnd/msnd_midi.c: No such file or directory
   grep: sound/isa/msnd/msnd_pinnacle_mixer.c: No such file or directory
   grep: sound/isa/sb/emu8000.c: No such file or directory
   grep: sound/isa/sb/emu8000_callback.c: No such file or directory
   grep: sound/pci/ac97/ac97_pcm.c: No such file or directory
   grep: sound/pci/au88x0/au88x0_game.c: No such file or directory
   grep: sound/pci/cs46xx/cs46xx_lib.c: No such file or directory
   grep: sound/pci/emu10k1/emu10k1_callback.c: No such file or directory
   grep: sound/pci/emu10k1/io.c: No such file or directory
   grep: sound/pci/emu10k1/memory.c: No such file or directory
   grep: sound/pci/emu10k1/voice.c: No such file or directory
   grep: sound/pci/hda/hda_auto_parser.c: No such file or directory
   grep: sound/pci/hda/hda_beep.c: No such file or directory
   grep: sound/pci/hda/hda_bind.c: No such file or directory
   grep: sound/pci/hda/hda_generic.c: No such file or directory
   grep: sound/pci/hda/hda_jack.c: No such file or directory
   grep: sound/pci/hda/hda_sysfs.c: No such file or directory
   grep: sound/pci/oxygen/oxygen_io.c: No such file or directory
   grep: sound/pci/trident/trident_main.c: No such file or directory
   grep: sound/soc/amd/acp/acp-legacy-common.c: No such file or directory
   grep: sound/soc/amd/acp/amd-sdw-acpi.c: No such file or directory
   grep: sound/soc/amd/ps/ps-common.c: No such file or directory
   grep: sound/soc/atmel/sam9x5_wm8731.c: No such file or directory
   grep: sound/soc/codecs/lpass-macro-common.c: No such file or directory
   grep: sound/soc/codecs/sigmadsp-i2c.c: No such file or directory
   grep: sound/soc/codecs/sigmadsp-regmap.c: No such file or directory
   grep: sound/soc/codecs/wm5100.c: No such file or directory
   grep: sound/soc/qcom/lpass-cdc-dma.c: No such file or directory
   grep: sound/soc/qcom/lpass-platform.c: No such file or directory
   grep: sound/soc/soc-ac97.c: No such file or directory
   grep: sound/soc/soc-acpi.c: No such file or directory
   grep: sound/soc/soc-jack.c: No such file or directory
   grep: sound/soc/soc-pcm.c: No such file or directory
   grep: sound/soc/soc-topology.c: No such file or directory
   grep: sound/soc/soc-utils.c: No such file or directory
   grep: sound/soc/sof/intel/icl.c: No such file or directory
   grep: sound/soc/sof/stream-ipc.c: No such file or directory
   grep: sound/soc/tegra/tegra_asoc_machine.c: No such file or directory
   grep: sound/synth/emux/emux_oss.c: No such file or directory
   grep: sound/synth/emux/emux_synth.c: No such file or directory
   grep: sound/synth/emux/soundfont.c: No such file or directory
   grep: sound/usb/line6/driver.c: No such file or directory
   grep: sound/usb/line6/midi.c: No such file or directory
   grep: sound/usb/line6/pcm.c: No such file or directory
   grep: virt/kvm/irqchip.c: No such file or directory
>> : warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

