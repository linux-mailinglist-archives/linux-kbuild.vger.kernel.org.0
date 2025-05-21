Return-Path: <linux-kbuild+bounces-7187-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0FAABEC7A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DD6F1894479
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 06:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85032233D98;
	Wed, 21 May 2025 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1LXptdj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D3233722;
	Wed, 21 May 2025 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810268; cv=none; b=ea2s3FPPkCWfcwC1nRe73BfgkU5VFRET+l3EBSmdidb2ozK1lNTk3haqNiPvplloCIDH7M8MxnKAnXZAGN3Keljudc1OJPVhomJSZZmE2hgF7Q7VqgnAOi6H+eLsEHLixZikqzPWyqSBk4oX8xAJqe/odzgzVygUhTnoR54pLQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810268; c=relaxed/simple;
	bh=fEgVgn8ddmuG94XtJzRW64JNMVcuU+HToQCr20S4KM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBuKjyQHM6wcs03BzPtWlT5hMcXkSQ/nI9zvH3Zy4btEGOklxwhMNBS5BrEweeJhwIH+8fLQivGCo9yNgGNsHL+BDw6gRWyFXGwjZXjoE+uKc0xphAEt/8zM5VlbqO83Ly2f6WXpK8J9Y+ATLKamByQpUAi44W1+YCBTprkpcWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1LXptdj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01B7C4CEF2;
	Wed, 21 May 2025 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810268;
	bh=fEgVgn8ddmuG94XtJzRW64JNMVcuU+HToQCr20S4KM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C1LXptdjj6O3doeZnkOI0NgfUWljdiWlLWkkzuAonzzNKlPBQWzvQL1l+DWjZtdUB
	 7A7Pw6zfviazzlCZZW81NKhrrWjQ50KkKt3Ko0uRC1yXdWTb/+gmTIe+HTYkP4HITw
	 jCELb0jD9ZVWHsbdwIccRLk51/M2uW78ZUu/FSzgEb/ZguLlHndlhu6p21yf25goUm
	 4+4Kua59fqc0JIZqPImBIXyJgyJfEb4zgpRiC1Ww7BkdXkvpRATT3BxdrLGg+gq2qk
	 tQshlaxfEgXNHs95GKtrU2f/mc7/cvHvLjzFL0BV2fYAQ/5oWA8gAtjafeWa38OFTA
	 003x47MQbA4kw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHdI9-00000006HuG-3lPV;
	Wed, 21 May 2025 08:51:05 +0200
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
Subject: [PATCH v2 1/1] MAINTAINERS: update linux-doc entry to cover new Python scripts
Date: Wed, 21 May 2025 08:50:26 +0200
Message-ID: <2103a8b16ae1af39c0f767445a4072cf034c379b.1747809627.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747809627.git.mchehab+huawei@kernel.org>
References: <cover.1747809627.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Changes to ABI and kernel-doc need to be c/c linux-doc. Update
the maintainer's entry to cover those files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..a668808769b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7173,7 +7173,10 @@ T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
 F:	scripts/check-variable-fonts.sh
 F:	scripts/documentation-file-ref-check
-F:	scripts/kernel-doc
+F:	scripts/get_abi.py
+F:	scripts/kernel-doc*
+F	scripts/lib/abi/*
+F	scripts/lib/kdoc/*
 F:	scripts/sphinx-pre-install
 X:	Documentation/ABI/
 X:	Documentation/admin-guide/media/
-- 
2.49.0


