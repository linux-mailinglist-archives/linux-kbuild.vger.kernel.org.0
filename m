Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD07819BE9B
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 11:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387784AbgDBJ2I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 05:28:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:49214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387722AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE5222074D;
        Thu,  2 Apr 2020 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585819687;
        bh=6NuIKa06JuBhIzAx4NV7mmY4eJMRHElqaJQJ06Ey6Dw=;
        h=From:To:Cc:Subject:Date:From;
        b=T1EmQBOdi0c/arhTL5zDnjC5vsqdYacLjOWLvQJ1ghRhTRhn9Rv9PcZmLSofp408U
         uxi5G+QlR685j2QbROP2dYYcq7qVIYB+SQd1kfggl/2O9pppimmZGxnj1GWIDo8xDe
         zA5uqDSV8qmqWs5lIknIjnE6D/Cg6H8FycuQiMns=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJw8s-000Aa3-0k; Thu, 02 Apr 2020 11:28:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/6] Fix several issues at qconf.cc
Date:   Thu,  2 Apr 2020 11:27:57 +0200
Message-Id: <cover.1585819250.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since its conversion to support Qt5, back on Kernel 3.14, the qconf.cc tool
has been having some issues.  With Kernel 5.6 (and Qt 5.13) it doesn't
work at all, on any of its modes.

This patch series restore its functionality to what it had before Kernel 3.14.

Now, all three modes should work as expected, and the layout will be shown
with a vertical split, with the help messages at the botton, for both Single and
Full modes.

The Split mode should also work properly, with its horizontal split showing
the main config items at the left and a per-items view at the right.

Mauro Carvalho Chehab (6):
  kconfig: qconf: clean deprecated warnings
  kconfig: qconf: Change title for the item window
  kconfig: qconf: fix the content of the main widget
  kconfig: qconf: fix support for the split view mode
  kconfig: qconf: remove some old bogus TODOs
  kconfig: qconf: Fix a few alignment issues

 scripts/kconfig/qconf.cc | 90 ++++++++++++++++++++++++++++------------
 scripts/kconfig/qconf.h  |  2 +
 2 files changed, 66 insertions(+), 26 deletions(-)

-- 
2.25.1


