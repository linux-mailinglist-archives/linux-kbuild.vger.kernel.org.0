Return-Path: <linux-kbuild+bounces-5730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5320A32A61
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2025 16:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 661113A6019
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2025 15:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4101D86C3;
	Wed, 12 Feb 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJdelmKm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB1271814
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375148; cv=none; b=q+H/8l9tHe8WruLfm8LjHOCZriQl1kvzBvIe/ZhHjD6BkekGwZ3MRRW+cxo1S+wDpylzVlp0R0S6NwJbjQpaC6KqhBcWH87Ygvv3A/d63g0+ubQRc3j7gLQprj4D8K5AftedkhW4WQ0LezLNKKXjfdx4vNnceoCZIobzj8WWo10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375148; c=relaxed/simple;
	bh=ShyiEbVibyLRh1cMGhSZQ4K+lXX+ZvVh7O57Y72NM+U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ad01Q7R0PGmVVj05w9KqmH3aiTMg5Hjn8TuiQ9c7/iVTv6b+Lyp76QCjnjQJrtIuHmSTns0h5iFDosUWpjKe9D7SN6q2WcGps9YfbhSldfGaodJ4RuOOyTfI6c00EpFx5BfU5k3Kpg/qXCikqOuETaqXof8e0Tsjg/s222b0VMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJdelmKm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so7673631e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2025 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739375144; x=1739979944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKXzuxunOTVzXXnL71jDLohdkQFXqmscQJlncliKwIE=;
        b=FJdelmKmiwmZI9JXbbcETTz8sU6z9fzxMGZWgw2mFuLvGwKlo1fKU0IU9cGFrvV7Tf
         MGo6uDDy/XW3z/4dBQdYVYKDuHM/6400yILxXyA4HNNP/djOuHxY+wDZ9myQshEm/E6J
         HWqTOnk2RjSmwTvBn6xGTvxNuf5XaasDzyTzAcuMASFN6Z9a0mOHvdxLChMC05ikU1Ni
         /CxUBIMwbGUGO3019NbumVuZvbdjaN77+ZvHxd8z1bHWswj9h6vd6iB20RqkFxFF6ikf
         1ed5uLN/5CJIIgxnZiRlGeKaNXiq/iRcyYOk9hVKSmIFg4DBY9Ol45zHxLc+fCa7lhI1
         /SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375144; x=1739979944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKXzuxunOTVzXXnL71jDLohdkQFXqmscQJlncliKwIE=;
        b=rS6ZQcOqcGgqHGVptjFQ8Hn7b0Y59NtO5+AlTyMVBmqva44/2umMq/MYiKitLsty/G
         U9RY6SZzkA4XXPnt72+2aTFjEJ2EuTnKhei2XEckcRnrgIjfpzchVWMDhyTDjX4NemrO
         3MVL/gaNXWdqr/zsXmPv9PWokk+o9xjTYi4HEa7Iu6G+cJ6Rih5pb6NFmeEPCiUw7T8I
         ljWMZ4zs7aV/0cXJ0u0iQ2N5D9mRR4sOLZyC/hTf02LueVx8sVcoPC5xKQwO6L6sDl5K
         sBHgtbJqAFQbaX6cSOfAzF03+g8u/OJp7dcygPDK8mx9mYrHQJR7hoUpybw5Jolg0B+Z
         gIug==
X-Gm-Message-State: AOJu0Yz3ZEDQGMpKY6nmiIg7N7EjPO/nZbyj1sg6T9zCxTGac5Sp6qVz
	E+egK0mfxo2xt8I3YRNRLHAIm9BAmOh88+NLViC0tThnk/XfcTsQO5QysKmhfhw=
X-Gm-Gg: ASbGnctRmiOPnGk3qKUUr4ejYD9i2pDqsaxqvhibcu573/UguGibAOHJ2Y3Oso9yE08
	LyLUmE1ybbN1SYzmjMLwTzZwAGbgY/WT8s0jInZVaJM06tBDA1z7lmxu3rOAl0zCs0LwCMSAzhe
	aKm4wJzYkAW7eF0skE/0QCFM0oQcqQj42dANYHGLKuN1U2Qm3BFEFDW4g9l0JQXL1Ok+aXdSOb3
	iZZyK0NqGBiQP84TBBkPwq2f5slERS5ILnJS5PiiCeV5TLj3S+19KtOUr6TdH4jvzfw1V+07t8e
	5WUb1+mMQd570WWdGD2LAYal4Yfcvex7WFk3jjNuhg3KYDqKOMKOPJ86TXBAMqMJQ6xV8O7K
X-Google-Smtp-Source: AGHT+IHF+X6gLhov4oGA3RJ93XHh0FeHyqg1dVZUceRT5b4LznIVeIqwYVn9+y0FgI3DWKRk843q7w==
X-Received: by 2002:a05:6512:3a84:b0:545:b40:6561 with SMTP id 2adb3069b0e04-5451818122dmr1283613e87.44.1739375144091;
        Wed, 12 Feb 2025 07:45:44 -0800 (PST)
Received: from astra-student.rasu.local (109-252-121-101.nat.spd-mgts.ru. [109.252.121.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450e02daa1sm906158e87.79.2025.02.12.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:45:43 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] scripts: kconfig: Fix potential NULL pointer dereference in
Date: Wed, 12 Feb 2025 18:45:37 +0300
Message-Id: <20250212154537.235297-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function `prop_get_symbol` may return NULL, which was not checked
before dereferencing the pointer in `menu_finalize`. This could lead
to undefined behavior or crashes.

This commit adds a NULL check before accessing `es->rev_dep.expr` and
`es->implied.expr`. If `es` is NULL, a warning is logged, and the
operation is skipped.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 scripts/kconfig/menu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 0fe7f3255a..3fb3ab4637 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -400,12 +400,18 @@ void menu_finalize(struct menu *parent)
 				 */
 				if (prop->type == P_SELECT) {
 					struct symbol *es = prop_get_symbol(prop);
-					es->rev_dep.expr = expr_alloc_or(es->rev_dep.expr,
-							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+					if (es) {
+						es->rev_dep.expr = expr_alloc_or(es->rev_dep.expr,
+								expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+					} else
+						menu_warn(menu, "select property has no symbol");
 				} else if (prop->type == P_IMPLY) {
 					struct symbol *es = prop_get_symbol(prop);
-					es->implied.expr = expr_alloc_or(es->implied.expr,
-							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+					if (es) {
+						es->implied.expr = expr_alloc_or(es->implied.expr,
+								expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+					} else
+						menu_warn(menu, "imply property has no symbol");
 				}
 			}
 		}
-- 
2.30.2


