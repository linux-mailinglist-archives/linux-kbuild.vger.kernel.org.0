Return-Path: <linux-kbuild+bounces-5454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314EA0BB67
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C281E3ABF7E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BAF23D3D2;
	Mon, 13 Jan 2025 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wci9umLg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F017323D3CD;
	Mon, 13 Jan 2025 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780590; cv=none; b=jMOK/QuxjB4oZMx6KwPQXt0rmEdsLmQRumH82DVc4QuoTTHIH8rSXMb/inHgEn4+B5IzBH/9QFNuwqSFasT3NQBDESda63ADT3RrDpon5JYRbD8ohETM+m6z7jM5zEtB9C08FgPXDpex4cgfGvR4/ocAGIiLF9/L9qdBTpPb8Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780590; c=relaxed/simple;
	bh=cKHuwhs5W1dFmJ/Kf1Fd8/c98XBQjhpg9ao/hRjEQc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eII4F7S7+sYMknAuJ6H6Se6s2znrey3e/+NJR3xPDLXaUqpJd/aUnpTDln1MHHTgQn89LneUTkECj2MG7/S8XW53N3V3ZTTk0Q3uywEJhp2FrvLvnx/V1vX1vDYJWV3UAMPgpLOtZa/M3VM/3m6LF/1VWzdXdeZ3E42Orll1aTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wci9umLg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C4BC4CED6;
	Mon, 13 Jan 2025 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780589;
	bh=cKHuwhs5W1dFmJ/Kf1Fd8/c98XBQjhpg9ao/hRjEQc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wci9umLgdaVMz91h/b5FtSb8owqxICvJEVNMlG1p4eFmYOnQnQZsxHM6JLEnPb49b
	 hovMl0v67L8atcDbIuV4vKeuFc/hfVblJiZ/6d2SokI/lE7o7CE7E8JsEZIrZiPkam
	 x6lCD52EZ5WwJp83EG6KxfUK/DqdOrSdeCeb69TrjXgAiCKApu3Dq6PNeeio8mpVKk
	 48BaQ0USoyamf0e4mvrK41sLV4+8SnEU9mthH8B05EO/LEWu6Vx5UM+a4LXcCszcY1
	 OYj5rWNXiOH4c0KgvV/Eqg7HuVOMMCUV4YsiVP4R5Ru1pJPQRMk4G3vD9UNqZFEJQo
	 Myl4wthhCIMEQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 06/17] genksyms: remove Makefile hack
Date: Tue, 14 Jan 2025 00:00:44 +0900
Message-ID: <20250113150253.3097820-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113150253.3097820-1-masahiroy@kernel.org>
References: <20250113150253.3097820-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This workaround was introduced for suppressing the reduce/reduce conflict
warnings because the %expect-rr directive, which is applicable only to GLR
parsers, cannot be used for genksyms.

Since there are no longer any conflicts, this Makefile hack is now
unnecessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/Makefile | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 312edccda736..4350311fb7b3 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -4,24 +4,6 @@ hostprogs-always-y	+= genksyms
 
 genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 
-# FIXME: fix the ambiguous grammar in parse.y and delete this hack
-#
-# Suppress shift/reduce, reduce/reduce conflicts warnings
-# unless W=1 is specified.
-#
-# Just in case, run "$(YACC) --version" without suppressing stderr
-# so that 'bison: not found' will be displayed if it is missing.
-ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
-
-quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
-      cmd_bison_no_warn = $(YACC) --version >/dev/null; \
-			  $(cmd_bison) 2>/dev/null
-
-$(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
-	$(call if_changed,bison_no_warn)
-
-endif
-
 # -I needed for generated C source to include headers in source tree
 HOSTCFLAGS_parse.tab.o := -I $(src)
 HOSTCFLAGS_lex.lex.o := -I $(src)
-- 
2.43.0


