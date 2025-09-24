Return-Path: <linux-kbuild+bounces-8947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E26AEB99E30
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 14:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E45138044D
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 12:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBF430214B;
	Wed, 24 Sep 2025 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF1b1osd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1817A301028;
	Wed, 24 Sep 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717642; cv=none; b=FamZuoKTQM0IucMnhIHEhSZv9f4jR4oF7uNUXES7lamq0SIrufJQu88EgQ9bwV8Wv0uyb7ZkbxfzYf8iCvAX9n1TNyQwsoaYFSmWXfDXZ3T3KKmbt/YamBAgvptl+k1kP3zA30NEbjGca408DuGg7uD7AZSnOMRgbKLSwPgIUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717642; c=relaxed/simple;
	bh=o2I34H38DvlXWFr+9zB77lMahqj/GxSAXo8mhBl2Brg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olxYvsK5WFLnB4u3CAesRZaTaou4oBkOOmm2M/a9DZlbMDG7njV3IM39xrEymv+DTvSQ/992PHFqHguf26L+1v65LOk3ob+ZhXKDUmjSaFEctr8hYE0oHsRze6jlb49X9/JHTrGJV18XZ+PPIEvm/a36ImJ83RJK4OK2uqE6GoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BF1b1osd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D39C4CEF0;
	Wed, 24 Sep 2025 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717641;
	bh=o2I34H38DvlXWFr+9zB77lMahqj/GxSAXo8mhBl2Brg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BF1b1osdRPiUsqBwRxEO3KoBEeqAXV1JFbexgu+zSSNDjiyGXPJfinjpCznTyOQnI
	 ZReCszz0QEw/2S4QMxWXmt3Vptqlxnk8OfC8q/BjA0scLQIsFQjsW8LRb5DaQoRxs8
	 G7Q8nk4VWiyVrLRAr7M/t+fI690yYltLUAP8sIzyLI+eAcOZU0L6IbVmy2UMlJ2J2B
	 /hSZedkijxiLHF21qBhdcdlMwbBnFzd1WpcOVSXYBNWlzu//a+DPIlbgwTFtkQSUqh
	 U59H9IwYk1er12rWivtamgJR8YOT8o8wiw747ZJEkZfaW7XHbJKHVyzRcSg/Pd9r8M
	 0HpQzjBdBco8A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 24 Sep 2025 14:39:30 +0200
Subject: [PATCH v18 7/7] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-module-params-v3-v18-7-bf512c35d910@kernel.org>
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
In-Reply-To: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
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
 h=from:subject:message-id; bh=o2I34H38DvlXWFr+9zB77lMahqj/GxSAXo8mhBl2Brg=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBo0+amMWJlaXP5TF9ysmuYwFRe5s53TWYoH3I7u
 uHaZmEgIHeJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaNPmpgAKCRDhuBo+eShj
 d7aQD/4wntLmxvwiX4j9H+THDkxEQ1KMFImB5iRHF3hDU+NfeGcAptgSSc2PzJ1IYrL2EnIPId6
 mDOsZRXd+0Avw+WJ8ZCVfpsv4KndrJOyl5CBFGrHNOurC46Tk8MKxhqsEbgerEBzgfcSGjCvwW2
 p8+lPmPFZlPBjopUsZPcKD7Pa0/QmPNJP3ib34T5UK364WzXHW2oqjWc21TlxVmAE1LrxZauhzn
 Bv2E0kZ8XqBzUOux4iu49rX16/VhKbwAhyCVB6jNIbnW2Mij3OFljERkBi7sJcZc8HvCebL5qpJ
 +saOgp3rIsxUfD1dSNZIZSY0Rowfo0H5qZpElk6Jqlt9fSpgLzSShM/F11FuNLsIEVuxLqeP8Uq
 aIMZcA7qIAkxKA0ZRGU3b5r6sfMUukn74Jcnjh+q177OjPP0Dq8TpuQHrJ+NojDD7D/WC93zxjF
 pCvWFahA8v+7k9b58vTfSmVkVZSoDPIYLq+tq6+u7KMSh0sgZqsmUb+GPq+az0e43jijjPT84zl
 /8LFJJ9VZ/UBt2hHUb8GQujcx+c2oxlrkc/2diSdRuKpbVhck89x34m/yOUU9gf8+ONVMNUjCjy
 HOdkoYh3l6nReiF86Tct7OGx5n9swLM5ZRiHIwT3pUhuJsP4ViPNT0cXQjw7xaBfGdYXUKzB0Nr
 kAkQmsY9Hei6iTA==
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
index d69021b88aef0..55e3bf16ea0a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17136,6 +17136,8 @@ F:	include/linux/module*.h
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



