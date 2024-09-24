Return-Path: <linux-kbuild+bounces-3704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB556984B87
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D2A21F21037
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 19:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CCA84E11;
	Tue, 24 Sep 2024 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=m3y3r.de header.i=@m3y3r.de header.b="wS2mGA7j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from www17.your-server.de (www17.your-server.de [213.133.104.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89EE1B85F1
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206010; cv=none; b=IGKWuQbKLSlmbp03Ze2AC5+Kw1smoA4lUj/xx7c121vxwUR7MDNGlAseiko3eNL9cDQIewOn03ZWHgIOPZvmziQFSV7S4/czIjKkEZZ2Oh6fwwZt/sK5O/sm8LN/JwykW2Qvu5OYtGpNfSh30MMXuo4/HLTg1Dg0Ns1b0VX5jyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206010; c=relaxed/simple;
	bh=oP1AVrGpzu/Qw5W+pauDf6+AidoiRbMraXrsNu8K0UU=;
	h=Date:Message-Id:From:To:CC:Subject; b=OKBl/cU4gNZch6deNHG4QqxB2QLEgNffTK5pMWCwebPS5EIceXuJdNELh6UFsFQZIABkZA/yYZ/YI7WV9KuLDAX8xXvjooT9J9W8eQMTMvdT1sRuQ5CAWXpsemOwDu7Ao/nlLG+tqVqqlXwqFXGyrrYdUecZ9n72atqWyVg6xqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m3y3r.de; spf=pass smtp.mailfrom=m3y3r.de; dkim=pass (2048-bit key) header.d=m3y3r.de header.i=@m3y3r.de header.b=wS2mGA7j; arc=none smtp.client-ip=213.133.104.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m3y3r.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m3y3r.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=m3y3r.de;
	s=default2402; h=Subject:CC:To:From:Message-Id:Date:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=qI0tmiXJQ6gW0+Cagua2Ukt4pxmcMPcceqm7MoTBQ+s=; b=wS2mGA7jz+yy4Pi1x6UEzXaGtU
	XqwfmgrpFDLP/B38Bf89fyXwJpqU3Wl1d1/GA5546sZlf9A+21ZREOZcrU0QQLpAN2KWxIjEX1ALY
	pVeMrviJ4utcNHBCGfCZpWWwGDK5RJGEuXxHM2rGC/3qxJyGilW8xxvb8r8o2bbrE4P2IvSzSSO8j
	zH3aozyfIuxnAxHsCarM2EWKqFx99XmwY6mK/pXqHPOwgRHEQseuFC9eqB10LqOK5bIItuicZEkl4
	IYhNcBAwQgIu3kyLbRzGt3tWfSaGIog46IOX3sLTo5heS55x/L0deMnv/gM9kO2QiVdUXQ0Jcf+fb
	SaViODjQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www17.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <thomas@m3y3r.de>)
	id 1stAZf-000F0A-0b;
	Tue, 24 Sep 2024 20:47:47 +0200
Received: from [94.31.73.216] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <thomas@m3y3r.de>)
	id 1stAZe-000J6o-1y;
	Tue, 24 Sep 2024 20:47:47 +0200
Date: Tue, 24 Sep 2024 20:47:22 +0200
Message-Id: <rxsikukdh39.fsf@localhost.mail-host-address-is-not-set>
From: Thomas Meyer <thomas@m3y3r.de>
To: masahiroy@kernel.org
CC: linux-kbuild@vger.kernel.org
Subject: [PATCH] kconfig: use memcmp instead of deprecated bcmp
X-Authenticated-Sender: thomas@m3y3r.de
X-Virus-Scanned: Clear (ClamAV 1.0.5/27408/Tue Sep 24 10:34:28 2024)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Make build succeed on systems whose c library doesn't provided the deprecated bcmp function.

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---
 scripts/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 76193ce5a792..18e229bf3d3e 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -76,7 +76,7 @@ static bool is_same(const char *file1, const char *file2)
 	if (map2 == MAP_FAILED)
 		goto close2;
 
-	if (bcmp(map1, map2, st1.st_size))
+	if (memcmp(map1, map2, st1.st_size))
 		goto close2;
 
 	ret = true;
-- 
2.46.1

============================================================

