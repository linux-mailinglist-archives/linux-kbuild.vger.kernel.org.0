Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA42420D80F
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2020 22:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732249AbgF2Tf0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 15:35:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:44032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730801AbgF2TfP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:35:15 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EB8520672;
        Mon, 29 Jun 2020 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593444620;
        bh=nq/3u9dL+NpcA+VdPdDb5yrAY3dUfopzZqsU7+8108A=;
        h=From:To:Cc:Subject:Date:From;
        b=UiTkgXKue1u1YVBAqngVCkhOgulfHMdfnLZEEWDCY/co470a08KLv9aANHwZaG3WU
         T5marLFtwl+o09Ed/sBO34ps6Kf7YVMwjtHrATod/LAJL/wDxcv0kiA8mWmfqhAVz2
         v741836WMzRBZvnM5+TNZnqd4+6L1mgWwLAk3vCM=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jpvje-007CSt-3M; Mon, 29 Jun 2020 17:30:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 0/2] Clean up goback logic
Date:   Mon, 29 Jun 2020 17:30:15 +0200
Message-Id: <cover.1593444492.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Those patches cleanup the goBack logic.

The first patch removes some unused stuff and makes the goBack
to work only on singleMode.

The second patch ensures that the goback button won't be shown
on split mode. While not clear at the logic, it won't show either on
full mode. So, the button will only show on single mode, with is
compatible with the current goBack() implementation.

Mauro Carvalho Chehab (2):
  kconfig: qconf: simplify the goBack() logic
  kconfig: qconf: don't show goback button on splitMode

 scripts/kconfig/qconf.cc | 55 +++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 34 deletions(-)

-- 
2.26.2


