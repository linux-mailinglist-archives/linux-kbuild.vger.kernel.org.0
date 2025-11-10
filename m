Return-Path: <linux-kbuild+bounces-9510-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD7C46D65
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 135503AA918
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FD130E0C5;
	Mon, 10 Nov 2025 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzmGqwdC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6ED2F7AD5;
	Mon, 10 Nov 2025 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780763; cv=none; b=bSotvs+7p1N6W84NEe8AlDpZi36CrVoKKR4e2RKTaqomdzuMAs2FfHk7Sp19LVal7jpDpqvghZw0GWO3nk5o6vSkwiQgwNMaG66x7OzNWGDdPjbs88+sG25RTJK+ezNBpIqwkX+fzPHupKTdXjMGqYhc4hlpVe1X/tlAwmtrFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780763; c=relaxed/simple;
	bh=VSiEIjLyYUKVvnPQ7kJVmq9DuKTsVrvaCBPI+TVnr3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jppEh/l370pqgK5vc/6Sg33kCcbNeh9qqeGGnjTDH2CQEL2Cpke+jv+srKOE76ERejyFQ2rc8J62eV7xXdqfZSy+Skydhh9yIzoeq5lmRkheJDpQyrYYMGk9sxSpZZ0cmwOJ7qKMmoTv6yWjX7DTt2EIJpM0uxkKb3fMJENGDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzmGqwdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CA3C19425;
	Mon, 10 Nov 2025 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762780761;
	bh=VSiEIjLyYUKVvnPQ7kJVmq9DuKTsVrvaCBPI+TVnr3I=;
	h=From:To:Cc:Subject:Date:From;
	b=uzmGqwdCfwkqc+jcuzhbZOI0uWbRrBQ1My5OehR1oF3gkvHxk0vnY91eBDD4xJE/u
	 4rD2aVzaaR14Z+zw0892FiLUynditRfogNudq8VIc4pWw4phnNQFnzk4zDOe6nJjO9
	 /3FACDjFRhVmdtnXXkPts1sgGbi4gSoPgfRsjBGyzdNwDqKuJr31Nsqw1G6P9F3oRm
	 1SRj58ul0QpHoVdIY+o3k2m917FwfE1A6xIqzHRLznkiQVY7UOGeYJWkUHsQtLyqK1
	 tKHPyqrJsIISIXlBQV7AtF7HHzmUI9ceYhXtvtC+7DINHS+jO085DyoYpxYr98Mm0s
	 JINt6NRUhAxmQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	Haiyue Wang <haiyuewa@163.com>
Subject: [PATCH v2] gendwarfksyms: Skip files with no exports
Date: Mon, 10 Nov 2025 14:19:13 +0100
Message-ID: <20251110131913.1789896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sami Tolvanen <samitolvanen@google.com>

Starting with Rust 1.91.0 (released 2025-10-30), in upstream commit
ab91a63d403b ("Ignore intrinsic calls in cross-crate-inlining cost model")
[1][2], `bindings.o` stops containing DWARF debug information because the
`Default` implementations contained `write_bytes()` calls which are now
ignored in that cost model (note that `CLIPPY=1` does not reproduce it).

This means `gendwarfksyms` complains:

      RUSTC L rust/bindings.o
    error: gendwarfksyms: process_module: dwarf_get_units failed: no debugging information?

There are several alternatives that would work here: conditionally
skipping in the cases needed (but that is subtle and brittle), forcing
DWARF generation with e.g. a dummy `static` (ugly and we may need to
do it in several crates), skipping the call to the tool in the Kbuild
command when there are no exports (fine) or teaching the tool to do so
itself (simple and clean).

Thus do the last one: don't attempt to process files if we have no symbol
versions to calculate.

  [ I used the commit log of my patch linked below since it explained the
    root issue and expanded it a bit more to summarize the alternatives.

      - Miguel ]

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Reported-by: Haiyue Wang <haiyuewa@163.com>
Closes: https://lore.kernel.org/rust-for-linux/b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com/
Link: https://github.com/rust-lang/rust/commit/ab91a63d403b0105cacd72809cd292a72984ed99 [1]
Link: https://github.com/rust-lang/rust/pull/145910 [2]
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/gendwarfksyms/gendwarfksyms.c | 3 ++-
 scripts/gendwarfksyms/gendwarfksyms.h | 2 +-
 scripts/gendwarfksyms/symbols.c       | 4 +++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 08ae61eb327e..f5203d1640ee 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -138,7 +138,8 @@ int main(int argc, char **argv)
 		error("no input files?");
 	}

-	symbol_read_exports(stdin);
+	if (!symbol_read_exports(stdin))
+		return 0;

 	if (symtypes_file) {
 		symfile = fopen(symtypes_file, "w");
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index d9c06d2cb1df..32cec8f7695a 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -123,7 +123,7 @@ struct symbol {
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);

 bool is_symbol_ptr(const char *name);
-void symbol_read_exports(FILE *file);
+int symbol_read_exports(FILE *file);
 void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
 void symbol_set_ptr(struct symbol *sym, Dwarf_Die *ptr);
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 35ed594f0749..ecddcb5ffcdf 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -128,7 +128,7 @@ static bool is_exported(const char *name)
 	return for_each(name, NULL, NULL) > 0;
 }

-void symbol_read_exports(FILE *file)
+int symbol_read_exports(FILE *file)
 {
 	struct symbol *sym;
 	char *line = NULL;
@@ -159,6 +159,8 @@ void symbol_read_exports(FILE *file)

 	free(line);
 	debug("%d exported symbols", nsym);
+
+	return nsym;
 }

 static void get_symbol(struct symbol *sym, void *arg)

base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
--
2.51.2

