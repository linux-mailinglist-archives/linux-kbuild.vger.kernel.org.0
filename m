Return-Path: <linux-kbuild+bounces-3590-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07F97B132
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA0472838C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56852185956;
	Tue, 17 Sep 2024 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToA62I3D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE618594F;
	Tue, 17 Sep 2024 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582658; cv=none; b=nKmTvDAn7sSrCBvtV1+BuSqGG6rbTP/SDM7t6RxDxG4i9j+hgbZqlvQWCAF9OZuIU0QknzI7dQsDEIxBjismJVa18mqzzN9YtGHyFCvDh6E8NWZHT2WQTF9chro7REJ34m/NaooTl4KHgzDIPyaQCANqWqlrtiiPIldL49fPCDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582658; c=relaxed/simple;
	bh=mEQ0ucDdLUQliMtanUxk44g5JWErCiGrOMyYhL1jU8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amXN8rxx+6+nJVy+M5GTDnPSaFvMP342KQnVZyLkvpTtnWO6Y3/h7hG/JsvKkWB07KOL0UP+vSYonH7rQNtedq2IL7bDkRVo6XcRUO303T0VQar7e9Xy8IuXR7r6FCns9X2vkHvsMMadkWG/ssJm9jk6FVDn6HmF4x3tTmLz0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToA62I3D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11942C4CECD;
	Tue, 17 Sep 2024 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582657;
	bh=mEQ0ucDdLUQliMtanUxk44g5JWErCiGrOMyYhL1jU8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ToA62I3DlVO5DsXeJCBgIqatkpRCPrEwx6J1aXJONw2xm9MUakM5NkaltIugwb7lc
	 +KakMreO0NvbKPS0KLviMBXvUzL/j+Eh3r6O6ExQPdz5wkyNYotS73jNpm0LsQZz7I
	 Kh2mKbev4qC4PefI7yP3yO1ulWguqONEdA3FruhDY9Ysoo/YZHZT9aixi8y6wHS/s9
	 ORphFAFmWYbK8P++ahlH2Er9J8GxSUIpaxtpHVZif+lcs08ypQhtl7GrXWbFu701uH
	 rF3XWxTruIdrberKoFTa2Ivl5b9wjEoBA2D3GjobqUOZS3uV90pAAZHgGaUvnxuW3R
	 yJlp/gb80RNAA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/23] kbuild: doc: remove outdated description of the limitation on -I usage
Date: Tue, 17 Sep 2024 23:16:31 +0900
Message-ID: <20240917141725.466514-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kbuild used to manipulate header search paths, enforcing the odd
limitation of "no space after -I".

Commit cdd750bfb1f7 ("kbuild: remove 'addtree' and 'flags' magic for
header search paths") stopped doing that. This limitation no longer
exists. Instead, you need to accurately specify the header search path.
(In this case, $(src)/include)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 268ebbd2ab74..7eceb9a65e9c 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -328,13 +328,9 @@ according to the following rule:
 		--> filename: Kbuild
 		obj-m := 8123.o
 
-		ccflags-y := -Iinclude
+		ccflags-y := -I $(src)/include
 		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
 
-	Note that in the assignment there is no space between -I and
-	the path. This is a limitation of kbuild: there must be no
-	space present.
-
 4.3 Several Subdirectories
 --------------------------
 
-- 
2.43.0


