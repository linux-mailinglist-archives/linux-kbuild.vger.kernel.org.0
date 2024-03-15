Return-Path: <linux-kbuild+bounces-1249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A187CCC5
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 12:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25261F21FB6
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 11:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504891C68A;
	Fri, 15 Mar 2024 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYEUvF9X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126981BF44
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503196; cv=none; b=Ss6L6kVSTzunfMv4xjYcd9/oW05EEDkGiRvev3f32ImSriT5N+bFtOUnCb2fYveFY91w5leQV686BrzjlTKtiqiWwI0vndV8k9mNu1A/sFONVJapyNjSr3tErBa1EkzzkMyPOKK3/FZmYo+jieoORdoemPOxeuSHuYbnkk82hfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503196; c=relaxed/simple;
	bh=LFBCygmQugB1B+c89cDmQuXR1TkW2sehOLTqu9Lzsnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwdVvaTpYDdAaRBZPzkrt0j3a6LxfncdkP2z44uJSZ30ll3DcQ6qzGVYsFd83NOXvb3OXabKXv+jwaF/bFI/DsXgoG9uWBfGHW2136XSWgyT8Oif+8TTUjF4kSZ9+D/v6iG+4dLkFCxwvKODvnb1B8IzlkOpuW9ZldnRdt4r9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dYEUvF9X; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-512b3b04995so2035849e87.3
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 04:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710503192; x=1711107992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnTUQM6F1e6b3ELJmMukNHuHn8ljSCVj2rp0eJe9i4Q=;
        b=dYEUvF9XU2vTQgj0aOle/tuJQOnrYRRxKF8Ajwfvdi1ZSgaoelwMTCLZeIb5cKCg/+
         EY+ocZyFiXpGr6Kzomf5UQPhjroonaTmb20R3k7uTO8hp+3rF/T6uVd4SF7fNlWeIyev
         VN4TzQv+Cayg/qnlh/2tG2H1oWGsoeaBieaKDwRhMha3QNcpfDeMCItkS0s3RoU5SWWz
         bULwyAGdoUGdSayWrjjCdIfBketmqcVkJxvvY30+0aVGkAAv/zW41aEz6AgIRQk8w1R2
         iSLU5aCH3lV9Ei2wn55QmpCkjnPUJEfvO+sZ2Fpea8NrPxbcP8k6Xzqp4HqMD9qDTMqd
         96TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503192; x=1711107992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnTUQM6F1e6b3ELJmMukNHuHn8ljSCVj2rp0eJe9i4Q=;
        b=Ku2fbZnvvr+wV+9ou8+Vl6ACvcOjmyy+hp5hyKtETdO7YEMPLTPJ7yqEGk6WVc+Iwh
         ywmk4MIKIiNL/mdXvEWn3R5x+9XW9CZbJ5q30q0JXW3vq72uekZ2Pqrt3LDTBqwazIbO
         IBJg37vMwEiTVDXgDIBKdJSXjdQ0voCK38fN+nFWV8EIXZIldkyh5+Z8OQimhXyOnpey
         tWWPjkFdRHTZPvlI2ZXsZgmyyKoomv+OY+N7/i/ZiUFIeMgBm+3lnv8mkNL2erAgMtue
         5Cqxrx/oIZxWrNoqxX6nm4+0nUCniKfP4iJNQhtuUK3iP6Zk3whkCPp2FLyAhbrVdNK+
         YaYQ==
X-Gm-Message-State: AOJu0YwXtL5b034IT362V+RZ3O373ch4EcZFl9Be0L368zDHO91fb9S8
	vQapTMVxPABI9zD6g6RB7CvKsdzC16ZN738bpi0J8HBlgQjerVYxDkzJN0bUxqw=
X-Google-Smtp-Source: AGHT+IEoRfNR3y0gEgP/uDmw8F0W15ppQGrWxJ2gVDuaoQKG4dgQpzYvzZt33ety/zxtkVVFJ3KDnw==
X-Received: by 2002:a19:430b:0:b0:513:32b1:9654 with SMTP id q11-20020a19430b000000b0051332b19654mr1886658lfa.25.1710503192064;
        Fri, 15 Mar 2024 04:46:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:46:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:46:26 +0200
Subject: [PATCH RFC v3 04/12] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v3-4-0fc122e36c53@linaro.org>
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7616;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LFBCygmQugB1B+c89cDmQuXR1TkW2sehOLTqu9Lzsnw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DURJ8VZSfcPhA2hplZSVG4kk9mT8ibTeU+Da
 oBKruluvnyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EQAKCRCLPIo+Aiko
 1WaYB/9rdIObPs25SPYC3qhW4NvqjqGjV/RlE/Na1A3V4aCpsFJPaXbNELqDxwOV8yP2s5YfmSr
 ZmiNezDGID/gOAFald5S0XE35UA9DUGGPxWGVPtfsgxBuomsN6pdrdNPeZN0u4+Cn6VnLaOfENr
 7IQei+0hb/P7Jk+GYPhmFgVJqaITdq1g87H/bEPjqJ3pJmLk7HPBdwHHs6KAIdY1/gBBU1BLksq
 M8Iw8NP1R2RcMprMQpQ99z61dJlu9rAX6vi7eAGpj6dXjIrTqdqSa/UXM/I7z2VOiAplIBuWz3V
 tu4XPQmP0rOJQUTW0W2BA1eC3IhOAGeAi/bVvqExPCKQGkpJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_gpummu.c implementation is used only on A2xx and it is tied to
the A2xx registers. Rename the source file accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       |  2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
 .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
 drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
 5 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b21ae2880c71..26ed4f443149 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -8,6 +8,7 @@ msm-y := \
 	adreno/adreno_device.o \
 	adreno/adreno_gpu.o \
 	adreno/a2xx_gpu.o \
+	adreno/a2xx_gpummu.o \
 	adreno/a3xx_gpu.o \
 	adreno/a4xx_gpu.o \
 	adreno/a5xx_gpu.o \
@@ -113,7 +114,6 @@ msm-y += \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
 	msm_gpu_tracepoints.o \
-	msm_gpummu.o
 
 msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 	dp/dp_debug.o
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 0d8133f3174b..0dc255ddf5ce 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -113,7 +113,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	uint32_t *ptr, len;
 	int i, ret;
 
-	msm_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
+	a2xx_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
 
 	DBG("%s", gpu->name);
 
@@ -469,7 +469,7 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 static struct msm_gem_address_space *
 a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
-	struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
+	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
index 161a075f94af..53702f19990f 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
@@ -19,4 +19,8 @@ struct a2xx_gpu {
 };
 #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
 
+struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu);
+void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
+		dma_addr_t *tran_error);
+
 #endif /* __A2XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
similarity index 67%
rename from drivers/gpu/drm/msm/msm_gpummu.c
rename to drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index f7d1945e0c9f..39641551eeb6 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -5,30 +5,33 @@
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
-#include "adreno/adreno_gpu.h"
-#include "adreno/a2xx.xml.h"
 
-struct msm_gpummu {
+#include "adreno_gpu.h"
+#include "a2xx_gpu.h"
+
+#include "a2xx.xml.h"
+
+struct a2xx_gpummu {
 	struct msm_mmu base;
 	struct msm_gpu *gpu;
 	dma_addr_t pt_base;
 	uint32_t *table;
 };
-#define to_msm_gpummu(x) container_of(x, struct msm_gpummu, base)
+#define to_a2xx_gpummu(x) container_of(x, struct a2xx_gpummu, base)
 
 #define GPUMMU_VA_START SZ_16M
 #define GPUMMU_VA_RANGE (0xfff * SZ_64K)
 #define GPUMMU_PAGE_SIZE SZ_4K
 #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
 
-static void msm_gpummu_detach(struct msm_mmu *mmu)
+static void a2xx_gpummu_detach(struct msm_mmu *mmu)
 {
 }
 
-static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
+static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
 		struct sg_table *sgt, size_t len, int prot)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
@@ -53,9 +56,9 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
 	return 0;
 }
 
-static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
+static int a2xx_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	unsigned i;
 
@@ -68,13 +71,13 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
-static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
+static void a2xx_gpummu_resume_translation(struct msm_mmu *mmu)
 {
 }
 
-static void msm_gpummu_destroy(struct msm_mmu *mmu)
+static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 
 	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
 		DMA_ATTR_FORCE_CONTIGUOUS);
@@ -83,16 +86,16 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.detach = msm_gpummu_detach,
-		.map = msm_gpummu_map,
-		.unmap = msm_gpummu_unmap,
-		.destroy = msm_gpummu_destroy,
-		.resume_translation = msm_gpummu_resume_translation,
+		.detach = a2xx_gpummu_detach,
+		.map = a2xx_gpummu_map,
+		.unmap = a2xx_gpummu_unmap,
+		.destroy = a2xx_gpummu_destroy,
+		.resume_translation = a2xx_gpummu_resume_translation,
 };
 
-struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
+struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 {
-	struct msm_gpummu *gpummu;
+	struct a2xx_gpummu *gpummu;
 
 	gpummu = kzalloc(sizeof(*gpummu), GFP_KERNEL);
 	if (!gpummu)
@@ -111,10 +114,10 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 	return &gpummu->base;
 }
 
-void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
+void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 		dma_addr_t *tran_error)
 {
-	dma_addr_t base = to_msm_gpummu(mmu)->pt_base;
+	dma_addr_t base = to_a2xx_gpummu(mmu)->pt_base;
 
 	*pt_base = base;
 	*tran_error = base + TABLE_SIZE; /* 32-byte aligned */
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index eb72d3645c1d..88af4f490881 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -42,7 +42,6 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
 struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
-struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
@@ -53,10 +52,6 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
 
-void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
-		dma_addr_t *tran_error);
-
-
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
 struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);

-- 
2.39.2


