Return-Path: <linux-kbuild+bounces-1430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBF89372F
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 04:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B95C2815CB
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 02:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198C5137E;
	Mon,  1 Apr 2024 02:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEF8ttVO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1C5256
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Apr 2024 02:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939384; cv=none; b=Z3tLwTPdOXbF6Mpd9bZRWfaDnEhhJcZmKLMSALkfxVcbVEO12RXCPyLiQPKd8K6mpPxkBlNQ9pMRradj6UBIligduT4PisvEKfx99ev01dM+beRJ3MOAB8Da4RSuFwyry3vvbGJ/Mqx3HW0vI7B7qcubDfjs0hAm14hId7Ykdd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939384; c=relaxed/simple;
	bh=ORR6dzF7ixyVffKjNFSE9dEPQrJVKUkVVQI3maBxXnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0zsepSOFlThZDiyvT/AIwHGgFr0QP4esfMXK6OQ5lEzRom/DEPBj9bxOJkS2dKyJkRluWVfEFZB02ncxzqedOoqticKVO0BZGW3qG/CUh3G6abPdRzkGMOLqCaBijScsnYItJyhzGuhN5WczZkkQtG9beNYdtnNwWfm+dguYho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wEF8ttVO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d68c6a4630so38135181fa.3
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Mar 2024 19:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939378; x=1712544178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmzWTuWbA7/KSeKskJRCzphgzIAmKm2p4vsT24YraKE=;
        b=wEF8ttVO3BfCAyTccp235H4E7vIsAGZQEafQa/P5ZE2r2YT4Tb1pc2+UI+NTQt/uiq
         vFLgoRsJgAze7B4u5U1HDYxJYWjWV8Ba0LAJEwTas5PFl27/7uEsyA4NC90FyacD3e2f
         SeyoZJ8KlElXbMplaNsHdkmjS8mvL2k9C3DhBYJlJs8E6TPKmzYqC068GYuGHTCKYeLP
         pAOlgTw1SzRo+0BMIKpf07eoE9jUhFqNbZRt6JYLJ8cxOvfOMAZkqd4xJPRHIH6B6/E5
         kLOgDVyFARPuVCYXzuiqBRh8qMi0rwuY1ti5VUwFY/fyaNIYO9vev6Ftm00ooJEt3hdz
         Y4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939378; x=1712544178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmzWTuWbA7/KSeKskJRCzphgzIAmKm2p4vsT24YraKE=;
        b=eXhyJJZeZExnfznaFoxzIdyYUgSiXbzdtMrDV/goZJfbiRxOuuO4k9ddX7zNJQy2l+
         EY544S7mz/wvCeIx5B4Z++Ad5ae4nh1C4WJvW4/8tRjce1BkK/CzLGb+l99j6kXgQeEx
         or4MJJUYLG+ElMYzZKDys+8FUz9gggRirC5cql7L6hzMyu8Ob+tPVtI66DSjAibNCPeq
         1n6qxeCV3/sP9Zhn/t4IwGQ4iKKFe2syHPZuwbSRGn8VeA7zewKLfCUfansCX1+3XO3L
         Nl9XVMPP80b/g8uJKTLxlw8sKzq0xKYabczYJS/14Bw18pA2gL3QGnjhAihu9cObDnOP
         eTPg==
X-Gm-Message-State: AOJu0YxtLm6mmRQ1QCZvaIX7lA+dd9KyVNVqbZzd37Je1c3ZVMeMjYjD
	JbhcuSyONNUKQBvdbM6mU3HcCrC/3T2YyBfPqBRWlNAPMPrcXj77yOV9mmvobvY=
X-Google-Smtp-Source: AGHT+IEPb4dY6c7aQMIQ2N70LBEcT/wgoDKqI8HuRJD1ZarBUNfLnOXM1swyg6gqFYmqbM4vF+AvJw==
X-Received: by 2002:a05:6512:3d21:b0:516:9ee5:e02c with SMTP id d33-20020a0565123d2100b005169ee5e02cmr5539392lfv.2.1711939377923;
        Sun, 31 Mar 2024 19:42:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:41 +0300
Subject: [PATCH v5 11/18] drm/msm: generate headers on the fly
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-11-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6349;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ORR6dzF7ixyVffKjNFSE9dEPQrJVKUkVVQI3maBxXnQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8m9FVtEnUE6/RSjnhnzRZcNwlyoZnCF4Zxq
 Y6DVbF/TfCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJgAKCRCLPIo+Aiko
 1RzpCACKW9A9HILnWVZWgBXnr28pajL2qQI4D5ryZ02SF202oKQbsv2zbrvnDfrwWtXqDXe/Hu4
 /YX57D4fj5wnEds1nqV6F14GuR102eW2oXAxZqWxalZWx1MDuiSMXExFdV64WZA8i2aLfapDBFf
 HSEf+XLIywX27Vexfmk65SxjOC5Gu7yML/sCitRU0MNhAEK6wRtpmO7FCBiweDEALRv9r1/NJgX
 5FVOP7E26dV6vs2Cxa+X0aCKUsAtTedefX5LGPmhrWMTBSTVkwy8WLbLhRC3vlxoVHm7MrgZ0yz
 pfY9Cm/hztkRPitWlBEcN1pLqVb5frtow79tXFmQHeBUjs6f
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Generate DRM/MSM headers on the fly during kernel build. This removes a
need to push register changes to Mesa with the following manual
synchronization step. Existing headers will be removed in the following
commits (split away to ease reviews).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/.gitignore |  1 +
 drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
 2 files changed, 77 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
new file mode 100644
index 000000000000..9ab870da897d
--- /dev/null
+++ b/drivers/gpu/drm/msm/.gitignore
@@ -0,0 +1 @@
+generated/
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 26ed4f443149..c861de58286c 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 ccflags-y := -I $(srctree)/$(src)
+ccflags-y += -I $(obj)/generated
 ccflags-y += -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
 ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
 
-msm-y := \
+adreno-y := \
 	adreno/adreno_device.o \
 	adreno/adreno_gpu.o \
 	adreno/a2xx_gpu.o \
@@ -18,7 +19,11 @@ msm-y := \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
 
-msm-$(CONFIG_DRM_MSM_HDMI) += \
+adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
+
+adreno-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
+
+msm-display-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi.o \
 	hdmi/hdmi_audio.o \
 	hdmi/hdmi_bridge.o \
@@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
 
-msm-$(CONFIG_DRM_MSM_MDP4) += \
+msm-display-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
@@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
 
-msm-$(CONFIG_DRM_MSM_MDP5) += \
+msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_cfg.o \
 	disp/mdp5/mdp5_cmd_encoder.o \
 	disp/mdp5/mdp5_ctl.o \
@@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
 
-msm-$(CONFIG_DRM_MSM_DPU) += \
+msm-display-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
 	disp/dpu1/dpu_encoder.o \
@@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_vbif.o \
 	disp/dpu1/dpu_writeback.o
 
-msm-$(CONFIG_DRM_MSM_MDSS) += \
+msm-display-$(CONFIG_DRM_MSM_MDSS) += \
 	msm_mdss.o \
 
-msm-y += \
+msm-display-y += \
 	disp/mdp_format.o \
 	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
+
+msm-y += \
 	msm_atomic.o \
 	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
@@ -115,12 +122,12 @@ msm-y += \
 	msm_submitqueue.o \
 	msm_gpu_tracepoints.o \
 
-msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
-	dp/dp_debug.o
+msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 
-msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
+msm-display-$(CONFIG_DEBUG_FS) += \
+	dp/dp_debug.o
 
-msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
+msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
@@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_audio.o \
 	dp/dp_utils.o
 
-msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
-
-msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
+msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
-msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
+msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
 			dsi/dsi_cfg.o \
 			dsi/dsi_host.o \
 			dsi/dsi_manager.o \
 			dsi/phy/dsi_phy.o
 
-msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
-msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
-msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
-msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
-msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
-msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
+msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+
+msm-y += $(adreno-y) $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
+
+quiet_cmd_headergen = GENHDR  $@
+      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
+
+$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
+		$(src)/registers/adreno/adreno_common.xml \
+		$(src)/registers/adreno/adreno_pm4.xml \
+		$(src)/registers/freedreno_copyright.xml \
+		$(src)/registers/gen_header.py \
+		$(src)/registers/rules-fd.xsd \
+		FORCE
+	$(call if_changed,headergen)
+
+$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
+		$(src)/registers/freedreno_copyright.xml \
+		$(src)/registers/gen_header.py \
+		$(src)/registers/rules-fd.xsd \
+		FORCE
+	$(call if_changed,headergen)
+
+ADRENO_HEADERS = \
+	generated/a2xx.xml.h \
+	generated/a3xx.xml.h \
+	generated/a4xx.xml.h \
+	generated/a5xx.xml.h \
+	generated/a6xx.xml.h \
+	generated/a6xx_gmu.xml.h \
+	generated/adreno_common.xml.h \
+	generated/adreno_pm4.xml.h \
+
+DISPLAY_HEADERS = \
+	generated/dsi_phy_7nm.xml.h \
+	generated/dsi_phy_10nm.xml.h \
+	generated/dsi_phy_14nm.xml.h \
+	generated/dsi_phy_20nm.xml.h \
+	generated/dsi_phy_28nm_8960.xml.h \
+	generated/dsi_phy_28nm.xml.h \
+	generated/dsi.xml.h \
+	generated/hdmi.xml.h \
+	generated/mdp4.xml.h \
+	generated/mdp5.xml.h \
+	generated/mdp_common.xml.h \
+	generated/sfpb.xml.h
+
+$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
+$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
+
+targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)

-- 
2.39.2


