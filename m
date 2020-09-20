Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9C7271878
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 00:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgITWsM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 18:48:12 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36140 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgITWsL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:From:Reply-To:Subject:Content-Type:
        Content-ID:Content-Description:X-Debbugs-Cc;
        bh=GZXK799wKmQ4LJ8gftrbG5oKxFQqUUOdRaFfHRTCLm4=; b=SgPL0ZW6T/11NntBf1J75uMQc6
        m5dlrN/srBOugLkYZ2J3JabiE1snCBDpQfxEJuy4AaFxUAlJGMr3y5ZTMTCIDxbgn/7PxgG9bU/JI
        XPU/rBUZmM69dKVMTB8coG2NPVO0bQGHPE/9pQetG04kckE5FSYHexnAfP/8K3UEecp3gnMe8eddT
        U/PhkXjGZqd0m7qwUAq5yQrhj1rGXS+7uCMUTtNG4iHJVEodg02X3ZKZBFyFwbmUHuOL9ttxqFvnT
        AIA0XeNXMoKi/rO5XmpuWNI3XiF/EjEgk6HUDhvUsUEX9mRSbRlb3ODLJ2QMUpdHUqLtadjcIqMmv
        ZU+zOQkw==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7n6-0002cL-8E; Mon, 21 Sep 2020 00:26:40 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] builddeb: Move upstream repository URL into the upstream metadata file
Date:   Mon, 21 Sep 2020 00:25:51 +0200
Message-Id: <20200920222556.10002-3-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
References: <20200920222556.10002-1-guillem@hadrons.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This file is structured in machine readable form (YAML), so makes it
easier to process by other tools. Switch from a git to https URL.

Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/mkdebian | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 48fbd3d0284a..cd2c8c39aa54 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -148,6 +148,13 @@ $sourcename ($packageversion) $distribution; urgency=low
  -- $maintainer  $(date -R)
 EOF
 
+mkdir -p debian/upstream/
+# Generate upstream metadata file
+cat <<EOF > debian/upstream/metadata
+---
+Repository: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
+EOF
+
 # Generate copyright file
 cat <<EOF > debian/copyright
 This is a packacked upstream version of the Linux kernel.
@@ -157,9 +164,6 @@ https://www.kernel.org/pub/linux/kernel
 
 Copyright: 1991 - 2018 Linus Torvalds and others.
 
-The git repository for mainline kernel development is at:
-git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
-
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation; version 2 dated June, 1991.
-- 
2.28.0.297.g1956fa8f8d

