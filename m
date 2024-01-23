Return-Path: <linux-kbuild+bounces-635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1C839CA9
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jan 2024 00:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F265F1F2645F
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 23:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122C153E2B;
	Tue, 23 Jan 2024 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaNthWnX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36514120C;
	Tue, 23 Jan 2024 23:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706050809; cv=none; b=QWoxtgYm8vA3rq9n7V0DNMcJC3Ccjk5c1xVrEVhbbiDX6Z+GZePyPrHHDr/ADbHiKqGhBk1X24KfXQaQ5RTLIvBfRWV1R9oitTxhijv+yMdwpx+A7BOGbh//Tj0UKRR+WvESjxZGJAbwAeiQbOjEuysannOAMqNl8RZVSsghr0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706050809; c=relaxed/simple;
	bh=67FZIBdOOMCQ00N5ExH/7I5y2V442bu28UsHFtb9aa8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hEPS1nMgvsdkkPC9+1b0jLtCig7Eoyi0UDmRf9/nNKxg4pEdpUMd3DgEvHkFXhp6+LTqgVgMPcPj+DZ5ETh90L8tUExk+NpkheD1/86lwWV7vx+BPQ62HCfPgmnXwuAe8ROsJGLhXcLB1lMXyAKTeVyuZwXBRcbBUO/gjR9IwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaNthWnX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938A2C433F1;
	Tue, 23 Jan 2024 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706050808;
	bh=67FZIBdOOMCQ00N5ExH/7I5y2V442bu28UsHFtb9aa8=;
	h=From:Subject:Date:To:Cc:From;
	b=JaNthWnXcGwKpArT4gZBJLpz0LIWEXmCpSDD0+/8ZuNXyS2CWAwvKCmYXJq+DYD4U
	 LnS7oKY33pmSxtlKQoD/rgTNf/egd/gKNvmrpb+Z66FnOzMbrjifw6SKak4nuUgHIK
	 XeVstqf0j6Twv0YiV5mFl4qmC2qH+65woTdelyT8MRxzyKz556XrVBJ85kQnFCY5UW
	 fV/y/mU4sbDiC0wyBzP3zlFa0TIMOv509gqAmj4oiSlyrj/8RXiqKhcM7SZQAxXFTv
	 DXityBgBNutwWEv804J54v8W6jsnhgTJvGQmX/ReSmeF2qhjopSEsZZ3VkhWnkDm9o
	 Y6WWicXzEF+8Q==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] Fix UML build with clang-18 and newer
Date: Tue, 23 Jan 2024 15:59:53 -0700
Message-Id: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOlEsGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ0ML3bTMCt3S3Bzd5BygrC5QINXYzDTJwNTAONHIUgmoraAoFagGbGR
 0bG0tAKpI5MxiAAAA
To: richard@nod.at, anton.ivanov@cambridgegreys.com, 
 johannes@sipsolutions.net, masahiroy@kernel.org
Cc: nathan@kernel.org, nicolas@fjasle.eu, ndesaulniers@google.com, 
 morbo@google.com, justinstitt@google.com, linux-um@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=nathan@kernel.org;
 h=from:subject:message-id; bh=67FZIBdOOMCQ00N5ExH/7I5y2V442bu28UsHFtb9aa8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKkbXL4LvJZlsGizYPisv8E0OzhMcnZHkoH7u5p9BR9rO
 BLff/nfUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACai/JmRYab++ijpXc8kine8
 mrJv8+RIo90Zk+8s836w1e9xjcgR/kMMfwXuGnXtO7tSPqfhUY306w0zZ+X5Pjzf+H7GlX1+Ud7
 c3UwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

This series resolves two independent but related issues that were
recently exposed by two LLVM changes.

https://github.com/llvm/llvm-project/commit/ec92d74a0ef89b9dd46aee6ec8aca6bfd3c66a54
exposes that '-no-pie' is not getting added to the linker flags with
clang, resulting in building objects with '-fno-PIE' that are linked
with '-pie', to which the linker rightfully errors with:

  /usr/sbin/ld: init/main.o: relocation R_X86_64_32 against symbol `saved_command_line' can not be used when making a PIE object; recompile with -fPIE
  /usr/sbin/ld: failed to set dynamic section sizes: bad value

https://github.com/llvm/llvm-project/commit/4bf8a688956a759b7b6b8d94f42d25c13c7af130
adds '.ltext' (and '.ltext.*' with '-ffunction-sections') when using
'-mcmodel=large' (which UML does), which causes a segmentation fault
with modpost.

I have tested these patches with all supported versions of clang,
noticing no regressions.

---
Nathan Chancellor (2):
      um: Fix adding '-no-pie' for clang
      modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS

 arch/um/Makefile      | 4 +++-
 scripts/mod/modpost.c | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20240118-fix-uml-clang-18-e365b0503a29

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


