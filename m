Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C364835B306
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 12:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbhDKKO6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 06:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbhDKKO5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:14:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FC1C06138C
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Apr 2021 03:14:41 -0700 (PDT)
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1618136079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xax9m7nzK6vr5O4i2iDG/FYysmrmK18NhmQkIvTSIkk=;
        b=kC7Kb4La1ywDv85paW8a44W2TzTeJQQQnGSQEHWWj046VJzI4bGFA4iUXJhDe9PYATZvgL
        F3nPjZ5sOx97kKJEwM0q7aeZHjKgK1IwHo0OCLhoHjylXRl8qqR9hysuEI1S/2xROEa8gn
        rnhEm7m9lDvwaKQ/UrIXtlDBzY/4XdCL7mnfxkdGWgyBkMQlXOxfqYqoBz0WBw3z6Yrrl3
        QMOv3oeBFwnoH1FbMT7B2Yl2dX/W88hC2OmBPgQvvmAEn26L12Tw5PB7UUDUtPzGOqrgF5
        GUlU74XgxHfdiz8XexXRNeOtNkWswzVIvTHK2oN4U5XpRp+qi8iTzOIEwjLhSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1618136079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xax9m7nzK6vr5O4i2iDG/FYysmrmK18NhmQkIvTSIkk=;
        b=fmJ84kJLNuq93s0S/Nweqfh0mt9/CmwGR8w3/+IGE/CQuQNbNXejwtCX2PTap//5jJm5jn
        blJai1NHGft8uGBA==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH 5/6] builddeb: introduce profile excluding the dbg pkg
Date:   Sun, 11 Apr 2021 12:14:21 +0200
Message-Id: <20210411101422.7092-6-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-1-bage@linutronix.de>
References: <20210411101422.7092-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

Enabling CONFIG_DEBUG_INFO implies building the binary linux-image-*-dbg.
As this increases package build time significantly, one might want to
exclude it from being built.

Add a pkg.$sourcename.nodbg build profile for that package so it can be
excluded via e.g.: `make DPKG_FLAGS="-P=pkg.linux-5.11.0.nodbg" deb-pkg`

Link: https://wiki.debian.org/BuildProfileSpec
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/mkdebian | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index bb5c19735345..369a989499ef 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -213,6 +213,7 @@ if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control
 
 Package: linux-image-$version-dbg
+Build-Profiles: <!pkg.$sourcename.nodbg>
 Section: debug
 Architecture: $debarch
 Description: Linux kernel debugging symbols for $version
-- 
2.30.2

