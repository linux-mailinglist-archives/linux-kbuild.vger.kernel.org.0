Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FDE3D8176
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 23:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbhG0VSk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 17:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbhG0VQ5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 17:16:57 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5804BC06179F
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 14:16:57 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e5so52021pld.6
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SsQl9AGgDVz4dMjQrj5Kn4zFkC00P69ydvQa5XL3s70=;
        b=Rs6HYoDB8JCI5LZcFDXmByirUGKdsEtYf0xGfbcTHeZOr8iLIgjdfNm+fUHA8pOrtM
         dUxzT2LIMFv8uDeD3I7uQhaPpIzublFtLZaKhb6m8G+5wrXncTNkX9kgfHOyRoc8fGvX
         nUFj4adSWSn12tKJr3EXvjYqssUobHPHsIXqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SsQl9AGgDVz4dMjQrj5Kn4zFkC00P69ydvQa5XL3s70=;
        b=UsU4Y65Smwto5F2geujPYhbFbtqPCEVt/r3N4Yizi1+9AaU7S1ViowI8n3PQoeXR/A
         tp91y3bYmF7PHYdHjJ/luvlG5v0+B3obZhVvj/2gyWQjXmawamRVl8IGQLu1oQICvt3f
         dO+v6/VNZpwLItZEKvHabi5/PEeJL6pBC4LmlTGNiGj+nvuHwrCUW5KVOu945GKyoR5e
         EZMJm2luvFfhIiG4hw1XQMzWXy+N2vAHKtXgkFmonyfj+y41D4Tjb8g7GWEFacKkZLRi
         AVTIQplkudvfBY6hIH1mzWxy9Gkiu02pX7ju4Ps7hohdJaC4YzZkuP15Nh2xrKyWUo8m
         +q1g==
X-Gm-Message-State: AOAM531dpamjYnKIhkX5b+EySIy61QOo1ebCXx6vXQXrjRdvqK5+1zxH
        R8UOmivbfXufwJ/KB+OEJcTa0A==
X-Google-Smtp-Source: ABdhPJxHQnolGrNqUWuxT3TRrygeD/Y4uv8PYH40HLi8EsnsRtbjxlRySGM6XIllWkttnsKi9TCjpQ==
X-Received: by 2002:a62:ce0f:0:b029:39a:a638:f25b with SMTP id y15-20020a62ce0f0000b029039aa638f25bmr10561280pfg.42.1627420616933;
        Tue, 27 Jul 2021 14:16:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v10sm3566644pjd.29.2021.07.27.14.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:16:54 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-hardening@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Keith Packard <keithpac@amazon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH 49/64] cm4000_cs: Use struct_group() to zero struct cm4000_dev region
Date:   Tue, 27 Jul 2021 13:58:40 -0700
Message-Id: <20210727205855.411487-50-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; h=from:subject; bh=pEaLYejpw1rouLzkWI/x3bS06fu+DrrD0bTA3jR4D24=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOLvAh3w+r+2Msan2T2U4UOiQHuaUCBe1ciGiHP 57FYFAmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziwAKCRCJcvTf3G3AJoDND/ 49iXlS8sP97A+TuQ1hW5zJk7qY4Cq/D6b+K1NZSr+4oxO8lsE5F6t9Yp5H2qKpQDH3aG1Y9eseHUet DuqxELASm6TEbv9OaDETKL/st1lYW3XnzIdg4jtHyIUR7l5R/zIZWVCZjBklYrBtW+5MfFN8QuuF/F lvWawq3IPr3DCsm73XdFP6Bc1lZvICUNlEpP/HrD4TRKQi8UcHlSKwLWB74WqQx4AXq0BeprPCj2+K 42l0klkcuGwQNXyEcytxOhIx1zOxhcCTx0MIEflgGQVpkEiSYsDfzS1bJdn9uw6osxjKzg81OaNfq3 nTCOrIrEUVrjsW/YQShJRG1piOtrMFenXJVqU+berM3mVlnU+b+WDEDFNI+DLr5KX7D5l7IPFskN7l QyIaULkhJZ6CLvwzOoVY7vIlqZi9yNnUcfzAODBfpImwjzd2gLx/nV18ywN1M+ifdG3l0jjRTOV39w 4QYa5ZAzd0U/P351r3R8m8ZaiSHjEUVJeN1PD7EexenIxVofRslJik5zDpKZPpb133Y5HOZQsfajom cIz74vJI2Jk82zGIJHBlsHVUj9yJkvhh/o3qK0i/XCfm4ybkalh4dXPTiXC5ddEfdP/qhK66ovmt1y Gr7orTiLuQ3FhBQJUseFFY2YfzQgiCe7UUGAJJZGZ/PgkQ1TY0MyXJ3eMxkA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct cm4000_dev that should be
initialized to zero.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/char/pcmcia/cm4000_cs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/char/pcmcia/cm4000_cs.c b/drivers/char/pcmcia/cm4000_cs.c
index 8f1bce0b4fe5..2f43e7088e16 100644
--- a/drivers/char/pcmcia/cm4000_cs.c
+++ b/drivers/char/pcmcia/cm4000_cs.c
@@ -116,8 +116,9 @@ struct cm4000_dev {
 	wait_queue_head_t atrq;		/* wait for ATR valid */
 	wait_queue_head_t readq;	/* used by write to wake blk.read */
 
-	/* warning: do not move this fields.
+	/* warning: do not move this struct group.
 	 * initialising to zero depends on it - see ZERO_DEV below.  */
+	struct_group(init,
 	unsigned char atr_csum;
 	unsigned char atr_len_retry;
 	unsigned short atr_len;
@@ -140,12 +141,10 @@ struct cm4000_dev {
 
 	struct timer_list timer;	/* used to keep monitor running */
 	int monitor_running;
+	);
 };
 
-#define	ZERO_DEV(dev)  						\
-	memset(&dev->atr_csum,0,				\
-		sizeof(struct cm4000_dev) - 			\
-		offsetof(struct cm4000_dev, atr_csum))
+#define	ZERO_DEV(dev)	memset(&dev->init, 0, sizeof(dev->init))
 
 static struct pcmcia_device *dev_table[CM4000_MAX_DEV];
 static struct class *cmm_class;
-- 
2.30.2

