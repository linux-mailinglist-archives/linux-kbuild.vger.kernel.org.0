Return-Path: <linux-kbuild+bounces-9406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07111C34901
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 09:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10E0F4F80D4
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 08:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B510B2E5406;
	Wed,  5 Nov 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="Ktm/Qpme"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3D52E2679;
	Wed,  5 Nov 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332488; cv=pass; b=ejaU5rFH2sEiXj59BweK8BYUYojeHMUovt1Ckoxj6OqlkOZhyaxuMD672zMqZIxAGQKwjthhbeNK7lYpP8I395vNBYoAwGNYonY10MNcdLPZC2TdfRsML0F+w1AgClt2WhKoOpeTe21EBlIrMCF9+VrXTw8Yq3+t97Mst+xb9e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332488; c=relaxed/simple;
	bh=HH5CD+ABj9c0/4cLQ0cEE3mbv7MXBlq3cBGimMKObKA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kfR5tE9HPURePMp6rkhyeaC+4UG4GSRPmrJbgjUPg6CwDA3jZiXGlcn3+nRJwc2rn0Q4w2AezZ2Fiw5bcA0mMVaLlWZJA1UDqdMtQaIachnANBOgu+TL4iUx4Tmbm3HFFUEZ/qMVtAvLknOekJh21n3MF8Dh6VPCmQk5bZysBxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=Ktm/Qpme; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762332465; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oAyv/XMM/gHl2sgx2sIwFzaZKt+7nrHzMMttBwSLSfXSvL5yL6IGKegNGMC9q5RPjsd/oRdr7B+xVH34YZsYCequm2B1zOZXcsy/uvy/gpLPrFxx5BNrPawAmagFluxVlftAJVtUMiV3tfimcXninmzyerhQf7h4jJS2WBgJbDk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762332465; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=K8HOkWwttrvijzQTji25uvp1UvEY1l+gmNnhNh8LP/w=; 
	b=cXAYSQy2Y7oS2CTmJbWxuLCx4ddqLZDv8VRJoPVuLDzXi9HqhMJJFBt1vUrQETo3oO5Cld0UVI8Lhs3qMkgXAITsstfV8qI+NOrlGRklDeSTwDdeovV/pTn8qC+/T2Oa5Un4TWvEUlW0foBlElQaxXmo1sQhxzlUEUhcg0L1R90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762332465;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=K8HOkWwttrvijzQTji25uvp1UvEY1l+gmNnhNh8LP/w=;
	b=Ktm/QpmeLYCyu8Bc9zPlpj3JU5/OtuU83UvGAJElEHi6gLxn7abkwWDjwhiVGyz5
	gI+tJ0Dbn2Mn22YVXbDEw+P/DoOUyhz9R7MN9Zu4poJSfPVvNTkJt3tQrrFjFqXVfTG
	TSl1DhAwkn/z0Yt4v9qm2e8+p0+OlFp8zoBEAYDE=
Received: by mx.zohomail.com with SMTPS id 1762332460647813.1105742017812;
	Wed, 5 Nov 2025 00:47:40 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 0/3] dm-pcache: built-in support and metadata hardening
Date: Wed,  5 Nov 2025 16:46:51 +0800
Message-ID: <20251105084733.3598704-1-me@linux.beauty>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

This three-patch series tidies dm-pcache’s build glue and tightens the metadata scan.

Patch 1 allow dm-pcache to be linked into vmlinux and avoids clashing with the sunrpc
cache_flush() by using obj-$(CONFIG_DM_PCACHE) and renaming the helper across the tree.

Patch 2 drops a redundant recomputation of the metadata slot pointer while walking headers.

Patch 3 zero-allocates a temporary buffer so callers never see stale metadata,
relies on __free(kvfree) for cleanup, and only copies back once a valid record is found.

Thanks for your review.

Li Chen (3):
  dm-pcache: allow built-in build and rename flush helper
  dm-pcache: reuse meta_addr in pcache_meta_find_latest
  dm-pcache: avoid leaking invalid metadata in pcache_meta_find_latest()

 drivers/md/dm-pcache/Makefile          |  2 +-
 drivers/md/dm-pcache/cache.c           |  2 +-
 drivers/md/dm-pcache/cache.h           |  2 +-
 drivers/md/dm-pcache/cache_req.c       |  6 +++---
 drivers/md/dm-pcache/pcache_internal.h | 15 ++++++++++-----
 5 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.51.0


