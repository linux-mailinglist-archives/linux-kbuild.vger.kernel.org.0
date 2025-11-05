Return-Path: <linux-kbuild+bounces-9407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E049C3495E
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 09:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7393C4F28C3
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 08:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17182EC0A9;
	Wed,  5 Nov 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="Ruapu6zF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0C2DC34D;
	Wed,  5 Nov 2025 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332502; cv=pass; b=VHFolp0oq6DQKiDOAJyozLBkLjwQo9GU0mmpOae3eNTxyIerThJ0zPmahoTyR3VaXSZSO2poyyNBdMQ5bJKG3+IdgO3Th89DIgWpJmlYxeUTKI9s3WHcDZZpCVmoeRl239ype1MyuHSu2ns0OwSbFiUc+bqEXNdAtHoadK1uB0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332502; c=relaxed/simple;
	bh=R/TbI84eFp9kXjDw88iosgHhX0aGRc0fsZmAH+tj+3k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lE0g5dP5WEWOSE90O2Npo14/xh/vPjBK3F+WpGQ5WEfAgma3qDCdhPdtWjtbWmWNAz4F51PLUuoN9qPQu0ZFuF8v4njvXA3pH9vFc+MTN6zAIgIaDuR8XrXBMdk1/wxOqcsNVrtiMsgW1QWsFRdEQZSqJP/kOFkWtgP8y+dM9PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=Ruapu6zF; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762332467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kWoQo5BdJD42/7cG3lCsHWFhsVYctDvr4Ozz1EM15SbZzCaQRUVncp1qzA1/vV0yRIBi4smKylYpyn7TyM/NHSMFS53dMi01R9hjbmS383ooJSJv+4UQP8dloA2uOgmGFSwXWsLXGDFErOFfSwQUPjoH9A0P5DWXW/J0DEilVr8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762332467; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=bL264gMYmKx98ivmk0jTfYv5p7G6wPZT+qugzMLjMzI=; 
	b=nQ4mheCmw/eXDEo5KJTk2FLYGAuCYfWODzPrQHLJSEDFtbopjy4FA9ANtYrxD1YEDT/3FVVrP7oshkFdge+XMoDVYAUlKU/0wN/DuZhUKQSxP0Q4aUGmgfJkZu4Bhhx5e+d8p00wtnSPYYbEosQcgbULQhxahejAk/we+y0x1rs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762332467;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=bL264gMYmKx98ivmk0jTfYv5p7G6wPZT+qugzMLjMzI=;
	b=Ruapu6zFTd23g4HL8YN9g0WCIbV+Dk0rEYn9G3O1pIYG0DH/mWAPFoozkbQ7hdv/
	61YQpgbzFDO6JtRrw1zjvPiAus1BQXZayy21tkbCxvfBQTasBYhvK1Bx2inIxRASj2K
	tni5NuE7MltSeH9APtON9MoWPOpfWaF2Wq4J6E/M=
Received: by mx.zohomail.com with SMTPS id 1762332464994471.04425031461585;
	Wed, 5 Nov 2025 00:47:44 -0800 (PST)
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
Subject: [PATCH 1/3] dm-pcache: allow built-in build and rename flush helper
Date: Wed,  5 Nov 2025 16:46:52 +0800
Message-ID: <20251105084733.3598704-2-me@linux.beauty>
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

CONFIG_BCACHE is tristate, so dm-pcache can also be built-in.
Switch the Makefile to use obj-$(CONFIG_DM_PCACHE) so the target can be
linked into vmlinux instead of always being a loadable module.

Also rename cache_flush() to pcache_cache_flush() to avoid a global
symbol clash with sunrpc/cache.c's cache_flush().

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 drivers/md/dm-pcache/Makefile    | 2 +-
 drivers/md/dm-pcache/cache.c     | 2 +-
 drivers/md/dm-pcache/cache.h     | 2 +-
 drivers/md/dm-pcache/cache_req.c | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-pcache/Makefile b/drivers/md/dm-pcache/Makefile
index 86776e4acad24..cedfd38854f63 100644
--- a/drivers/md/dm-pcache/Makefile
+++ b/drivers/md/dm-pcache/Makefile
@@ -1,3 +1,3 @@
 dm-pcache-y := dm_pcache.o cache_dev.o segment.o backing_dev.o cache.o cache_gc.o cache_writeback.o cache_segment.o cache_key.o cache_req.o
 
-obj-m += dm-pcache.o
+obj-$(CONFIG_DM_PCACHE) += dm-pcache.o
diff --git a/drivers/md/dm-pcache/cache.c b/drivers/md/dm-pcache/cache.c
index d8e92367d9470..d516d49042272 100644
--- a/drivers/md/dm-pcache/cache.c
+++ b/drivers/md/dm-pcache/cache.c
@@ -411,7 +411,7 @@ void pcache_cache_stop(struct dm_pcache *pcache)
 {
 	struct pcache_cache *cache = &pcache->cache;
 
-	cache_flush(cache);
+	pcache_cache_flush(cache);
 
 	cancel_delayed_work_sync(&cache->gc_work);
 	flush_work(&cache->clean_work);
diff --git a/drivers/md/dm-pcache/cache.h b/drivers/md/dm-pcache/cache.h
index 1136d86958c8c..27613b56be54c 100644
--- a/drivers/md/dm-pcache/cache.h
+++ b/drivers/md/dm-pcache/cache.h
@@ -339,7 +339,7 @@ void cache_seg_put(struct pcache_cache_segment *cache_seg);
 void cache_seg_set_next_seg(struct pcache_cache_segment *cache_seg, u32 seg_id);
 
 /* cache request*/
-int cache_flush(struct pcache_cache *cache);
+int pcache_cache_flush(struct pcache_cache *cache);
 void miss_read_end_work_fn(struct work_struct *work);
 int pcache_cache_handle_req(struct pcache_cache *cache, struct pcache_request *pcache_req);
 
diff --git a/drivers/md/dm-pcache/cache_req.c b/drivers/md/dm-pcache/cache_req.c
index 27f94c1fa968c..7854a30e07b7f 100644
--- a/drivers/md/dm-pcache/cache_req.c
+++ b/drivers/md/dm-pcache/cache_req.c
@@ -790,7 +790,7 @@ static int cache_write(struct pcache_cache *cache, struct pcache_request *pcache
 }
 
 /**
- * cache_flush - Flush all ksets to persist any pending cache data
+ * pcache_cache_flush - Flush all ksets to persist any pending cache data
  * @cache: Pointer to the cache structure
  *
  * This function iterates through all ksets associated with the provided `cache`
@@ -802,7 +802,7 @@ static int cache_write(struct pcache_cache *cache, struct pcache_request *pcache
  * the respective error code, preventing the flush operation from proceeding to
  * subsequent ksets.
  */
-int cache_flush(struct pcache_cache *cache)
+int pcache_cache_flush(struct pcache_cache *cache)
 {
 	struct pcache_cache_kset *kset;
 	int ret;
@@ -827,7 +827,7 @@ int pcache_cache_handle_req(struct pcache_cache *cache, struct pcache_request *p
 	struct bio *bio = pcache_req->bio;
 
 	if (unlikely(bio->bi_opf & REQ_PREFLUSH))
-		return cache_flush(cache);
+		return pcache_cache_flush(cache);
 
 	if (bio_data_dir(bio) == READ)
 		return cache_read(cache, pcache_req);
-- 
2.51.0


