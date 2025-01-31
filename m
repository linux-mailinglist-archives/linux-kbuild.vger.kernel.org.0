Return-Path: <linux-kbuild+bounces-5591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F1A24437
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 21:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DC683A5C0C
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 20:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491B21F2388;
	Fri, 31 Jan 2025 20:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9NdFO0i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE0D1494AD;
	Fri, 31 Jan 2025 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738356566; cv=none; b=oQtCx2bmr6dTbr5c2SrlQ52NYGh6i0FfvL20M/HiQRnaTXknmJ4fZ5f+6lS6HDkcLQCquGKgX1BB3X1syTCtHlOnFTPKmRE6YtWsgLDnrMCMZgwPTTmBYwK4Q4U2CLpXcgmqL/jmtcxZyClYQbc9usqEN1irwP8jevN6+7KsIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738356566; c=relaxed/simple;
	bh=jEJXvDy6tRn01UWx5QLXVr7QPDMqGTXnIQtlB9fxnXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fiz6y3xeVzJolg9iGPXXuv+wDwNeHrgLEdo9kkYeljyYgbpuG6kGJEY5IfEwTlgvY6Zc9ENL6xZPe10xhzWwnobm+zUjVbZUN0aWQBXM614FaV7GnhsJ8VOXkEvG81w00jdwg7GyTHjskZ7p8xFkeB9VOEOdCCJ74RqO0WNiYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9NdFO0i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8681C4CED1;
	Fri, 31 Jan 2025 20:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738356565;
	bh=jEJXvDy6tRn01UWx5QLXVr7QPDMqGTXnIQtlB9fxnXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9NdFO0iZGGz45yl4wtk1o7qQfdmVAoXHZYVvpwRnLIp6MFAc2sx1gdnEo7TRGj3c
	 WVCR8sUGeTQK9Q9o1RB/64rxEtLqD9JHw382cDCwC9LHFqGy6IR7yuO4TnTBilpBNY
	 xAOl3e1J/SXzbph85uhsa18/+e3Y24S8QTd4GFghKcUWVr9uaXtf9IQCe9dQ4wz/Ke
	 yZ93VV91Uj9GKc/4r1rEKTX45b2Ijbdijqbp77inFSwCYle8FLUHqjb9C4m08L4mDt
	 SPsOO569kl/7P63Oxow1T/mey0Ch+IJ2zNLeDqTIR5JXSfEaz8XWRsP+dhVjmNQLb+
	 ffPnnFnYku5oQ==
Date: Fri, 31 Jan 2025 13:49:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20250131204920.GA1974131@ax162>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
 <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162>
 <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>

On Fri, Jan 31, 2025 at 11:44:46AM +0100, Brendan Jackman wrote:
> On Thu, 30 Jan 2025 at 19:30, Nathan Chancellor <nathan@kernel.org> wrote:
> > For the record, this will be disruptive for clang users because a number
> > of warnings have crept up in recent releases and this option will get
> > enabled for allmodconfig.
> [snip]
> > I think Josh already mentioned it but exposing -Werror for objtool is a
> > big committment.
> 
> OK yeah, I hadn't really taken the implications on board, i.e. I
> hadn't really internalised the fact that this affects builds where the
> user didn't explicitly opt-in to strictness.
>
> Do you have a mental picture of how sources of objtool regressions are
> distributed in the kernel? I'm wondering if it would be alleviated if
> we enabled it for stuff like defconfig and tinyconfig, while disabling
> it for allmodconfig/allyesconfig. Looks like LTO_CLANG_FULL does the
> latter (forcefully) by depending on !COMPILE_TEST, maybe there's
> another way.

I do not have a good high level overview yet since I have only just
started combing over them in addition to all of my other work keeping
the tree green and our CI running.

I can at least provide an overview of what my most recent build of
linux-next with a close to tip of tree clang shows. I have sorted it two
different ways.

The first is showing what builds have warnings.

-----------------------------------------------

loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: .text.dc_fixpt_recip: unexpected end of section
	vmlinux.o: warning: objtool: .text.crash_shutdown_secondary: unexpected end of section
	vmlinux.o: warning: objtool: .text.kexec_reboot: unexpected end of section
	vmlinux.o: warning: objtool: .text.kexec_shutdown_secondary: unexpected end of section
	vmlinux.o: warning: objtool: .text.machine_kexec: unexpected end of section
	vmlinux.o: warning: objtool: ___bpf_prog_run+0x64: sibling call from callable instruction with modified stack frame
	vmlinux.o: warning: objtool: __efistub_efi_boot_kernel() falls through to next function __efistub_exit_boot_func()

loongarch-defconfig.log
	arch/loongarch/kernel/machine_kexec.o: warning: objtool: .text: unexpected end of section
	arch/loongarch/kernel/machine_kexec.o: warning: objtool: crash_shutdown_secondary() falls through to next function machine_shutdown()
	arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_reboot() falls through to next function crash_smp_send_stop()
	arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_shutdown_secondary() falls through to next function machine_kexec()
	drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x64: sibling call from callable instruction with modified stack frame

x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log
	drivers/gpu/drm/msm/msm.o: warning: objtool: .text.msm_dp_catalog_ctrl_config_msa: unexpected end of section
	drivers/iio/adc/at91-sama5d2_adc.o: warning: objtool: .text.at91_adc_probe: unexpected end of section
	drivers/media/dvb-frontends/dib8000.o: warning: objtool: .text.dib8000_tune: unexpected end of section
	drivers/media/dvb-frontends/rtl2832_sdr.o: warning: objtool: .text.rtl2832_sdr_s_fmt_sdr_cap: unexpected end of section
	drivers/media/dvb-frontends/rtl2832_sdr.o: warning: objtool: .text.rtl2832_sdr_try_fmt_sdr_cap: unexpected end of section
	drivers/media/i2c/mt9t112.o: warning: objtool: .text.mt9t112_set_fmt: unexpected end of section
	drivers/media/i2c/mt9t112.o: warning: objtool: .text.mt9t112_set_params: unexpected end of section
	drivers/media/usb/msi2500/msi2500.o: warning: objtool: .text.msi2500_s_fmt_sdr_cap: unexpected end of section
	drivers/media/usb/msi2500/msi2500.o: warning: objtool: .text.msi2500_try_fmt_sdr_cap: unexpected end of section
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: .text.mlx5e_mpwrq_mtts_per_wqe: unexpected end of section
	drivers/nvme/target/nvmet.o: warning: objtool: .text.nvmet_ctrl_state_show: unexpected end of section
	drivers/pci/endpoint/functions/pci-epf-test.o: warning: objtool: .text.pci_epf_test_cmd_handler: unexpected end of section
	drivers/regulator/rk808-regulator.o: warning: objtool: .text.rk806_set_mode_dcdc: unexpected end of section
	drivers/spi/spi-amd.o: warning: objtool: .text.amd_set_spi_freq: unexpected end of section
	sound/soc/codecs/snd-soc-wcd9335.o: warning: objtool: .text.wcd9335_slimbus_irq: unexpected end of section
	sound/soc/codecs/snd-soc-wcd934x.o: warning: objtool: .text.wcd934x_slim_irq_handler: unexpected end of section
	vmlinux.o: warning: objtool: do_user_addr_fault+0xe5b: unreachable instruction

x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log
	drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_catalog_ctrl_config_msa() falls through to next function __cfi_msm_dp_catalog_ctrl_set_pattern_state_bit()
	drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_tune() falls through to next function dib8096p_cfg_DibRx()
	drivers/media/pci/solo6x10/solo6x10.o: warning: objtool: tw28_set_ctrl_val() falls through to next function __cfi_tw28_get_ctrl_val()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function __cfi_mlx5e_mpwrq_max_num_entries()
	drivers/nvme/target/nvmet.o: warning: objtool: nvmet_ctrl_state_show() falls through to next function __cfi_nvmet_ctrl_host_traddr_open()
	drivers/regulator/rk808-regulator.o: warning: objtool: rk806_set_mode_dcdc() falls through to next function __cfi_rk806_get_mode_dcdc()
	drivers/spi/spi-amd.o: warning: objtool: amd_set_spi_freq() falls through to next function amd_spi_busy_wait()
	sound/soc/codecs/snd-soc-wcd9335.o: warning: objtool: wcd9335_slimbus_irq() falls through to next function __cfi_wcd9335_set_channel_map()
	sound/soc/codecs/snd-soc-wcd934x.o: warning: objtool: wcd934x_slim_irq_handler() falls through to next function __cfi_swclk_gate_disable()

x86_64-alpine-config.log
	arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30: sibling call from callable instruction with modified stack frame
	drivers/bluetooth/hci_vhci.o: warning: objtool: vhci_coredump_hdr() falls through to next function vhci_open_timeout()
	drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	drivers/gpu/drm/amd/amdgpu/../display/dc/spl/spl_fixpt31_32.o: warning: objtool: spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
	drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_set_frontend() falls through to next function dib8000_fe_get_tune_settings()
	drivers/net/ethernet/jme.o: warning: objtool: jme_check_link() falls through to next function jme_powersave_phy()
	drivers/net/ethernet/mellanox/mlx5/core/en/params.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
	drivers/net/ethernet/mellanox/mlx5/core/en/params.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()
	fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_split_leaf() falls through to next function bch2_btree_update_start()

x86_64-archlinux-config.log
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
	drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_set_frontend() falls through to next function dib8000_fe_get_tune_settings()
	drivers/media/i2c/ccs/ccs.o: warning: objtool: ccs_set_selection() falls through to next function ccs_propagate()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()

x86_64-debian-config.log
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
	drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_set_frontend() falls through to next function dib8000_fe_get_tune_settings()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()

x86_64-fedora-config.log
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
	drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_set_frontend() falls through to next function dib8000_fe_get_tune_settings()
	drivers/media/i2c/ccs/ccs.o: warning: objtool: ccs_set_selection() falls through to next function ccs_propagate()
	drivers/media/pci/solo6x10/solo6x10.o: warning: objtool: tw28_set_ctrl_val() falls through to next function tw28_get_ctrl_val()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()

x86_64-opensuse-config.log
	drivers/bluetooth/hci_vhci.o: warning: objtool: vhci_coredump_hdr() falls through to next function vhci_open_timeout()
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
	drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_set_frontend() falls through to next function dib8000_fe_get_tune_settings()
	drivers/media/i2c/ccs/ccs.o: warning: objtool: ccs_set_selection() falls through to next function ccs_propagate()
	drivers/misc/lkdtm/lkdtm.o: warning: objtool: execute_location+0x4f: relocation to !ENDBR: .text+0x11a8
	drivers/net/ethernet/jme.o: warning: objtool: jme_check_link() falls through to next function jme_powersave_phy()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
	drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()

-----------------------------------------------

The second way is looking at warnings and what configurations they
appear in. You will notice there are a good number of warnings that
appear only in allmodconfig, so that could point to a sanitizer causing
some weird behavior with code generation.

-----------------------------------------------

drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: .text.dc_fixpt_recip: unexpected end of section
	loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log

vmlinux.o: warning: objtool: .text.crash_shutdown_secondary: unexpected end of section
	loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log

vmlinux.o: warning: objtool: .text.kexec_reboot: unexpected end of section
	loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log

vmlinux.o: warning: objtool: .text.kexec_shutdown_secondary: unexpected end of section
	loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log

vmlinux.o: warning: objtool: .text.machine_kexec: unexpected end of section
	loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log

vmlinux.o: warning: objtool: ___bpf_prog_run+0x64: sibling call from callable instruction with modified stack frame
	loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log

vmlinux.o: warning: objtool: __efistub_efi_boot_kernel() falls through to next function __efistub_exit_boot_func()
	loongarch-defconfig-CONFIG_LTO_CLANG_THIN=y.log

arch/loongarch/kernel/machine_kexec.o: warning: objtool: .text: unexpected end of section
	loongarch-defconfig.log

arch/loongarch/kernel/machine_kexec.o: warning: objtool: crash_shutdown_secondary() falls through to next function machine_shutdown()
	loongarch-defconfig.log

arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_reboot() falls through to next function crash_smp_send_stop()
	loongarch-defconfig.log

arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_shutdown_secondary() falls through to next function machine_kexec()
	loongarch-defconfig.log

drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	loongarch-defconfig.log
	x86_64-alpine-config.log

kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x64: sibling call from callable instruction with modified stack frame
	loongarch-defconfig.log

drivers/gpu/drm/msm/msm.o: warning: objtool: .text.msm_dp_catalog_ctrl_config_msa: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/iio/adc/at91-sama5d2_adc.o: warning: objtool: .text.at91_adc_probe: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/dvb-frontends/dib8000.o: warning: objtool: .text.dib8000_tune: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/dvb-frontends/rtl2832_sdr.o: warning: objtool: .text.rtl2832_sdr_s_fmt_sdr_cap: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/dvb-frontends/rtl2832_sdr.o: warning: objtool: .text.rtl2832_sdr_try_fmt_sdr_cap: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/i2c/mt9t112.o: warning: objtool: .text.mt9t112_set_fmt: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/i2c/mt9t112.o: warning: objtool: .text.mt9t112_set_params: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/usb/msi2500/msi2500.o: warning: objtool: .text.msi2500_s_fmt_sdr_cap: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/usb/msi2500/msi2500.o: warning: objtool: .text.msi2500_try_fmt_sdr_cap: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: .text.mlx5e_mpwrq_mtts_per_wqe: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/nvme/target/nvmet.o: warning: objtool: .text.nvmet_ctrl_state_show: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/pci/endpoint/functions/pci-epf-test.o: warning: objtool: .text.pci_epf_test_cmd_handler: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/regulator/rk808-regulator.o: warning: objtool: .text.rk806_set_mode_dcdc: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/spi/spi-amd.o: warning: objtool: .text.amd_set_spi_freq: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

sound/soc/codecs/snd-soc-wcd9335.o: warning: objtool: .text.wcd9335_slimbus_irq: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

sound/soc/codecs/snd-soc-wcd934x.o: warning: objtool: .text.wcd934x_slim_irq_handler: unexpected end of section
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

vmlinux.o: warning: objtool: do_user_addr_fault+0xe5b: unreachable instruction
	x86_64-allmodconfig-CONFIG_GCOV_KERNEL=n-CONFIG_KASAN=n-CONFIG_LTO_CLANG_THIN=y-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_catalog_ctrl_config_msa() falls through to next function __cfi_msm_dp_catalog_ctrl_set_pattern_state_bit()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_tune() falls through to next function dib8096p_cfg_DibRx()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/media/pci/solo6x10/solo6x10.o: warning: objtool: tw28_set_ctrl_val() falls through to next function __cfi_tw28_get_ctrl_val()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function __cfi_mlx5e_mpwrq_max_num_entries()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/nvme/target/nvmet.o: warning: objtool: nvmet_ctrl_state_show() falls through to next function __cfi_nvmet_ctrl_host_traddr_open()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/regulator/rk808-regulator.o: warning: objtool: rk806_set_mode_dcdc() falls through to next function __cfi_rk806_get_mode_dcdc()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

drivers/spi/spi-amd.o: warning: objtool: amd_set_spi_freq() falls through to next function amd_spi_busy_wait()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

sound/soc/codecs/snd-soc-wcd9335.o: warning: objtool: wcd9335_slimbus_irq() falls through to next function __cfi_wcd9335_set_channel_map()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

sound/soc/codecs/snd-soc-wcd934x.o: warning: objtool: wcd934x_slim_irq_handler() falls through to next function __cfi_swclk_gate_disable()
	x86_64-allmodconfig-CONFIG_WERROR=n-CONFIG_DRM_WERROR=n.log

arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30: sibling call from callable instruction with modified stack frame
	x86_64-alpine-config.log

drivers/bluetooth/hci_vhci.o: warning: objtool: vhci_coredump_hdr() falls through to next function vhci_open_timeout()
	x86_64-alpine-config.log
	x86_64-opensuse-config.log

drivers/gpu/drm/amd/amdgpu/../display/dc/spl/spl_fixpt31_32.o: warning: objtool: spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
	x86_64-alpine-config.log

drivers/media/dvb-frontends/dib8000.o: warning: objtool: dib8000_set_frontend() falls through to next function dib8000_fe_get_tune_settings()
	x86_64-alpine-config.log
	x86_64-archlinux-config.log
	x86_64-debian-config.log
	x86_64-fedora-config.log
	x86_64-opensuse-config.log

drivers/net/ethernet/jme.o: warning: objtool: jme_check_link() falls through to next function jme_powersave_phy()
	x86_64-alpine-config.log
	x86_64-opensuse-config.log

drivers/net/ethernet/mellanox/mlx5/core/en/params.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
	x86_64-alpine-config.log

drivers/net/ethernet/mellanox/mlx5/core/en/params.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()
	x86_64-alpine-config.log

fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_split_leaf() falls through to next function bch2_btree_update_start()
	x86_64-alpine-config.log

drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
	x86_64-archlinux-config.log
	x86_64-debian-config.log
	x86_64-fedora-config.log
	x86_64-opensuse-config.log

drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
	x86_64-archlinux-config.log
	x86_64-debian-config.log
	x86_64-fedora-config.log
	x86_64-opensuse-config.log

drivers/media/i2c/ccs/ccs.o: warning: objtool: ccs_set_selection() falls through to next function ccs_propagate()
	x86_64-archlinux-config.log
	x86_64-fedora-config.log
	x86_64-opensuse-config.log

drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
	x86_64-archlinux-config.log
	x86_64-debian-config.log
	x86_64-fedora-config.log
	x86_64-opensuse-config.log

drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()
	x86_64-archlinux-config.log
	x86_64-debian-config.log
	x86_64-fedora-config.log
	x86_64-opensuse-config.log

drivers/media/pci/solo6x10/solo6x10.o: warning: objtool: tw28_set_ctrl_val() falls through to next function tw28_get_ctrl_val()
	x86_64-fedora-config.log

drivers/misc/lkdtm/lkdtm.o: warning: objtool: execute_location+0x4f: relocation to !ENDBR: .text+0x11a8
	x86_64-opensuse-config.log

-----------------------------------------------

I know the fixpt_recip warnings from amdgpu.o have a patch on the
mailing list and I think the LoongArch folks are aware of the ones in
their builds.

LTO does definitely give the compiler more ability to find and optimize
around undefined behavior and that does make things more difficult to
triage. Sanitizers muck things about too :/

> But I can also envisage a world where that creates exactly as much
> work for you, just introducing Kconfig hackery for no reason!

Such is the nature of such changes. It is not that big of a deal for us
to work around in the short term but it would still need to be addressed
pretty quickly at that point.

> > If exposing this to the world feels too premature, maybe the flag could
> > be added then have a make variable like OBJTOOL_FLAGS to allow a
> > developer to pass it through if they wish?
> 
> Yeah, that would definitely be a reasonable start.
> 
> I'll wait and see if Josh has any additional thoughts.

Sounds good, thanks again for bringing this up.

Cheers,
Nathan

