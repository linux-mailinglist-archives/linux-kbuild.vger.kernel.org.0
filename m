Return-Path: <linux-kbuild+bounces-1461-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A526898AE9
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Apr 2024 17:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994F51C21320
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Apr 2024 15:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEB0129E66;
	Thu,  4 Apr 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcjbtZ+T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AD612D75A;
	Thu,  4 Apr 2024 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712243839; cv=none; b=kdvnH6ciEiQQ+ujkNx/UAanuhNMTGUrleCdzH5/qD52Svt84fd1/dC1zW2VLzppk5FrGNpx3HbYJSQX4Xtf0PCSEJHmg9lo7SVUgwMG+ys4Gg+Vvl1jtTWxGndnXoCcCN5lQs55UaUYV9loaCspXuqjRuUi3NTIcAKrfSgVpWwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712243839; c=relaxed/simple;
	bh=ra+W5lQfPkd8zP92QWXnwHL7MhuJZh7uU6466dDEa8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BuZnIYddI0+bk8JtcDciUksneAk+QiKvczHZHyTrOlkTbh0oP2o6VvhKUa3H3yoiK+qfLFhTJ0PQodm1gehzQtlyWjqz5sE2ETzTcOd+n1OnpEj42gIFcoISapnyhjRkHpAcuJc/Ju7x2PEGN2rEHZy7Hj6hiCaum2xS2jcMqBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcjbtZ+T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D063AC433F1;
	Thu,  4 Apr 2024 15:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712243838;
	bh=ra+W5lQfPkd8zP92QWXnwHL7MhuJZh7uU6466dDEa8E=;
	h=From:To:Cc:Subject:Date:From;
	b=YcjbtZ+T5iGrFx7Xa4Xz0zBIl2J8VEBXxUlbBijbcgeZ+xikscezuqtuxaW3xul4z
	 L5ZPZO8c18dWuOpdmVKN7jW4bVoCFmGaNDwFWSMn3qS0GG75BLkdT/bvwSoaoaF4XZ
	 jF3qV6UpeVR09F/UfL8EaPP+4F0AeRVLHI2XsRtEnawVi1uQLKg1LPHW55PtyDS1VO
	 yv9wnvGXUeyIW05vn2mGgplqabr+Go7vyEz9ekcDBkFgbHrAl8hHRy1qdBhnVkcP39
	 GSEO3EBE9BlA2UoXue/0EwNjdKpO+fDaEls1Co1LzCWRn6przLQD0kwKulZX06e3QI
	 xnNZBcnSt11/Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH 0/4] Enable more warnings by default
Date: Thu,  4 Apr 2024 17:16:53 +0200
Message-Id: <20240404151713.3493098-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

I think these can now get merged into linux-next. I reordered
these slightly from my previous submission to skip the
-Wcast-function-type-strict warnings but instead include the
-Wformat-truncation enablement, based on what got merged so
far.

We are still missing the "kallsyms: rework symbol lookup return codes"
and "firmware: dmi-id: add a release callback function" patches, but
I expect them to get merged through the respective trees soon.

There is still an open question about the order of patches in the
coming merge window: if some of the other patches are also queued
for 6.10 rather than 6.9, this series has to come after those to
avoid regressions. Maybe they can go into some kind of 'kbuild/late'
branch that gets merged in the second half of the merge window?

     Arnd

Link: https://lore.kernel.org/lkml/20240326223825.4084412-1-arnd@kernel.org/ 
Link: https://lore.kernel.org/lkml/20240326144741.3094687-1-arnd@kernel.org/

Arnd Bergmann (4):
  kbuild: turn on -Wextra by default
  kbuild: remove redundant extra warning flags
  kbuild: turn on -Wrestrict by default
  kbuild: enable -Wformat-truncation on clang

 scripts/Makefile.extrawarn | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

-- 
2.39.2


