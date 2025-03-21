Return-Path: <linux-kbuild+bounces-6277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D853A6B6DC
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 10:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31A04482B98
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 09:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967121F190E;
	Fri, 21 Mar 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnEmDsG4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654481EB5F4;
	Fri, 21 Mar 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742548722; cv=none; b=gwOFu1LySYh7TCxsHr0GCQkw6tKNh3yno7XF77ScFSyv5YCA05fnI9hm2u0Ga473qNilPg/3hP3De6ZIER8/LJKlLUd2Mu+9SRiLJU8dTCdSpNXzEtcOrKMUKg/CqypJOmTQHzRV8INqN/mgF+ldx19c9RN4wCHqDgtSuZIItcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742548722; c=relaxed/simple;
	bh=wc7GsbS3qt1jWIEplofQPOfdWK8wEAPOvoSH0Kax8jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpLZwP10FlNr2WqkU2in17AU+0VQH5ldYoadjQpjrH9IQe1qd5qHcoII8A+8ZBbamxGbMu5ynrIU/tPMX61UeJ5QrTd/xhNj+oyV9t6kt7lu8peohyLdWmpiqOf3IQnn++Cnev/hRSLpRE8HRfjCIPfoRwlINiOUVkI3fYhko5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnEmDsG4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACC9C4CEE8;
	Fri, 21 Mar 2025 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742548721;
	bh=wc7GsbS3qt1jWIEplofQPOfdWK8wEAPOvoSH0Kax8jM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bnEmDsG4A9yeTbbp4PRxZLSiccJvCgkZieX7EoSOmgtR5oqeQlgXrfuK1O6pYKxTJ
	 YDcZwRA3nJNWun844kqDyfVy6Yhs/x5/OfduWOFBmrXOcmLMokSGzFlf6hE0ZY8QKf
	 1fIcWCYoEetJZ/zh/FXxozGWHNsq6gnixLv0vGc5hPfNv2UN7wQGM6cG5rw6Vlwri+
	 okr8BX2LuKh2TCu2qWo7+zTvafgtJcGQrT0m83+gVaXSAhOXqbtk+wpbsPQ2Tta/Gk
	 xMhb0WifVDDfAS6LjqVLGvy5hVM5I9s+w9etYsNF/5x9DSYYYlR/weO6FxuOmzXotD
	 UaUV0xRep9EuQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 21 Mar 2025 10:17:36 +0100
Subject: [PATCH v9 3/3] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-module-params-v3-v9-3-28b905f2e345@kernel.org>
References: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
In-Reply-To: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=775; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=wc7GsbS3qt1jWIEplofQPOfdWK8wEAPOvoSH0Kax8jM=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBn3S7FszSHexMdVAg4ncDmcBnpX0wowDdFhJXAd
 11UhFvoJA+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ90uxQAKCRDhuBo+eShj
 d6QKEAC41SM5t9JXRgTwU5y42PWjmXeCeVBNkFWVY4sx2mP+2M0k1fmYVjXzT5E1hoLS7M8s69A
 cOkXUj4J7TNr1jqPNAUK1sMUUT4enBU3lNYzoH9BgTBm3yg5buhFFHquCMufd02UI4ZakI+pQeU
 2kaWGTTyx8ibT6Kq45Tc7cm1bS888qYMmXlzwKMSnWouKFG1G//2Ql8HGvMz3xVHfmPvaL8zed2
 rK8HZRwZBzDBAksy+GdBFS6G9fkXylDcyVPrM+8Y01Nj75wKyCjHaPdSdEZp5yaKobMbuE2/3v4
 3hxzmZm2waSG+iLHvhgfBTZA+2pQCX4Dv9UJlAS5EDcauX3F2+S62y9T7af9ZTbr5bpMMslDxBR
 c4/1PZuu2/kaoBQ9YiAs+yh5NYaarPFL9LQFirrOj0Hi1w4rFoE+Y9Ceu8XDTNjACO4TP7WVZgO
 1CGO54Xkw0X1o9ZRX+ygVe9N0ipdOK7Q8p3LBhPAYEaP/YXCrMGfG3YwXyVsbZ8Rn9Pzkeu6Zl+
 T42kv2B7KRDeGBSUrctcQoh2BgH6kpxF8DBzHFwz+4jmx1FjsNpeNI6nHx4XyDIRUMsTj3V676U
 TUb1QGU/W2ODotR/IBr4lCt/SJSWc5VlpnsuICXhnAjuP4Xx7wC0EAealVWEg/TjigwWmay6ib2
 HH8IQ6wRa2EXYWQ==
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
index cbf84690c495..94f5d9e8e7ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16007,6 +16007,8 @@ F:	include/linux/kmod.h
 F:	include/linux/module*.h
 F:	kernel/module/
 F:	lib/test_kmod.c
+F:	rust/kernel/module_param.rs
+F:	rust/macros/module.rs
 F:	scripts/module*
 F:	tools/testing/selftests/kmod/
 

-- 
2.47.0



