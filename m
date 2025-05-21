Return-Path: <linux-kbuild+bounces-7192-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B1ABEC94
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8027B7A4D0D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 06:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514082343C9;
	Wed, 21 May 2025 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X26GFF/S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24054233D64;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810786; cv=none; b=YGQAQJJ/VHMlXFLQNGcDvNWn35MDTQx41zujQEDHGS0Zh4ikhwKkO3oZzF+yXJCLOg80JT1ohlAKv7ZG0pMSLaM7SSVQ3HW3/ACYGHSbdaNdAjnKbDiEfnFfMiCLRKR8nU1wj7OTEHN1gfJN9ImRoo8G6m18AdtzES1WVqkgTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810786; c=relaxed/simple;
	bh=zrs4cXgnOa//B/Txk8KhjILwuaI02i9DB4tFgWygRDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUdGuaAROhaxt2m1WDvkN+9mkiLoHtp1n/SM8X/aO0QR3NEvUzFne7EwBvOlM6/O6RABuwTuuF7B67D+mXWrgp1YrAeaJSUVaQYTlevdNenecVUy51mxnbSjxxRNbOboXLzUvoeKiHaRNNYiHjNuQUuYPJCqycim3qEboNkymrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X26GFF/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9840BC4CEEB;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810785;
	bh=zrs4cXgnOa//B/Txk8KhjILwuaI02i9DB4tFgWygRDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X26GFF/SWaINIpDsWh3rDNXnbBSz2OXs5ORJKKrIKZ2pELxcpHw2W2jzNRwRYsanS
	 9Zh6XSJAX3seUSVzUxmLP1IeG8CrsPwdmh5Dj6oPuqUr8oSMbUdZYOQXsprAYTKhJB
	 mVQpNSrl94TcgfixJoteslTH9kyfcnAPWvgxUzCYGm96WCNag8sm6jiGIQcPJ4lk8/
	 Og4R8SL+EHOXR+GsBdFZYPzaiNeRTYAaGuG9yxZALGH3JnB4/KAAOWhnnIUF9M9omc
	 6VN+qPxgtujCWziRtyPz6WiLBNBmWlasMWiu9qUGYaEGx0o2NIrNdEjcGw64DB59tw
	 5Rx8BQ54ADwyA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHdQV-00000006IG6-3DTs;
	Wed, 21 May 2025 08:59:43 +0200
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
Subject: [PATCH v2 3/3] scripts: kernel-doc: prevent a KeyError when checking output
Date: Wed, 21 May 2025 08:59:33 +0200
Message-ID: <a99113db21c53fa5115b197310390aafd38773fa.1747810691.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747810691.git.mchehab+huawei@kernel.org>
References: <cover.1747810691.git.mchehab+huawei@kernel.org>
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


