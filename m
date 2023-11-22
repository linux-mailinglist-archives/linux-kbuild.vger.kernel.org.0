Return-Path: <linux-kbuild+bounces-122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B754F7F530D
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 23:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E73D51C20BB5
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 22:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5B21F947;
	Wed, 22 Nov 2023 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDDCB9;
	Wed, 22 Nov 2023 14:12:40 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35937f2fadeso858685ab.2;
        Wed, 22 Nov 2023 14:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691159; x=1701295959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQrmqAZcdIuXmqszFM5kR+KdU7shYUbjsm44jbecVtk=;
        b=HmmXPwzc50joKTkOWtAw3+vfvwRiCJwUxb66bn0t0RkrnwXrWSRk3c6b5Shvdoh2sU
         1Ws/58s/BN2eTAn9XZvjg6u01uhbmcGAOH7EnsT+kTbG2DIzyuyoxcgEUpJSXFmnJePk
         QQFX+2Kc5fgSuinpVmNBN0WU84ER/oosxaKkNnMFeDluUotIq3Bd6gjBQR3ybPRhwEjb
         3YjUYSLEYZ36hbpwG01KySCr8IpTslGHW3dGY/IF9WMA4uRhuAgeCglzQNyCJgSACRSa
         P63Vid7B+ctDcka/yhDiQzEvFAXyWjeYu/OLlYTrWUwkdQoXBUUVmXBRHUsORX3WYomF
         TyAA==
X-Gm-Message-State: AOJu0YwUMbJYNNiUHMB89pLYoBA7II/J2cjO01l4lvOT9QyA4sONZp2z
	KAWDU3LqmPgemTxsBpStKA==
X-Google-Smtp-Source: AGHT+IGj21a13xz1WqdS/H6Nqa3rnnJqU98fDkeH4YoBfe8sZRN0UwRgSamoEKVV6rR3nWw7fbCw5w==
X-Received: by 2002:a92:c5cb:0:b0:35b:110f:8127 with SMTP id s11-20020a92c5cb000000b0035b110f8127mr3639999ilt.26.1700691159445;
        Wed, 22 Nov 2023 14:12:39 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y17-20020a056e02119100b0035b19b773b8sm159259ili.59.2023.11.22.14.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:12:38 -0800 (PST)
Received: (nullmailer pid 2753842 invoked by uid 1000);
	Wed, 22 Nov 2023 22:12:33 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 15:12:35 -0700
Subject: [PATCH v2 4/4] arm/arm64: dts: samsung: Always enable extra W=1
 warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-dtc-warnings-v2-4-bd4087325392@kernel.org>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.13-dev

Samsung platforms are clean of W=1 dtc warnings, so enable the warnings
by default. This way submitters don't have to remember to run a W=1
build of the .dts files and the grumpiness of the maintainers can be
reduced.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Use new variable name
---
 arch/arm/boot/dts/samsung/Makefile  | 3 +++
 arch/arm64/boot/dts/exynos/Makefile | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index 7becf36656b1..fffc5c45d441 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+KBUILD_EXTRA_WARN_DTC=1
+
 dtb-$(CONFIG_ARCH_EXYNOS3) += \
 	exynos3250-artik5-eval.dtb \
 	exynos3250-monk.dtb \
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 6e4ba69268e5..9cb188ef470d 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+KBUILD_EXTRA_WARN_DTC=1
+
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\

-- 
2.42.0


