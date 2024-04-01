Return-Path: <linux-kbuild+bounces-1428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA77893727
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 04:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 798EC2816AD
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 02:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1259964D;
	Mon,  1 Apr 2024 02:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxThYhTF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED733C39
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Apr 2024 02:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939376; cv=none; b=mlT+xLjpAMDE36uQmrAa8xK+MtMKy19FbupnE68TiPkVmkxFnR8VQAoSVUApYTLJPy2NG0AOL40wEOgIGd9MHLCpqUzkOWL4qC63N2srinfgpS0ZSdlS1NaqYBaZvnSg+S2p48P8kCOxaxakHEXvSOsJZFo3fpiB5YM0rywcgOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939376; c=relaxed/simple;
	bh=FIA5gSDDGcNdfXmQ+N4A6AdhW2aI4yM0uElb16UbaLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4Esusdw8Ff/IBbpy3M0pl6H+0VQyzRyuUYx+4VR4TX/nUB4VOYEHprPYywrU/Bgi39HYvw1FlOW7XnmCMI2t2R7jlw+MVmo7zpsaAVBGEKQgpQQhE5mFaTCVMFNdtg2BAg/ipw0zEb6IMzrNkMjz7tVR0XkavvcNtYiZUYowyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxThYhTF; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-515d515e28dso1204396e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Mar 2024 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939372; x=1712544172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTN/5zXbYSDvoflBwey+wQVzVgLTpokSf84Ta9NbOAk=;
        b=oxThYhTFa3diMQNw1F7yZiGM2NSZe3TTVmlPPwCJu4Ll9Wt3kxCF990XgIanpGEVjJ
         zJGzc3xuyBSIH1iYFxT23lZ0AJbmySC3K8yNOJguELgi2lmQv/bLGpbDucTPr+JpFmOD
         //U9NKogcJiARiyTZxJEda0nte5xAlo9DGWyuvKe1OVvvNORSzvo6uF1ucxb005C5CEb
         YcfquC7h9nuCYQFiELb7OBkvHvhU12b9j81CKt6QJ6kJViyWTFfvNM6UU/ZG3W3L5kBS
         AV0foaZeNbwrXPlfyEYts2nhV7S4s/PkBPHvo54f9MMBRzXRmdQaCvBEJFrOrNv8Vz2x
         4Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939372; x=1712544172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTN/5zXbYSDvoflBwey+wQVzVgLTpokSf84Ta9NbOAk=;
        b=pNbknqauKeycJ0uGT0te3bBnKqHiAcvC0m0vsNI2kcEd/b5jZw5xWKmYiH37oVWjKy
         r1rB1xQt5PV24dYVYiLlqzMgb/3hOjwTHaRIY54J1RudCgjtsonjNtsWUpIpSsiQaifC
         B0lA8tL34NalT9BZDJVn/YhyINQ6XU0X5wyE9BhHG5Nnv4/VelL1udblqoGrV6h+/MgE
         62nAwVKnEVkv/DyEAQzzxeBcWpTmzbk1bPSg5jFFDX/nYkumRbus6uQR7z8F5+rlOLXr
         xupAfmTikf2oNLw8QURZ7kzOMgCLjX9xQiDsV4J05PxV+3cblVKf+O6UoklyoAMssfb4
         dLBw==
X-Gm-Message-State: AOJu0Yxnv2XtqMmI7FfOdW2BUzPGOTJU/c1tZud9wmSusykFsf6An7IQ
	zMHJWSs5nPaXoxfrzgguMh7mxBGjVY5Ab+rowJuong9cYHjE71FbNXGpPrcHTHw=
X-Google-Smtp-Source: AGHT+IFP9REyObCpwP8FfKQocxrhzrzBK9nbQ5+418k2IPcnyV2JEBBHMBvUz4tSIQcCtBA5qBI0hg==
X-Received: by 2002:ac2:5a5a:0:b0:515:a62a:8e3d with SMTP id r26-20020ac25a5a000000b00515a62a8e3dmr4752003lfn.11.1711939372499;
        Sun, 31 Mar 2024 19:42:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:35 +0300
Subject: [PATCH v5 05/18] drm/msm: remove dependencies from core onto
 adreno headers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-5-4bdb277a85a1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FIA5gSDDGcNdfXmQ+N4A6AdhW2aI4yM0uElb16UbaLo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8ld2FKnFCLZUvEq0yUrry1GXgy/a3PIXADW
 eEHKZqNmduJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJQAKCRCLPIo+Aiko
 1bJPB/9KZHd4lJk1+EI/9hjBKp7kR3q8yMlmjIjf94oTgYj1cN+OlX6i/R8+JNs56tTpLBbxb0n
 Kkg1Zt19tY6TxGqOGhEr1jqL15deeffMt8A8GbGm3560EIM0Ec5ozFcNg/Tr80hkL0B/Mv51Mo/
 SYtxt9gho7yuTIjwUxolxYXSkPzKNVXWmIemwWtKrV6w4FUOKnKJ0oG/8YShZfL5lLkI98ENMUj
 Cvjb3dK1pQNtAp0/E52OBRkwmD8PW4LOcnwyz8cl8vlWOgXeFMSrFKe76yEeVILvYV9FJviBUmo
 9jLm/Oj80FKCS39ckDsC6LVizI73F6ddlufo1uXp3d2uzMha
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Two core driver files include headers from Adreno subdir, which also
brings dependency on the Adreno register headers. Rework those includes
to remove unnecessary dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 97790faffd23..9c33f4e3f822 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -17,8 +17,9 @@
 
 #include "msm_drv.h"
 #include "msm_debugfs.h"
+#include "msm_gem.h"
+#include "msm_gpu.h"
 #include "msm_kms.h"
-#include "adreno/adreno_gpu.h"
 
 /*
  * MSM driver version:
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 655002b21b0d..cd185b9636d2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -11,7 +11,7 @@
 #include "msm_mmu.h"
 #include "msm_fence.h"
 #include "msm_gpu_trace.h"
-#include "adreno/adreno_gpu.h"
+//#include "adreno/adreno_gpu.h"
 
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>

-- 
2.39.2


