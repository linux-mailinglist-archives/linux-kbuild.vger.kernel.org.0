Return-Path: <linux-kbuild+bounces-250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9880227B
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 11:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53FF8280ABC
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DC88F52;
	Sun,  3 Dec 2023 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ru11GhM8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B89463;
	Sun,  3 Dec 2023 10:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08552C433CA;
	Sun,  3 Dec 2023 10:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701599139;
	bh=/G/U1jJhbg6VKWyteRfH6C1mvYApP8yrSi62PoEqI9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ru11GhM84CbNOelG13KOP1EoEqrb8+Wvlvslrb7HO888VE7rXPv8gGZNWGla1cS2c
	 /vzIfuDA7nv5eCPMlO/dUbAT1l2/8dSPRLuyq1q7qHSx6xZU4pyZRzeXpOABc7hasb
	 GrVzvInmpj19XxroKZTs8Ulwp20rJyHa6ejUCPLhjztl7s4S7SIoesFrougAlvMqis
	 O+DVF79EGrgNWxMnJF37ZTdwifA++f2ylh+huqAlQCjyc+QT5Bvv9yKHhzV2r/Qq1o
	 P9pt2ypmlUV9rXAv/HTjBE1K+VhMnBe13AzN8iEBtsT7aMWQxBNKYvn3qlollSvI3v
	 IAswBND4PDQnw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 5/6] kconfig: remove unreachable printf()
Date: Sun,  3 Dec 2023 19:25:27 +0900
Message-Id: <20231203102528.1913822-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203102528.1913822-1-masahiroy@kernel.org>
References: <20231203102528.1913822-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unreachable code detected by clang.

  $ make HOSTCC=clang HOSTCFLAGS=-Wunreachable-code defconfig
    [ snip ]
  scripts/kconfig/expr.c:1134:2: warning: code will never be executed [-Wunreachable-code]
          printf("[%dgt%d?]", t1, t2);
          ^~~~~~
  1 warning generated.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 81ebf8108ca7..a290de36307b 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1131,7 +1131,6 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	default:
 		return -1;
 	}
-	printf("[%dgt%d?]", t1, t2);
 	return 0;
 }
 
-- 
2.40.1


