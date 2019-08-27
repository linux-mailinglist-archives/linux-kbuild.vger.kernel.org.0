Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0E89E7BF
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2019 14:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbfH0MUl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Aug 2019 08:20:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46287 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfH0MUl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 08:20:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so18572083wru.13;
        Tue, 27 Aug 2019 05:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9YiLMzN5FRFc66UBSg4I7hR0hdxNL+dhq+vTlwPS1+A=;
        b=ZOGza1JY5t1oNUxdSuoZYqgcwlzDE4WglTtIViYZOobeMFj/KqDbFyFuO7VbUbIfCM
         UJTw0BJZHR5nRgO+47lx3YLoZLHq3qMRjG0R7+Ie5bazei2YxSvGx2nUO5lb5Xk28XWj
         uUKDQMaz6iqJ3lbUfb/FYOtBVny8mhaDIjuFGTTbDC4ghKdgwEq0Oi58rZmjIN0xo28X
         k6VAJlSd8fFd4Sg1oLkkAINg6xYnSVz5eszxWa3Aa/3mjO9TuK862A8yEKs9W0SX+TvV
         rt2lgxAo5ByZhienwXkSh56Vd0bjJ0YQWnSo9qzQEIYOaCGzypEEDffG4+m+UYBsjOPt
         mZyQ==
X-Gm-Message-State: APjAAAVENYceb8ndoBIXsq8a411ADcR8pHLCxhSc/o3HyKGep3mr77Ei
        XcFQxPLZ/O0wSebSc53er4c=
X-Google-Smtp-Source: APXvYqwO7vn03LTFpqQ9ngvvTwiMldgPKHecOUTmCBtEmSRe0vl9sAmbUqJBgQ8IAe9J30XjSgMIIQ==
X-Received: by 2002:adf:e5d1:: with SMTP id a17mr4034066wrn.118.1566908439451;
        Tue, 27 Aug 2019 05:20:39 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
        by smtp.googlemail.com with ESMTPSA id f197sm8086254wme.22.2019.08.27.05.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 05:20:38 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Denis Efremov <efremov@linux.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: add NOFAIL to strndup
Date:   Tue, 27 Aug 2019 15:20:23 +0300
Message-Id: <20190827122023.15086-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add NOFAIL check for the strndup call, because the function
allocates memory and can return NULL. All calls to strdup in
modpost are checked with NOFAIL.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..0255538528fe 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -795,9 +795,9 @@ static int match(const char *sym, const char * const pat[])
 
 		/* "*foo*" */
 		if (*p == '*' && *endp == '*') {
-			char *here, *bare = strndup(p + 1, strlen(p) - 2);
+			char *bare = NOFAIL(strndup(p + 1, strlen(p) - 2));
+			char *here = strstr(sym, bare);
 
-			here = strstr(sym, bare);
 			free(bare);
 			if (here != NULL)
 				return 1;
-- 
2.21.0

