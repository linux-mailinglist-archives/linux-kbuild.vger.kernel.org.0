Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89E529F086
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 16:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgJ2PwV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 11:52:21 -0400
Received: from codesynthesis.com ([142.44.161.217]:46800 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728491AbgJ2PwV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 11:52:21 -0400
Received: from brak.codesynthesis.com (unknown [105.184.207.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 305B55F126;
        Thu, 29 Oct 2020 15:52:20 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 9583E1A800C4; Thu, 29 Oct 2020 17:52:16 +0200 (SAST)
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>, linux-kbuild@vger.kernel.org,
        Boris Kolpackov <boris@codesynthesis.com>
Subject: [PATCH 0/2] kconfig: header inclusion cleanups
Date:   Thu, 29 Oct 2020 17:51:50 +0200
Message-Id: <20201029155152.2467-1-boris@codesynthesis.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add missing and remove no longer necessary header inclusions.

Boris Kolpackov (2):
  kconfig: make lkc.h self-sufficient #include-wise
  kconfig: clean up header inclusion

 scripts/kconfig/conf.c     | 6 +++---
 scripts/kconfig/confdata.c | 4 +++-
 scripts/kconfig/lexer.l    | 1 -
 scripts/kconfig/lkc.h      | 4 ++++
 scripts/kconfig/symbol.c   | 3 ++-
 5 files changed, 12 insertions(+), 6 deletions(-)

--
2.29.0
