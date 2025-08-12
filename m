Return-Path: <linux-kbuild+bounces-8359-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BBB21CEC
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B6868522C
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A101A2E3373;
	Tue, 12 Aug 2025 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lI8Pjm6p";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p1mABPk5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129752DCC01;
	Tue, 12 Aug 2025 05:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976796; cv=none; b=CCaABbQ2A8KQrzfYfdkVTwxgOZKHrd1TS7luScI6qAc4AmcyUJDbca1WQlgyil2VeKaIK1XYXiqpfsWiffRDrrAvsLYnt9lrGpyuZn5omRtljjt9jI3LzlQxAkRGpcIKRkht47zQ96db/gU/u2+u8rVeQjXlUMN65GP+LZ/AmDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976796; c=relaxed/simple;
	bh=jGDTmnsnZdUjQh5FtBO1M6vpfIP4BrjJnoo9MTY7UcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqoKx1Np1wU0dfUlZpGdidLOZuJ3XB/vOp8nQWkeLK+PQsR44p5nOkTLPVKTqb7rY8gjICxbscst3TxxS21DW+I6wOG6Vw3L0CzrUsxqTNO4ZWacfcLdY7dwQKENdu+jXGXUFbVMA1Y1mgBYvrRTYbHJr9vbE+CAdJE8gQ/2dFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lI8Pjm6p; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p1mABPk5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWes/uuQ/kR/IDZ3EOYRCyIfF7xZIM/CW794pfrdoK0=;
	b=lI8Pjm6p5/09LWjb2Fn1jRutFc7+LyII5I8t23FJRvlk0YIJWBAOj1yHiTAjlRY1RYAvWX
	VivQ2bDHRg/J0QFsBhbjhm7KYObe/V0siRhUwsGJ5m24Gm8zJGwRDZ6l4ZsIQTXNC7T9w0
	ianBD/8Ur7RA1IuYGfrr/6jFKklqTyzgOiZlULrs9xyK55FIG+AeK9KoNzhL/pSRitrE2q
	WmX6p3oRkrxc0J87+sVnVjiBFJh548xH57w7OCoSGVFNd093N0hTEFk6knw11VU7386rlj
	dpcM6FwvKLcKucLTNyxt3x21zPdyjDL7FzS4NMKwv0H5XkD08D3vTp6LtzxYuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWes/uuQ/kR/IDZ3EOYRCyIfF7xZIM/CW794pfrdoK0=;
	b=p1mABPk5EoXi+Ob/ak8tHXLFdMGFx/3/8uEPYtPK+bpgEvCqr4apcgkN2r91zOHhVE/2wz
	5CbPBoImRaf2GBCA==
Date: Tue, 12 Aug 2025 07:33:08 +0200
Subject: [PATCH 5/6] kbuild: uapi: upgrade check_sizetypes() warning to
 error
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-hdrtest-fixes-v1-5-7ad2af66cd58@linutronix.de>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976787; l=747;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jGDTmnsnZdUjQh5FtBO1M6vpfIP4BrjJnoo9MTY7UcA=;
 b=iR6RFO/MELFWlqKwO7lT/mVZMIeuyWQThrX2gB3ydIoiiBGvsiZQzvJ98Fi5waJ1UQpVKzUwR
 nOlcUXsjQ5uA6KvUbfxDU4midaJ4nxlba1mSe/+YXUVfrmyza9Z93+d
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

No problematic type usages exist anymore.

Make sure it stays this way.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 usr/include/headers_check.pl | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 36307a137cc1e109e3e1c253f66f3e5935499fc8..36349b21cef5d55241b68ca24dabe6a321b7ce27 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -159,7 +159,6 @@ sub check_sizetypes
 		              "found __[us]{8,16,32,64} type " .
 		              "without #include <linux/types.h>\n";
 		$linux_types = 2;
-		# Warn until headers are all fixed
-		#$ret = 1;
+		$ret = 1;
 	}
 }

-- 
2.50.1


