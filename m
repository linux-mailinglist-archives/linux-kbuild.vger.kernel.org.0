Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948973BAED3
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhGDUbP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:31:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:36558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229880AbhGDUbO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:31:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2AD9613F3;
        Sun,  4 Jul 2021 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430518;
        bh=GSKkzFV1KnCldT7AihGFOinVXAf3BT/60pJezRkXMr0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mxBLdJzX5x7nnGagn1EFXnW4GXK+ChMcVyMozxZk16DrWE/3XDdXASwfqqes7qSoe
         NUaf8FP4A1o6iUZVM91Qlx8CKlTOB+2nMdc8mkcXiP8eaEJnlZZ+T4NvcnutDD/mHp
         5rlhd3NeTkcVeM39DRcNjFrK9EjVXIXNd4ofi4dW0xcpJ1BvwPxdXMAs8oOuttCu4d
         s4YT2BnFXXI+HSFifmn97eQmmc1vp99DnBXeSsH/2NgR7gqEL6j/BylUfBzIB7SCcu
         X9OKntbaTg/BU4tutkuAyw3HzK/yii+GmMcI0i9Ogx7ud0EuiZUsBBe4O+C91buofU
         LEHcr15ywwVyQ==
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
Subject: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
Date:   Sun,  4 Jul 2021 22:27:40 +0200
Message-Id: <20210704202756.29107-2-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
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
index c851ca0ed35..9d0c23e1993 100644
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
index 54ad86d1378..bcdabee13aa 100644
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
2.32.0

