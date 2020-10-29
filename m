Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C257429F090
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 16:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgJ2Pwm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 11:52:42 -0400
Received: from codesynthesis.com ([142.44.161.217]:46804 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgJ2Pwl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 11:52:41 -0400
Received: from brak.codesynthesis.com (unknown [105.184.207.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 7FE1E5F6C0;
        Thu, 29 Oct 2020 15:52:40 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id BFD2E1A800C4; Thu, 29 Oct 2020 17:52:36 +0200 (SAST)
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>, linux-kbuild@vger.kernel.org,
        Boris Kolpackov <boris@codesynthesis.com>
Subject: [PATCH 1/2] kconfig: make lkc.h self-sufficient #include-wise
Date:   Thu, 29 Oct 2020 17:51:51 +0200
Message-Id: <20201029155152.2467-2-boris@codesynthesis.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029155152.2467-1-boris@codesynthesis.com>
References: <20201029155152.2467-1-boris@codesynthesis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Signed-off-by: Boris Kolpackov <boris@codesynthesis.com>
---
 scripts/kconfig/lkc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 8454649..3e2c70e 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -6,6 +6,10 @@
 #ifndef LKC_H
 #define LKC_H
 
+#include <stdio.h>
+#include <assert.h>
+#include <stdlib.h>
+
 #include "expr.h"
 
 #ifdef __cplusplus
-- 
2.29.0

