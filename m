Return-Path: <linux-kbuild+bounces-8360-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14FB21CED
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4383BE66E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA30F2E3385;
	Tue, 12 Aug 2025 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OMg2ht9C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qMyWg5+s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129E32DE709;
	Tue, 12 Aug 2025 05:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976796; cv=none; b=r1ja4boYOKAPqnymj4oXnUegBSxtcHjbOWtcUxOArQeWgnBJAJaTWkCoq+iXqNeQ/K+fiRZ1MBCotMUvVg9+6sCRDCIEeZCRa+GRlXCL8SfTL2oHFh0v+DjHaRem6tzDEN8iwVYEPpmINeILuPojjKoTUfbEPA9snIJlPz0XR3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976796; c=relaxed/simple;
	bh=zSThn3P1sQhXq1hONEmer/JmBxr3pbjn2fRx5MtiEeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvotPwIbu76/NBwj3T7vZUx5ogAFCl5H2fo7wAXQWrjr9CnWI3Xp1LGs281bNpai9Hd5lbsN4dQm66amftsiq5Xs+PKrizl88DsBPYlr4ltWrAbgV2ENiiLqXkeQEVbDxW5Si/OpQXnGrPD97u4+LYFr1KmmzIBn9S1oV4x7ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OMg2ht9C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qMyWg5+s; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcH6XyM5OcYaSc0KW4AUOOA2KBFUgeJjyxIXjGh+HT0=;
	b=OMg2ht9CpHNWEsZOyVemHaok3NhVldZfOPseFYp5wo9bvNy9FNNfMrHTTZi0a/n8lRtNux
	4enOqOdhkVr8cqxxy+8zJn0AmPXPLnLezRnizI5ZgMebbwy1k3sphn26tndquEn3ZpFDmM
	yxFxfUXt1KWv2n0YVwqTAUMMcLq5potLU57yqcDVqmntmSFXuvU0CThRZDQ9j2CcI+5EeS
	na1Ab/Q3mWfwuyVPge7TB5ejuHIf3WY87ZzRPYspAvdbmG02fvM66bTTvBwUwg7sFao2TT
	ox/lvCDiKIIstsqF/ksNnSZEC2ReaRHuYco4yMsK5UvwFxYdN0wUcIJBVuas6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcH6XyM5OcYaSc0KW4AUOOA2KBFUgeJjyxIXjGh+HT0=;
	b=qMyWg5+scVXCQBnV946X9xvtjlvSRXuhbdACfpEardbJTe8YBzUZLucIf1cTAI7fccbbGt
	3ZCjnjP/tuLl1+Dg==
Date: Tue, 12 Aug 2025 07:33:09 +0200
Subject: [PATCH 6/6] kbuild: uapi: upgrade check_declarations() warning to
 error
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-hdrtest-fixes-v1-6-7ad2af66cd58@linutronix.de>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976787; l=693;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zSThn3P1sQhXq1hONEmer/JmBxr3pbjn2fRx5MtiEeA=;
 b=JM4Vnq14WsuzK413TdYns69UWnS7Hg9UMSY5BKbqabrhJVSgKkjxv1nxg3yqXQBGwCtPRpRsg
 KI/w7L4XQgRAoZP98qjogXWbdmtrFvwOqTLjb8Y4mbLjvTFpl6H5CwN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

No problematic declarations exist anymore.

Make sure it stays this way.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 usr/include/headers_check.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 36349b21cef5d55241b68ca24dabe6a321b7ce27..21c2fb9520e6af2d6ebf2decce69f6eea64efd88 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -74,6 +74,7 @@ sub check_declarations
 		printf STDERR "$filename:$lineno: " .
 			      "userspace cannot reference function or " .
 			      "variable defined in the kernel\n";
+		$ret = 1;
 	}
 }
 

-- 
2.50.1


