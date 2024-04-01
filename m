Return-Path: <linux-kbuild+bounces-1427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5AE893725
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 04:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1C41F216CA
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 02:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE5746B5;
	Mon,  1 Apr 2024 02:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ox72FJgk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B828FD
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Apr 2024 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939375; cv=none; b=XnQGFYBpxymcyHRtbt3lAuCcWFg27zG8R9qDs+fcqV+NFUiqC0jpvRLADw34MnRFzFep8rrMy2cNL1umFRo8qXYFSR7AkecT6OIvq/OyMDdQtiRfXVDtrwkNJwUox6hnsH/Ng0jMW4g01PClH4fSdQjC4JP2FGXTucDwFXYE+rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939375; c=relaxed/simple;
	bh=6cU+E0t42Ap7hxdVHeSGMWjrpjeApiZ0znIxbQ3B0x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7PM8m75z2eEbow49I1y0rDaF0uALck+nkBvuGxPOpfxfQodhRQRN/KWH2Dk5HvAEIK3SocMFOTCI1VVrTGVA0gZBKuBrR84fVBo1LJnViH5oQ3rh8z+S+d1DcxwqNRCCVBAFRCaYZJvgyfKbp8oHzcB5uVKLeOpolFJZIdVB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ox72FJgk; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51588f70d2dso4865535e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Mar 2024 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939371; x=1712544171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9yVFk1F/l4InaoRBRhvAvLyVqHVfxw8io9/7oWWxjk=;
        b=ox72FJgkuYEfZtHAYYJUdCAxrA2+RAMFJiRYnyvdeDrk+0xxsZ8Mt+7UZ5VeQrdd5C
         Ry9dWtwUo8zurMmIMnoxHoLDnYlCq0j/vh3SacvgxFTpjOjsCvGzlWwaz7SkHkAwOJHq
         nDH3ea8RwxtHCYsaDXR1HNC+a9dCgrM3tcQTciOITY0xKkxmXZjaIUiakPSmhZ+bAYTM
         h1X9D2rhezixL3DWdTmtE6D6EPxO4unf9aQT99nE+j1Yi+4Ab/rTmbo4/5q7A6uLvdB0
         KjxF4+CSWWLOhgnll6WXbrOykEu9uQnT7Ptott5/RnDZ1mGeBc5AgQwmRD934jqSGt1J
         mtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939371; x=1712544171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9yVFk1F/l4InaoRBRhvAvLyVqHVfxw8io9/7oWWxjk=;
        b=Rtd2OroB0BteNTPOCHGN+SNADCaAKR7P+T7zApOetQIlVP+tAo42uU8D9Z4/A6S4DB
         IM7h831y8zjZuonM37VtuDMnSWjS48DzrVXCZb84LYNm8a9u1Jk4YDyRoxPb0cEJcuVY
         r2Il6ECWiGJlAtUsGZqNNTGS9PRtWumdON98+L8pFKfXEbvRGwabInRxeR6DrYiPOXlW
         dcsC+jV860hLXv5KG9plTDa4ZZS7QRO9jNJ8D3WnLIQ57ol73kxkRSoG1fs9sjxTwvlD
         OPpoOxYuh5bOkNgQPG5BLHXA86KyZqFiw4NUAqoetrj3f8OJhWFyYux48AopIu5Cpqar
         cCLA==
X-Gm-Message-State: AOJu0YxCgt/TOOxp4IjcD914VWdLq3Rd4ZU7qBD5SVzgpUp9IfrM4bHR
	NWVMjc8W3CjpqXFn9E5Q9Aq6104/ULu7LraRcuP9HNic0iUpzCUkFXOzdskVrms=
X-Google-Smtp-Source: AGHT+IH1/JM4guJl+34tgSJ/YStzCSqA5P3CfRXHwwtYSzw5F5Ml9p1FV7t1oCWJiJvS+kJX7dsLBA==
X-Received: by 2002:a05:6512:6cd:b0:513:5e6b:a191 with SMTP id u13-20020a05651206cd00b005135e6ba191mr5924164lff.50.1711939371678;
        Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:34 +0300
Subject: [PATCH v5 04/18] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-4-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7672;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6cU+E0t42Ap7hxdVHeSGMWjrpjeApiZ0znIxbQ3B0x8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8l7rJy5HPp40fwedPE0XvlatC/gRHOPF1eo
 +BHEQj9qjOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJQAKCRCLPIo+Aiko
 1TWnB/44jhPVpCCLWqmra3T6vdOKy/kk1E/qGo6vdXKYz+0MYBQp8siB6aQ+HOCDvO+8hiv9u6H
 CH17HymNiuIWWiplYAsUDHaIQYOOygyJrQnTAsdOqzIFXiK/oYQcd34/oo/7SPO6AINJEMtrw3T
 DuqRLSZJqv+3/IcXitDO5B4EnWviDT/08DL3bSQzNeooJ5FXTk4a1RA+src2apMxjDcPoiB5Jx8
 w7j/JoY+5UNyb6glVgcQ0FEIdokVgC4793o0LoKrcp1JcymSy4Kkm8x1Kt7W/AWWdbv7jKcVgq7
 DwWbSA0DxeCCkTscHNOgslUt9C7F9UTqXAmz09DNVNjda7Ib
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_gpummu.c implementation is used only on A2xx and it is tied to
the A2xx registers. Rename the source file accordingly.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
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


