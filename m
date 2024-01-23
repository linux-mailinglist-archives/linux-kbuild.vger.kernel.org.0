Return-Path: <linux-kbuild+bounces-637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C56839CAD
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jan 2024 00:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BAED288864
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 23:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E524253E11;
	Tue, 23 Jan 2024 23:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hv9MKEwx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0F4120C;
	Tue, 23 Jan 2024 23:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706050810; cv=none; b=aFDWvWvBi6Gqq6TgLBfJjyfxXfPWBX25EETXTOmFjdpHbcofnh1tx0kctqhxfqC+XMAiW8z8l0T7/1+Lid5yn2qJESgKDURLLvB/fJOsNva3JBP8c+na3MK6Vfg/qjTmyV2ITt3mmV19xi+f4skI2vAla0j1QzG7M0RPSw9JQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706050810; c=relaxed/simple;
	bh=47d45/RRXMankzhMusTw5E76i3KancCT8EE4zAg0rGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/3zPteacWJ+wef+XNK0Svj8mHhYIgcVM4Tyb8tc/jjX9ChnP0GAR0mKpgoCvb0AzBSVfhf7QmOxNwPhWTIMPUVXwOtTN9Iv+Vb4ndym0jome70LohVVTPMMAVNZC+Kz3TZ6YyMv4o3RccZit17oMWPEzVyqz+9F+Q+wyZSF93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hv9MKEwx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73094C433F1;
	Tue, 23 Jan 2024 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706050810;
	bh=47d45/RRXMankzhMusTw5E76i3KancCT8EE4zAg0rGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hv9MKEwxpkkCCkQrEatypks4jWMZLmFrc201jDtKZrvVTqil/OWkpW2HYGAg3zXvM
	 gMNh2Ho5m6vOgxuB2hjiNRZSlChICJ0zQU+d3AZGJc81JMibhy1GnNDcbWlJQDAPw7
	 o6ZOXo5U19naO8rH8jduwiPgifsP58ZRT/8VH8KkisFvLzn+zBYz36FSYoKd82/Gif
	 YZApO56cPTyLi0bpM8E7S7ACjjrmJjkARStRRinS2CxJBMPuu31LK9cQgSxohWSrGG
	 fphJnxNbTS5rdh9Ro+VY9vZ9HKSCS2L05aL7blyt/JpHx+xhe0xAQbnCqU4Q4u9ZVU
	 PnTwLYkYnA+aw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 23 Jan 2024 15:59:55 -0700
Subject: [PATCH 2/2] modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-fix-uml-clang-18-v1-2-efc095519cf9@kernel.org>
References: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org>
In-Reply-To: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org>
To: richard@nod.at, anton.ivanov@cambridgegreys.com, 
 johannes@sipsolutions.net, masahiroy@kernel.org
Cc: nathan@kernel.org, nicolas@fjasle.eu, ndesaulniers@google.com, 
 morbo@google.com, justinstitt@google.com, linux-um@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960; i=nathan@kernel.org;
 h=from:subject:message-id; bh=47d45/RRXMankzhMusTw5E76i3KancCT8EE4zAg0rGc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKkbXL7/kHuhv2nVz94j05xb+rcxrfI8Zv1VJ19xf4Pr/
 U8+V473d5SyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJTHFi+MN/aGvHkwsyHuev
 GRlp3JWeIr425ekSxR37Dmhc2TIpKs+YkWFNu471So56bseXdW7f9zf9v/pHgmdq6q0FNqd+doa
 /f8UGAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After the linked LLVM change, building ARCH=um defconfig results in a
segmentation fault in modpost. Prior to commit a23e7584ecf3 ("modpost:
unify 'sym' and 'to' in default_mismatch_handler()"), there was a
warning:

  WARNING: modpost: vmlinux.o(__ex_table+0x88): Section mismatch in reference to the .ltext:(unknown)
  WARNING: modpost: The relocation at __ex_table+0x88 references
  section ".ltext" which is not in the list of
  authorized sections.  If you're adding a new section
  and/or if this reference is valid, add ".ltext" to the
  list of authorized sections to jump to on fault.
  This can be achieved by adding ".ltext" to
  OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.

The linked LLVM change moves global objects to the '.ltext' (and
'.ltext.*' with '-ffunction-sections') sections with '-mcmodel=large',
which ARCH=um uses. These sections should be handled just as '.text'
and '.text.*' are, so add them to TEXT_SECTIONS.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/1981
Link: https://github.com/llvm/llvm-project/commit/4bf8a688956a759b7b6b8d94f42d25c13c7af130
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/mod/modpost.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index cb6406f485a9..f7c4d3fe4381 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -807,7 +807,8 @@ static void check_section(const char *modname, struct elf_info *elf,
 
 #define DATA_SECTIONS ".data", ".data.rel"
 #define TEXT_SECTIONS ".text", ".text.*", ".sched.text", \
-		".kprobes.text", ".cpuidle.text", ".noinstr.text"
+		".kprobes.text", ".cpuidle.text", ".noinstr.text", \
+		".ltext", ".ltext.*"
 #define OTHER_TEXT_SECTIONS ".ref.text", ".head.text", ".spinlock.text", \
 		".fixup", ".entry.text", ".exception.text", \
 		".coldtext", ".softirqentry.text"

-- 
2.43.0


