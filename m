Return-Path: <linux-kbuild+bounces-1238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A587C71C
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 02:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 344851C22011
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 01:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EDB79F4;
	Fri, 15 Mar 2024 01:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGc23MFY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F567476
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 01:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710465766; cv=none; b=QODr0LpKX68pQs2vacHsM0yatK2yL7gYNjpaPEKzwgUIKc59waT+BKE8j2RpGp8+rZ57n84/av9KMbbtfS1mhbMaRKtatNLI9E/ggJL53nCW2MJ2QTbxh/7iCw0W0n0tTJs+LVmuh3V68AjDOgjC8ASgX7L2JCRHIuCIe50q+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710465766; c=relaxed/simple;
	bh=LFBCygmQugB1B+c89cDmQuXR1TkW2sehOLTqu9Lzsnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuDfoU6HYxTQ8m+Tn9PDs9HNRD12CAPC2DVUVKLkPoTfB7disWBfY5AMzbaBdY0uC32iINrdoZ/965mmwdRAe8wrgjr4RXqZEL+CwI6bRAC0vSTWWwvWJ6czvGAGQ9i/am32moQkGOZ8QwSaVSTSGYiRWTry3JVndyrj5NFr4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGc23MFY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5131316693cso2127577e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Mar 2024 18:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710465762; x=1711070562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnTUQM6F1e6b3ELJmMukNHuHn8ljSCVj2rp0eJe9i4Q=;
        b=jGc23MFYD5+SDuVl6kpUTmhI66GtqSH+ggPV7p2Kosybz7ZoDAEYSaT/B55q5LKAoY
         b9+gqMluNSe+7KMx/1sA88PuZ/7YDNhiEvbZRyuocozUoezDB4AkFhOCsUur16r5GpFO
         BF4TAjnOV0RImLxuTBkpiTIQTtdOUyNp4wLWtMuqzSOVyLbqUejNKDRDfohhnPc6yWkF
         KwM3RuLOtENHNNIRCkrKEs5rJ3PJPYUHwz76vS+tsAOOsulxmqQM2pKh4+ZGfBKnYWib
         IenR1ghXRt8v+AjKTP1hQUPQ2QulHQgC2oEBbjZf132KwSf6Lqk9vj+kve5jkG9+Hbhe
         Aehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710465762; x=1711070562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnTUQM6F1e6b3ELJmMukNHuHn8ljSCVj2rp0eJe9i4Q=;
        b=IkRQATUZbjD9VE5EI0fuyzgnBd1MQl9QoT6Dd9zsXF1ei54uQtiQo8F1bsa2iQyB6z
         xA7CRqA3gR6TecQ6XiJkQrWMHKq7F7TNE4hhvd2G4ZeHl7TNd4kDD5yF75+/WZE6BVyy
         Jn2k+6I7KvCt+Ll5tpFU2X34zWPT93J6382YWZ4O9L0d1ChYzhFf8obMRbSCfW5DwDT6
         jAAvUW0bth0s39sf0ilqAjTZrXJNkNfMvIwl48JrWnj6Hr7eNUUeOfsZtaRhKe00cDD5
         +vQJU7ikFaQ0L8ntX10phVusCdFbszExtSX9FHFZ6ZxDPzTAgRIDWI1EEoh9+IeFav/A
         iSSQ==
X-Gm-Message-State: AOJu0YwnM8kC/Zrq76pWBBNPSiR1gG+DF6WEQVCcpk1A8CB1njpg4dfB
	GSJVQ83ns8sgyNui3X96s6OHhUq0MOM0MRzUlDZSZMKn30YFFQIid++JQoOO/2Q=
X-Google-Smtp-Source: AGHT+IGF6Rd2QFEFgg8jWV1Nji7VZj+187KzICp7mgCfyOB56YyykFiunNZI1eP8sXJzZbVXX98t9w==
X-Received: by 2002:ac2:5609:0:b0:513:19cb:be72 with SMTP id v9-20020ac25609000000b0051319cbbe72mr2154193lfd.64.1710465762616;
        Thu, 14 Mar 2024 18:22:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 18:22:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 03:22:37 +0200
Subject: [PATCH RFC v2 4/7] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v2-4-7cd68ecc4320@linaro.org>
References: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86LcThFJCHH7X/l+JLZeWqxucV+hrtWlSOnI8
 yn6mTfs7jKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi3AAKCRCLPIo+Aiko
 1TXYB/wJCyFwVKYokCN9ZamLeUEw0mZlhWytrjg7ehfn6/EF1pIcqx3bcw71vBMGYxJxvSKzxam
 3ZwH+J70clDTS9/43jKkSjFm/nMAbT2uVP9vzSookMeuzNIpshJ+AYZhPJ6dJA1SYd2SZ/iNKNk
 LWf+g+D6ivAPwaj/dmlGsxk8KWnu6nynHqSGXyGFtWMpANzeYcTwfzAZugMKOdr2t+onFDrTwCM
 tG0nCmu7pTiAxO1CHkFjrA7CXanQPY+dAZVlkjkL6qKyp7Qaxb+xgB0RY51NRe/KVLupdrsYMWQ
 GIeEOmh6JrsWMHlmEL+ohSBi0LNlA1OxeOg2hyOexaYoq9fw
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


