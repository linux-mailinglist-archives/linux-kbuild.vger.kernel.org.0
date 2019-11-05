Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26754F00CA
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 16:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388842AbfKEPI2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 10:08:28 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53077 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388292AbfKEPI2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 10:08:28 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 5272042B;
        Tue,  5 Nov 2019 10:08:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 05 Nov 2019 10:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=xzppQS9xMepOy
        GoA8pWwoXrtkg7wapM6OGQalRg1FfA=; b=Q1bT5VAdayP9qSmsEsnJ8PC5P+SGp
        GVHLZbV5QVHzpfZ2uF1UyQ15SwMHstaXpi0rKQcdOv2jfeqk4kqOz/4QUhUKDfho
        CKUmbhfx/u/tbZ7ybsqVeLMXpVFSohYhzk6muCTdfSSKpzquBwj2TSqUMuUTLpEq
        lNwO3kzpW2NfULJSq+aj7XtVBvkWmVUDBw5X07dl8DcA4mojb/okph6En3Ll0Mt9
        /ovSdDd/T1HTgN1owxu9yE/hBf+Rz4Xvbw0rvYZ4qy4EkUJ7slBs1nwuT/u17PvN
        B8kE4XpCx0pLy20VpESagSmmUNjmg8DVjctHdmnbqRjkw9ajk4ySDx//Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=xzppQS9xMepOyGoA8pWwoXrtkg7wapM6OGQalRg1FfA=; b=Vx1eI0Eh
        e/3GZUFWwetM9ctlkIIp5fkmNzB8Q8z6vWMI9bGZFhdHUMZxuZKaQinRulCGCnBu
        cdeC4Frj9nmIfILfneqk+R9BEGDEmXpnBMN6catEHUiDFbCTp34tGqGmS+/TQ8Cp
        9SfddEKz3lOmWS7Aq8amvNuwoQ2/ac6JIFobZNMoVmfaC3+RsSSD8gc9shOLVEot
        oqRRglLpePZsbcT2hGGoNmJ5QJxN1oezo1VOwuTSqUo72kWBUh3N/djR7I9SasoY
        oY9CiEY9e95rWldqTyq/LU+PKMyAZYSZYYqHBNfxEx+30lOhcvO4YbDPdCGWcK2Q
        K5gd074ak7erQA==
X-ME-Sender: <xms:aZDBXQTIjSdA6jelVxB6PsJq6sYQbfT9VPncxXCouf-339K1_cKqug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudduhedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhihshhs
    rgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucfkphepkeegrddukeegrddvfe
    ejrdduudefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehqhihlihhsshesgidvvddtrdhq
    hihlihhsshdrnhgvthenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:aZDBXU7z4IdA0huHxAF3c-SMBFxnzhDPTmKBcDCLPUoItTKp5beKgg>
    <xmx:aZDBXQMpItWZW7qzidtzXUWdh1_XVMuaFwmT-kERRNEPpL2fgMp3zg>
    <xmx:aZDBXdsSiJbMrSdTdIIXpxmQZC8PtJMtcA_CR3azTt6LjAnLM2Ap4Q>
    <xmx:apDBXR6KKVUqMSx4akkVTshxMXiY5SuP0ps_yj-7msxybqcgx7TZWA>
Received: from x220.qyliss.net (p54b8ed71.dip0.t-ipconnect.de [84.184.237.113])
        by mail.messagingengine.com (Postfix) with ESMTPA id 66BD8306005E;
        Tue,  5 Nov 2019 10:08:25 -0500 (EST)
Received: by x220.qyliss.net (Postfix, from userid 1000)
        id 535671400EF; Tue,  5 Nov 2019 15:08:24 +0000 (UTC)
From:   Alyssa Ross <hi@alyssa.is>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alyssa Ross <hi@alyssa.is>
Subject: [PATCH v3] kconfig: be more helpful if pkg-config is missing
Date:   Tue,  5 Nov 2019 15:07:36 +0000
Message-Id: <20191105150735.17200-1-hi@alyssa.is>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105150415.13098-1-hi@alyssa.is>
References: <20191105150415.13098-1-hi@alyssa.is>
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
Apologies -- was a little too hasty in sending v2, and it only
included the updated message in one of the two files that needed to be
changed.

 scripts/kconfig/mconf-cfg.sh | 3 +++
 scripts/kconfig/nconf-cfg.sh | 3 +++
 2 files changed, 6 insertions(+)

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
index 001559ef0a60..c212255070c0 100755
--- a/scripts/kconfig/nconf-cfg.sh
+++ b/scripts/kconfig/nconf-cfg.sh
@@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
 echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
 echo >&2 "* depending on your distribution)."
 echo >&2 "*"
+echo >&2 "* You may also need to install pkg-config to find the"
+echo >&2 "* ncurses installed in a non-default location."
+echo >&2 "*"
 exit 1
-- 
2.23.0

