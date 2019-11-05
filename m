Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2405F00AF
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 16:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbfKEPFB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 10:05:01 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:40929 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731090AbfKEPFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 10:05:01 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id CFDFA2CE;
        Tue,  5 Nov 2019 10:04:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 05 Nov 2019 10:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=XJJHGTd2q0bwU
        eTp9zByVLPaNxBLmq2W3jxYIPMWHgw=; b=HY96En7XaAbDG8C3xrSC5mFWboc5U
        MgRk+6EWdQArSNMYa8N673Iy4eYmWcy5LwpVPlgx46UioKXSK/TupWhvdqw5J6Um
        H5q6tLIQi6FP+OHezb2k9zAIrHbus1e6DjD+KWraNbwxoahJZKzbrx9TEOdaHs2P
        poHo9pfI9GKmv+2FTgsh7pWziSxM0xSssaB+2LmVmqy0Oc69IiuMlIDHfGO1ZEwk
        DNVxKEZhVXj6WZH+Qacz5K+/xi/MLJfNWnTxxoDuAe3TbRaRt7K6CoiaUb75E4p/
        7TtyaZLawyE+EYpnEoZhIg/WlrduDn/X9oivuJDseaop3RZwYCortEd3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=XJJHGTd2q0bwUeTp9zByVLPaNxBLmq2W3jxYIPMWHgw=; b=Gap45l1i
        vS1gZZSwtXag79ChRKuQQl0Y0Img0yfZ063VSuk55fGhrJCQlZfPjQ7s78AX9KBK
        Dj9zrQ08qWsQvZp5YZN7g5VfzNkbY1pA4zlqcEqJVlEfD8ku/AYNhU0p2SJj8bT+
        ARCDn+/GI/8Kvy70bLAVeaOIWe4ti1ytm00TO0Fh7kBiozRJqRZLzKfs/rWg75Y5
        gvu0L0DI50JH98rxH0acvMAud8CYpLl4yeBA+Z9v9EOz2E1dkXWWzcvhL5Rik1Aj
        a9tryngGwf/7IDLO3pD6dexK1OH/OJEAYOeOl+B0rhpiYCLMHybdRLYjxTIjZs8u
        RxbTHPN4x5lq/w==
X-ME-Sender: <xms:mY_BXYe5TBFXmLw1vpTb3H2lUu1pJb6oi_tJ9K5RaM1EDEhwQFDu7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudduhedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhihshhs
    rgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucfkphepkeegrddukeegrddvfe
    ejrdduudefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehqhihlihhsshesgidvvddtrdhq
    hihlihhsshdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:mY_BXec98weXmCTh7P__OAmYmR7llC5C5at8RfK1UX3uAIYfCe7SGw>
    <xmx:mY_BXUjSzRB4vWN8ZzTqWyR6_Nse8HKgZelM3zxc33gXxDMNTM3hYA>
    <xmx:mY_BXSRC7mte60bGOpBJ6ArqLwcIqifsVP1Za8VEMHMBKi2xaY-cmg>
    <xmx:m4_BXQMFM6T7vPTgeAg2AruJxKRYMTVIgk3Ik1Ncfqe-fuDOSQtjOg>
Received: from x220.qyliss.net (p54b8ed71.dip0.t-ipconnect.de [84.184.237.113])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4CB293060064;
        Tue,  5 Nov 2019 10:04:57 -0500 (EST)
Received: by x220.qyliss.net (Postfix, from userid 1000)
        id 7025F1400EF; Tue,  5 Nov 2019 15:04:54 +0000 (UTC)
From:   Alyssa Ross <hi@alyssa.is>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alyssa Ross <hi@alyssa.is>
Subject: [PATCH v2] kconfig: be more helpful if pkg-config is missing
Date:   Tue,  5 Nov 2019 15:04:15 +0000
Message-Id: <20191105150415.13098-1-hi@alyssa.is>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <CAK7LNATEUcoB8u-AYU6=hfS+NFbGEOV_9noCwGHWHNsqOK2e+g@mail.gmail.com>
References: <CAK7LNATEUcoB8u-AYU6=hfS+NFbGEOV_9noCwGHWHNsqOK2e+g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If ncurses is installed, but at a non-default location, the previous
error message was not helpful in resolving the situation.  Now it will
suggest that pkg-config might need to be installed in addition to
ncurses.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 scripts/kconfig/mconf-cfg.sh |  3 +++
 scripts/kconfig/nconf-cfg.sh | 14 ++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index c812872d7f9d..aa68ec95620d 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
 echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
 echo >&2 "* depending on your distribution)."
 echo >&2 "*"
+echo >&2 "* You may also need to install pkg-config to find the"
+echo >&2 "* ncurses installed in a non-default location."
+echo >&2 "*"
 exit 1
diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
index 001559ef0a60..569226f1b497 100755
--- a/scripts/kconfig/nconf-cfg.sh
+++ b/scripts/kconfig/nconf-cfg.sh
@@ -41,7 +41,17 @@ fi
 
 echo >&2 "*"
 echo >&2 "* Unable to find the ncurses package."
-echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
-echo >&2 "* depending on your distribution)."
+echo >&2 "*"
+if [ -n "$(command -v pkg-config)" ]; then
+	echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
+	echo >&2 "* depending on your distribution)."
+else
+	echo >&2 "* You may need to install ncurses"
+	echo >&2 "* (ncurses-devel or libncurses-dev"
+	echo >&2 "* depending on your distribution)."
+	echo >&2 "*"
+	echo >&2 "* If you have ncurses installed,"
+	echo >&2 "* you may also need to install pkg-config."
+fi
 echo >&2 "*"
 exit 1
-- 
2.23.0

