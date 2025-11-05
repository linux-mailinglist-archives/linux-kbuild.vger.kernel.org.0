Return-Path: <linux-kbuild+bounces-9408-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82828C3496D
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 09:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B109C4FB44C
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 08:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DF12DF3E7;
	Wed,  5 Nov 2025 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="YOVJZ3dw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC542DF141;
	Wed,  5 Nov 2025 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332515; cv=pass; b=CHB5oyw/n0mNpf+qUJZU1zJsvV/rO8n7WhhaLW6L15GfvkFg9Dy72WT76tQc0SQtoP34CaGG2jL3zbzRfe1lNAMS7g2wGh/Kv7aa6ou7HgX1IAkPGVlTL58G9DDL9iU27s/tQrOPGEERyGhh0C+scR25dRJXWoZLbxn+Kwlxes4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332515; c=relaxed/simple;
	bh=Pm4gfPGpEvl7urYYvAAc//M9O+0YLVRYbm6O0V4Wi5E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fraEDkoJPDOrawaCmKWyLjc+ALD/oyveHR0leKfgwCW6E+avIoOiK8AFsHWvJ0L3JyE/Fq0ThuOWlgVoPJDmjRrvnKiClZmDdThql/3LBFpwGK8tHOVxy1/cMMezH3wbB/hvpWXqX8RoEdQvsBiKJ9wsWyZcLrr/P/XBabNXrlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=YOVJZ3dw; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762332471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GB/bfm/hhQEdLL32vdewOf2VFPFDHj8Q35Ir9rAtSa1vFPX+6sW8d7QjXD8I4OTCRA26VXzkffiL3A/6NSoMxy8MUW9t9CPYR6JUyw+70TRFUkHV7sPxIcQb7IUibXk+5xsVpJjFO+3BTkzdxnfUmiTUP7/jZjQrSzHiotdLAKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762332471; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=LWxPD1jqIGf0eGjGt5kSF5OaU2M0+DsfoZfQTI0FPb0=; 
	b=Vtk2qXzOYFR4KtQm2y8RInkcEwlSuDOU4rXuMG+cxrE1n+aGWbzs/FOl1kFx0C4R/0pH+e6xVoa3LZ3yGzkFgYNfbesECq98P1jEMegnOGIlRqlknZA0n9RieSA/ODESbL/PVIOyIFIbrglX83YvZkfou3umgN1jQIyXm8dkuNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762332471;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=LWxPD1jqIGf0eGjGt5kSF5OaU2M0+DsfoZfQTI0FPb0=;
	b=YOVJZ3dw/wWxX207nFOt/1I8vi/e55aKjBu+NCHKIR6sg42TsI6MgU/whjrAzAE3
	3N9Ko6vxtmJYNHw4UTcrEv50N6Z3hG7VPxrfztPFGeQdmwitt3dI4bioAys4wbmPXUq
	IECYEwjkWRYbbp0AyYVQoDpVmCpK6tOrAAYjfBNk=
Received: by mx.zohomail.com with SMTPS id 1762332468517747.7914752177128;
	Wed, 5 Nov 2025 00:47:48 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dongsheng Yang <dongsheng.yang@linux.dev>,
	Zheng Gu <cengku@gmail.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH 2/3] dm-pcache: reuse meta_addr in pcache_meta_find_latest
Date: Wed,  5 Nov 2025 16:46:53 +0800
Message-ID: <20251105084733.3598704-3-me@linux.beauty>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105084733.3598704-1-me@linux.beauty>
References: <20251105084733.3598704-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

pcache_meta_find_latest() already computes the metadata address as
meta_addr. Reuse that instead of recomputing.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 drivers/md/dm-pcache/pcache_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-pcache/pcache_internal.h b/drivers/md/dm-pcache/pcache_internal.h
index d427e534727ce..b7a3319d2bd3e 100644
--- a/drivers/md/dm-pcache/pcache_internal.h
+++ b/drivers/md/dm-pcache/pcache_internal.h
@@ -99,7 +99,7 @@ static inline void __must_check *pcache_meta_find_latest(struct pcache_meta_head
 		/* Update latest if a more recent sequence is found */
 		if (!latest || pcache_meta_seq_after(meta->seq, seq_latest)) {
 			seq_latest = meta->seq;
-			latest = (void *)header + (i * meta_max_size);
+			latest = meta_addr;
 		}
 	}
 
-- 
2.51.0


