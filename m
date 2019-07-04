Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 808E85F0AA
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 02:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfGDAix (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jul 2019 20:38:53 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:51085 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbfGDAix (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jul 2019 20:38:53 -0400
Received: by mail-qk1-f201.google.com with SMTP id n77so5486234qke.17
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jul 2019 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=oxYjFRyxX3NROXm+Ygmt9JHCAGAtVhFnOyo3OkZfbDU=;
        b=pFv5mcrDyGgL+dq8XXN+UzV3D859ZKLMwvBZx8cL1G+iv8Gu3Bpp+0tDy7y+eqJdN+
         Sys/jfOMPIa4Kk480wXC0YSxIJr4WY5NEmKFAbtIyqHPCEL2shC1RGkkrmviAIc9PnSu
         TXCypRWrWJGDNfUhMWaPu525sXypB8WEC829GXbeLutNsc9f/WyFCZgbd+YcS+3Bt/27
         ++SN32pVuSx2WX6MEAkXAXS9tJC649L452kf9cFUTF1O3tHvajHrkRSjikLGaYLmS0ab
         9IJofwcEo1fJd6pCPer9SdnXJXIqGF+iHoAffclBGB8yGVB4sDN+f0jHKqqeZ/ia1nBq
         8yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=oxYjFRyxX3NROXm+Ygmt9JHCAGAtVhFnOyo3OkZfbDU=;
        b=o2NpdkVqgBJhsvcGVXI9vbcb4mfQmN+dauYU8R41yt2NRrVpLCkKHkmF9A0PSbmLZk
         11bxwgkaGO71xF1+k6iudwqokUfHAa2Vd5yBLUuZBxjZAN1bM2ADxgpPEwxTjiK7vG0E
         u8DjVdwvdcfcK5mwDkPR7hdOikydqHrJHPhBHIhfDPOZNyrAg6PPgkF0zZqBJlak7KjH
         CgqciaSRCSfD4l44sdD5ueEq6XbRm1W24XHPygalTWp5BPYAT6Qg7eiLPGzUIrDDnGLz
         yXTJj4TtaGDcIgOm2RFUW4TyAB85mzk7RIhZo1+nuDe9nzbPHquzuQbwBbyG032DpGDu
         JFpA==
X-Gm-Message-State: APjAAAWXOf4sb7LUwZdqbzvLcRSw0nt04A4x75ZvtbWWzkelBvl8hpdE
        HM8DUtBkOlwx9LS7yhXtSPKFcOu7ydGwUyNNWdCIcQ==
X-Google-Smtp-Source: APXvYqzWy4FbKHHWYOuv608ZWRy81huPhVNFArtBSw25v8dz2nkh4QA//OrB7jPx5C158BeXlhqK6QKVWRPtFRELD79Swg==
X-Received: by 2002:ac8:1a3c:: with SMTP id v57mr32832048qtj.339.1562200731869;
 Wed, 03 Jul 2019 17:38:51 -0700 (PDT)
Date:   Wed,  3 Jul 2019 17:36:15 -0700
In-Reply-To: <20190704003615.204860-1-brendanhiggins@google.com>
Message-Id: <20190704003615.204860-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v6 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 856a7c4f7dcf2..7b4dcae2526c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12727,6 +12727,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.22.0.410.gd8fdbe21b5-goog

