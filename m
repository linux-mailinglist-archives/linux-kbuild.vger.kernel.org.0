Return-Path: <linux-kbuild+bounces-7475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF887AD7289
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4651C2443B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211D3255E27;
	Thu, 12 Jun 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zve+8Us0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E561429405;
	Thu, 12 Jun 2025 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735704; cv=none; b=jvk1GBWWlaS6D3cZuWC3NsWQ8ZLPolOns2Jy4FOHHGImIeVNgXUCgT9UalbrcG8wAKek/DDkjdaX649h0yS2gIifPzvZTc1xwL7CeIqgWSWiAwS0nBPYY0BnPnUp8R0wFyEvIsTT3di4SNOCWmgkSQ76Atqz3ZUqKXeqfKiBAC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735704; c=relaxed/simple;
	bh=PtuTc4hQCwkPkaeEcx5FuCImo6u7nfEiFFeDuVcRi+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scS38d9ACMRZD5/NQ1JJmStVPd4sm8Kt54oLAkinRX3Fiu+MIkq15f0F38BsZSCOadIreYCGT79GuRlVEiq6CjU5GOtV2AX014Lr2A9m6vfV4/4gJ595WXx1CBQdwO8Gl/P9kafLIX3kWCDbg/Tu0h383X7gLoLQRg7cHrKRZ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zve+8Us0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD919C4CEF3;
	Thu, 12 Jun 2025 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749735703;
	bh=PtuTc4hQCwkPkaeEcx5FuCImo6u7nfEiFFeDuVcRi+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zve+8Us0w5wjasu/XWomWd5hMM8F6wniPNtUHEY44FW0R+Y3sQrnFv625tpuFP41+
	 txzXWxSKvH5MV2P+7ZcCrZr8ex2+I2QEvzcNcSaERgNUNr6+8AbRIUu9G3ey4RnbLg
	 1kWUZM3GgTKHCg9AwhLMEpq8U0dHrIekbnr5dKLzCu48fXl/8iFLLSj5xOH2axaufb
	 i4jG1lnWrxab0PgafLygvevOmtv6cCwPVpgQy94lZ4iggQP8KTlGmL7d1CBwnNqAqW
	 ftbpYZqM49g0a8KAJOFsaaOf0KEteuzhNTePhDLzqUECmusLEM+5MDtB9nbpvlaqm1
	 iO5u+QlhvW9Mw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Jun 2025 15:40:07 +0200
Subject: [PATCH v13 6/6] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-module-params-v3-v13-6-bc219cd1a3f8@kernel.org>
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=PtuTc4hQCwkPkaeEcx5FuCImo6u7nfEiFFeDuVcRi+8=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoSti7f7BsTFkFbFOskmVS4/+QcJ4aUaQYBbQjc
 u8+JpR5o2mJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaErYuwAKCRDhuBo+eShj
 d2pNEACnbI0d469VxHqJtVI1ZNarSPJeilQVW6J6dQh5JvBNAIkcUK5AZEBQsV/OGQG9suT42g7
 +Q5LB5BgS8yKbKE2eDWN+zzdqyGzsno/unTxk+KOPXyw3wsnhv9N7WYIL0z0bRYsni2gyWem+1C
 2NiVyuU50OBTR/930EnWbhdU6aVJjJSfDT3/RAFWeJXU46RZnB8w+z7fAFyDVI7YfhWxbk/FfyF
 mydPez6cGLpS8G9VBJVfyx+XvLsCXzELL49z+pNOj46Ah80QTzBbA13CmRYgQOCmi1hDTO3n2W+
 lNg4nYZB40m/nqXI2cGpw+F3ECX38Y3z31NPlW8wvoXbafwSGxK2AF3VeeClEVD6f5u7BFZgjM9
 T9dvRlj/gymgVtlNYUHI3+bQ6a8xDprgsrJQweiZxlhfukuOV1/oOT2AuYivIar2TMaRwcfml2N
 V6paR5z9uuI8KU4vF6o1S9K6eal5FfPTloW/pskhaU6h92QFKHohse/H4LMDKWuemYw0qiF2stP
 vOftpBfMsQwTUolE1kaftrVY0cV72g/7hiGI0V/rbgw7p4SRQB16j2TPEko8WMLwgt9ukl+srfO
 deEtA9WYjFHYGRk+uPwTjKAMeghe7e+EI4wEOdBzEPGAya0g0czzJDRBnZT4en/YCd3qLDm1Spm
 cNZlXPvQdrnhYdQ==
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
index a92290fffa16..e3f43583c9c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16794,6 +16794,8 @@ F:	include/linux/module*.h
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



