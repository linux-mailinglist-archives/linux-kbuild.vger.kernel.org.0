Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514C520EE49
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbgF3G0q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:26:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:55636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgF3G0q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:26:46 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A6B520672;
        Tue, 30 Jun 2020 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593498405;
        bh=Zv20vQGNRuS4lmSmXZR/J0h8QfiRZt1k6Qe9cCldUuI=;
        h=From:To:Cc:Subject:Date:From;
        b=fqfMGcCk4bMPWw1jDAvvVz8OSOTx8OhMcXFQOTWdwrlg/kQVcnPAUmt6torPtx4Zn
         ZXNmP6jKGnYEd83+uIvDXsVJWAmDgYSnCQ4fsKdPh/WeZTQSESpdO5lej9JwqHkEY2
         pXb0R/VNeXrqyEvlw1Rk0gpF2hpM0KtoC4weEz7w=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jq9j9-008Wam-Ll; Tue, 30 Jun 2020 08:26:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/7] Fix split view search and debug info navigation
Date:   Tue, 30 Jun 2020 08:26:34 +0200
Message-Id: <cover.1593498345.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This series fixes some issues with search while on split view and fix the
broken hyperlink navigation.

The first patches restore the pre-Qt5 conversion behavior. The last
one implements navigation on a different way. I opted to keep this one
in separate, as this one is a new feature.

-

v3:

- dropped a patch that it is not needed anymore;
- hyperlinks should now work for non-visible items;
- fixed a description at patch 3.

Mauro Carvalho Chehab (7):
  kconfig: qconf: cleanup includes
  kconfig: qconf: make search fully work again on split mode
  kconfig: qconf: make debug links work again
  kconfig: qconf: re-implement setSelected()
  kconfig: qconf: simplify the goBack() logic
  kconfig: qconf: don't show goback button on splitMode
  kconfig: qconf: navigate menus on hyperlinks

 scripts/kconfig/qconf.cc | 169 +++++++++++++++++++++++----------------
 scripts/kconfig/qconf.h  |  29 ++++---
 2 files changed, 119 insertions(+), 79 deletions(-)

-- 
2.26.2


