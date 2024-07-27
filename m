Return-Path: <linux-kbuild+bounces-2681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BA93DDB2
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 09:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4F11F22678
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 07:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E4240875;
	Sat, 27 Jul 2024 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2Ko0rMl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0A40856;
	Sat, 27 Jul 2024 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722066337; cv=none; b=SZ8IKKnx51tTmNfi9jqzZivcovcv5EW3OXfYeKyC7Tm9x+Gk7/zAS17G3HyxotVqe670QOaY9L6r/Sh3TUZXpGeAl4Oa6RzAaapII/I3TPdptBrck56+K0CtO/J5aYfnMNu9uPtac6N/NVyUS+Bw+UtQdOqZKNOHYZC5yhui/Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722066337; c=relaxed/simple;
	bh=NDllRo2iGl1hfEBaSYSoTi2556pDny/MrzqazaQB+yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fueu9Z1e8H6zcfzUbhgnzoN+A8lGJ35ufC/Ftatk4NkQduQpS0sy5QO4M+QvLGh5Z2WCmc8FKvnMmjpzu40CBTQWvPkL8NOcefqhtGZ+SP1XwJniQ4uQA+SNgh1GxDzT+ze5jzBMa7N9TS8iuAOTqQmnHj89xWJrYT7yCIbTEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2Ko0rMl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA456C4AF09;
	Sat, 27 Jul 2024 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722066336;
	bh=NDllRo2iGl1hfEBaSYSoTi2556pDny/MrzqazaQB+yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2Ko0rMlFEb57lywUf2G6bVlIa6NbkH/s88JL3qjGQ4zIXqzibvzszR6i00SjZIef
	 ZWHaTrg0WG5AZ50dTICNwYgFosGVLdJXq+FejTPqLcuoQPDxVXGMNj3din3eGsYfZy
	 2A3Hq2IchoSPg+mwVF5o5ZrDm+gLq6bGFR8m1guz+j8Zl8QMeRz2eGkuOeWO6ensUw
	 vLwwHHnhE9QVxnIQwktk9vvUQmzJcQN6DoLarUZxSgRf424HPnGssf1sshod953zPg
	 1pjb3rxVHnOzYPd2mZrrSZjOXqvEtNKVix6K5N+1bS0+DAwjDnRJ38NmmF6LTgOrMI
	 V06jdgxwzL1zw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/4] modpost: remove unused HOST_ELFCLASS
Date: Sat, 27 Jul 2024 16:42:01 +0900
Message-ID: <20240727074526.1771247-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727074526.1771247-1-masahiroy@kernel.org>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HOST_ELFCLASS is output to elfconfig.h, but it is not used in modpost.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/mk_elfconfig.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/mod/mk_elfconfig.c b/scripts/mod/mk_elfconfig.c
index 680eade89be1..aca96b3aada0 100644
--- a/scripts/mod/mk_elfconfig.c
+++ b/scripts/mod/mk_elfconfig.c
@@ -39,12 +39,6 @@ main(int argc, char **argv)
 		exit(1);
 	}
 
-	if (sizeof(unsigned long) == 4) {
-		printf("#define HOST_ELFCLASS ELFCLASS32\n");
-	} else if (sizeof(unsigned long) == 8) {
-		printf("#define HOST_ELFCLASS ELFCLASS64\n");
-	}
-
 	endian_test.s = 0x0102;
 	if (memcmp(endian_test.c, "\x01\x02", 2) == 0)
 		printf("#define HOST_ELFDATA ELFDATA2MSB\n");
-- 
2.43.0


