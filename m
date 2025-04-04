Return-Path: <linux-kbuild+bounces-6405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A69A7BAAD
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 12:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 882791765AD
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 10:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E479F1A23BA;
	Fri,  4 Apr 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfE5x3dG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288B019DF66;
	Fri,  4 Apr 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762342; cv=none; b=bGud1fEKC4adZgHGN3LdQbJbWh+i9+iRTVMjQbPfm0Oyz6VsGvNmo4IBj3viZRFkWbQhvRl45Oz/h6z1h9pnAFivms1/BpCZ7uXXa9q5SqF4XkNbhGG7bHfvEHDhL6bwhZXvlMIiCTQ91Acn8afiNCAAwjYkdXbtAEV8yNLyWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762342; c=relaxed/simple;
	bh=CvbGy7Z16ghRJXEw/ksfJ9bwdxdQWqPDwcg8Knj4S3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mX6jOtfx288jrusptWcXdcxDPh4wrjJs2++tm8rK/j4VJgsCWBzBKevSiCFF+A96OvldaQSaDXyRSRInp/cGhb1+Znw+mA/3ARRGmxsGLqhQ3+j7M8X3n9oI82GIrjkKTfxNbCn1CwlnIEiGg0Qyg3blwYrvJ8gMlp3eCPz3guI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfE5x3dG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so2697631a12.3;
        Fri, 04 Apr 2025 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743762338; x=1744367138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5ogAbF9QL+rVm6LLuZIaFrwHDUu4iwqiP2lyV1/P5c=;
        b=FfE5x3dGoBgEJCwPu8xyLOKjl2CuFskAKqS5JRYk+0XUgX/KtTVRrymnrbvzkspv7/
         fvtOy83IHXA37uzr3v+Lei0R2SYaWSLXtXh7IOQ7MTI6DYFXN6JLQGTzWREhT2hj32T7
         3inqxq2zkcftkgy9JwGjZ5KXxxBWe2IM0nvpYieJzqtEgan4092Zxc/wgiLCfvxdoguw
         Dac4RMqPs6wdXca9gOaEsCO+RSWACcGWF5EyiODuadxb5h8LpEUyHEucyKGJ87i7UV7F
         A5O/8xBpwjYgKilPlVXb2S7mYmyNDtcyscK0PNRA5T5ENXsk7PZ1/CLwwBAX/16swdTy
         UKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762338; x=1744367138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ogAbF9QL+rVm6LLuZIaFrwHDUu4iwqiP2lyV1/P5c=;
        b=Sv+MJ3YKLFGigkvSc7u6bSWdu70t9RMzdyfjQ9JePnXpmccsIG78uSbCuyk1LDPgSL
         M1D4GvmtnLjTg3TolM10bz+t5geryjS6kxD8ee+5bKXLeB2HtIrTbsQy3yc7fOoPNOl4
         qLOHniaUZdHfHEydC7KyiZdAJvw1YbysHcIQhKcRhbO5C+lE9nipL1Znxa8v0o+uaTof
         lzJULpZ50KXs4S/7i9qAJ+Lw2xEqIZJNh+NxNVXnKAg+GEm7VZP1wz1/SiljymIGKPOn
         h2uZMUcWkPNxyKZqXaaf1l8aRjNdm4rnPOJsitfTl/+5TkENrATbiqIwbkeLjnfmB6Ft
         e1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMFETTDE+xiyK7riQWePhqcWO8BUBoAaORIzax9dkWCvuYnEwuiBkSZ+HwhIRkj8cmQX05wcjZCIGnxzkP@vger.kernel.org, AJvYcCXd1HTDNcFWHpg/Cf1CMWgW6M6qRh1MmNy9mFKHhoDh5w5+8gzXKqP6mcAvvcq7CvviciXxtYPswv50S0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpXlZKpg5M+CA5f4QbNFIwvFLGWtMwipBa1xcgSaYot1Qnu4M
	1/7qoZFme01H+Y7PY41IoOn3F3JbcRvXsWXfILZrr0EacXRCeUxBTKnjVYxt
X-Gm-Gg: ASbGnctBq6IsnZTlC8LK5KYVTAqinOPMcRBXr6L3WfftE1v4P+3NmWFYazNvT2o2/Xn
	8inTRxrWtdbq3zw5nrW3zzkJoNqfexOOnlPtKJWC+JlEV+j3dw2a0dI0pdzt0IbuvtC3yAyk/ZV
	XsmReCCf/0JB5EQrxg7qO1XA72J6iILoTPT2ldIMT0BlAEqnj7hhIko9lGOHoycUeXEhHTLzn5i
	xq/TI7jcEbsjjY4xsD3SvbAE79EQNtE3NKGVxAvdpi9E5gcph5DdlR24lPglvnAs9CPm0K84tdo
	fzZfbCLpzZmilfyOd5IEa+kOncAV7Qea0LB0
X-Google-Smtp-Source: AGHT+IFJz9EUmGvviMmCcJ4sYh2QDGdjf3KeKXbFYEjls/uDEMgd7PgUg/7XN4ICoBXBM2b96EJe7w==
X-Received: by 2002:a17:907:7ea6:b0:ac2:a5c7:7fc9 with SMTP id a640c23a62f3a-ac7d6e93599mr182313766b.51.1743762338226;
        Fri, 04 Apr 2025 03:25:38 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfee46f0sm229142466b.86.2025.04.04.03.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:25:37 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when __GENKSYMS__ is defined
Date: Fri,  4 Apr 2025 12:24:37 +0200
Message-ID: <20250404102535.705090-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current version of genksyms doesn't know anything about __typeof_unqual__()
operator.  Avoid the usage of __typeof_unqual__() with genksyms to prevent
errors when symbols are versioned.

There were no problems with gendwarfksyms.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() macro")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de/
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/compiler.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 27725f1ab5ab..98057f93938c 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -229,10 +229,10 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 /*
  * Use __typeof_unqual__() when available.
  *
- * XXX: Remove test for __CHECKER__ once
- * sparse learns about __typeof_unqual__().
+ * XXX: Remove test for __GENKSYMS__ once "genksyms" handles
+ * __typeof_unqual__(), and test for __CHECKER__ once "sparse" handles it.
  */
-#if CC_HAS_TYPEOF_UNQUAL && !defined(__CHECKER__)
+#if CC_HAS_TYPEOF_UNQUAL && !defined(__GENKSYMS__) && !defined(__CHECKER__)
 # define USE_TYPEOF_UNQUAL 1
 #endif
 
-- 
2.49.0


