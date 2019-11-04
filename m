Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D50DEEA10
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 21:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfKDUrm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 15:47:42 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47545 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728392AbfKDUrm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 15:47:42 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 81A4A21B4C;
        Mon,  4 Nov 2019 15:47:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 04 Nov 2019 15:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=XmRwftF81yg852f+UvjXfdQjfz
        O1tQWIo/qB1nRcCIM=; b=RCT4Y9KaK7JUgkB0GJjZKwT63HfUP8OSbRYq0dhFrB
        XkJErq8NyARygfMeYWy3KGL3X176f6aps41+M2opU7N9DRgsnLDIg4RCeaF+av53
        3F+sAxki+oRjbbQo9W/uDxR+QaRmU3V7y/g3gzXPyb6bLHeBONCv4Dd+KdzvO8ne
        eaal/GNltBJJKI8yHImoNcSiPos5e7G+sl/2brX+rzyJJhD93UXT9icBAvcHL7aX
        wxBjBGEcYOjofIrn2eX+wANDD4v3U67p81gphGS2eAWbap+0LF/SUp9fCwnCE8Hx
        JfcxqFEqVwtylBuL0aFIbJqD8ibXxs8vROq35kWhADtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XmRwftF81yg852f+U
        vjXfdQjfzO1tQWIo/qB1nRcCIM=; b=UtbmnlplIaNObTZGtWoQCXfoAFA0vDkQu
        pVK8J94JkNfA0gZ5wnGWIBzLoNz9Yy4AVdhOzUwRjrYI5sZtnnkI/km31g+UpYV3
        11nP1TaPgr63m1PjrSGUs/T0wI7Ll/3RjAXzAHRTo+oSoiCpGSLXn/i7qmXZpalE
        E/q2hLZZSsBcd5Taf4o6pVeumxwNu32O2rSmD5DVoBF5fTadBjShRDCBoqm8mt0X
        p1W0wDXwh44PULFz4ujtd6PrrL0WvW4GokJyRi3Mh2XMl+EBCqlXq6NbGT9gCAUO
        xfqkQD8nPlxA/ukockdrGiQXQvN5NeLXqslwdtqWbfvoneEE82t2Q==
X-ME-Sender: <xms:a47AXeT4srDBpkPPaBG_APvd0RZ58LMryC6fHhkiyISLqqk2vMwTvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddufedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlhihsshgr
    ucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecukfhppeekgedrudekgedrvdefje
    druddufeenucfrrghrrghmpehmrghilhhfrhhomhepqhihlhhishhsseigvddvtddrqhih
    lhhishhsrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:a47AXeFN2yHZt7auarc7NqlOxcsb_xwyP_cf-bRJDjYWCReypLRZJw>
    <xmx:a47AXWE5JBnJC8Ax7DkDHXcMXu1yQbAJqeFygfZCWZt-mnQIskK17Q>
    <xmx:a47AXQSJFynteyOeVPSOLd9wZECsDmfgHHcBHRE5XAf2qfqBpNRXhw>
    <xmx:bI7AXQ2JYH0docpGusjS_K-wPBKnSOtjrjveueewWgCqTf6i68QkLw>
Received: from x220.qyliss.net (p54b8ed71.dip0.t-ipconnect.de [84.184.237.113])
        by mail.messagingengine.com (Postfix) with ESMTPA id 013E63060060;
        Mon,  4 Nov 2019 15:47:39 -0500 (EST)
Received: by x220.qyliss.net (Postfix, from userid 1000)
        id 24E841400EA; Mon,  4 Nov 2019 20:47:36 +0000 (UTC)
From:   Alyssa Ross <hi@alyssa.is>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: [PATCH] kconfig: be more helpful if pkg-config is missing
Date:   Mon,  4 Nov 2019 20:44:54 +0000
Message-Id: <20191104204453.20115-1-hi@alyssa.is>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If ncurses is installed, but at a non-default location, the previous
error message was not helpful in resolving the situation.  Now, if
ncurses can't be found, and pkg-config is not installed, it will
suggest that pkg-config might need to be installed in addition to
ncurses.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 scripts/kconfig/mconf-cfg.sh | 14 ++++++++++++--
 scripts/kconfig/nconf-cfg.sh | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index c812872d7f9d..f547b13f77f6 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
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

