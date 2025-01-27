Return-Path: <linux-kbuild+bounces-5557-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770CA1DC86
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 20:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0192B7A491E
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 19:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8638A192D83;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck9Gf7/o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555C815B10D;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005035; cv=none; b=rZr0SrmOBua7wUTRvQL3cPncuPDZIpd1iDuqAcaIx6K/zgHdp0NZM9a9uxtt15p7t3HS+rrsogt9N5J+BPcusF3iCbUEDhWg8Ikkyxh2TdjbAuREKBG8MGvLc7HXg8SrFz+p4RmoFP+U8oQemBKbfnhqS9xxuJqRP2eHWSm/vQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005035; c=relaxed/simple;
	bh=AqSUk5sUf3jbxdrXZ2fTfevBbBjNAnQmRaLdwuch76A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BndIfg8VTrPJaogLtGMFoHLaEqmkn3nemm1DnJ8m1gBKj+ZNfa9TF3xG4WKIvFCl1yvr5M/ZWYhccA+jAOdgTy7/WME6V+Ir28bJQZhI1UKlYiBMOvmlMEgsDvQVsMBHteMZiBkeSlImgoBsm31cbu/4VAL6WLlSDa1ZXykglaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck9Gf7/o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0CEC4CEE4;
	Mon, 27 Jan 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005034;
	bh=AqSUk5sUf3jbxdrXZ2fTfevBbBjNAnQmRaLdwuch76A=;
	h=From:To:Cc:Subject:Date:From;
	b=Ck9Gf7/oi5DRU/2YkxwuvmIX09dDv6wKbPqBH8keKHZzt6pJ10wdcpIvZmIRkaSRX
	 VO7/yevJ/KsXa+g5F7AZIh18HnaZyHDuV1/TbtaFmbrWlhkaQ2M9Fy/fUVYCDeFQIC
	 AP7g8rcY257yg2SUd+IH+S5Jl3Z0Mp34blhyWb7EN/QriBj4J+w9RuNByAMaHWJqVL
	 GP7s8LUeliJR51DytYr8dn5D18Je9A+X5I2SwL1HHkspen+ZbRpFf6OYGsK4fwyBMl
	 Jj5zRd9gBNBrjEEJ026xwbBwc4qUv/lZm50gCHRAVkH4Ky5suHhG2BYm1P8x/OQwTp
	 0Ve5Aq/YfZNhg==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/3] kbuild: Use -fzero-init-padding-bits=all
Date: Mon, 27 Jan 2025 11:10:25 -0800
Message-Id: <20250127190636.it.745-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=kees@kernel.org; h=from:subject:message-id; bh=AqSUk5sUf3jbxdrXZ2fTfevBbBjNAnQmRaLdwuch76A=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnTbynFbW2tyQ4OVJK3V34v6xt/cSX/pmnfVrVMMkpab ZCcZ7m3o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCLmvQz/dKddT929/8UNj1uv w8+oPu7xrvjyQLy/7FU7h9n8H75erowMmz4ryP30+vnyArtdzRmhd7Mfvo6p0ujmymoX+l85efJ dbgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This fixes the union initialization regression introduced by GCC 15,
and improves explicit padding initialization for structs.

I can take this via the hardening tree if that's easiest.

-Kees

 v2: Add updated stackinit KUnit tests, improve change log, add Reviewed-By
 v1: https://lore.kernel.org/lkml/20250121003646.work.168-kees@kernel.org/

Kees Cook (3):
  stackinit: Add old-style zero-init syntax to struct tests
  stackinit: Add union initialization to selftests
  kbuild: Use -fzero-init-padding-bits=all

 lib/stackinit_kunit.c      | 106 +++++++++++++++++++++++++++++++++++++
 scripts/Makefile.extrawarn |   3 ++
 2 files changed, 109 insertions(+)

-- 
2.34.1


