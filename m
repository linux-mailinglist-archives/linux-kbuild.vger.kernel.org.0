Return-Path: <linux-kbuild+bounces-5933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32481A49862
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2025 12:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D538B7A67E0
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2025 11:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0574223E34B;
	Fri, 28 Feb 2025 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuy49n77"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC825CC8C
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2025 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740742664; cv=none; b=Hl8c+zYqUJnqcJAsEgYO4jfterRNlR6FhYVbLk8rDS9dDfr4yKQ3dpPnjzXH6KIjFuUZp4PT8qcBL3vp4c8kexwuDyV6PlZsX5Su3FDE6GX+W3bDLFOvHl7xaCGwDrP+fY4qD+26/d6mV5hD/I1njoJwY44vTTE5WYePg8KmcJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740742664; c=relaxed/simple;
	bh=WYdIy2sGbzSiX92RtQYrv56+sp8W6qSNU3rv9mhIYOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f5RlB1Xa6nwmkAmcHECLYdXgDyokjBubcS6MMERNuS3PgE9DI0xYe8aDaA9XNCOQwIh4mVnhhDBHw1atYhPsfqBSOSzkrw+s+qwplXPkwtrA9G7Nie2TAMF4kMUaLGYAhmfVm8Kb6oq4ZG/6cI/dHvPzsZjGtq71atbQBptMJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuy49n77; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2233622fdffso39241045ad.2
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2025 03:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740742662; x=1741347462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMUhAuT82gxwAZcscr/Yr66gdRltVialQBb8xLKV0OQ=;
        b=iuy49n77Lrr7gwe63pyA6uIiDQgNps96pGWDjNBAVkC0Ndxi/z7wZl6RMdnGGiqpmM
         bjR0aqc7hW0cAfw8305/0uq0YwwB/1aQWhk/b1/J5GH6nqEPGdTP8P+1qPstwVAK7C7/
         p4+qVPEZkh/D4BaSVJKIiJrHsaS0jv43kalV3FGUW5SlIH697PpS6hoq8wL9KR0OO/Vw
         KiwEQaDeksa8vM8vb8XWbLhiQqWZOo6gIvl1XK7aLfmOG6YDJvqlqvuU5OifvKIBgc37
         azYe+ozLfTzbOIJM80OB8cbxamI+5uSEyLMIC72SlseugLQJDBJKhG5q6qSziJtSEHC2
         7STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740742662; x=1741347462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMUhAuT82gxwAZcscr/Yr66gdRltVialQBb8xLKV0OQ=;
        b=OnE660ku9upnpgMFsp07JhqBrBkgw+d/Te0ooCDCZlcdNiy3iKkUe7PlHdZFuQ2TwR
         r8IjTdL1TPu0+D2l5TYGumm6i0E7z6MwJujnIyj2tuT1mbH/9kBKBF0yLUozhbjBpYYB
         y9vcOTLnwr8qr1Dbnd+ElleGvXFbG5MPVNa6oL13Q3LmwohW1D1LFdwoD1yNXE0nPI/U
         yKxxF/TIoCrIcUXmM/Mr4isLBVcHVnjgpyXu9xwVHSkW8f9i2Kp4RC7Gb6zRyT2ngcoo
         QdwhIGX+QZDC73Gl/8eSONN/6QjAOExtmKKl8v7eZsjuqvMs4jV1F5Wp3ds7wyTndLYW
         BmCA==
X-Gm-Message-State: AOJu0YyiaI8q9VE7+JGvdqQhIsx0SCeI1Hjs5gkScUAA8AvZmSvN5/mX
	RX1bmO1hUpceUTzqKYvnGGlmqiGVdZmWnQDvtPRMIiv6hO6QPJAcRmUEZQ==
X-Gm-Gg: ASbGncvjRqJTBpOsxAgiThA4Jb9n6ufGteN4N1Rhg/GPH1lbf1uwgWO5PRm9kJOB7e5
	tHNciuMmXOV0fs73E3ufDPhcWeFFT7kn4sbVJtZNufZ02hcps3woJMuyVJ1F3PWmKo21nSwPTq9
	+lwana1VMNjf1V6u8JKJhZ6mcDAsfdnPuGAhDlQgMJsAeRCM0DBV3AIoohEGcZwxjGQoCVrfzSp
	GnvgXam1fsEdgqfqHOD+TCQh9KcNb1Cz688wYMyR9K9FgLh3MlD/4bz3dvzN7ubCUgpzL+FcxbZ
	tGrUZRFu7EM9AuWi9rMmE1gydpGEYxj7BfElbdyATd0=
X-Google-Smtp-Source: AGHT+IH7h71CAvZknmclcwWlu2xtEy3htyKfMAefCE1SSeQTB99EagO355PiM1NWDH5/OyfeoVU0Wg==
X-Received: by 2002:a17:902:fc84:b0:220:d28a:c5c7 with SMTP id d9443c01a7336-22368fc267emr53287945ad.21.1740742662290;
        Fri, 28 Feb 2025 03:37:42 -0800 (PST)
Received: from tea.. (tvk033150.tvk.ne.jp. [202.222.33.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5b38sm31027695ad.138.2025.02.28.03.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 03:37:41 -0800 (PST)
From: Satoru Takeuchi <satoru.takeuchi@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	Satoru Takeuchi <satoru.takeuchi@gmail.com>
Subject: [PATCH v2] docs: Kconfig: fix defconfig description
Date: Fri, 28 Feb 2025 20:37:08 +0900
Message-ID: <20250228113706.154519-3-satoru.takeuchi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2a86f6612164 ("kbuild: use KBUILD_DEFCONFIG as the fallback
for DEFCONFIG_LIST") removed arch/$ARCH/defconfig; however,
the document has not been updated to reflect this change yet.

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


