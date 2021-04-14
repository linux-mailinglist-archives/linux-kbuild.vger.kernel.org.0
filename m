Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D4735FAEC
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353028AbhDNSqx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:46:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:49072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353021AbhDNSqt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:46:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0846F61153;
        Wed, 14 Apr 2021 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618425987;
        bh=tIW9/GtTYEr3rMqQ5PvPIFl8/iExEIaumsIoas5zmX4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PoNrqlzwz9Ra54wscIVxKxX0ProvI6EOrNWeIHFtqBB7kSGF6XofnEdnVMH3NalVp
         qsfxzvXGCJxTrSGUv09oa3LSgMYdyLPirYHv0QvNUTUVEyqHOFR08hJFysyJsfzHLe
         26wKZXYKxSCYpgb8XWpEXvkLsDN0yjzXDDtWAKawMFWJXgPfP98s6q8AzzgzKBIsJ1
         yTaGR05/kNtLBlYhGPCjqNmEZLlQS/CtXZtC637dBSQBrDiS8WkGA3kb1EDNwLHXCL
         StXFViddTaTOuO+a7Uw4zJkcycMiGSj3LuEpA/fj8TPj0YgVqBtUrjuM2siBrG36pP
         xpiZTp8U9LH5w==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 01/13] kallsyms: Support "big" kernel symbols (2-byte lengths)
Date:   Wed, 14 Apr 2021 20:45:52 +0200
Message-Id: <20210414184604.23473-2-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Rust symbols can become quite long due to namespacing introduced
by modules, types, traits, generics, etc.

Increasing to 255 is not enough in some cases, and therefore
we need to introduce 2-byte lengths to the symbol table. We call
these "big" symbols.

In order to avoid increasing all lengths to 2 bytes (since most
of them only require 1 byte, including many Rust ones), we use
length zero to mark "big" symbols in the table.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 kernel/kallsyms.c  |  7 +++++++
 scripts/kallsyms.c | 31 ++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 8043a90aa50e..faba546e9a58 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -73,6 +73,13 @@ static unsigned int kallsyms_expand_symbol(unsigned int off,
 	 */
 	off += len + 1;
 
+	/* If zero, it is a "big" symbol, so a two byte length follows. */
+	if (len == 0) {
+		len = (data[0] << 8) | data[1];
+		data += 2;
+		off += len + 2;
+	}
+
 	/*
 	 * For every byte on the compressed symbol data, copy the table
 	 * entry for that byte.
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 54ad86d13784..bcdabee13aab 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -470,12 +470,37 @@ static void write_src(void)
 		if ((i & 0xFF) == 0)
 			markers[i >> 8] = off;
 
-		printf("\t.byte 0x%02x", table[i]->len);
+		/*
+		 * There cannot be any symbol of length zero -- we use that
+		 * to mark a "big" symbol (and it doesn't make sense anyway).
+		 */
+		if (table[i]->len == 0) {
+			fprintf(stderr, "kallsyms failure: "
+				"unexpected zero symbol length\n");
+			exit(EXIT_FAILURE);
+		}
+
+		/* Only lengths that fit in up to two bytes are supported. */
+		if (table[i]->len > 0xFFFF) {
+			fprintf(stderr, "kallsyms failure: "
+				"unexpected huge symbol length\n");
+			exit(EXIT_FAILURE);
+		}
+
+		if (table[i]->len <= 0xFF) {
+			/* Most symbols use a single byte for the length. */
+			printf("\t.byte 0x%02x", table[i]->len);
+			off += table[i]->len + 1;
+		} else {
+			/* "Big" symbols use a zero and then two bytes. */
+			printf("\t.byte 0x00, 0x%02x, 0x%02x",
+				(table[i]->len >> 8) & 0xFF,
+				table[i]->len & 0xFF);
+			off += table[i]->len + 3;
+		}
 		for (k = 0; k < table[i]->len; k++)
 			printf(", 0x%02x", table[i]->sym[k]);
 		printf("\n");
-
-		off += table[i]->len + 1;
 	}
 	printf("\n");
 
-- 
2.17.1

