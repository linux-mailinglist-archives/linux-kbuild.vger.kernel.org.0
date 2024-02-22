Return-Path: <linux-kbuild+bounces-1032-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C085EFB6
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 04:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA2B1C20F73
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 03:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B84D156E4;
	Thu, 22 Feb 2024 03:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UuXHtPOh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9412E4A
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 03:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708571554; cv=none; b=g78smBhpCkntC0VzrngbqkNlekvdEhINjE0iyXBUQaEYzF8P+iFITOnCSOE0/tkIDL8WhwkxNKg+mRt4ejplsgQzUIX+aSS+VZhuXZJC5iBstcsDb9Hrg+zwXQpFOmZ6RxEvEe88TvUI8s6ld58bgthSKFxGIQcxeFRiwJKYZcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708571554; c=relaxed/simple;
	bh=t76bTeaY1oO0hKMH63CgusnsVSDq295EZx6khFeKZZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6DUT317etZVAhfoU2u1NEOL2mFyFaLZlNyunV4u9ab/0KuzCTL+VrpKcTelyRYZw6RDpsZlO5HAFjP8EsnUP275HiaPcFBhNqqzmYeHbluVFU83OES4y8vC5GI6YU7xVenUrQZIX5Q+P6f81hNFvSczWEuGZkoaPzTG24NRW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UuXHtPOh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dbd32cff0bso37134575ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 19:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708571552; x=1709176352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXAtKGBTQphe1VTUrO0UL5mNNpHbTJAM2XNak4iATx8=;
        b=UuXHtPOh0BSgimPRIDsWSy2sEQyjESzOs472eclYKRULmarc3uOHh7gRVMA2KXM/6n
         qp5hx2sW/RPbEcxG0T9i+ZcftHAfcbdJrV5Pbm+tY+BKxVxW3o49tP1MOpZb8MJWGcHp
         qTEU7FIgXy6gRbg66iFyHQ5rZRcB9+u+dH1gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708571552; x=1709176352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXAtKGBTQphe1VTUrO0UL5mNNpHbTJAM2XNak4iATx8=;
        b=ECCQ/M9WAocC/aCvOIBuFi42B7ftxAqz6pKCI2qv2Ge5lBqiVpJ+oqJPDfDQ3HHzcI
         tkEqoD9OEwTX1xS2e3XvZTFcVIY52ypDIEXehjqV8DsmpsyV6eP+vAQWJ3+v5NIXRxV8
         GPtblooFVYh/SwbY3Kk3g0V1iJKKICWvGd4G4ag1TPJ97LeOruGKvueX3+9oP45iRBZy
         WkBb5077m3RPLgEouYpskttdIx6V/x+EA+YFwlgFWx66ZLD/TvaO60P4b68fAJ5J6PTD
         PldQFfbJQ59JgRPR2JnN+orWDAFst+mfmDZK15FTMMvj5eVhiIYV7ugojEdOdY+45p/f
         d0bg==
X-Gm-Message-State: AOJu0Yy69qefN/xI9BKiKczwaUvp9e4x8DhZkDEuIg4Pi6O7WQmkPugH
	ZiQfHWU+lNpeqK+Cr+3SQJynBhIT3ibTaYR6ij185mCJ5l0GZk5a5Ib9+kWV3c44IFYDIY/0mJj
	XwQ==
X-Google-Smtp-Source: AGHT+IHDHQmJBofzH26P/NRGNfPQs2RH2p1YdtpUAqVIJqQ503WaN981yxMspFGWB6Z/NTQhlMFhMA==
X-Received: by 2002:a17:902:da87:b0:1d9:ce46:6ebd with SMTP id j7-20020a170902da8700b001d9ce466ebdmr22324866plx.16.1708571551721;
        Wed, 21 Feb 2024 19:12:31 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:480:9ded:eece:6cb3])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f2d200b001db579a146csm8846084plc.241.2024.02.21.19.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:12:31 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] kconfig: add some Kconfig env variables to make help
Date: Thu, 22 Feb 2024 12:12:13 +0900
Message-ID: <20240222031226.493692-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new section "Configuration environment variables" to
`make help` output in order to make it easier for people to
discover KCONFIG_WERRROR, etc.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 scripts/kconfig/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ea1bf3b3dbde..109e28fd6209 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -158,6 +158,10 @@ help:
 		if help=$$(grep -m1 '^# Help: ' $(f)); then \
 			printf '  %-25s - %s\n' '$(notdir $(f))' "$${help#*: }"; \
 		fi;)
+	@echo  ''
+	@echo  'Configuration environment variables:'
+	@echo  '  KCONFIG_WERROR                 - Turn some Kconfig warnings into error conditions'
+	@echo  '  KCONFIG_WARN_UNKNOWN_SYMBOLS   - Make Kconfing warn about all unrecognized config symbols'
 
 # ===========================================================================
 # object files used by all kconfig flavours
-- 
2.44.0.rc0.258.g7320e95886-goog


