Return-Path: <linux-kbuild+bounces-241-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7797802252
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783D8280F24
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 09:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F5F8F52;
	Sun,  3 Dec 2023 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNv2/I0y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E8528F5;
	Sun,  3 Dec 2023 09:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099D3C433CB;
	Sun,  3 Dec 2023 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701597000;
	bh=3fREL+3pDb0+f3gpXJDWy/Z+fjSVV4sYVi1Ga8WtaHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNv2/I0y1QaQgNoItB2fCs1RK2AgJtD5NdVHjX92RWhrLjqitS+cRVeZ2kXIsGx8o
	 QER7zjLtrPvCDVpDGyc3FQjR1VGYW3GSPNVdnBPNTd/weX/xjWmn3qQ+K1pop+vvcg
	 GFEsnbwuHQbnxVpzlV+Nq196TtY3G02V8Ierf2Za1v9CKfTZdcZyFKZPK5izOAbYYl
	 ZOpkXYUBx5i1XQIVUb6TT7YK1VqGX0xTOhvmbj9cb/vYAtzzh/DiO1FD7tn+eXX70Q
	 AtM5DljHuHWcL9uKAyXzFm49NNpivgg0zf9/3DC1s2cXsmpzfMak3IwicdamK9Zc7m
	 G3A13S5DzjkPg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 4/4] modpost: remove unreachable code after fatal()
Date: Sun,  3 Dec 2023 18:49:34 +0900
Message-Id: <20231203094934.1908270-4-masahiroy@kernel.org>
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

Now compilers can recognize fatal() never returns.

While GCC 4.5 dropped support for -Wunreachable-code, Clang is capable
of detecting the unreachable code.

  $ make HOSTCC=clang HOSTCFLAGS=-Wunreachable-code-return
      [snip]
    HOSTCC  scripts/mod/modpost.o
  scripts/mod/modpost.c:520:11: warning: 'return' will never be executed [-Wunreachable-code-return]
                          return 0;
                                 ^
  scripts/mod/modpost.c:477:10: warning: 'return' will never be executed [-Wunreachable-code-return]
                  return 0;
                         ^
  2 warnings generated.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v2:
  - Change the patch order
  - Update the commit description and add warning example.

 scripts/mod/modpost.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3233946fa5f6..e2bc180cecc8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -476,11 +476,9 @@ static int parse_elf(struct elf_info *info, const char *filename)
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
@@ -518,12 +516,11 @@ static int parse_elf(struct elf_info *info, const char *filename)
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


