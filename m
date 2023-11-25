Return-Path: <linux-kbuild+bounces-161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FBC7F89F0
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 11:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B55D28171A
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 10:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2D98C1F;
	Sat, 25 Nov 2023 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hy1V/roH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE10D29C
	for <linux-kbuild@vger.kernel.org>; Sat, 25 Nov 2023 10:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9869DC433CB;
	Sat, 25 Nov 2023 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700908293;
	bh=UQohXr4Q1HYdYBXHCpAgYPqYqu05A8PQAIBFeD9Rs4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hy1V/roHQPewcPQbyO4u0xgO+U/7AUQ6zHeTG+3A4iGhHH8I2gAOF+bTlcFIZNaqy
	 E6kbL5ccawosHgiy1iOLfy2rgMDXKQQzrflVIUepKiyjaRVORIA1uqy35KeyT2r41s
	 CYCoiG1Hh8xCxCIEFCGr9INRlFd4O6FHtPAFPb4OO3t5vg+62alSTU1X1z9irnvnDw
	 QrzXFlJpbkKY7fWGDNcxeOKUpbOwpiLwaswfOm0c59LIR7GOPVwT4FoUCaA7lg1YqO
	 xAqtE4SqovC/rVLuV7UvFrY9+K9D/9Qwif8QwF7uF3pzDhDC83pyd8niOrKYqSUFze
	 VLZZB6DeGtB3g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] modpost: remove unreachable code after fatal()
Date: Sat, 25 Nov 2023 19:31:15 +0900
Message-Id: <20231125103116.797608-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125103116.797608-1-masahiroy@kernel.org>
References: <20231125103116.797608-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fatal() never returns. Remove unreachable code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ca0a90158f85..013fc5031bc7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -473,11 +473,9 @@ static int parse_elf(struct elf_info *info, const char *filename)
 		fatal("%s: not relocatable object.", filename);
 
 	/* Check if file offset is correct */
-	if (hdr->e_shoff > info->size) {
+	if (hdr->e_shoff > info->size)
 		fatal("section header offset=%lu in file '%s' is bigger than filesize=%zu\n",
 		      (unsigned long)hdr->e_shoff, filename, info->size);
-		return 0;
-	}
 
 	if (hdr->e_shnum == SHN_UNDEF) {
 		/*
@@ -515,12 +513,11 @@ static int parse_elf(struct elf_info *info, const char *filename)
 		const char *secname;
 		int nobits = sechdrs[i].sh_type == SHT_NOBITS;
 
-		if (!nobits && sechdrs[i].sh_offset > info->size) {
+		if (!nobits && sechdrs[i].sh_offset > info->size)
 			fatal("%s is truncated. sechdrs[i].sh_offset=%lu > sizeof(*hrd)=%zu\n",
 			      filename, (unsigned long)sechdrs[i].sh_offset,
 			      sizeof(*hdr));
-			return 0;
-		}
+
 		secname = secstrings + sechdrs[i].sh_name;
 		if (strcmp(secname, ".modinfo") == 0) {
 			if (nobits)
-- 
2.40.1


