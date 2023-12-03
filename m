Return-Path: <linux-kbuild+bounces-240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0FB802251
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC6901C208DB
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 09:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C6A8F4F;
	Sun,  3 Dec 2023 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGbXL9/Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CA228F5;
	Sun,  3 Dec 2023 09:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D96FC433CA;
	Sun,  3 Dec 2023 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701596998;
	bh=2DvonXnTe7s/F9D7y3v/KBQpYELTPDsU5vhrOaqP0pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGbXL9/YNvdZ3anDtwiwLsyBey9CwF9Zt9CsaYDGb8EKVE3wrJB/WhDBRGjY1Uxxs
	 Tn5B7LbKOvQkSogqXHVf/+u/ag2wpVX9EBYkBYcIh7SKaoAnySjiJN+YOVd2U9Ps58
	 YJRWdgzIaWA7WEVAG0xWQoEMLHmFMTVPLWjouvzxYsFX3xOctviP0fdgEJUnbfFDpM
	 al/hCwPCuju0DP+lZOFjGzUYR65MIAj8fHRrC2gQFSlr8wdvyZnYJ8y6l0KsQ25mvc
	 OOm9BamZlQDMJIerOt4X3z45JEQeKLjd51OACKQb610rvMHLUrXHD8l64l3XLp/7DG
	 X54qRPJZ1vv+Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/4] modpost: remove unneeded initializer in section_rel()
Date: Sun,  3 Dec 2023 18:49:33 +0900
Message-Id: <20231203094934.1908270-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203094934.1908270-1-masahiroy@kernel.org>
References: <20231203094934.1908270-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This initializer was added to avoid -Wmaybe-uninitialized (gcc) or
-Wsometimes-uninitialized (clang) warning.

Now that compilers recognize fatal() never returns, it is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Split into a separate patch

 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index c13bc9095df3..3233946fa5f6 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1421,7 +1421,7 @@ static void section_rel(struct module *mod, struct elf_info *elf,
 
 	for (rel = start; rel < stop; rel++) {
 		Elf_Sym *tsym;
-		Elf_Addr taddr = 0, r_offset;
+		Elf_Addr taddr, r_offset;
 		unsigned int r_type, r_sym;
 		void *loc;
 
-- 
2.40.1


