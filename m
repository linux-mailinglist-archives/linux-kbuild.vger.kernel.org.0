Return-Path: <linux-kbuild+bounces-6128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48AA5FA96
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 17:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA023B6576
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 15:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC375269836;
	Thu, 13 Mar 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="r8pu4q5Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C0C2690D7;
	Thu, 13 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881568; cv=none; b=CWPvyFu6AfEmqhHX82IegZelK1xH9LLavy9d4G1cEjmg9gjlYhyq/Cr8PJuVw5hvwgGhT+kKLxsk+p28JGWgfUB1d/27l4djeZYC8zSDxlKvpbPqqzLKQuaD5MOb1Q/9AFYUZi4zOm4nFnqaPuC/WLP6naizlmOVqaVgQxcW8IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881568; c=relaxed/simple;
	bh=sbRqhsPxaiG33AW85HcsugVEGACPfRyX8+4Fqim02yU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OtGWfsW2pOeoyhdKm9wMi1xyQ6PQe1XRMfc0kcbd6wcBJbzQ6z2XuEwV6aQ+T/RelD0UkHNlgBI6817cYRuW6j0BXzMV8dLDkCvIgTPCQDmYerMwkhmIVdODcWqMN6YjiLypveD7xo9OcoNYXFMg/KBdwUS1a8NTRUvPC228AqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=r8pu4q5Z; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741881564;
	bh=sbRqhsPxaiG33AW85HcsugVEGACPfRyX8+4Fqim02yU=;
	h=From:Subject:Date:To:Cc:From;
	b=r8pu4q5Zm2Y4/bkM87JQgqofERmhLJ/NamSeicjQ5DiCPut3GQ/zuh2uwlY2oHFP4
	 g8zxi8drEXQWOfmVhjqbVAB9kHy2kf53B0Jk9jaaZy1n/QfhRWk0biRDCFU6xsOro4
	 EBN88bBhyFmd3ukzDhyQ/vZ3bBdMqSg8qU0lpqQ4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] kbuild: make all file references relative to source
 root
Date: Thu, 13 Mar 2025 16:59:08 +0100
Message-Id: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMwA02cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mj3eyk0sycFN2CotS0zArd3MQCXdPEVHOzZCMDy1TzRCWgPogU2Mz
 o2NpaAH3psEVjAAAA
X-Change-ID: 20250312-kbuild-prefix-map-5ae76c209e7a
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741881563; l=1108;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sbRqhsPxaiG33AW85HcsugVEGACPfRyX8+4Fqim02yU=;
 b=iYWeAFjtReijQ1rxt9I32WydmRSix+2keTGIILRqt3eIxYZqj2eCRLhIReYGPxcowtaY8ely6
 KJHLWeYfLNdBsuctZ4nBNgiDSXkCbbOvPh0hZ2A/gLMDW7zt2MiV5E7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

-fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
Other references, for example in debug information, is not affected.
This makes handling of file references in the compiler output harder to
use and creates problems for reproducible builds.

Switch to -ffile-prefix map which affects all references.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      kbuild: make all file references relative to source root
      kbuild: doc: reproducible-builds: drop section "Absolute filenames"
      x86/boot: Switch to -ffile-prefix-map
      x86/boot/compressed: Switch to -ffile-prefix-map

 Documentation/kbuild/reproducible-builds.rst | 16 ----------------
 Makefile                                     |  2 +-
 arch/x86/boot/Makefile                       |  2 +-
 arch/x86/boot/compressed/Makefile            |  2 +-
 4 files changed, 3 insertions(+), 19 deletions(-)
---
base-commit: bc5431693696b3f928b0b7acf8d7a120127db7a4
change-id: 20250312-kbuild-prefix-map-5ae76c209e7a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


