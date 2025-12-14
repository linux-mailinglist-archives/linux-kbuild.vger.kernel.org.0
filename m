Return-Path: <linux-kbuild+bounces-10096-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC06CBBB11
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Dec 2025 14:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA75630054A6
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Dec 2025 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F6D19D8AC;
	Sun, 14 Dec 2025 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhPnmbAG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA219C566
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Dec 2025 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765718138; cv=none; b=LNqwDUssa0CgJPlLsMhiWCWxl+ie3NXDLU3m3T6btOdfsEv/QswrrLxe8St0X/CIUi52Wg76AjgwGUTl8pnh8ISrjYfzMKNF8guRW1u/owSQBeZz2zyTAW17EnF73HLDsSHBQ0qbNy8ttY+FNJjJmdFWdEf+nY1w2vF/6WS6w4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765718138; c=relaxed/simple;
	bh=EdUmem+sejpz36yYnKdOzQ3u1tIJjqiU1Dj7+evT9lU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dpE9wcaUSwPJjq8fFQNnY/54PXNn+afE4B8eVaW6JLSK2wYDJ4ptQQJRj5+IA/hhpk4PQ+vYC42QAKiF3qX1nDxZ9Qhn6nJhb/KgN0M7qN1eodnOJDrN0Ki2vFObMzvLoxM77If+z/C/PwSlZRhAD6pixxsrEsn1oiab2j6CNLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhPnmbAG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so1427564f8f.1
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Dec 2025 05:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765718135; x=1766322935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xGSG0Vsa9+qI2wiCp2gliIFyT6dWVXRARFOSTyb3V8=;
        b=JhPnmbAGl7ZDzZN2P0hLQWuj/DLI5/dDl3Lx/y4nlehc0+5aW8pfG1lL3Xg/aBbSoO
         TrI4ixJ+cfc5JtZy0brwz3GeZEW/Vqt5/f3gbsZF3TZHAub9pP2qU9fHAZFMM+48MTe2
         Cc7BFdgIBSQf95r0cH94qEKIVQHldwpbqd7vuDzv9MnlTu0fqpnI+MWcUpnqtJ5bxuf6
         AKWa0+2R7glOP8JEDFDyK8AZGC/WHLHY6pZOnMbVR5+qpYuvBdSZlJEA9IaWikw3xgry
         KsfIYzrmCnY6DyoRQvJKHo8V+WoodYIbZpgpwadaVH9CxivW7akFyXpE31Wz8XY4/XIe
         PBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765718135; x=1766322935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xGSG0Vsa9+qI2wiCp2gliIFyT6dWVXRARFOSTyb3V8=;
        b=bEqfLfLoC20rMNbj8MO6DMZAThGTJKjOp8ztQEeiQQC04u8EV+3USKfGs1rTgaoV/C
         Wy2bO4K0dJ3bOHnjiT0Na+86i+dy1zoYnJlydjxwAKWv68W/kTJCrzzK17UljD5/4+IB
         /j9AKOfifW+BitBf7e+Z8yoBWQ3mLA++XKCyFAFQoGD1gPdj94VcR45mvecY1IiyNeoW
         ZHUtDUhZmbNcyfPPeofnBi9oBWn3EjSNyW41P7Gw31IbqWk7QtBJDrFO4BFipeIQmJIH
         +yxm6gUoAUTGko/cyL/DosLB6PS2upn/CbYUyJBxqNwtloFV4ClYzwO+CYvXBNMzQM/o
         zyNg==
X-Forwarded-Encrypted: i=1; AJvYcCVPqmPtRmjtULTEWHSH90wP7usYj0aY5Czg4BUiuY+ngbPdYh+r0Pigi/sjfaWOFPdWoGdeY2ya1Q/H3go=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6IeIxRTekGd2n3W6Hxe33uwZauJ9jy72Y04M8Bs3z57FT78Uf
	3YqlmeJAv5JK3PFFjfUe0siXDogYdLdp2ar8LZChUfbbbRRqD4RZjEdN
X-Gm-Gg: AY/fxX41FUtjzKjdjfCF/wKHgUtderb9sTqG0A/kpOAODyyShXlwYzZYjbQTVpqYpd1
	8VQyoZ5DsVHAqublu/ZFdzE17Cm/ZJ7KcPQAxWsjRCmfdRIviO0jRpV/3Es1PCBGyoLbbkHWtOM
	vD9tSKcp6cpkEvxdhronrN8pAznPg3VR6RiZ7L/9d1bEQJ2uxSoTptNTcM3DVfBGQFi4wtOg/6I
	CAN3ei47blpMLG/nR8kA1WxzNHqg0ov+yScnni4eoDcdCxtqOajjKy3kika+q54HjKbYxBGv63K
	MmmDKp6v7l2E0t9S9Ov45QKkaPyXdj29hSmwSf57Ax+l8tCSBNvZAW4xIutYt5oonrhf5IcyS5b
	jAPYdRV3/Yb4su99uD3MJg6aTnM2v5EBgAyoB+vB/TDaZOTXaIBcfT6fpxat495h9O5Jyj9s3KN
	4rrPesP6UkFy9T83tKI1srKmQ80oUJi33woqOMxU4zaMKCGdmst2c8L+63zFKhCrp5LD3C1lNm
X-Google-Smtp-Source: AGHT+IG55in7CePXegLIYGWIvbg9pSdIRdxYIXe/y9JbYHMR2Q5mql3QRGrehZJInzb7dHPJhLZsIQ==
X-Received: by 2002:a05:6000:186d:b0:425:86da:325f with SMTP id ffacd0b85a97d-42fb3ee6156mr8233050f8f.27.1765718134895;
        Sun, 14 Dec 2025 05:15:34 -0800 (PST)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43009dfe5b3sm10822533f8f.39.2025.12.14.05.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 05:15:34 -0800 (PST)
From: david.laight.linux@gmail.com
To: Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 1/1] kbuild: Only enable -Wtautological-constant-out-of-range-compare for W=2
Date: Sun, 14 Dec 2025 13:15:28 +0000
Message-Id: <20251214131528.3648-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

The kernel code style is to use !(expr) rather that (expr) == 0.
But clang complains that converting some constant expressions
(eg (0xffffu << 16)) to a boolean always evalutes to true.
This happens often in the validity checks in #defines.
Move tautological-constant-out-of-range-compare to W=2 (along with the
similar type-limits).

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 scripts/Makefile.warn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index 68e6fafcb80c..e2d467835c5b 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -151,7 +151,6 @@ KBUILD_CFLAGS += -Wformat-insufficient-args
 endif
 endif
 KBUILD_CFLAGS += $(call cc-option, -Wno-pointer-to-enum-cast)
-KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += $(call cc-option, -Wno-unaligned-access)
 KBUILD_CFLAGS += -Wno-enum-compare-conditional
 endif
@@ -179,6 +178,7 @@ KBUILD_CFLAGS += -Wno-shift-negative-value
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-enum-enum-conversion
+KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 endif
 
 ifdef CONFIG_CC_IS_GCC
-- 
2.39.5


