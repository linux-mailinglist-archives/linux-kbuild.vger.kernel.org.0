Return-Path: <linux-kbuild+bounces-7170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C174EABD977
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 15:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A80A43BECA4
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 13:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E4A2417E4;
	Tue, 20 May 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7zU8NdS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEB322D7B8;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748003; cv=none; b=MTPVTDQVt/TyDdd6fIGiLj/LSSV6DihLH8OcW6iq7Q7iJgq9HwCIkkr8cAM4IrxsrQBmuyxpN38s8IRzTng9nbtg89Z6ocWIY+lKGeAP0BOmQK8yz/5AMU7/YbXnzOxxuw1Mpy8yRL5UA+/28jSkp6zS3MqYJkraCnQWeEpjuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748003; c=relaxed/simple;
	bh=zrs4cXgnOa//B/Txk8KhjILwuaI02i9DB4tFgWygRDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMNMQVwC1IYsWE3egEt4oUtCt6KTqXYGkZUkZtyWfXyRCjhJEJ9EpVavG1phwGpi6/7DTmyc9wqLMicI/uZpWsqtd76t0jWYcbnJYt4z+UwVToghm/2MaOiWjOftPZDdA9hA2Iq/l0h+6EofbHu3+AfMjjhQHcdeEsvz25lNQ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7zU8NdS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB29C4CEEA;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747748002;
	bh=zrs4cXgnOa//B/Txk8KhjILwuaI02i9DB4tFgWygRDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S7zU8NdSHh7bpbvbSe1rLW6x0DMBphFO1+oYUOSiWeTy7oP13/x++uOh1rP1oPFX4
	 ue6lrG9ZFFVG6Mm1EbYqkl2YJPuE18oX9r/VSb1nOefneTjoXgHB5H3ext+CPbye/1
	 szPay7N0A+NXbrVnwITw9dGDbUVuhomVQrHHHLWVMmfv3YjKHP2PRRAx8rNa7tUC2s
	 66dr3H2c6ecOaupLFFADUki4NM8XNArLIU3MzN3FYb/ttg7zq0Lk5Ud5J7Zrq7qgEU
	 SBTJav/CvhqSrjBLZ8R/EVXhVFk0THHp3T1A9QnD8HaLT16qHFgG/CDTfQUqPAd5a1
	 4WaPVG/GkDuCQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHN5r-00000006n8O-1Qvx;
	Tue, 20 May 2025 15:33:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] scripts: kernel-doc: prevent a KeyError when checking output
Date: Tue, 20 May 2025 15:33:07 +0200
Message-ID: <d97e86c7176f671405b4c15d75cb951349022a23.1747747695.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747747695.git.mchehab+huawei@kernel.org>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

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


