Return-Path: <linux-kbuild+bounces-531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51F82C57E
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 19:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68EE02820BE
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 18:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F7314A80;
	Fri, 12 Jan 2024 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYJ1hGLn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D414AA4
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jan 2024 18:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbf405319b9so2946266276.0
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jan 2024 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705084478; x=1705689278; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GlGgb0cBHVu1ifFKwOv+GQYvTTYJliQt0u5z/Pbkfrw=;
        b=pYJ1hGLn5bfg/LNhpyeIaQ4Qbi65jyrpZtPy5GeXMKDfoHAMAPxtWRXZ+0X8iQNPzO
         jCeGdWYzxbBe47LN5fLfRYcG5cgSktWrGkeNJZOdHmAKoKERyYWhcUDRAvwLoeJyKKXb
         3ipn+zNB/MzJu/8TTWrhC73OIW5FE4SfFCf5MorTXZ4rvaVovNSp/NlNuDBNxIOzl7Xc
         ihBO1lZFlgFjGw832rBuf0Rtox+Z3c3Q7Y/F1YrWRoVEYufycbZT+0t7/xbv+yEbVGlX
         XlIpPntZMb9kANTqU0wfAbxeCa6iRfDfBhhCk73mxFyYN7IqEFaaNu2BdAo9zXo583Bn
         JPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705084478; x=1705689278;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlGgb0cBHVu1ifFKwOv+GQYvTTYJliQt0u5z/Pbkfrw=;
        b=l0oUS0quMbUae7lyFPnzlvQItUmBr4xRLvaOLMTgJ7Eqx9jzOGY5I8IK1FY50jy3l1
         MNFpg3u3cjMeGH6VhhLPWvnPGrA6btmxa+Mz3egrudEcsp9AFTxyBxk9Bu/Cm+nRHAHL
         mgWqZS+sXyA2OoBh9rQtvGqmtYYUuOKJinRU/ohnovSr7sPAaJvJ/BXioFZzUmJ1sSk7
         3Bglsang12nxQ0+46R+F45M/dBXuAjpGYGwR1RPdxyKYJCvXn3BbH6Xp6zCcS0gfOjfk
         VDNpvwrOzlAKvotmJSy06/lofPpIZpvoVx+6XgXaav1FxVchJMeKEQpYa0zpTuJZnYSZ
         yw0w==
X-Gm-Message-State: AOJu0Yx/aZn8EpmAFIMMXIEa0UhOuFZCSCuj7G1LYzj/HAefztGu/tjs
	0plFVOhzoth3AvX+JV8eygykuXRvG9vh7a7vuyRhX1X/8Q==
X-Google-Smtp-Source: AGHT+IF0B+hwG2gegsZ19JaqZb8LO0rUZXlLxs4CYObf1dy5WSdOPlGnerP3Omjk/NAl+AsKiUOx7q8TqrWkCvguRJo=
X-Received: from wmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5ebe])
 (user=willmcvicker job=sendgmr) by 2002:a05:6902:102c:b0:d9a:efcc:42af with
 SMTP id x12-20020a056902102c00b00d9aefcc42afmr64403ybt.2.1705084478457; Fri,
 12 Jan 2024 10:34:38 -0800 (PST)
Date: Fri, 12 Jan 2024 10:34:19 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240112183420.1777576-1-willmcvicker@google.com>
Subject: [PATCH v1] checkpatch: allow build files to reference other build files
From: Will McVicker <willmcvicker@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add an exception to the EMBEDDED_FILENAME warning for build files. This
fixes the below warnings where the Kconfig and Makefile files reference
other similarly named build files.

  WARNING:EMBEDDED_FILENAME: It's generally not useful to have the
  filename in the file
  #24: FILE: Kconfig:34:
  +source "drivers/willmcvicker/Kconfig"

  WARNING:EMBEDDED_FILENAME: It's generally not useful to have the
  filename in the file
  #36: FILE: Makefile:667:
  +	} > Makefile

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f8343b34a28b..62939f5800cf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3785,7 +3785,9 @@ sub process {
 		}
 
 # check for embedded filenames
-		if ($rawline =~ /^\+.*\b\Q$realfile\E\b/) {
+		if ($rawline =~ /^\+.*\b\Q$realfile\E\b/ &&
+			$realfile !~ /Kconfig.*/ &&
+			$realfile !~ /Makefile.*/) {
 			WARN("EMBEDDED_FILENAME",
 			     "It's generally not useful to have the filename in the file\n" . $herecurr);
 		}

base-commit: 70d201a40823acba23899342d62bc2644051ad2e
-- 
2.43.0.275.g3460e3d667-goog


