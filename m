Return-Path: <linux-kbuild+bounces-7837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD3AF58AA
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64CEC441BD2
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53F11FFC5E;
	Wed,  2 Jul 2025 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbF3K1F0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DC2798FE;
	Wed,  2 Jul 2025 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462381; cv=none; b=bDtk7Dhbsj3FxdLyQt7qbV54iN4vOMeYr7N8B911ymEzTc6BGmJn8y9ehbqJdiKOLohLlae+SJb8oVX0TYl0RpWLObdyY1YtXxFSXYpjPubo2YoPCqje02/nXWNCJ0MCZpBUCmVIWkEU4PNcUtJL4sSpQB9nAcfE6HlXQrGOzZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462381; c=relaxed/simple;
	bh=QKv1eaNx8HXCqOejDO0r39rwgHrEEYHNlSfukU0dcXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6/5I6FosoIwysUVb4ot375HK7ly6TKW6yZq7Qq3JBWPaRrEZjAB2F7pbWPXzk4FnzjJFZ0ZROxMw4JXIKp1wjyvnVxBvkLqq7LTBYRqT5HDsiWu8rY1JjHVNR1R9r6Gxx/G8XB7poLT2PIAYL0kEBxvQKsaSCakKYPowtNeALw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbF3K1F0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B025C4CEF1;
	Wed,  2 Jul 2025 13:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462381;
	bh=QKv1eaNx8HXCqOejDO0r39rwgHrEEYHNlSfukU0dcXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FbF3K1F0xoMCvW2mCumeLkEI7lUkTga14EsFKlxYJXhpm/ctiwGe4N74gIPu3vIHx
	 x6Ku4BYZEphGAar9XBVMNrE7Xs368n2HDMiUu4l2y/A6rTMK+aM8F+BFir5mMAOkpa
	 WkuOh68i8M5i5+XMLuuERMgu5QBgEEeto/QfW6aFEWtwGj0sw9Gj62VDTCR6SvgHYK
	 bCKPDj/FBNnB69N6OKwfdxbkH/bvAbiXuLAIND56oONr0ABCaUNXcV+yaFmRZzVBp4
	 VVTNYbE1UY20D2io2LkOgeMeLmdQFpLn/qCMxr7mLnrIARczPBIrF4/I7gPB5KC4RL
	 Eu6mf0qH8KZoA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 02 Jul 2025 15:18:39 +0200
Subject: [PATCH v14 7/7] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-module-params-v3-v14-7-5b1cc32311af@kernel.org>
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
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
 h=from:subject:message-id; bh=QKv1eaNx8HXCqOejDO0r39rwgHrEEYHNlSfukU0dcXk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoZTG4L057HjJ5TR9cS+a56ULFDPMPW9mzocfjJ
 Aei5uwPLiqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGUxuAAKCRDhuBo+eShj
 d5j2D/9sF/xwBInFVeLxWuLHtYlx4FfdgeB9B20QNmNCqnu9ZEGGRCv4E7ETYVzdCSYIgAAwQ1f
 EvT/iH9cmn5m+G9mcAQojIE8ZqrlcisATzKw4D1LKbDJ8TmV5FyWva2Lvo11kn+8lObcVcEmt7a
 WBAsGmE1VAiKskFe5Wt7zk+kNGKh7FjZcWvX1L9EvvrBF7u1P61BwxrJkAAhwDTq8F8H5DxghtI
 MMkAVLHZP+pNDsCKTrVI7FlRGHsnPoOldn0521AI3bawMC4y/0OtzSr958u8+fGBByAlDPqKHtG
 rJnMINI3VvgwyOKHhYEyhKQTirCNkNZZ6WaRl7gpqIWfddTq5u1fT4sft18Q/mDyfz6zu6P+phk
 dC6T8CU48RNwUsUDcD1aiKV4SUGbF5aewaAFqdCFLjt0woMIhMiSK8yGL0l+bOXPainnXn2Lt0R
 6ll3QNuxZZYeZgqHeFPK5YR1fIpjxiEzl7E1QCKqgUmwjiVYeeXgc+6G9yO1BMohZeN4uJbd7lO
 VsRCejzqVqoZPwVNx5ayx5+ARamTXjt8QGLBEY3GqlwHBxVIT7iyaA+9QJNwUf07JhIMGkvYcBU
 Xqgk9TJqp1y4mL4/BkvTrFKnjfz3uFwBUxsUfmUc7U/hdk8UPy5+kUi9ZXvMZ2UFG4R57+j6xTk
 6BXyhbtu0NRRgJA==
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
index fe0cf0a2e6e5..aa5618350723 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16796,6 +16796,8 @@ F:	include/linux/module*.h
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



