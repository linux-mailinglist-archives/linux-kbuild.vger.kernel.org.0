Return-Path: <linux-kbuild+bounces-5920-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EFDA47DA6
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 13:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18A15163585
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 12:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8219322A4CE;
	Thu, 27 Feb 2025 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meFKk4n6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218364B5AE
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2025 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740659009; cv=none; b=FJXx2e8I2Zks62x3pJX3qkBVKnzRHSD29nyuvqqLQfwfmAwgM5XEDfJ5r6J2k9gKe4x8UG8petykG5rT9qYSSLqQf4PeoP48WjExWyL0EQqbzUp4q5Htr8Uo9whBPBxDNZeBoGSOLM7w5v0zHGTjGKEY9ehrmOeOssXliEmpjBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740659009; c=relaxed/simple;
	bh=tclB8mjAigT5a/mxI+jBNc05J5FVqwfOVeEO/CUlDcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b16mBKg303VM/+FwQKmiY7LMb0Hoa/naB+3cHph/3Xi26LoSD1zFWgCeM52ZssBXBfqRmjL/7qviHIHYtz2dCIBRJ3MEO0/qHnyyo3iQdGCEq5X6ahHVktKLm+2pn81YXCU5GRYdWUCqG/TqEMyS82wWPwvz+DNBUvuS2898JPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meFKk4n6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223594b3c6dso6789425ad.2
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2025 04:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740659007; x=1741263807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IBZVv59sbmReRFqkpG4nXSeANqwTT9rIFzByijsv1I=;
        b=meFKk4n6afnMviF+kyBcsM8AiF0J9pYG9SCW2CJh0lDcyhJEOHKG5R4usCwMhljlKV
         PyXLBVbdX72F1a7C/MllTI/lL1BQsofBZGsX73AEEw7dWMkhWgKciYCT8T3JBOLvYvK0
         YM5aJlt8dy7xE01UJ8zBuGTsFBPqm6dSfXKbEqiJmq8OEqxr2QXy5/pMT8oAOOYTauDU
         8Rb6Kjcd5k2/lx0lTvZsGrliXi0xlBBeoPJMgBFcZsSxYLAlXQ+/dfFf8oinCbV5QjqF
         z2ouWY+GofbDQdO+0u0aalMdS9f2FN7siBE+CB8wxMughSugobBBm6MUGVSEIIo9rlmO
         j/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659007; x=1741263807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IBZVv59sbmReRFqkpG4nXSeANqwTT9rIFzByijsv1I=;
        b=itS3YcbbjZXrDTx7xzaFX4PxpJxtS965SAyaTjSzP0Ds+BERTzdWYYaUz8i3NxylqM
         L6dKLbUH6wM+lhfLUEeeXmFAQ8h2H+XDdzNHu3oO6hqr7Fgc6f3Bp67JH0Igo2O9ENM2
         k6tvfj+Gy4lz0/FQJ/qBnxwhy3ddZi1vHTosYsx0xNXp4KS6l2M3NaXV3u0MbXQYovJh
         YJTGm2M97Qa8vOenOZ41xJfvYwhvN7dsdkXllGH7jPp4Y4YeSH7DqmfAd/VpKI1VCXeS
         0Rlt4LbZKsjZBE9z1Lw3CE4XcohY/PmBY7fIOxSkpwCW0mRIrAlmF+MZBboKvEqOYs6D
         vn8Q==
X-Gm-Message-State: AOJu0YzxjtKg8hgv2Gjml3VplMDHVP/xXoUdhgrJe6BP2mNewZM6Jz8c
	bCnHByZtlPQwNBp36IA73YfplQ9DCjTo6j2aJOtbeQgvgP1cqEzH9WwPCQ==
X-Gm-Gg: ASbGncuKORd5A1/fmLzmkQxqFH72JUe5e/gNA82QBEt52LnzdeBhIlzUPy/rH+p04T+
	EzUQbBzCwVJdd2mJ/R/Ql35i8dBBxN40nZHMqD13ojuhFBMzPqmV5Hv2Sv4r5WNxa3pcZSht6Uj
	Hltmio6t4GVnZ9S0yTDyBO+oZ7hCUwteVnxRQIqtmeMJkaNlneoogGyxlbZRW/QUFM6Ete3wVOO
	hCeaUQ07lamwYgN2atlPoKty+vfVkTsHLdpOG/bufW6ttYg5+Yg+TfKU/g1EwH9nJxc4x2vRyZz
	qLpU5weGhYcvgtcHxolMbwtm5OIgY2S5Em8vmnGE+x4=
X-Google-Smtp-Source: AGHT+IEYW3g7Cy4wMxM1dhJmvmLGyTUhbDtKcwz4P13mzTqfMvvbB1jTKXmJtZ48EDiWnBtojvZ2lg==
X-Received: by 2002:a05:6a20:9d8f:b0:1ee:e785:a074 with SMTP id adf61e73a8af0-1f0fb42821fmr21175322637.0.1740659007016;
        Thu, 27 Feb 2025 04:23:27 -0800 (PST)
Received: from tea.. (tvk033150.tvk.ne.jp. [202.222.33.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf242bsm1257257a12.13.2025.02.27.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:23:26 -0800 (PST)
From: Satoru Takeuchi <satoru.takeuchi@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Satoru Takeuchi <satoru.takeuchi@gmail.com>
Subject: [PATCH] docs: Kconfig: fix defconfig description
Date: Thu, 27 Feb 2025 21:23:20 +0900
Message-ID: <20250227122320.153393-1-satoru.takeuchi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 2a86f6612164 remved arch/$ARCH/defconfig.

Signed-off-by: Satoru Takeuchi <satoru.takeuchi@gmail.com>
---
 Documentation/admin-guide/README.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index eb9452668909..b557cf1c820d 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -176,7 +176,7 @@ Configuring the kernel
                         values without prompting.
 
      "make defconfig"   Create a ./.config file by using the default
-                        symbol values from either arch/$ARCH/defconfig
+                        symbol values from either arch/$ARCH/configs/defconfig
                         or arch/$ARCH/configs/${PLATFORM}_defconfig,
                         depending on the architecture.
 
-- 
2.43.0


