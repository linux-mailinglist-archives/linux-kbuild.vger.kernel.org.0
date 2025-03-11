Return-Path: <linux-kbuild+bounces-6058-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2973A5C8D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 16:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DDA53AB019
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 15:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3396225E805;
	Tue, 11 Mar 2025 15:46:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8B25EFA9;
	Tue, 11 Mar 2025 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708018; cv=none; b=oVsXC/r+pZJqYIapbTyeDn3p2svKuxVRuVvRGXnLBZ54wKXHoSdnmFEl5mWIoY3kAS5qMpz5vjLqQ5OUy4VnVoLJBFyaMxTVz8h+khYnldtXKqz//YhhhlzwS/AmuwDYV+qpBe/hDpSF9Bg3AEezBwULaSWsc7EIZuY2VyfBb3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708018; c=relaxed/simple;
	bh=nk40KUh/QUjBRCuoaYNOFdH3bn8mS8+Y2mowH8reTEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VafdbfmPPQmE30Zxd6q1JqtP0UpKeJr7IV7Sf6EI7/LS+MGgXrJvE/0oODBzHXthoFbznjumCXM/QpOsvJYcpnHQPE4CrHogFiUIJEeBmLKNZ6+PFPyDxI39l3gN74qsPimuMY3GoJMoDzKfxHbeO8lRaAp7bbLQOcz6vzA1EgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn; spf=pass smtp.mailfrom=ict.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ict.ac.cn
Received: from localhost.localdomain (unknown [114.245.34.20])
	by APP-03 (Coremail) with SMTP id rQCowAB3fNjgWtBnqMtEFA--.61900S2;
	Tue, 11 Mar 2025 23:46:43 +0800 (CST)
From: Kefan Liu <liukefan24s@ict.ac.cn>
To: corbet@lwn.net
Cc: linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kefan Liu <liukefan24s@ict.ac.cn>
Subject: [PATCH] Documentation/kbuild: Fix indentation in modules.rst example
Date: Tue, 11 Mar 2025 23:45:35 +0800
Message-ID: <20250311154535.56560-1-liukefan24s@ict.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3fNjgWtBnqMtEFA--.61900S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryfCr4Dtw4DtF4xXFyUGFg_yoWxCwcE9w
	1qgFZYka45tw15Aw4DtFn5Jr92vw4IkFs5ArWkAF47A345KwsrA34DX34kZFy8GrsF9ryk
	Wws0qryDJ3ZrtjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYNVyDUUUU
X-CM-SenderInfo: 5olxyvhidqjknv6lu3wodfhubq/

Correct the indentation in an example within the `modules.rst` file
to improve readability.

Signed-off-by: Kefan Liu <liukefan24s@ict.ac.cn>
---
 Documentation/kbuild/modules.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a42f00d8cb90..d0703605bfa4 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -318,7 +318,7 @@ Several Subdirectories
 		|	|__ include
 		|	    |__ hardwareif.h
 		|__ include
-		|__ complex.h
+			|__ complex.h
 
 	To build the module complex.ko, we then need the following
 	kbuild file::
-- 
2.43.0


