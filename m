Return-Path: <linux-kbuild+bounces-5264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF79FDB93
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 16:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30203A12EC
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 15:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6201974FE;
	Sat, 28 Dec 2024 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsQvrCoU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465A195962;
	Sat, 28 Dec 2024 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735400814; cv=none; b=nJv90RN1GohNAcTL3IpDlGg0FUMMqqpF7EzWbTlvCmK632cxTJvaosXDMjCvDuWVs5RWB8KBNVxclQ7Hr77zQOKPPiwGOoj3PcRWI9hmxsrxOixsQkKKk2UyVXS47fF8x5MAe0aKl5jrKWQZjmqxFS6mDNbQqKQZWuPRQ7iJQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735400814; c=relaxed/simple;
	bh=3/ThW0PZI+QC5zOOBvYG4A1b5k0MlKgGioClzGM4WIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4Ga6dSmI8/Z1ysE4yCCtUcEtq/dSdxKHTzqIo3d9sftLHUTwZglm3N0MRnt0ovM9eAF6at9ARk8YJd/4eizK9mUZAu3CPg1gvZ1LUHj13iF4Xib5Sfs12607L6K6gvxeQJclb9tlbOQUsFw+vbZH+Dfv+be7SD/zMp2iFF7WVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsQvrCoU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7A3C4CED2;
	Sat, 28 Dec 2024 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735400813;
	bh=3/ThW0PZI+QC5zOOBvYG4A1b5k0MlKgGioClzGM4WIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OsQvrCoUj8eAmq/ErlW24vddPT3CZwXkQdEDKB1zEHiG/Htd6Dizpy0AN6GViZwi2
	 9ejagpHoGNq7pmLfIaNvnrjYGVwnkBHJLs03bFNIOEa0MtRCs2URjSeiVAC37/E46u
	 ki9ZXqGiC/0PINX8cILUyqM93+yLemDZyN81dxgzdOnzG+vIkd1kBQSXNgOJ3Wj1Ce
	 x/P6+qkw3oZTkHlG2oODiNgKgihhodp/AnyRhcOZOWiBP4k6v0sLnmyCfvNR0+gpET
	 xY4aRBY7x22oC62mo5G1ZxapmBnEOqxQb2WSHgsz0u1EU6Mih+ud0jn/xrTk5M9b//
	 JgGVOa7MxpEoQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-modules@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/2] modpost: zero-pad CRC values in modversion_info array
Date: Sun, 29 Dec 2024 00:45:29 +0900
Message-ID: <20241228154603.2234284-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228154603.2234284-1-masahiroy@kernel.org>
References: <20241228154603.2234284-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I do not think the '#' flag is useful here because adding the explicit
'0x' is clearer. Add the '0' flag to zero-pad the CRC values.

This change gives better alignment in the generated *.mod.c files.
There is no impact to the compiled modules.

[Before]

  $ grep -A5 modversion_info fs/efivarfs/efivarfs.mod.c
  static const struct modversion_info ____versions[]
  __used __section("__versions") = {
          { 0x907d14d, "blocking_notifier_chain_register" },
          { 0x53d3b64, "simple_inode_init_ts" },
          { 0x65487097, "__x86_indirect_thunk_rax" },
          { 0x122c3a7e, "_printk" },

[After]

  $ grep -A5 modversion_info fs/efivarfs/efivarfs.mod.c
  static const struct modversion_info ____versions[]
  __used __section("__versions") = {
          { 0x0907d14d, "blocking_notifier_chain_register" },
          { 0x053d3b64, "simple_inode_init_ts" },
          { 0x65487097, "__x86_indirect_thunk_rax" },
          { 0x122c3a7e, "_printk" },

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 94ee49207a45..0d7b0bc8796b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1832,7 +1832,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 			      s->name, mod->name);
 			break;
 		}
-		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
+		buf_printf(b, "\t{ 0x%08x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
-- 
2.43.0


