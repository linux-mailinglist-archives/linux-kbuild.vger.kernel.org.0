Return-Path: <linux-kbuild+bounces-5448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD1A0BB38
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EEDE188295D
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B99B22F85F;
	Mon, 13 Jan 2025 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6Gz2qB+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCB22F85D;
	Mon, 13 Jan 2025 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780582; cv=none; b=FFd6VYO7dqW9ZiF1hkk8R5gXuBUfGFH5cQP0W33iiMZsNZMvlYajhM2HKWkOEbB8NBytMJelgOD81L3HEUxL1PdNEQ7TtWNih1V1mSzO6ZgUEoT2R9y5j4oEmERxJXELpLT20G8Zl1W0vsNFryI/EGjSKQUj5XZvKMjwpNrh7Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780582; c=relaxed/simple;
	bh=R/GAtnnL1XS+Bp1RPoUnHGQcgQ9M8JLE5OyvU/hxcs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwIKaHWJXu4Apw4P0f2Upzc+ROsn2NkClayKeCTU3GjE4dBr1OAKwEyagP6S44o1x2DrOKvfBpw+cNnmkG0KVIrpeiVay0TZpDQbJzypGlarDP2ZlzzNIzSrto5cFfyZOQ35Hi7GO/68ukkrqZsqo5NQs1C8jzDAqRc+JC9CrLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6Gz2qB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E026AC4CED6;
	Mon, 13 Jan 2025 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780581;
	bh=R/GAtnnL1XS+Bp1RPoUnHGQcgQ9M8JLE5OyvU/hxcs0=;
	h=From:To:Cc:Subject:Date:From;
	b=l6Gz2qB+mMi+raoaN0Oy485fjehBTWUv3RjsvnrD9rPQrhuA8OKjOie7pvwehdTtP
	 f3d1+91xhsqCVyLEwtC60P4XW42ClVmRSvKIxeXQrp1iSL4pXKYVA4UNcRjXpxQwOt
	 Y6avwa+dzAO1nC+1IhBtUk4r1K+l6hJmFxxRlYy5agSZqGnSBvtJQ4LlwbiAwFwX9f
	 PK2bx6fe9nR0OpRAXH3p63PGWQ0NNa8NXynI/aM942tSM6po6rUV51TggD0GQX8jhf
	 8Uy9mCdpvVQ/MLkbO/3jLz2DkXergI5Aoli2kHUJvrYttACFy3YcVyx+GYh/VzVkCM
	 /NbFVu0BlExZw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 00/17] genksyms: fix conflicts and syntax errors in parser
Date: Tue, 14 Jan 2025 00:00:38 +0900
Message-ID: <20250113150253.3097820-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series fixes several long-standing issues in genksyms.

 - The parser contains grammatical ambiguities, including both
   reduce/reduce and shift/reduce conflicts.

 - There are several hidden syntax errors
   When a syntax error occurs, the type becomes UNKNOWN, and
   precise CRC calculation becomes impossible.



Masahiro Yamada (17):
  genksyms: rename m_abstract_declarator to abstract_declarator
  genksyms: rename cvar_qualifier to type_qualifier
  genksyms: reduce type_qualifier directly to decl_specifier
  genksyms: fix 6 shift/reduce conflicts and 5 reduce/reduce conflicts
  genksyms: fix last 3 shift/reduce conflicts
  genksyms: remove Makefile hack
  genksyms: restrict direct-abstract-declarator to take one
    parameter-type-list
  genksyms: restrict direct-declarator to take one parameter-type-list
  genksyms: record attributes consistently for init-declarator
  genksyms: decouple ATTRIBUTE_PHRASE from type-qualifier
  genksyms: fix syntax error for attribute before abstract_declarator
  genksyms: fix syntax error for attribute before nested_declarator
  genksyms: fix syntax error for attribute after abstact_declarator
  genksyms: fix syntax error for attribute after 'struct'
  genksyms: fix syntax error for attribute after 'union'
  genksyms: fix syntax error for builtin (u)int*x*_t types
  genksyms: fix syntax error for attribute before init-declarator

 scripts/genksyms/Makefile   |  18 -----
 scripts/genksyms/genksyms.h |   3 +
 scripts/genksyms/lex.l      |  17 +++-
 scripts/genksyms/parse.y    | 150 ++++++++++++++++++++----------------
 4 files changed, 101 insertions(+), 87 deletions(-)

-- 
2.43.0


