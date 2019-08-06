Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 009B982BD6
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 08:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731731AbfHFGkp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 02:40:45 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:40143 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731976AbfHFGko (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:40:44 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x766dO7s002982;
        Tue, 6 Aug 2019 15:39:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x766dO7s002982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565073570;
        bh=NHKB+RcwJX9tNIjEMmZ3uK4qIjZTelU5Onq9zKuQPU8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1czhhUjZIDKICC0g7fyRzg51PmtWgjB1i4MvtPqab9fEajQ0lRcfnksDCFerqRlph
         unCwjFQ775zT5+tV/VfY1ipMRAEYuRVi0pK4zKLDFQb07BGtD5Tva6Fs00h7l65Hzr
         FM9aw191ln8QtwH187M1/MTUVa19G55lWLnKx5fSuY3CT8yIQQ1585eCOAjfTpghyy
         0hMngY9kEM8RhPHDOmMivWKUrpwtTFTpsCMLTRgtEiG3NioBL488ptfT157wmZMumX
         PVqpn6K/khWACOLaK8gXI2y61aX+YBlyY+4kCYlTIjavosYIwL900eBBTY7/JrbSSI
         fuOSvgLZu+Gxg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        dri-devel@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm: i915: hierachize Makefiles
Date:   Tue,  6 Aug 2019 15:39:23 +0900
Message-Id: <20190806063923.1266-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

You can use the <modname>-y syntax in sub-directory Makefiles
of modules.

Demonstrate how it works.

PLEASE DO NOT APPLY FOR NOW: this is only for comments.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpu/drm/i915/Makefile               | 126 ++------------------
 drivers/gpu/drm/i915/display/Makefile       |  64 ++++++++++
 drivers/gpu/drm/i915/gem/Makefile           |  27 +++++
 drivers/gpu/drm/i915/gem/selftests/Makefile |   3 +
 drivers/gpu/drm/i915/gt/Makefile            |  16 +++
 drivers/gpu/drm/i915/gvt/Makefile           |  32 ++++-
 drivers/gpu/drm/i915/selftests/Makefile     |   9 ++
 7 files changed, 153 insertions(+), 124 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/Makefile
 create mode 100644 drivers/gpu/drm/i915/selftests/Makefile

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 8cace65f50ce..6319c670bfb8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -63,56 +63,16 @@ i915-y += \
 	i915_user_extensions.o
 
 i915-$(CONFIG_COMPAT)   += i915_ioc32.o
-i915-$(CONFIG_DEBUG_FS) += i915_debugfs.o display/intel_pipe_crc.o
+i915-$(CONFIG_DEBUG_FS) += i915_debugfs.o
 i915-$(CONFIG_PERF_EVENTS) += i915_pmu.o
 
 # "Graphics Technology" (aka we talk to the gpu)
-obj-y += gt/
-gt-y += \
-	gt/intel_breadcrumbs.o \
-	gt/intel_context.o \
-	gt/intel_engine_cs.o \
-	gt/intel_engine_pm.o \
-	gt/intel_gt_pm.o \
-	gt/intel_hangcheck.o \
-	gt/intel_lrc.o \
-	gt/intel_reset.o \
-	gt/intel_ringbuffer.o \
-	gt/intel_mocs.o \
-	gt/intel_sseu.o \
-	gt/intel_workarounds.o
-gt-$(CONFIG_DRM_I915_SELFTEST) += \
-	gt/mock_engine.o
-i915-y += $(gt-y)
+i915-y += gt/
 
 # GEM (Graphics Execution Management) code
-obj-y += gem/
-gem-y += \
-	gem/i915_gem_busy.o \
-	gem/i915_gem_clflush.o \
-	gem/i915_gem_client_blt.o \
-	gem/i915_gem_context.o \
-	gem/i915_gem_dmabuf.o \
-	gem/i915_gem_domain.o \
-	gem/i915_gem_execbuffer.o \
-	gem/i915_gem_fence.o \
-	gem/i915_gem_internal.o \
-	gem/i915_gem_object.o \
-	gem/i915_gem_object_blt.o \
-	gem/i915_gem_mman.o \
-	gem/i915_gem_pages.o \
-	gem/i915_gem_phys.o \
-	gem/i915_gem_pm.o \
-	gem/i915_gem_shmem.o \
-	gem/i915_gem_shrinker.o \
-	gem/i915_gem_stolen.o \
-	gem/i915_gem_throttle.o \
-	gem/i915_gem_tiling.o \
-	gem/i915_gem_userptr.o \
-	gem/i915_gem_wait.o \
-	gem/i915_gemfs.o
+i915-y += gem/
+
 i915-y += \
-	  $(gem-y) \
 	  i915_active.o \
 	  i915_cmd_parser.o \
 	  i915_gem_batch_pool.o \
@@ -148,78 +108,11 @@ i915-y += intel_renderstate_gen6.o \
 	  intel_renderstate_gen8.o \
 	  intel_renderstate_gen9.o
 
-# modesetting core code
-obj-y += display/
-i915-y += \
-	display/intel_atomic.o \
-	display/intel_atomic_plane.o \
-	display/intel_audio.o \
-	display/intel_bios.o \
-	display/intel_bw.o \
-	display/intel_cdclk.o \
-	display/intel_color.o \
-	display/intel_combo_phy.o \
-	display/intel_connector.o \
-	display/intel_display.o \
-	display/intel_display_power.o \
-	display/intel_dpio_phy.o \
-	display/intel_dpll_mgr.o \
-	display/intel_fbc.o \
-	display/intel_fifo_underrun.o \
-	display/intel_frontbuffer.o \
-	display/intel_hdcp.o \
-	display/intel_hotplug.o \
-	display/intel_lpe_audio.o \
-	display/intel_overlay.o \
-	display/intel_psr.o \
-	display/intel_quirks.o \
-	display/intel_sprite.o
-i915-$(CONFIG_ACPI) += \
-	display/intel_acpi.o \
-	display/intel_opregion.o
-i915-$(CONFIG_DRM_FBDEV_EMULATION) += \
-	display/intel_fbdev.o
-
-# modesetting output/encoder code
-i915-y += \
-	display/dvo_ch7017.o \
-	display/dvo_ch7xxx.o \
-	display/dvo_ivch.o \
-	display/dvo_ns2501.o \
-	display/dvo_sil164.o \
-	display/dvo_tfp410.o \
-	display/icl_dsi.o \
-	display/intel_crt.o \
-	display/intel_ddi.o \
-	display/intel_dp.o \
-	display/intel_dp_aux_backlight.o \
-	display/intel_dp_link_training.o \
-	display/intel_dp_mst.o \
-	display/intel_dsi.o \
-	display/intel_dsi_dcs_backlight.o \
-	display/intel_dsi_vbt.o \
-	display/intel_dvo.o \
-	display/intel_gmbus.o \
-	display/intel_hdmi.o \
-	display/intel_lspcon.o \
-	display/intel_lvds.o \
-	display/intel_panel.o \
-	display/intel_sdvo.o \
-	display/intel_tv.o \
-	display/intel_vdsc.o \
-	display/vlv_dsi.o \
-	display/vlv_dsi_pll.o
+i915-y += display/
 
 # Post-mortem debug and GPU hang state capture
 i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
-i915-$(CONFIG_DRM_I915_SELFTEST) += \
-	gem/selftests/igt_gem_utils.o \
-	selftests/i915_random.o \
-	selftests/i915_selftest.o \
-	selftests/igt_flush_test.o \
-	selftests/igt_live_test.o \
-	selftests/igt_reset.o \
-	selftests/igt_spinner.o
+i915-$(CONFIG_DRM_I915_SELFTEST) += selftests/
 
 # virtual gpu code
 i915-y += i915_vgpu.o
@@ -241,10 +134,7 @@ i915-y += i915_perf.o \
 	  i915_oa_cnl.o \
 	  i915_oa_icl.o
 
-ifeq ($(CONFIG_DRM_I915_GVT),y)
-i915-y += intel_gvt.o
-include $(src)/gvt/Makefile
-endif
+i915-$(CONFIG_DRM_I915_GVT) += intel_gvt.o gvt/
 
 obj-$(CONFIG_DRM_I915) += i915.o
-obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
+obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/
diff --git a/drivers/gpu/drm/i915/display/Makefile b/drivers/gpu/drm/i915/display/Makefile
index 1c75b5c9790c..1fd26c5e68b5 100644
--- a/drivers/gpu/drm/i915/display/Makefile
+++ b/drivers/gpu/drm/i915/display/Makefile
@@ -1,2 +1,66 @@
 # Extra header tests
 include $(src)/Makefile.header-test
+
+i915-$(CONFIG_DEBUG_FS) += \
+	intel_pipe_crc.o
+
+# modesetting core code
+i915-y += \
+	intel_atomic.o \
+	intel_atomic_plane.o \
+	intel_audio.o \
+	intel_bios.o \
+	intel_bw.o \
+	intel_cdclk.o \
+	intel_color.o \
+	intel_combo_phy.o \
+	intel_connector.o \
+	intel_display.o \
+	intel_display_power.o \
+	intel_dpio_phy.o \
+	intel_dpll_mgr.o \
+	intel_fbc.o \
+	intel_fifo_underrun.o \
+	intel_frontbuffer.o \
+	intel_hdcp.o \
+	intel_hotplug.o \
+	intel_lpe_audio.o \
+	intel_overlay.o \
+	intel_psr.o \
+	intel_quirks.o \
+	intel_sprite.o
+i915-$(CONFIG_ACPI) += \
+	intel_acpi.o \
+	intel_opregion.o
+i915-$(CONFIG_DRM_FBDEV_EMULATION) += \
+	intel_fbdev.o
+
+# modesetting output/encoder code
+i915-y += \
+	dvo_ch7017.o \
+	dvo_ch7xxx.o \
+	dvo_ivch.o \
+	dvo_ns2501.o \
+	dvo_sil164.o \
+	dvo_tfp410.o \
+	icl_dsi.o \
+	intel_crt.o \
+	intel_ddi.o \
+	intel_dp.o \
+	intel_dp_aux_backlight.o \
+	intel_dp_link_training.o \
+	intel_dp_mst.o \
+	intel_dsi.o \
+	intel_dsi_dcs_backlight.o \
+	intel_dsi_vbt.o \
+	intel_dvo.o \
+	intel_gmbus.o \
+	intel_hdmi.o \
+	intel_lspcon.o \
+	intel_lvds.o \
+	intel_panel.o \
+	intel_sdvo.o \
+	intel_tv.o \
+	intel_vdsc.o \
+	vlv_dsi.o \
+	vlv_dsi_pll.o
diff --git a/drivers/gpu/drm/i915/gem/Makefile b/drivers/gpu/drm/i915/gem/Makefile
index 07e7b8b840ea..1d9da1287bef 100644
--- a/drivers/gpu/drm/i915/gem/Makefile
+++ b/drivers/gpu/drm/i915/gem/Makefile
@@ -1 +1,28 @@
 include $(src)/Makefile.header-test # Extra header tests
+
+i915-y += \
+	i915_gem_busy.o \
+	i915_gem_clflush.o \
+	i915_gem_client_blt.o \
+	i915_gem_context.o \
+	i915_gem_dmabuf.o \
+	i915_gem_domain.o \
+	i915_gem_execbuffer.o \
+	i915_gem_fence.o \
+	i915_gem_internal.o \
+	i915_gem_object.o \
+	i915_gem_object_blt.o \
+	i915_gem_mman.o \
+	i915_gem_pages.o \
+	i915_gem_phys.o \
+	i915_gem_pm.o \
+	i915_gem_shmem.o \
+	i915_gem_shrinker.o \
+	i915_gem_stolen.o \
+	i915_gem_throttle.o \
+	i915_gem_tiling.o \
+	i915_gem_userptr.o \
+	i915_gem_wait.o \
+	i915_gemfs.o
+
+i915-$(CONFIG_DRM_I915_SELFTEST) += selftests/
diff --git a/drivers/gpu/drm/i915/gem/selftests/Makefile b/drivers/gpu/drm/i915/gem/selftests/Makefile
new file mode 100644
index 000000000000..80f96f51b623
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/selftests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+i915-y += igt_gem_utils.o
diff --git a/drivers/gpu/drm/i915/gt/Makefile b/drivers/gpu/drm/i915/gt/Makefile
index 1c75b5c9790c..1a3401e7dde5 100644
--- a/drivers/gpu/drm/i915/gt/Makefile
+++ b/drivers/gpu/drm/i915/gt/Makefile
@@ -1,2 +1,18 @@
 # Extra header tests
 include $(src)/Makefile.header-test
+
+i915-y += \
+	intel_breadcrumbs.o \
+	intel_context.o \
+	intel_engine_cs.o \
+	intel_engine_pm.o \
+	intel_gt_pm.o \
+	intel_hangcheck.o \
+	intel_lrc.o \
+	intel_reset.o \
+	intel_ringbuffer.o \
+	intel_mocs.o \
+	intel_sseu.o \
+	intel_workarounds.o
+i915-$(CONFIG_DRM_I915_SELFTEST) += \
+	mock_engine.o
diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..2bd07b7935d3 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -1,9 +1,29 @@
 # SPDX-License-Identifier: GPL-2.0
-GVT_DIR := gvt
-GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
-	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
-	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
-	fb_decoder.o dmabuf.o page_track.o
 
 ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
-i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
+
+i915-y += \
+	gvt.o \
+	aperture_gm.o \
+	handlers.o \
+	vgpu.o \
+	trace_points.o \
+	firmware.o \
+	interrupt.o \
+	gtt.o \
+	cfg_space.o \
+	opregion.o \
+	mmio.o \
+	display.o \
+	edid.o \
+	execlist.o \
+	scheduler.o \
+	sched_policy.o \
+	mmio_context.o \
+	cmd_parser.o \
+	debugfs.o \
+	fb_decoder.o \
+	dmabuf.o \
+	page_track.o
+
+obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
diff --git a/drivers/gpu/drm/i915/selftests/Makefile b/drivers/gpu/drm/i915/selftests/Makefile
new file mode 100644
index 000000000000..19ca8e7b3b80
--- /dev/null
+++ b/drivers/gpu/drm/i915/selftests/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+i915-y += \
+	i915_random.o \
+	i915_selftest.o \
+	igt_flush_test.o \
+	igt_live_test.o \
+	igt_reset.o \
+	igt_spinner.o
-- 
2.17.1

