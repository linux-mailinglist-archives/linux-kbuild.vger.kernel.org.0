Return-Path: <linux-kbuild+bounces-2602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE439380B6
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 12:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673061F21EC7
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 10:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F5A84D0D;
	Sat, 20 Jul 2024 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4wOaVhL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9F2030B;
	Sat, 20 Jul 2024 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721471460; cv=none; b=eIOanH0AwO5O5n1dIZ8cwBk92Ogq7BAyyZORVKCHiuvFvjhwJCm9AL6F5UbmthYtfplYj1o5A/tK0g3nPgfYZ4mYFeF7nlXEvK+zog5XADh1YrAVxDZRt5LGZa9VcuZIlRsDKj65/qnKhHQzVygUXuY5ASrWxITK8fyOh3CC2Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721471460; c=relaxed/simple;
	bh=ByfgYKKvNMtTldgmxYr1sWL8C4ln1p+Y9xYJTAycY/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnCnmR3/l5IrXxLqYsnnxI9GX5F1Hl0xQ8xM1RAvb4ATrwKITNKhnleUN0fhq5MxI1FXHBBuNpp5DsD//nbIUQykn2R2mwdUJ6E++HesYYAlBnJLMJWXzBtg26sjt5AW6PRDsTMOChwmJW/GDEHfa+/f4dHzHTFPmUIDMypXM2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4wOaVhL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0AFC2BD10;
	Sat, 20 Jul 2024 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721471460;
	bh=ByfgYKKvNMtTldgmxYr1sWL8C4ln1p+Y9xYJTAycY/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m4wOaVhLNGT4mPR5cOlyFCpr+wVawMdMDaGlG9Sk8x1DNknb5C2ZOdW8sUuSITbCi
	 f5IMhAY4xhKlFOy7QKxkGMLB04TDnDGlzSP+mfySfAnpoXYAGZyi0kqpGmTZkfRCOX
	 lRmifMJzTHQdZ3Xq9LH+swLuuCW+ot/CQFUJ/JEWbIL4Geravjbbu+120YZRCPowhZ
	 Eb208YA6bq3/6nakYHPh9vA75CpywC+3/cKfuo8QmlwQV2KzOibqLrbj2etqmRK9Ea
	 c9XuyA65FN2NZi0kJ34QC1iwiYgtDKL3ZmnxJGBj8v7cdj8qglZLi8pnhWuVxY2ZHH
	 ub3rPub9D6iEg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kallsyms: use \t instead of a tab in printf()
Date: Sat, 20 Jul 2024 19:30:13 +0900
Message-ID: <20240720103053.2870014-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720103053.2870014-1-masahiroy@kernel.org>
References: <20240720103053.2870014-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This string literal uses a mixture of \t escape sequences and a tab.

Use \t consistently.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f0ea8c922dc8..164c04d22061 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -521,7 +521,7 @@ static void write_src(void)
 				table[i]->addr);
 			exit(EXIT_FAILURE);
 		}
-		printf("\t.long\t%#x	/* %s */\n", (int)offset, table[i]->sym);
+		printf("\t.long\t%#x\t/* %s */\n", (int)offset, table[i]->sym);
 	}
 	printf("\n");
 
-- 
2.43.0


