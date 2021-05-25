Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D6C390CA2
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 01:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhEYXD7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 May 2021 19:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbhEYXD5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 May 2021 19:03:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABC2C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 25 May 2021 16:02:27 -0700 (PDT)
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1621983745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Cv+zu7W2GChgFJp4HOz/u8Hpr4RiyGNAMX6ZvzMvcDI=;
        b=wVv9IdBm769eH0avKYiQIZU9RUNH6sWpOrcII7F35K/3Y/njPtfSv0P+WoDKdYxkTXgWtK
        Q90SqkwUERnW2+3trKOLr3lxJgyXMMRXmA/pnCSZRx9LYsNHuDaNr+5F/RXRCiJRYjiiel
        Ae4iCjAJZ2hEZ0mV6LGhvUt15xlK384zD0qTCJTJn1LtsJTBJgMkkK9LOCJU3X9oi7QiPr
        QGFsfmaA7GKkf3gQjedRGYjSQ2w1V1Gu9aDtEv069RAJkFiMUa7S8NEULnuL97IOQtu+sW
        KAV4vHMPkkOpHtKHTcsACYJmZ9kNEHFPOH4ry2t0jbyBUNsdAr1SwzLjWrsH8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1621983745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Cv+zu7W2GChgFJp4HOz/u8Hpr4RiyGNAMX6ZvzMvcDI=;
        b=6T+nrsqVuf4TVnCk9IOK72DM7UlAYiEqHPpTaewf54HFsQkJxZOOuWbhHAOo2vdFqxqUfi
        FfKqwB2PpsElQXAg==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH v2 4/5] builddeb: introduce profile excluding the dbg pkg
Date:   Wed, 26 May 2021 01:01:38 +0200
Message-Id: <20210525230139.6165-5-bage@linutronix.de>
In-Reply-To: <20210525230139.6165-1-bage@linutronix.de>
References: <20210525230139.6165-1-bage@linutronix.de>
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
excluded via e.g.: `make DPKG_FLAGS="-P=pkg.linux-upstream.nodbg" deb-pkg`

Link: https://wiki.debian.org/BuildProfileSpec
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/mkdebian | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 9470581d8c75..2e95966fe4dd 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -212,6 +212,7 @@ if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control
 
 Package: linux-image-$version-dbg
+Build-Profiles: <!pkg.$sourcename.nodbg>
 Section: debug
 Architecture: $debarch
 Description: Linux kernel debugging symbols for $version
-- 
2.30.2

