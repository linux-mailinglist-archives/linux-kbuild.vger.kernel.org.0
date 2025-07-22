Return-Path: <linux-kbuild+bounces-8105-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993DB0E296
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 19:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9229256788D
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21F027FB15;
	Tue, 22 Jul 2025 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYxMkcH/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A97277CBA;
	Tue, 22 Jul 2025 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753205353; cv=none; b=sHhqYDi/itEZ+DFswLGYq2X/O8mRDeZ+hG8OyRB7D2dqa0CMirRj4v/QJM8LU9tOsl4CONhMMaPjwJRp1hW+8Cnsm8UQN5F1hcm8f+NscX4q2pG8CE23wpI+dlOGivq+KgRfB+Kq5djxOy7pZOdxVqxYscfkLvNP7PySNCRBl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753205353; c=relaxed/simple;
	bh=0+JauH28HYVUWG6hrxFn1yDspMA1MTZm2Hxl3u21BHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QOZAAkVpRr+XLFvkhZBGewWlS7pRPR6UwLZMWA0O4qcy9+aoj/6/bkoRK6A93UGj/H7uytB9OpV1B0w6W3c3r4i/1l0yiTIufdU0OxoXzmGyK+bBUuB46mMTjgJwhzXZn67vXrAze1YptvUA4LDinelm2heeICGiMYBtJ8az6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYxMkcH/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-75001b1bd76so3661050b3a.2;
        Tue, 22 Jul 2025 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753205351; x=1753810151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Hh9rn2Pq0w8+Rx4ALg0gLyUsE3RWAfCvKLiuX/Mgyk=;
        b=AYxMkcH/m5uMnCbgQdXqyJaEQC8p4C2JhmSWLQ8ynAFb2yiUAccKu8kkFhmEnQpz0F
         9D2qTgcE3fhHOk2jcvD03uLAzPjrn0piboByaBP+SJlN4w1Z4u9eA1O5x5cQK9kCxlwX
         7RKvPJwe71hS0QdwAHGQWQAjaNYCrmqKeWpw+Al7BVB2p62UFY0dvAhAuxc2cS0wM3fQ
         tZ/FSX46Uf5bAH2lEt2pc2fFdhuBt9QUUlZHz2MWt0ezR017MWJoZUIkpW4U/ovITSDr
         UwvF83oE4WoWRq60nLl1ZiHj+U7Zz/GDRvucEJ5W0yRtMFloLmJypKh7B+faTYkZ7+NZ
         A7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205351; x=1753810151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Hh9rn2Pq0w8+Rx4ALg0gLyUsE3RWAfCvKLiuX/Mgyk=;
        b=gOD1IbCMt4q9iSojuNW6rBP7GxXi55/9bNcwc6D3DZ5OtztTo+aloKP7qdEq/Q1Hzj
         0nitFDI5WX4DCRlPxn1z12KLsCHKUkWxh2etMkZSSBJqAFlGk19lcKn9SL0UKIFc+vvz
         Vcot8iNI5BvdoBFiIFZrTqjn3bmNgY6wz+yKCT3dqM2vbsZsFxMiQVsizWJlxNc5b0ly
         onDLh+46EcCir0lyzap94E9xu6h30C6+2TDzlKCep3UMlZwOxhefoCKGaFnrRHecEn1q
         eSxkWo9F61Cj76NcHZbi9z5sLYIIt26lmbEPU2uUGKUBg5eQGGLz7y7knCK3iDgjuTtL
         szyA==
X-Forwarded-Encrypted: i=1; AJvYcCUw2itTzTvw7QWdSlTtLcqW9IaNyMqFGPMh9r9qWbP0IiexQBUDhgXEzdupnEMZQP1n+TsIQcOmLWQNmOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKFTnTElxpaeZmhfeEZWhJUSqApMlKdg/Dti5GTRYlEjmaz257
	i/6un84cO/6QaoegnTzAV1UXjDh/BBDNXoKn/qm6RBfkIkswPBK2pjmFkgh6nw==
X-Gm-Gg: ASbGncvHlB3fMo7Cz07y3N2yGDwQ9uHxmfHsC7hqYFh0yjDdxsJ5edft60czfOOpkRD
	SYmmX+nXz8rqU5xQbCts4fF4Te6CTmCh4dwUqTh/HdtQfcuclErmR0CGeepeA+9vta7+hS0d4bQ
	5RZ9Dfa2VdPEs1GnxOyeA/8SXv1TU1T7aJUcblNCYnSRAEMyPLYt9da0SRUOpreqvGrGQecFlR9
	grmluaZqMIkrT3/sPNVDbTEZAnAIGvT39MOR454ufb4p1EubrELITzxuuZ0aXoLr9GXOBoajP4P
	HSKFYzO9XXTcB6JBB5Qogm92uTWDP9+dAmy7XaVzdDkdcLvrC7dPMAXsY6vbAN062YyHGLQC/lw
	lUBXvsGHqN72MqJ9fKwSPgQsCI8qS56ZXtECv
X-Google-Smtp-Source: AGHT+IG2xUjr6hY0DIyG0TnPvyMMo2piQomAOlh2Okyn9A006ocqDc3HT2OIJTuxbHqnojNQtP58Aw==
X-Received: by 2002:a05:6a00:198e:b0:73e:23be:11fc with SMTP id d2e1a72fcca58-760369d5ff5mr95676b3a.22.1753205351333;
        Tue, 22 Jul 2025 10:29:11 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89cfb3dsm7920061b3a.34.2025.07.22.10.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:29:10 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] kconfig: nconf: Fix uncleared lines on help screens
Date: Tue, 22 Jul 2025 22:58:37 +0530
Message-Id: <20250722172837.140328-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1b92b18ec419 ("kconfig: nconf: Ensure null termination where
strncpy is used") introduced a regression where
help screens (F1, F2, F3) no longer properly clear short lines of text,
resulting in duplicated or trailing content when lines are overwritten.

Revert the null-termination change to match
the actual length of the copied string.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/lkml/CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWXi9R-d3Yx3iXs=Bg@mail.gmail.com/T/#
Fixes: 1b92b18ec419 ("kconfig: nconf: Ensure null termination where strncpy is used")
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
v1 -> v2: Add closes tag to the report.
Carry-forwarded acked-by and tested-by from previous version
---
 scripts/kconfig/nconf.gui.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 475a403ab8ba..7206437e784a 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -177,7 +177,7 @@ void fill_window(WINDOW *win, const char *text)
 		const char *line = get_line(text, i);
 		int len = get_line_length(line);
 		strncpy(tmp, line, min(len, x));
-		tmp[sizeof(tmp) - 1] = '\0';
+		tmp[len] = '\0';
 		mvwprintw(win, i, 0, "%s", tmp);
 	}
 }

base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
-- 
2.34.1


