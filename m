Return-Path: <linux-kbuild+bounces-1765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC48BBDB7
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E9E2281F6C
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC16685926;
	Sat,  4 May 2024 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB7W4a/r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EF685650;
	Sat,  4 May 2024 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847658; cv=none; b=lG9jaByQ92ofqpwckgEmmptPhT5RuBHHN9O+Jvj0MLSH2zu1I9DgozJmgvmX8pPeYXPBTihf3U2PGUrx6A6/rCa4HmEUXKmP0UNw5MLuPGRuam7+cEQWvM6UQGIsRn8DJLcfzcqkkcwNnwMQiXguzzV9AF5EWK8I9uRYd/GDQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847658; c=relaxed/simple;
	bh=n3kfPRVCQ5t0c9SyMZT7tSS34HDAWc2ENT6kh3eZwfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rp9fBdp/PYZnj7mdFjOMjHGWPvk5jc/dWbVe9psYxfWLyyYArvnBvHERsD4DdqbpAMW+oaDn2f97JBvXr7iygj7MiuiZ2Tp/OkiYOm6TUOyTFnUDAUEcARrKH+Lo6C4hzTUqg+PplMkIzujI+LRHrYeZkmMEFvqi9dFzBM0Pj4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB7W4a/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C21C4AF19;
	Sat,  4 May 2024 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847658;
	bh=n3kfPRVCQ5t0c9SyMZT7tSS34HDAWc2ENT6kh3eZwfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YB7W4a/r94YbuqIOmnzBSU2yP7Q4ojM/kpmfCjsl0HLqlgB++Q10eefoGmjqnm0fa
	 kVt67HRAQz3OoCGB+3i0QfKFtlXc+LQSAMaYOaZIKrSsaHT/rEAabBm1VcKFccCahW
	 tBEM4Kf3+EoDM67LGHF16Vfwn/SiJYBhBh4c2wwapkyxFWJoQj8V+UUx1cG9T1H7Uq
	 szJzjQf6/yPJzdXE146n/3PYjassqfrx6f4xIKT8W7+6yrpFccNeKC/Pbgk04tm+9R
	 +3zaWheqKamBeSjqzjv2PgaXoSKy+DUIWsS+0jtPzXEFA3LP29wfKQoqm6BCt42jU7
	 Y7PA4vd3mTc3g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 08/10] kconfig: turn conf_choice() into void function
Date: Sun,  5 May 2024 03:33:31 +0900
Message-Id: <20240504183333.2031860-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504183333.2031860-1-masahiroy@kernel.org>
References: <20240504183333.2031860-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of conf_choice() is not used.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 0156ca13f949..8ad2c52d9b1f 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -446,7 +446,7 @@ static int conf_sym(struct menu *menu)
 	}
 }
 
-static int conf_choice(struct menu *menu)
+static void conf_choice(struct menu *menu)
 {
 	struct symbol *sym, *def_sym;
 	struct menu *child;
@@ -459,19 +459,18 @@ static int conf_choice(struct menu *menu)
 		sym_calc_value(sym);
 		switch (sym_get_tristate_value(sym)) {
 		case no:
-			return 1;
 		case mod:
-			return 0;
+			return;
 		case yes:
 			break;
 		}
 	} else {
 		switch (sym_get_tristate_value(sym)) {
 		case no:
-			return 1;
+			return;
 		case mod:
 			printf("%*s%s\n", indent - 1, "", menu_get_prompt(menu));
-			return 0;
+			return;
 		case yes:
 			break;
 		}
@@ -551,7 +550,7 @@ static int conf_choice(struct menu *menu)
 			continue;
 		}
 		sym_set_tristate_value(child->sym, yes);
-		return 1;
+		return;
 	}
 }
 
-- 
2.40.1


