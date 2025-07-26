Return-Path: <linux-kbuild+bounces-8203-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3278B12BBC
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 19:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25A2B543C94
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 17:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519222877D2;
	Sat, 26 Jul 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIupiKjn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2F81D5151;
	Sat, 26 Jul 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753552534; cv=none; b=CLbM4MNQyFdWRRyAs9l/kjhSOLu5mSq3PsOWl6GLI7uTf+uZ8KlUw06nCBTiRFdqKC1erd/BIKl0mkBqp71NnDqiw6FkFK1/giz3GCLLxpXE+4wUIBeVD07rM8seChwyt20+anvhILdkqO3+CSs/xGHQ09b+6QV2ZSI1oKL80SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753552534; c=relaxed/simple;
	bh=J7tOKQm6KsbYvCR3Hdcgq3HJjA2YL0PvUJvCbeT5bRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQ4lXQep4fsPXj1Gdn5wiAYlrJMFHZWQwL3RZ9wTyZKCgHaYB8HpSDHV7OXHHYd3GGtOYtrI3UOl+X1cHUUCTzfWQg+MssLBZstIDygyszqhGO1V8G5tjyAkSMzPNT/w4L/sU4dd4ws4UAdvf1eu0qCMGV+zMQGv+zh05D4IHVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIupiKjn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3447990b3a.2;
        Sat, 26 Jul 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753552532; x=1754157332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5W++au39rEBJxX2Q4rDpMomnaH1q1xWRqIVRKBNu/qM=;
        b=CIupiKjnPAk3h9tq1uXS3oygqp42p4jKzOzCrvTnpy/2sQq/ujWwRSw8IXqayx/dbu
         QM8CU30AuKWxrUEhtu/B/e7EcJqmMCup8q3eRJW2zQ9k8K0JlWL8qzxSbL8oAoF5vYc2
         MyKpgqL2qhnOAHJtQQtVqMiPqrSx6OKa2s1yJHfQdfapKBPqOhKGa64Ubby6PuCE/5tA
         VdK2uT5xSzgP5dRrHd8tG73CKCnGMNMUH18haoPGQZp9qcVWk8Ksv1ZRFUbKf3kHf28D
         QO0S6W+S9knPdxCDv/QRTWO1SfG310eYponxJ9CBeKJnoT+0rDILr6qrSboi7j6gJGKF
         ewDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753552532; x=1754157332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W++au39rEBJxX2Q4rDpMomnaH1q1xWRqIVRKBNu/qM=;
        b=a6ICndBxu9V+K5H83W2Mq8PFtr5xGVH87XtWS93tAP71puC2701jmgbOcj1xJ5hSaA
         cTC9gbtWyD/j/ET9YR14pAK1PJzs4F540i3bk+c+0FiliqoHx103rmRTERPA6IRPx6Iw
         VHUFmGpAY8DbUbFH9j/j5bK8DlO75oeuEd+b+582ndzQH04cE/ynaI8R/WIjy5swxBHF
         HQ4D3KnKdvszIPUHxFx5wupTiIfido6MJOpf3nVa1Q3moEIbnJyfbBWsMuat3AdaODwK
         TFQAWhvbDsAoekwZKoEWgeGUwolyZESfaZmgPqP9Oa4vf7hx4tWN/jo5MP8+DsIeTu6g
         qqVw==
X-Forwarded-Encrypted: i=1; AJvYcCVNk9l9WN3OFJZZxuU7QeI5ut+wOBjyZ0RERld5hd4CNtIFvGKgSZFN2/GlGXIZ/yys5MR8+w/a4PvdWA8=@vger.kernel.org, AJvYcCVaJJfwZ47S0hQ9FCW3Qni+h2wRChnaweT9eZI3qs4LS1u3ZVpn/QhkbizaxLyZyrkUkJDrfLR4Q/rNu/uR@vger.kernel.org
X-Gm-Message-State: AOJu0YzhOplbmJjgGcJwOy8/ikt6fsYPyyAANe5bOyA9cV7H2EqyTUid
	AIw7/zPIF+8Q9i50liCC2GoG0sI/5YLh8KcAeVDPTtPEG6VgHql1vf9m
X-Gm-Gg: ASbGncuhYo3L2VccNKw1AAfVAYXfCd1Vt606UTcRqzETq1PcvbSG94nAJ68chmLuXtE
	0j7/Wkcxc53azeVRHtur2KaeE7pKxuzlxVQSDmT67gSuz5sBLeAmAOzLriVDfwbJzGxnxDsXO5w
	2+IGH/H/NuG6FwYlCeTd93J0yaUEu/zKqAgoa3g0K7qjLp42Ln5/IH//dtKBOQLAWeKPmzoTCs3
	XrtoZl+gR/CJPZQ4QZsdNorx42AZeGNNsoca7iLb65W46OhB6cCF73MT7nbbzv+UZ6XkHFrQSz1
	BzrBGe9KaIdPxxZToBblwy4+jteuc/IuVIGxSsQr8styPo0LPP/RJ6c43IqUJqtikmX7F6ZiL+P
	P1cuNEceL+vhxtE5covy2evfuYCTlig==
X-Google-Smtp-Source: AGHT+IGxlNYFc38S9eyRpImqOcQtnsmU476IB/ko2ETz+ypFrU/cqJ7CZ1/p3sY9pKlfg1fkHfAKrw==
X-Received: by 2002:a05:6a00:3e01:b0:754:7376:548f with SMTP id d2e1a72fcca58-76337de94ebmr9720110b3a.23.1753552532040;
        Sat, 26 Jul 2025 10:55:32 -0700 (PDT)
Received: from archlinux ([205.254.163.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-766cf6c19dcsm167180b3a.68.2025.07.26.10.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 10:55:31 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] kconfig/lxdialog: replace strcpy() with strlcpy() in inputbox.c
Date: Sat, 26 Jul 2025 23:25:24 +0530
Message-ID: <20250726175524.146459-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() performs no bounds checking and can lead to buffer overflows if
the input string exceeds the destination buffer size. This patch replaces
it with strlcpy(), which ensures the input is always NULL-terminated,
prevents overflows, following kernel coding guidelines.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

Changes since v1:
- Replace strscpy with strlcpy

---
 scripts/kconfig/lxdialog/inputbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 3c6e24b20f5b..ca778e270346 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 	if (!init)
 		instr[0] = '\0';
 	else
-		strcpy(instr, init);
+		strlcpy(instr, init, MAX_LEN + 1);
 
 do_resize:
 	if (getmaxy(stdscr) <= (height - INPUTBOX_HEIGHT_MIN))
-- 
2.50.1


