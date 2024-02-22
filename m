Return-Path: <linux-kbuild+bounces-1034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB585EFCA
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 04:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65D61F237E5
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 03:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EF4101EC;
	Thu, 22 Feb 2024 03:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PtNW7RHd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C461754F
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 03:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708572368; cv=none; b=S2ExdwoO+kaokTMPf5GmAFESo5wyDO8xR+N+WAg5Is8YyGvf6RuLvre6UO2BWccdQvIr9kOcih4Y2gdhqhoaqoY5OZvdnDku9D0fMbSgj2bEvZxI4ioRCTwlD71sBBZ/7v3A5RSLswS7K8jytLTyZZWxs/z3fgc+aWhbW4SfKpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708572368; c=relaxed/simple;
	bh=bzZ3fX2DEFw0nOMx3kh5bVpyXkZ4XTMyHUYzy2/dFvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6rC/sPag/KO1d8/aQeQ/5tEpZ9wF3L4/3ANW8Q/7wfTPWhjTvwTQtrt9T7bUUewliuafmnPiNFH4CMJdQsohu+xY8WBwEhMYwaxUHV11PEbLGDWrtCjgA0VOgNtCnamloocvjVPxN4SH7cKd64LLl7jMN9S6rVAVYJDEZEFpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PtNW7RHd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc13fb0133so11626505ad.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 19:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708572366; x=1709177166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSw2XZua5CqiB9gf2+U2cFgOtZgxjplbw5UzRI5t8LU=;
        b=PtNW7RHdSMdHfUYrTsy76NtBVVgA8/SHqYhhQXDHUy+3s1RGfxVBTDkUnK0a0Dz3s9
         i2Ej0BBZ36oH61+7st7Of3JSYygAq6ifRdVKOej0UAsrflrZ5t9ws1ZeTq3wGkq1CnoH
         FkaT7hFwiJu/eNpJPJgpVHO4jk5t1dVueqPno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708572366; x=1709177166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSw2XZua5CqiB9gf2+U2cFgOtZgxjplbw5UzRI5t8LU=;
        b=CvWGlCeSUV8UsrxRdOVuTdzSNMY4BpYDijo1ngJ3nu1b6tM6MTO0kLy/62GTOEJuyj
         v6F2UR/xZyU4fUop4kBh7ulZCAP48Im75XxbYZ1MN3TN3rhExh+7q4pwQcPiv1cK3Lat
         PRUegggaFfCHasgnSB9QBH1GbmceOH8Hsj6whDzlFqyWPXRcxW5oI6KfWHISwLQD2b4z
         GEkogB8i21M8S2wetz4n7FBJqK4eL14WUIU8a+7d/G3YVxLO5uNEPXNqTU3zo7zL9nWR
         2aiml/AqrJmGYpMpiU4TgmElUOr46dJXriNxodLUMyDMM9XCLEtYiNyK/JTHXQlJGr8B
         xjPw==
X-Gm-Message-State: AOJu0YzC1H5mc/ivWE0RAnUNTMI74bPiBUi3qi3OFdq6bjYx64tkdASX
	ZAG0mM4GxTu5Zf7C3d3v/A11vYhdhRABs3SWFs9up4rBtl2xnZAkdOfvqkeFrlfXLA+BwAapONp
	WFA==
X-Google-Smtp-Source: AGHT+IGOe3WWge9cSMFBSWmiMSAx9ofR2X6nwTUk1YuqlzcKU1YRsNpuiCLjQXeKqRqct+Nd87AuhA==
X-Received: by 2002:a17:902:d2ca:b0:1db:e1f4:d483 with SMTP id n10-20020a170902d2ca00b001dbe1f4d483mr13653262plc.12.1708572365981;
        Wed, 21 Feb 2024 19:26:05 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:480:9ded:eece:6cb3])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902f0cb00b001d937bc5602sm8818337pla.227.2024.02.21.19.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:26:05 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] kconfig: add some Kconfig env variables to make help
Date: Thu, 22 Feb 2024 12:25:31 +0900
Message-ID: <20240222032559.496127-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240222031801.GG11472@google.com>
References: <20240222031801.GG11472@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new section "Configuration environment variables" to
`make help` output in order to make it easier for people to
discover KCONFIG_WERROR, etc.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 scripts/kconfig/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ea1bf3b3dbde..0044d49e149c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -158,6 +158,10 @@ help:
 		if help=$$(grep -m1 '^# Help: ' $(f)); then \
 			printf '  %-25s - %s\n' '$(notdir $(f))' "$${help#*: }"; \
 		fi;)
+	@echo  ''
+	@echo  'Configuration environment variables:'
+	@echo  '  KCONFIG_WERROR                 - Turn some Kconfig warnings into error conditions'
+	@echo  '  KCONFIG_WARN_UNKNOWN_SYMBOLS   - Make Kconfig warn about all unrecognized config symbols'
 
 # ===========================================================================
 # object files used by all kconfig flavours
-- 
2.44.0.rc0.258.g7320e95886-goog


