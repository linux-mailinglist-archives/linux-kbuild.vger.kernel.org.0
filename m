Return-Path: <linux-kbuild+bounces-4234-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19C39AB5E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 20:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E90CB23834
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 18:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D261CB314;
	Tue, 22 Oct 2024 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXHeViGC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC841CB30E;
	Tue, 22 Oct 2024 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729621038; cv=none; b=nQSwYlGzs50nY2MuItIEj/lX3yhcqM3LLbXVuq26NOpSdDp05e8Belj/4+LgNO6/3qe+bFJA0C0vrXAhkGp3PRHXH3Txgvp42VH0pfhxX5hlsv9xBmKfSu0xJZZZTbGGH00W1Fo+S071U6lMx0ALeqtTj892G17R1CgtegnU17M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729621038; c=relaxed/simple;
	bh=69MTF+FDcDqGCmtUQUj1fxrLiwjJ7KwdB47gZ9JlPJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHkDZoUckvlj4ZHzGVfWLGcctz+M0yly6b0bDgTHMeiO6webw7aAZbUK81NbAOc7c9+xHJIf8hqyXERed7zjZXjjVzmp9qiqfOeZSU+atEyzIfVBrIFl+7Vy90l0Lo0unDi5SlEc+1oz66BXJ/RaZR1Na0PI/YqJQD7rqPSixo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXHeViGC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C0CC4CEC3;
	Tue, 22 Oct 2024 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729621036;
	bh=69MTF+FDcDqGCmtUQUj1fxrLiwjJ7KwdB47gZ9JlPJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mXHeViGCbfEl+dX3CLXe5RyitzGYKYERLNlTNfcYZUrh95yo8+KIACen6vMagiDU6
	 7TlX1XK43WZMl+m2D35pCM13wAzGF6PmtnH4uUi5o0XKPaDYci1n49Ow9vK2m7AkKD
	 Vh+lJ6gc88Z4IsNY6ROyXugjI8gCyPb0of6FkFcgEPZ+AuGCYQznFZ5ehq+hrCaVaK
	 ZPH14wo54eLmL2Cl2lwsUU4UYsnpvi6FlxuvRnOHi+6y01K7GR6ECAtGuZ+8CGguvZ
	 wChG5OeFxOxj+/yj8LH/7OJGy/jDpe0xK0Oyy75h68NJt18x8NKzBhTVRL+//Cfw9M
	 e+UBRnaAh2HXw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <benh@debian.org>,
	Ron Economos <re@w6rz.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: deb-pkg: add pkg.linux-upstream.nokerneldbg build profile
Date: Wed, 23 Oct 2024 03:16:59 +0900
Message-ID: <20241022181703.1710116-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022181703.1710116-1-masahiroy@kernel.org>
References: <20241022181703.1710116-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Debian kernel supports the pkg.linux.nokerneldbg build profile.

The debug package tends to be huge, and you may not want to build it
even when CONFIG_DEBUG_INFO is enabled. This commit introduces a
similar profile for the upstream kernel.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 93eb50356ddb..fc3b7fa709fc 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -245,6 +245,7 @@ cat <<EOF >> debian/control
 Package: linux-image-$version-dbg
 Section: debug
 Architecture: $debarch
+Build-Profiles: <!pkg.${sourcename}.nokerneldbg>
 Description: Linux kernel debugging symbols for $version
  This package will come in handy if you need to debug the kernel. It provides
  all the necessary debug symbols for the kernel and its modules.
-- 
2.43.0


