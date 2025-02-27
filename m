Return-Path: <linux-kbuild+bounces-5925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23AFA481BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF43C3A806D
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DF5238142;
	Thu, 27 Feb 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S78kSn8R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A6C235C1E;
	Thu, 27 Feb 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667175; cv=none; b=rH9msMWJjeEJZPWrj4Jbhsg212A4QgKe2QY30IUBuCPUKtcGcSq759g829KM2Le4hc33doiDTrbiIUjIgUmulbwNmsIhC5EGZCvEhgby1KdPxbERra3OANNCkuRu80zSV0lvyFP3wnk9VBG3lSP9+rXBt1BaCKnDhCqZ5HQYH0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667175; c=relaxed/simple;
	bh=IR3xh6hJj0KU0ZzHcQJSsYTm8/JMrsZrW8buOuX8o4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOlQvmherdbC5vNleqBYj0I1La6oyJ1ncKOzRuNXKX7jfCynmSH8CfCnglcD2xhk69PEZeNDq99npfyV6I+FXxmDk6BXCc6W/0nB0UL6QtsteYkRw/ImKlX924fu2d9CBMN/RzBYyRgHoYFBxrmqqzpjQ4V5IRaue5C3kIP6p0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S78kSn8R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E7EC4CEF3;
	Thu, 27 Feb 2025 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667174;
	bh=IR3xh6hJj0KU0ZzHcQJSsYTm8/JMrsZrW8buOuX8o4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S78kSn8RSEvaqrzgCxHEUKNJuQprbCxU0D1KO6AtI8PEB57hssB6ocUznd7ZeYwdL
	 877tscl3lo1ArOU62F1ZqqxXlF+fZ6sote/uB/i9uxmTVqbevIhIBlTFsw4vxq36ir
	 /MFq0x5/nazaHY3O49cp2OBW6Bqpmk5vdL8WW9RPR4gONWkFAqAH0FwcVRgXn270hI
	 sUEGQwksfamoEPMGBvQzdTGn0Ql3Sr0zSeJvUmowUdzWt7U4xEl9oGXGNvw8crsmae
	 3qDeY92OLzOURCafvcRsUqgko/urh8cFN34PLLp5gXr7Jho9DbS5QEvMHBxWvJEB6t
	 f1BNATY3VJpZw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 27 Feb 2025 15:38:13 +0100
Subject: [PATCH v8 7/7] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-module-params-v3-v8-7-ceeee85d9347@kernel.org>
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=IR3xh6hJj0KU0ZzHcQJSsYTm8/JMrsZrW8buOuX8o4g=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjW7Rwp1CwiEEM6Ci+GDQQ8wAF3xBytnLCGk
 gTS4hA9cj2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B41gAKCRDhuBo+eShj
 d3pMD/4kJz/1hY96K6isBfT82GxFzWUlGYYvJ4RHtjW77HggFfQ5riqHEr7nOl0OF4C/eSsxxdq
 Q939WQMMvc80TkptTq7TKuQAUe2nmXpx3XGWiUnTak8ee79giIc1sTTqm0dVbrCO9q37wQt9LUv
 hXoGH4m6FBr7LzGKnHQkeb7grzEzILCeZf1Fn2qesJE26G7L6u4NawWp/WBPDXT/stmQMEFeDHx
 EJH9DdI7Sgctd82gorSFMqSzWoVbb+a3Tl/QtHbgg/3gGEr6HWpK975KInbwS/A/byXXnvTbp4r
 DXZKK0NgEqVdlOQFZwYd7cWhPOT5cMssmYICDrKvOEnPX1gCZHO7bQTMqoJvtmS6eegTOS7q7Rc
 /bY2Bg8yf3Zg/jjMVXGuBXPjm6+zYTITO79aznLM0xEk1hfUVc9G5coE/OWhiqDGWXFgUpDRHUM
 nAtak3WI5MKPSmULt61EG6ZRJHH3Se95qW3oXIDPSoiDVi2ifMl6hMXnyWSWkGwi80zd2GOqdhf
 awdWarZh827sg6qoCEQf8kLvMX12uUsUJOXZr2zQUoPQW+/WjPIY9ghA8dnXycuiQ/IaizkKFwL
 QFlkO9sdcI5wUvezjsK+e1paTbQwzzg06S5TY3FhhQDU6e6s56XWEyeF1TKhTxxs5DqzUNSRY6a
 TMsbiIMdxSXowiw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The module subsystem people agreed to maintain rust support for modules
[1]. Thus, add entries for relevant files to modules entry in MAINTAINERS.

Link: https://lore.kernel.org/all/0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com/ [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..ff65178f6e06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15991,6 +15991,8 @@ F:	include/linux/kmod.h
 F:	include/linux/module*.h
 F:	kernel/module/
 F:	lib/test_kmod.c
+F:	rust/kernel/module_param.rs
+F:	rust/macros/module.rs
 F:	scripts/module*
 F:	tools/testing/selftests/kmod/
 

-- 
2.47.0



