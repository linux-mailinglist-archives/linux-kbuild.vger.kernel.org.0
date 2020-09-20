Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2BE27187A
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 00:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgITWsT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 18:48:19 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36152 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgITWsS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:From:Reply-To:Subject:Content-Type:
        Content-ID:Content-Description:X-Debbugs-Cc;
        bh=rmt420AiQ/6iJnB0gbUjUpPeTTkVRtKvCPHsJMSwg4Q=; b=WhDUoum+cotgkEkJAosLq62fTC
        1/Jas3z2aORwseGkBU3iZNSFqeKTXrZtmGHCvZq6W8bBtZuHk05rFJd7FhuhbLBbHOclADgP6DhmT
        bSR8QvjW8NCK5QugYUNW/9gabuSvszfxZF9x7qiKya7EoXOxPN1GiweKOyg8bsDpFEybXnFmHtY0r
        SVKzY31JZQtSrZWHcrnGzOrd9SY6LSd4hGd/djQvDCNIsgD9DvYjbio7UfHAh3jioAazmb1LD6x4h
        q9jruV+qh6r6JZuNHwdcwoLXdR8UE7oiPXUHl2wf3XGgzRRdlfivcWXGtwxsX2cfRwdpv8KMM2m5Y
        wSpp98ww==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7n7-0002cT-N6; Mon, 21 Sep 2020 00:26:41 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] builddeb: Switch to a machine readable copyright file
Date:   Mon, 21 Sep 2020 00:25:52 +0200
Message-Id: <20200920222556.10002-4-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
References: <20200920222556.10002-1-guillem@hadrons.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This format makes it possible to automatically process the licenses
within a system for compatibility or compliance checks, for example.
Update the copyright years.

Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/mkdebian | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index cd2c8c39aa54..69f2a6d7f009 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -157,19 +157,29 @@ EOF
 
 # Generate copyright file
 cat <<EOF > debian/copyright
-This is a packacked upstream version of the Linux kernel.
-
-The sources may be found at most Linux archive sites, including:
-https://www.kernel.org/pub/linux/kernel
-
-Copyright: 1991 - 2018 Linus Torvalds and others.
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; version 2 dated June, 1991.
-
-On Debian GNU/Linux systems, the complete text of the GNU General Public
-License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
+Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+Source: https://www.kernel.org/pub/linux/kernel
+
+Files: *
+Copyright:
+ 1991-2020 Linus Torvalds and others.
+License: GPL-2
+
+License: GPL-2
+ This program is free software; you can redistribute it and/or modify
+ it under the terms of the GNU General Public License as published by
+ the Free Software Foundation; version 2 dated June, 1991.
+ .
+ This program is distributed in the hope that it will be useful,
+ but WITHOUT ANY WARRANTY; without even the implied warranty of
+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ GNU General Public License for more details.
+ .
+ You should have received a copy of the GNU General Public License
+ along with this program.  If not, see <https://www.gnu.org/licenses/>.
+Comment:
+ On Debian systems, the complete text of the GNU General Public License
+ version 2 can be found in '/usr/share/common-licenses/GPL-2'.
 EOF
 
 # Generate a control file
-- 
2.28.0.297.g1956fa8f8d

