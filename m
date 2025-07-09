Return-Path: <linux-kbuild+bounces-7953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C8AFF034
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 19:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B0CE175FF3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 17:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49E02367B0;
	Wed,  9 Jul 2025 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehp0Ao9g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B789F2356CB;
	Wed,  9 Jul 2025 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752083598; cv=none; b=AUzrLCCBRLeiis9JHvJWsjlS8TQQqiO45YggHSMtyM5W2ASJJDgS92eSJuq1NBERrlF+jmkg1gM8jBI5ydruKgLU5CeaRFiLEyY3Mbf+bVl2qW4UL90O9hsQD5JLMjcBrWsR+ndcw6sMhT37YA12SwXSeQbO62mvswXACFCMV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752083598; c=relaxed/simple;
	bh=rC87q+cE6l79VfDDaP1rreH6c58LNoR3ApaI6m+XCGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BieRlwuRZdKVkUDVQhLc+fcwoi8/n8XnnWaXfpSloV7ab3vtQf/TGrt/aJsg64eCjWJLU5ENNgSeluCTpVbcxIqMo6gF8aqkBAItRSq/6eksIa4UC9N4FgmY1epxQur0F8vYtj6rjCsajY2hRK3tiYauUAGnlyeMXOjqM7wikW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehp0Ao9g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD13C4CEF8;
	Wed,  9 Jul 2025 17:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752083597;
	bh=rC87q+cE6l79VfDDaP1rreH6c58LNoR3ApaI6m+XCGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ehp0Ao9gieyI+p6wXWhfYxKe3IuEX+eLG/ledHEVePjgN6Wwk8oksJXz7aJGqOR1+
	 MDr3h1bB8C9vYaULTMrUXGZrXy8FesVOLrvYpaSlSB3QDmTSqmsifjmqvRYR06UzKa
	 3Gh+V+/CS/IrBoVJfvOl8zeD+nJEhOdaXnMYDwODh+enxixGmukJKmMtEilpkoS8ig
	 s1ElEqPO1PPE68xnCty7DigF4CXOGSy2m89AFRB5ic1MWKEWV3EhV0oC2MQ0Iwowyv
	 QejJZQxfCKbyr13rmncyvOtJaEMJ8EtKvXlarT1AXbY1kD63HHrYVTaUgucD0M9GqA
	 StuiMg6cVo6fg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 09 Jul 2025 19:52:21 +0200
Subject: [PATCH v16 7/7] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-module-params-v3-v16-7-4f926bcccb50@kernel.org>
References: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
In-Reply-To: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=rC87q+cE6l79VfDDaP1rreH6c58LNoR3ApaI6m+XCGI=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBobqxescsuQG7XGmqvzjOrq6qdItJE/OpG3PjV5
 lCv3GctpzCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaG6sXgAKCRDhuBo+eShj
 dznEEADFwbo5Hvcp7KUzr2hE1ebnvnKnreDa6tt++6zehg4ZxwnraAWS3jYLIa2LgUtw1N0DSBR
 PgGmWSvIL3zL0ZzUZT5cer8MZBU607zdR4HReZbemhzfHtJBNkOH3aaFsrNW28kYSu6+0bYtXkV
 hmWkxNiM76TDakUwPU7jAlnnOUiT7gpH3rNu5YwnfjRhl2n+ftrpJzNeGqZNqhXfeJlK6LHg6NK
 5PQlLLGQjLaStAG2/UYB1vqlkn7VzO9iHe2RIlZnADwwouT45TdKAVSB0HSL2SfqQi+tD661A60
 bB7Jo5ksUBm6SMxGGtrukrAgMg7Ll7JghwomLBfiTHEsXxBG1dUOjJbJeYpTpsDAcxX+6zeFism
 8M+0JDbOy7147HcSwiFWY2Hi+aGg5UMwWM4+ne8iR7z+9ZlAXbq/q+Gp5CY0wJeJ1MwQGNaSZmq
 2t9zEIEG55k4Cou8bz3Fa5IqH7/WeY3XPnNJoRDJRGuZ+PebITdaXrqpDLbet1oARoTWl0VKiev
 t8HH7RMBUKGZ6ka31GEV+yRLiCMOe+0zCiAqgfvsiQlp/1BYqYQ8oTTDOWgKvtfphX/oU8VyZuj
 SpvRuQh0Y5S05PpxkCtYeDYTTb0wIFa7qMhpxpA2jDR76aEcnSQFpddj6s9ZS6Q9X2aIfqRl8Hy
 7O4SZTScX68ZJCQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The module subsystem people agreed to maintain rust support for modules
[1]. Thus, add entries for relevant files to modules entry in MAINTAINERS.

Link: https://lore.kernel.org/all/0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com/ [1]

Acked-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d431320ed3b2a..afa385ecc5c4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16835,6 +16835,8 @@ F:	include/linux/module*.h
 F:	kernel/module/
 F:	lib/test_kmod.c
 F:	lib/tests/module/
+F:	rust/kernel/module_param.rs
+F:	rust/macros/module.rs
 F:	scripts/module*
 F:	tools/testing/selftests/kmod/
 F:	tools/testing/selftests/module/

-- 
2.47.2



