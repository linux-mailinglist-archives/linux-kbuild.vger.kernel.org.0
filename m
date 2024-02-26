Return-Path: <linux-kbuild+bounces-1060-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6A8667EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 03:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 514BA1F20C3A
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 02:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9675D11737;
	Mon, 26 Feb 2024 02:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XUIO8Whs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F04BEEB5
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2024 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913515; cv=none; b=dVS7EqR9dw+8YbPZIrdQdak9OAXR4y69OP0TCu7cOeibNNf0WaphJpuY/A+UsCy0Nda31T8gTsvxkvF+8U6Avl0a8WykyQWfy/mIQddKSF94z2dIkXNmd3k5NXeB68uSFxB6ZIH72TYxaw9kdKPdMzhsa0swNdmdGzDXpcIyb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913515; c=relaxed/simple;
	bh=Nx7fpXRNpbAX1r5/PwTsdJN6+2r3qO1If+c+S986pBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8RdkvlGQG7kgqN0rR8j29jEiCnS5zMwYC+SD6sAI4kMCmqV+z+3uBNPKLl0AjhAVpSF0zeZs0hmmfkFG1uG1VzNON+QiF8YUM3n986pxii4lAvab6XFrYTSxCdNIYR17m7bYbM5pGm1zMZvbPenTsq3zbOuflYjdnJbgxjbsok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XUIO8Whs; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512f6f263a6so577182e87.2
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2024 18:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913512; x=1709518312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lr1blVGAcoSGI3DjOlnBnp5duz00dIqA6nxHMeCLWdU=;
        b=XUIO8WhsNrHtaHunDHGcV/8jbd80tPiGv+fLph+l7jRkXYUWqJqfIdiR9EIVj+YSTY
         pUkL3DMTBHRm3EwdCT8yCzIZ7w9d1RXgxbeFCOAsxgxGEnZIgZ6TXycCWRkoksO5GHGJ
         IIkR5+Z2desXTAQbEqkkUvScExkq932jdIEBwoXASR08B6CQlP/8M7F9UrixC7y1jYOd
         hhqyOJ7YNV/4PuOs1rN+wm2Or2TwUPwW3kGdt6UxlViR8J0aVwIqs71dJqCFUsHY3QiX
         mbdtHGszsYxSENults3hWAnKfv3fD8geI06r1yiD0YdO+QmVbL8bIvmGgg+wMfXoUOSa
         7v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913512; x=1709518312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lr1blVGAcoSGI3DjOlnBnp5duz00dIqA6nxHMeCLWdU=;
        b=mI7SPjFMxR/MUWvn5f9Di547LD5HF3oTSXQzwMG4b92h2yQwjIrzTNiIybK78eLiRw
         vspAirFPk9nYWXOwoazCQLzwqGECLZDOn/+wWazQ8zazeoMoNeZ1MXdvczTYzAn4rIam
         lz2b9G/A491J50qlxR82f0bn3/y1Ek4qyGkiIzZBwoRkRYX+DhoWwBqzlY4f1Z6CHSYz
         FP+JXFF4XiQfVUs0r0HmPgbacyajpmw3Bgahv4Gr+OF5ezSe9c5OW+KsdDR2VOuaat1I
         1x1wzk4eUCtW2ZwTuQxED2n42WJcAqLM8sKXG+FPvab45jzu3hWCD9GblYw0SXULMm0b
         yPhg==
X-Gm-Message-State: AOJu0YxT95+ImuMhGc4bHm5estsS9h/jU/w/mKH56oJU6QD/xLsCAIld
	QlOiefv4kwyP6tZfKoUig9vMlrVso9njw94VS3WKcqkHDGQiWZQ0osmgZYkugn4=
X-Google-Smtp-Source: AGHT+IGwS1S2UIhR7u1D1bdJLxUjT0Jxa/J70GI1DJuamydDmmp3ucw1HVC+ZEydtEqM5NUTau2YZQ==
X-Received: by 2002:a05:6512:1196:b0:512:e218:db7f with SMTP id g22-20020a056512119600b00512e218db7fmr4207381lfr.67.1708913511750;
        Sun, 25 Feb 2024 18:11:51 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:41 +0200
Subject: [PATCH RFC 05/12] drm/msm: use _shipped suffix for all xml.h files
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-5-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8048;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Nx7fpXRNpbAX1r5/PwTsdJN6+2r3qO1If+c+S986pBg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhwB+8UhIVNwQgD1ymNg7h8cxIwJG82l3SB
 Qh8ciUg7lqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1QfnB/wO4OAKfkCA0ViZeKqmFzhrpWC+RtB6kbCKREZbqvsxR8ezWqAEofG1IKcWAKnCf0ZQ1jK
 b/DeJwbAIZskh03EEqffohnxySp6RF/WIS/NlBGiYR3wdZ9A1KPhV3XvkyVJ8AozL/FKtq+gLS6
 9XBBJWar2aloyeQfC1D41fStDTi6QyLZYaZU2hfbLRKVRQxFIHckuTvrv9m8H8VoQM0EeBKKQnY
 y6/ipHxkDX82EKk/DpoFvwShjl1QDcnl5vsBVcHRMkacW0bcYgP1NXqrBgtGOPHhOOoF69vd5JA
 HTbvtv79T0lC7J1qogV+FBT3lUCKu4Cm/ESCDGfV3BlLzKZH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move non-GPU xml.h files into the ./registers subdir and add the
_shipped suffix. The GPU files are left intact for now, since they
require processing via a gen_headers.py, while display headers are
regenerated using headergen2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       | 53 ++++++++++++++++++----
 .../{dsi/dsi.xml.h => registers/dsi.xml.h_shipped} |  0
 .../dsi_phy_10nm.xml.h_shipped}                    |  0
 .../dsi_phy_14nm.xml.h_shipped}                    |  0
 .../dsi_phy_20nm.xml.h_shipped}                    |  0
 .../dsi_phy_28nm.xml.h_shipped}                    |  0
 .../dsi_phy_28nm_8960.xml.h_shipped}               |  0
 .../dsi_phy_7nm.xml.h_shipped}                     |  0
 .../hdmi.xml.h => registers/hdmi.xml.h_shipped}    |  0
 .../mdp4.xml.h => registers/mdp4.xml.h_shipped}    |  0
 .../mdp5.xml.h => registers/mdp5.xml.h_shipped}    |  0
 .../mdp_common.xml.h_shipped}                      |  0
 .../sfpb.xml.h => registers/sfpb.xml.h_shipped}    |  0
 13 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 543e04fa72e3..89c9f5f93b85 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 ccflags-y := -I $(srctree)/$(src)
+ccflags-y := -I $(obj)/registers
 ccflags-y += -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
 ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
@@ -17,7 +18,7 @@ msm-y := \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
 
-msm-$(CONFIG_DRM_MSM_HDMI) += \
+msm-hdmi += \
 	hdmi/hdmi.o \
 	hdmi/hdmi_audio.o \
 	hdmi/hdmi_bridge.o \
@@ -30,7 +31,11 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
 
-msm-$(CONFIG_DRM_MSM_MDP4) += \
+msm-$(CONFIG_DRM_MSM_HDMI) += $(msm-hdmi)
+
+$(addprefix $(obj)/,$(msm-hdmi)): $(obj)/registers/hdmi.xml.h
+
+msm-mdp4 += \
 	disp/mdp4/mdp4_crtc.o \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
@@ -41,7 +46,12 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
 
-msm-$(CONFIG_DRM_MSM_MDP5) += \
+msm-$(CONFIG_DRM_MSM_MDP4) += $(msm-mdp4)
+
+$(addprefix $(obj)/,$(msm-mdp4)): $(obj)/registers/mdp4.xml.h
+$(addprefix $(obj)/,$(msm-mdp4)): $(obj)/registers/mdp_common.xml.h
+
+msm-mdp5 += \
 	disp/mdp5/mdp5_cfg.o \
 	disp/mdp5/mdp5_cmd_encoder.o \
 	disp/mdp5/mdp5_ctl.o \
@@ -54,6 +64,10 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
 
+msm-$(CONFIG_DRM_MSM_MDP5) += $(msm-mdp5)
+$(addprefix $(obj)/,$(msm-mdp5)): $(obj)/registers/mdp5.xml.h
+$(addprefix $(obj)/,$(msm-mdp5)): $(obj)/registers/mdp_common.xml.h
+
 msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
@@ -115,6 +129,9 @@ msm-y += \
 	msm_gpu_tracepoints.o \
 	msm_gpummu.o
 
+$(obj)/disp/mdp_format.o: $(obj)/registers/mdp_common.xml.h
+$(obj)/disp/mdp_kms.o: $(obj)/registers/mdp_common.xml.h
+
 msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 	dp/dp_debug.o
 
@@ -133,17 +150,33 @@ msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 
 msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
-msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
+msm-dsi += dsi/dsi.o \
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
+$(obj)/dsi/dsi_host.o: $(obj)/registers/sfpb.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
+$(obj)/dsi/phy/dsi_phy_28nm.o: $(obj)/registers/dsi_phy_28nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
+$(obj)/dsi/phy/dsi_phy_20nm.o: $(obj)/registers/dsi_phy_20nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
+$(obj)/dsi/phy/dsi_phy_28nm_8960.o: $(obj)/registers/dsi_phy_28nm_8960.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
+$(obj)/dsi/phy/dsi_phy_14nm.o: $(obj)/registers/dsi_phy_14nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
+$(obj)/dsi/phy/dsi_phy_10nm.o: $(obj)/registers/dsi_phy_10nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+$(obj)/dsi/phy/dsi_phy_7nm.o: $(obj)/registers/dsi_phy_7nm.xml.h
+
+msm-$(CONFIG_DRM_MSM_DSI) += $(msm-dsi) $(msm-dsi-y)
+$(addprefix $(obj)/,$(msm-dsi) $(msm-dsi-y)): $(obj)/registers/dsi.xml.h
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi.xml.h
rename to drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/hdmi/hdmi.xml.h
rename to drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h b/drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h
rename to drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h b/drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h
rename to drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/disp/mdp_common.xml.h b/drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/disp/mdp_common.xml.h
rename to drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/sfpb.xml.h b/drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/sfpb.xml.h
rename to drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped

-- 
2.39.2


