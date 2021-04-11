Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9213535B305
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 12:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhDKKO6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 06:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbhDKKO5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:14:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EF4C061574
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Apr 2021 03:14:41 -0700 (PDT)
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1618136078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YprCFzJGbx6nvlz1jxtaUJj1p9GgOqh51am+QXWV9pA=;
        b=WCNx7yij3Vaclf3IVEyzso4Qtg43M0poGMwsTq1ICOZWYf9nv+AcTw1WWdEZIM9+13XZO5
        +B2WRDGhOGYlsp6mppalkdw5XE4Yun1e9zHKTS0SF6nRhz1Z3HllI1HpajI7H4LOCq/z0R
        SyA8pq8YbGfgGMXWh4S3YS7d1L9Ds0jp8AS3Jh5u6UVsBm+s7PCmSGvD3tkd44QYkjqWZF
        oCnNhZknzWkLmJKolYhYmksMO/0pXmanxxMX3ZijkSMLl4MNr6eDryT6O24flRUQPOau/x
        rXkDxIFrrOAWzueGAecaKYnKhGoi9+6DsL/enYe7Tovtxn0bChHehRjaDS32RQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1618136078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YprCFzJGbx6nvlz1jxtaUJj1p9GgOqh51am+QXWV9pA=;
        b=YfRJKlxKehVomAiV/bZ3XIl3Xr0VOiLkAoJXtaASNE5lJ0Oie5nZjIrUntHu3ZxT0MOo27
        RRS2ve8cRrM3W9DQ==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH 2/6] builddeb: set CC on cross build to prefixed gcc
Date:   Sun, 11 Apr 2021 12:14:18 +0200
Message-Id: <20210411101422.7092-3-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-1-bage@linutronix.de>
References: <20210411101422.7092-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

Building the generated package with CC unset will fail for cross
compilation. Detect that and set CC to a sane default prefixed by
dpkg-architecture's DEB_HOST_GNU_TYPE variable.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/mkdebian | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 3d2d4b033e44..2fa149796791 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -223,6 +223,14 @@ fi
 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f
 
+include /usr/share/dpkg/architecture.mk
+
+ifneq (\$(DEB_BUILD_GNU_TYPE),\$(DEB_HOST_GNU_TYPE))
+ifeq (\$(origin CC),default)
+CC := \$(DEB_HOST_GNU_TYPE)-gcc
+endif
+endif
+
 srctree ?= .
 
 build-indep:
-- 
2.30.2

