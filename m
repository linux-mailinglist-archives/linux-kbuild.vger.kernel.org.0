Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2958B35B300
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 12:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhDKKOy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 06:14:54 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:60590 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbhDKKOy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:14:54 -0400
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1618136077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CN3phlSxpUzqKwZh/NlE0a8HijtaK040AGHto72X8HA=;
        b=sOCLv4CUGUkE9Z2s9zmCEwW4oV0MQiwCZ4TKN8YmgPnAQy+LCazzfz3ppGPggmhzolg2+y
        hHe493Cl6iqa3QfDNPkx6jprITrZy3CJUYJOWOefLvq67LrPyzYuTceNplkP8+CHP3Z1sh
        qyBfVh2HYSInNqjgtzCKl11dOQcSbyV+szlPXyJcm6EeN6S1Ufv7EBNCvcwE11DKBzW8fg
        alVq59KhI+WE4T4r+s3+lXAapyfrqAsX0cYsnDtW8IcXbtIvgtPSJgiAtLOBFmacXnuber
        LMm+c8KSSKnMqIF3zGusAv/I9h5zXvkxZWMJ7Amoj9T+SfuYtvp2iJQeHX9RYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1618136077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CN3phlSxpUzqKwZh/NlE0a8HijtaK040AGHto72X8HA=;
        b=LiwfbA+KML8sGP5niQnHdJ2G4nHXQXtfIApP+3iqWbHbeRwTSafGhEp8VDPJkhsP9LvoEM
        Z6sNZE+h52YOprAg==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH 0/6] builddeb: make deb building more flexible
Date:   Sun, 11 Apr 2021 12:14:16 +0200
Message-Id: <20210411101422.7092-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

Building Debian packages via the [bin]deb-pkg make targets has some
shortcomings. These targets do not allow for packing a Debian source
package independently from actually building the binary package.

This series improves that process by making it possible to rebuild
the packages without errors via dpkg-buildpackage, by separating
source package creation from binary package building, and by making
the dbg package build optional.

Bastian Germann (6):
  builddeb: diff-ignore unexported top-level files
  builddeb: set CC on cross build to prefixed gcc
  builddeb: clean generated package content
  builddeb: use standard format for copyright file
  builddeb: introduce profile excluding the dbg pkg
  kbuild: introduce srcdeb-pkg target

 scripts/Makefile.package |  8 ++++++--
 scripts/package/mkdebian | 40 ++++++++++++++++++++++++++--------------
 2 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.30.2

