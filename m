Return-Path: <linux-kbuild+bounces-7196-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA07ABEEEB
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 11:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C6A01896489
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69704231852;
	Wed, 21 May 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayiixZE5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4932356DE;
	Wed, 21 May 2025 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818143; cv=none; b=NZnBb35ItxWDmWqbfst3KjfurGIubET1K0AU1eHOotl6x6cjmUeIRUuqehKkmivfxCbAUN9C0+LvOufNu4EjHLxEspSW/ZxOBZXRch1pgbiDDi8KgarKY4CX9RTIJCuakvF1SO56RRZMoIGCT9gvHJoWByFeTqfVxwvORMr9bmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818143; c=relaxed/simple;
	bh=1F+XLvKJN8mGHglQB9+YpWwhAiCnby4yAK6uXiE4F54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USDrPRxAcIo70bty9fs5le7/b2x4iRrKFXHzjGQoGP62UxzepY8QqGtrxozzD5TXwCGKmqap7Gj84+8XwC03t80/Jkn4+Q8g5zbg95JFhq27qpgePHZa4WpLozE7zmxJDpGB46WgcLKXp0ERtStF8WrdyLOXkbWmFV4qqZgsuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayiixZE5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9554C4CEEF;
	Wed, 21 May 2025 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818142;
	bh=1F+XLvKJN8mGHglQB9+YpWwhAiCnby4yAK6uXiE4F54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ayiixZE5PjtMegiMEfcN/b+gD+9JXxiPApEbPBI10p8y5YNhm8E+cbeHh0Q1Q/Xx9
	 GHDoq43xiuCMOPRTcH19fuDas5cqwPPqzezfr30bVtkHaAFLZLIBkFmf6rdt57ka4m
	 P4DLaUNIMg2qVGoTXhcfbK1FvaXvvwX/Er+NZFC1EhpJaUnFBwcBSTwRW7vvpQJ8v7
	 QUkYNURhI6DEssc9zzwS4Ou2YqT2Yvo9w8Dmh0GzOAnGyxX4CB0wP48VjS0CGmlgqx
	 /08ALbHYE77Vp6qknNH371+e044qMZ+bMsipmpy5aYcxrfI6K340DTLl5Dt7WtOhZR
	 NHWR0OpN6U9Ug==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHfLA-00000006L9i-3ki0;
	Wed, 21 May 2025 11:02:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Masahiro Yamada" <mchehab+huawei@kernel.org>,
	"Nathan Chancellor" <mchehab+huawei@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] scripts: kernel-doc: prevent a KeyError when checking output
Date: Wed, 21 May 2025 11:02:15 +0200
Message-ID: <4efa177f2157a7ec009cc197dfc2d87e6f32b165.1747817887.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747817887.git.mchehab+huawei@kernel.org>
References: <cover.1747817887.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

If a file sent to KernelFiles.msg() method doesn't exist, instead
of producing a KeyError, output an error message.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-doc/cover.1747719873.git.mchehab+huawei@kernel.org/T/#ma43ae9d8d0995b535cf5099e5381dace0410de04
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Akira Yokosawa <akiyks@gmail.com>
---
 scripts/lib/kdoc/kdoc_files.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 630aa5ca6460..9be4a64df71d 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -271,6 +271,10 @@ class KernelFiles():
                                       no_doc_sections)
 
             msg = ""
+            if fname not in self.results:
+                self.config.log.warning("No kernel-doc for file %s", fname)
+                continue
+
             for name, arg in self.results[fname]:
                 m = self.out_msg(fname, name, arg)
 
-- 
2.49.0


