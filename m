Return-Path: <linux-kbuild+bounces-8157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34544B1182A
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 07:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F5F1C21556
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 06:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E2226CE1E;
	Fri, 25 Jul 2025 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKbQKn+m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64176026;
	Fri, 25 Jul 2025 05:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753423183; cv=none; b=gzM3mxVMsiaPPrcwGqhazBJ/uoTNhdX8S6TiTqhAUjXV/7bJjjE7pbX7g196KogELlTKwaiRmqN8ujaOxhOW4TDrEGPPIWfOfJ8KA1SJXEy//VV9xcYZzmxKY2OiJMIW/sPjHSGM9QIkLeoupbmlsWdCYWysRaE6SOrKHMVMpC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753423183; c=relaxed/simple;
	bh=nBcBKRJJNJGcVUVk6gP4i4rSb9mRzrhq+SDLQDfVOEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PJfQpS1ZLeZForqTfOxUIh2h6TwIbG/BDhaKiMLh/KkUgxNsR/e+MQoXqjUQ7iQ2uUlH1v4c9LUOrs1UT4G12xawmJavwWiCzIyIU961ldCNpZDZw1a9PHSAzLX9S9Mvm8TBxAcRL9U8gseC53GyNoZHCUtw45he3tQfRw9/BP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKbQKn+m; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235a3dd4f0dso10987155ad.0;
        Thu, 24 Jul 2025 22:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753423181; x=1754027981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVNZL0XbVVjmYW0qgJpjAWMxqjdbqksP7PPEjDFEdGw=;
        b=DKbQKn+m3hBO/faCB13CQvsP9/eaV/qjNOIlx1QU939nOje1mhNtKNQW8o5cCBFnPp
         eM0h1y5i2GDja3xDcHrSIj4+iqnIl5l+h/JYFaUpLYL+HxVLmlB3AunI5fylDZtjR8Tq
         hSLi7LIZh0EJ4v5DbnEoMKSipDU7RFZT9vak+5RWqA615ftyo4vgcHPLx16l0pW7nffY
         uuzGdBDG6veXYbIMOLOYLEZqgz/zFXM+Bqn1Un2zGQdOuxXnq3iSiWZRsFCOJ4xY3ay1
         n6Xh2nMPkgpiZHCEDuQxAPzrfMF6NjWk7vJspZz/Zyus23euy4gQeNsMRMuVQi7sS1rH
         B9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753423181; x=1754027981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVNZL0XbVVjmYW0qgJpjAWMxqjdbqksP7PPEjDFEdGw=;
        b=Hn8r5+tkcYNSUxCXiqIglgxma4Efh12B3sstfp1wFA9CLwf58PrGQZmC9IL20mrcAA
         dfdCvFBCPF2J5nKA1xrAgsAcgWgY4xaWXIjJn8CX2bfpMC0lsOGui7Y5ssHNGIcE3w0S
         BOwYKYmt3BQMUxHNql5lBs77IYE0qjZ99KcMNhsXQ+3MO89KRvfN02y7UgfQUxnotJ9o
         rqmIJ3PMxy8f6GdW1jkYVbl5iYVHZlJp41J5P7bXU+dPxtP2frgQZCNnbSMq/Ld8rT9I
         YtLnyVZnrk3K69m7hztX2xxaUgG2foj89Mu3Gd9f6W6H+otIlcCaQIDpxJVidJdwWw4N
         Yvjg==
X-Forwarded-Encrypted: i=1; AJvYcCUnxg/AOxR1wtwn5ddUfsnX8g6T90YoltmH/9hAcwJzgMVgx8TCAZGEJRFVFnl8BEXUn/MilnVRpEhwMlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRlfHDsyjCipcVbbio6rO90JolEX3iy8Jj8B7UZjN6MOD/6bC
	GcHL1A49Oodh7oE/WjXtnB3LUiA0fPamSajBKLmaLvImzkmddGD7f0nq
X-Gm-Gg: ASbGncu6qM83wZhKUmScaWlNwB31KIEBuPf7eLZ0nngLvqqrpHPVSMdD28XJ+J5An7t
	/80pu+ESh3sLNqB/3jLLPZId1hqvE4TuR8xLPPc+DqyT3Bvud1skt6Toh7qbL0bdGgmaxGD43V8
	4EmCbul+UpV2E4ol/qnyniec8KRKmTJMB+dFIBshWCDHvT/Ugj65S5l9wtU0AWrSBnE7eW7gNpp
	HeUE1vdNsRHc0Nd7Jk9igU+78H3NNXgUYyWruTUFXH9JiclbPAo5pJ5ZdJW9rZQKY2F9Z6VHDy2
	csQuDW77sBLG2mHP5vQuuLfvAyH6bLAbp3lWHEYEdtEpd2Z3SI0Ss5ggTf1ojre5ReVQnKcBPDp
	LVAeWXA7//y/WooMCGRv4vsJj6hlGuu/thb6V2TUzL/zV3HJ2E8XEZwHS
X-Google-Smtp-Source: AGHT+IHjK7Y10iA+T5R9XL7jldoC8ZUaJfmjiU0tHtrBjKNfxMToTwdZ+fswBgGtQ1QgxWF15DRyJQ==
X-Received: by 2002:a17:902:ccc3:b0:234:d2fb:2d28 with SMTP id d9443c01a7336-23fb2ff03a7mr11126315ad.2.1753423180886;
        Thu, 24 Jul 2025 22:59:40 -0700 (PDT)
Received: from localhost.localdomain ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa4901bb8sm28747335ad.174.2025.07.24.22.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 22:59:40 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] kconfig/lxdialog: replace strcpy() with strscpy() in inputbox.c
Date: Fri, 25 Jul 2025 11:29:28 +0530
Message-Id: <20250725055928.37658-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() performs no bounds checking and can lead to buffer overflows if
the input string exceeds the destination buffer size. Replace it with
strscpy(), which ensures the input is always NULL-terminated and
prevents overflows.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/kconfig/lxdialog/inputbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 3c6e24b20f5b..8880ccaffa0b 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 	if (!init)
 		instr[0] = '\0';
 	else
-		strcpy(instr, init);
+		strscpy(instr, init, MAX_LEN + 1);
 
 do_resize:
 	if (getmaxy(stdscr) <= (height - INPUTBOX_HEIGHT_MIN))
-- 
2.39.5


