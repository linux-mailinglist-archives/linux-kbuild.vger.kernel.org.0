Return-Path: <linux-kbuild+bounces-6865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF71AA716E
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88F4A178772
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 12:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7DE25485D;
	Fri,  2 May 2025 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LStqMa/W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDE22578C;
	Fri,  2 May 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188233; cv=none; b=Te90V98rbuX+u1PgcasPTakJGIkPW+C8jngN6erbQ9SMnyhqKRz+rsGumDgxj4OQGxgz+Hjya8WlctD7v/KDQBWAOP3Fcm84NjxC8CS4R1v+dyWyWquisV3zMgnDihKB1FxlApTbRFTCoJZdjdRqMvLb+bfyaQSHXBaunDLiRJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188233; c=relaxed/simple;
	bh=S9xpT5II4HEFQ7Pcgab/h1zpYjOY04rscXr6GialsmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s855Gi9cnema7Hy79RFqba4CN8siXIC//lMfKRGvg8mV5eLr1rHekv524/W90GkyYXPFOazhiMAwNa0mXDm2vmXXMlNP0PgmOqHYcLE4/9qySCDxhAYrrjGhz9dcFEMZ3RU92s9ElLddTcJF66fILiMCpQhNOoYFlq2JWgjPb0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LStqMa/W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9014C4CEEB;
	Fri,  2 May 2025 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746188232;
	bh=S9xpT5II4HEFQ7Pcgab/h1zpYjOY04rscXr6GialsmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LStqMa/WYkh6aJf8xqoodVQuaVIahuRzUjH1snYJow4JnsAerOQVanfiGAMyCxw5w
	 GAPQ1tcimsvCkc7fAwS8aDmebL/bmmNJQvOPfSDlqm8qRXgO1eXoCW7REn498wiHWw
	 /NGcGihmCaGlZP6MdFVLzDp6h2r8IYMfoPai/jpP3avsXyLYRDmxGpQweigm1jzdjI
	 QMiTz1lsjFETuEziaqNY3DyQr+YqPf/TL02DJbJTGNfDG+xtv7WHTqBsj2h0+cHdch
	 tADg+WXRxb9JsAYAIxQ+hgDkYz31tHVSQ3T5KH4/k+k56XXLQCif6j0zQxsLWvhwfL
	 JgJAogJUlT4lg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 02 May 2025 14:16:36 +0200
Subject: [PATCH v11 3/3] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-module-params-v3-v11-3-6096875a2b78@kernel.org>
References: <20250502-module-params-v3-v11-0-6096875a2b78@kernel.org>
In-Reply-To: <20250502-module-params-v3-v11-0-6096875a2b78@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=806; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=S9xpT5II4HEFQ7Pcgab/h1zpYjOY04rscXr6GialsmY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoFLeqZKr071PEBKGjcF4JLDSdvvNNBoHbLblBP
 TLUPdGfK0+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBS3qgAKCRDhuBo+eShj
 dzpJEACl7UzV4T7qDQY2jDE3VOWm102mRinW7oCVXlX9+nR19RSoO0gL1hTfFeSEbkEwjRXm31N
 v6jTjVzJU0G6jYWONKpwWQVylbW0sZYWSEBJr20VOQ/iIXNaSBcaE8GmOyNWxUAQxueULf/bAqz
 Q6boIofC2kWuYrF/SUDGfd86PC17Tkb6iI40GVHYrhobj5E1fldhXSeP7lOtxFvKLrXoN4+GtaL
 reaptZZ4EcCkcyv54BnHDs5LqPVgdAbAdGa9G1IsU9CBYdul5oSFKMMKGsHjjZjmZHGpYnNUKxH
 QskE07s0QlSKtCMr0VQCy46sgAWOS+VmuOexwpYcLrAKXEJGOEk3DU4I4ux4XP5Mhc0ZEyvvtW0
 +de9/d1Q33EG4IrW2WV0l4puU7y5rcfOY4kAvfHorq5/G8BEaUp1eN4Fot5vy+rlAYekHS0CWEo
 kPKQfl7zkU6q2VMMNVnEhQo51dKztxQ+ATAz4KNCwSHNkyCgZAa7N7jtRLlEc7v8ZFzw5bXfhKc
 6gUVUIrc4aU+dtB6efbzwOKO3nbQvtyjTHxdqcBUkx8QClDU7aZHQKLfKQxxNGeSM7KZtkZb81u
 kXCK4o6ynFc+wNCoz4nELLoFsGsalqnJcichXg5BuN00lPszFWqoFp3yylppE9cOIosstv5UaUK
 n5vZddtEdiBmYlA==
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
index 3cbf9ac0d83f..d283874843a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16395,6 +16395,8 @@ F:	include/linux/module*.h
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



