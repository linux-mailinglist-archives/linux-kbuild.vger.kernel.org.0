Return-Path: <linux-kbuild+bounces-1305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A91887C3D
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 11:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB0A71C20AA4
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEEF33F9;
	Sun, 24 Mar 2024 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N2g+X6T8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8510A15E86;
	Sun, 24 Mar 2024 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711276221; cv=none; b=FZnpAju2vZFXr0uo7MB55bfrJpLPIqVBYkWobyIU99mxgrjO6aRTGMoiAE3Ao+zIatUl0XJOXDi8OCEu/16csYRET6hy0vQQklGj6KM4roAGD9H84OBepyxKvuponQ+ltx3Vek4iPffcGnBWrA4hy+eDBlKdslKQ4Md0VAQgPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711276221; c=relaxed/simple;
	bh=Zgn5RhLhw+1fcNEFWwcm+4LZra6J79bA+SrmpCAXALM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWeiYomXkEyU4q0wVm0KxzDPEt9B/XTFL+q0gl/1ATRYzYA5MtR4kFvf45HFCjjkpkbFZ/BpH4aQEZQzC7QLKWhzK2AkrwDLhrttMcF3PD9MajG5dwYQiVHWBuAX5f7QCVBlLVs4cfdRrSLtsLDChjtvCtWMl+ghTy25yicV5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N2g+X6T8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42OATna9027493;
	Sun, 24 Mar 2024 10:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=01l9OWQey/10bufH0pudv
	gUPTWWJEzRzlXPQ8vQGRQE=; b=N2g+X6T8mMMviI1va5+EOg2w1vA3hGqWJmNZM
	sjkPbRxLsp3fBEdxGx+x9qoUIeSe6uI557cT4FqLELEj6ddZfUny9DxPl5/4SVJw
	gmRUqYR/rjUnwL/4XU/4gZ8Sd01x92ovZxHHPThGqrTLXJNwxsbUCUpO2I0a9jmy
	ClIupbuqMPMqrh89txibMXK9uD9x4ecysFUDDpM5blK4OL0O9XeEqnbtfetE+8Kg
	lM4TtRwFbDUReeS8yHDeSEgmIlnzgCg1KzBRcIge15ePuwdNSiHdqZc0qwI7Cac5
	v75hqbVzeldVU+kLtORtbTvp6j8GGH7lPyO/U6TqtCHB67C7w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x1mskmefs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Mar 2024 10:29:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42OATmKA022831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Mar 2024 10:29:48 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 24 Mar 2024 03:29:44 -0700
Date: Sun, 24 Mar 2024 15:59:36 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
Message-ID: <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Du1qeUnsdDiaXHQJcozNXRl8JxztSbpy
X-Proofpoint-GUID: Du1qeUnsdDiaXHQJcozNXRl8JxztSbpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-24_07,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403240066

On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> Generate DRM/MSM headers on the fly during kernel build. This removes a
> need to push register changes to Mesa with the following manual
> synchronization step. Existing headers will be removed in the following
> commits (split away to ease reviews).

Is this approach common in upstream kernel? Isn't it a bit awkward from
legal perspective to rely on a source file outside of kernel during
compilation?

-Akhil

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/.gitignore |  1 +
>  drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
>  drivers/gpu/drm/msm/msm_drv.c  |  3 +-
>  drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
>  4 files changed, 80 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
> new file mode 100644
> index 000000000000..9ab870da897d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/.gitignore
> @@ -0,0 +1 @@
> +generated/
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 26ed4f443149..c861de58286c 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -1,10 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
>  ccflags-y := -I $(srctree)/$(src)
> +ccflags-y += -I $(obj)/generated
>  ccflags-y += -I $(srctree)/$(src)/disp/dpu1
>  ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
>  ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
>  
> -msm-y := \
> +adreno-y := \
>  	adreno/adreno_device.o \
>  	adreno/adreno_gpu.o \
>  	adreno/a2xx_gpu.o \
> @@ -18,7 +19,11 @@ msm-y := \
>  	adreno/a6xx_gmu.o \
>  	adreno/a6xx_hfi.o \
>  
> -msm-$(CONFIG_DRM_MSM_HDMI) += \
> +adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> +
> +adreno-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
> +
> +msm-display-$(CONFIG_DRM_MSM_HDMI) += \
>  	hdmi/hdmi.o \
>  	hdmi/hdmi_audio.o \
>  	hdmi/hdmi_bridge.o \
> @@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
>  	hdmi/hdmi_phy_8x74.o \
>  	hdmi/hdmi_pll_8960.o \
>  
> -msm-$(CONFIG_DRM_MSM_MDP4) += \
> +msm-display-$(CONFIG_DRM_MSM_MDP4) += \
>  	disp/mdp4/mdp4_crtc.o \
>  	disp/mdp4/mdp4_dsi_encoder.o \
>  	disp/mdp4/mdp4_dtv_encoder.o \
> @@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
>  	disp/mdp4/mdp4_kms.o \
>  	disp/mdp4/mdp4_plane.o \
>  
> -msm-$(CONFIG_DRM_MSM_MDP5) += \
> +msm-display-$(CONFIG_DRM_MSM_MDP5) += \
>  	disp/mdp5/mdp5_cfg.o \
>  	disp/mdp5/mdp5_cmd_encoder.o \
>  	disp/mdp5/mdp5_ctl.o \
> @@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
>  	disp/mdp5/mdp5_plane.o \
>  	disp/mdp5/mdp5_smp.o \
>  
> -msm-$(CONFIG_DRM_MSM_DPU) += \
> +msm-display-$(CONFIG_DRM_MSM_DPU) += \
>  	disp/dpu1/dpu_core_perf.o \
>  	disp/dpu1/dpu_crtc.o \
>  	disp/dpu1/dpu_encoder.o \
> @@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>  	disp/dpu1/dpu_vbif.o \
>  	disp/dpu1/dpu_writeback.o
>  
> -msm-$(CONFIG_DRM_MSM_MDSS) += \
> +msm-display-$(CONFIG_DRM_MSM_MDSS) += \
>  	msm_mdss.o \
>  
> -msm-y += \
> +msm-display-y += \
>  	disp/mdp_format.o \
>  	disp/mdp_kms.o \
>  	disp/msm_disp_snapshot.o \
>  	disp/msm_disp_snapshot_util.o \
> +
> +msm-y += \
>  	msm_atomic.o \
>  	msm_atomic_tracepoints.o \
>  	msm_debugfs.o \
> @@ -115,12 +122,12 @@ msm-y += \
>  	msm_submitqueue.o \
>  	msm_gpu_tracepoints.o \
>  
> -msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> -	dp/dp_debug.o
> +msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
>  
> -msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
> +msm-display-$(CONFIG_DEBUG_FS) += \
> +	dp/dp_debug.o
>  
> -msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> +msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>  	dp/dp_catalog.o \
>  	dp/dp_ctrl.o \
>  	dp/dp_display.o \
> @@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>  	dp/dp_audio.o \
>  	dp/dp_utils.o
>  
> -msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> -
> -msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> +msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>  
> -msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
> +msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
>  			dsi/dsi_cfg.o \
>  			dsi/dsi_host.o \
>  			dsi/dsi_manager.o \
>  			dsi/phy/dsi_phy.o
>  
> -msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> -msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> +
> +msm-y += $(adreno-y) $(msm-display-y)
>  
>  obj-$(CONFIG_DRM_MSM)	+= msm.o
> +
> +quiet_cmd_headergen = GENHDR  $@
> +      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
> +
> +$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
> +		$(src)/registers/adreno/adreno_common.xml \
> +		$(src)/registers/adreno/adreno_pm4.xml \
> +		$(src)/registers/freedreno_copyright.xml \
> +		$(src)/registers/gen_header.py \
> +		$(src)/registers/rules-fd.xsd \
> +		FORCE
> +	$(call if_changed,headergen)
> +
> +$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
> +		$(src)/registers/freedreno_copyright.xml \
> +		$(src)/registers/gen_header.py \
> +		$(src)/registers/rules-fd.xsd \
> +		FORCE
> +	$(call if_changed,headergen)
> +
> +ADRENO_HEADERS = \
> +	generated/a2xx.xml.h \
> +	generated/a3xx.xml.h \
> +	generated/a4xx.xml.h \
> +	generated/a5xx.xml.h \
> +	generated/a6xx.xml.h \
> +	generated/a6xx_gmu.xml.h \
> +	generated/adreno_common.xml.h \
> +	generated/adreno_pm4.xml.h \
> +
> +DISPLAY_HEADERS = \
> +	generated/dsi_phy_7nm.xml.h \
> +	generated/dsi_phy_10nm.xml.h \
> +	generated/dsi_phy_14nm.xml.h \
> +	generated/dsi_phy_20nm.xml.h \
> +	generated/dsi_phy_28nm_8960.xml.h \
> +	generated/dsi_phy_28nm.xml.h \
> +	generated/dsi.xml.h \
> +	generated/hdmi.xml.h \
> +	generated/mdp4.xml.h \
> +	generated/mdp5.xml.h \
> +	generated/mdp_common.xml.h \
> +	generated/sfpb.xml.h
> +
> +$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> +$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
> +
> +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 97790faffd23..9c33f4e3f822 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -17,8 +17,9 @@
>  
>  #include "msm_drv.h"
>  #include "msm_debugfs.h"
> +#include "msm_gem.h"
> +#include "msm_gpu.h"
>  #include "msm_kms.h"
> -#include "adreno/adreno_gpu.h"
>  
>  /*
>   * MSM driver version:
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 655002b21b0d..cd185b9636d2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -11,7 +11,7 @@
>  #include "msm_mmu.h"
>  #include "msm_fence.h"
>  #include "msm_gpu_trace.h"
> -#include "adreno/adreno_gpu.h"
> +//#include "adreno/adreno_gpu.h"
>  
>  #include <generated/utsrelease.h>
>  #include <linux/string_helpers.h>
> 
> -- 
> 2.39.2
> 
> 

