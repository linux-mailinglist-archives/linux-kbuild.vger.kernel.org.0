Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091DC390CA1
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 01:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhEYXDy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 May 2021 19:03:54 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:51090 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhEYXDx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 May 2021 19:03:53 -0400
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1621983742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=toj7KPze/2B+kSbZumVha4emjctVzI8sYeAGse/2JY0=;
        b=cDbiKrd2J0O0jH5aKGbXoc8n+hgsigABTZvkSFOAmvSCroJtzXvinl9eKMqtfoVaKft3YM
        5ezfEYWtgoE0zoeeGOzTk5afgYaNfRwMFGSXILu3cj+Kuw1Z3CXaZfjt3HLJ4C5sVozsB/
        cN1U33mYXx4epP36vMH1UEI50Xjk4SznQ6ybkA5gCMYa6LwGvf1FPZU8Q2CNvaTGW6nFIs
        p0y8uWP5JC0qHA8D1IVoXkTEW9aIHU3e0IODD0wBoLUa1WAw7rB0cqMfZKEfXDpkJHuqZo
        6EPVYcf0871048OfbjviJOeb3pn5q9+LrPd8Kc+zif0gVC/qVuvVZLAPaRolWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1621983742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=toj7KPze/2B+kSbZumVha4emjctVzI8sYeAGse/2JY0=;
        b=AZPPa6EK89mTJVwiCOtVScTtxILd0y0nfQGdtqfJSinu80ADi0ushN25zxRw6qoS3fHh1T
        rCdesBWOxxuvfsBw==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH v2 0/5] builddeb: make deb building more flexible
Date:   Wed, 26 May 2021 01:01:34 +0200
Message-Id: <20210525230139.6165-1-bage@linutronix.de>
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

Changelog v2:
  * Drop "use standard format for copyright file" (equivalent available)
  * Enable parallel builds (via ordered make target dependencies)
  * Include previously excluded top-level files in tarball
  * Other minor suggestions by Masahiro

Bastian Germann (5):
  builddeb: ignore or export files for clean pkg build
  builddeb: set CC on cross build to prefixed gcc
  builddeb: clean generated package content
  builddeb: introduce profile excluding the dbg pkg
  kbuild: introduce srcdeb-pkg target

 scripts/Makefile.package | 11 +++++++++--
 scripts/package/mkdebian | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.30.2

