Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75EBD118B40
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2019 15:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfLJOlJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Dec 2019 09:41:09 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37705 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727345AbfLJOlJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Dec 2019 09:41:09 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 6954322480;
        Tue, 10 Dec 2019 09:41:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 10 Dec 2019 09:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
        from:to:cc:subject:date:message-id:mime-version:content-type; s=
        fm1; bh=QyRY1SH/TcZCYCqQzwGfCLBox8YaWx+EjaKhewFMq/s=; b=lpHjPuP+
        sElkQXi6GriJD0Oooj/CgBCmct25KCYWjWwpWmon6OBdR68ouEPaITKLQl8SOdZD
        52StJ5Wdc7/1GuLcvldMlcw6prrfVYTRA42q5kItSP3ljMUFN/WP5ArEWJJYp7iD
        pt3Jvp+dlZrzyjVDIDFBD0v53PzwlutNW6c27m9k7j+2xOUMqMOsgZf4wryMmCSU
        +Ke/sGSnlSHo+aSF2NcwoEy7Fep6MsGlH/Tub45rc+aNnqZ6UOlf6yHUaiYFNXtp
        S3u3W5J/aUNqu1fxwDlaCrY2KDRfs+//yHCdsSOeF4juz8Pz+6rMhLbdFPkzXRM4
        r8a9G38O8ZEjfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=QyRY1SH/TcZCYCqQzwGfCLBox8YaW
        x+EjaKhewFMq/s=; b=MNiyCRZaJ7w+0JHZW8F+zPkUKzRyGOHMrbod3X5SiZYKs
        wA5Xj+PA2v4uXsvWEorNrvj82MHBXbDdwNgEflQh7YGJUHDT5shfqTRtfIVsYE0n
        /b4rQgTI2u8TzW27e18UUMcDAC+HMhk2OjvZ9bfjOPHjHfnMSUoPQ6OrQFX1Z1U6
        m84GKDV7kSOm3OQqCdkpk1bOpW+VYcxemxhgAv+K7/WwXavHI/1Ye8q9nSgQbt7M
        kk0Ia3th8kTWOi27ng1zc4Xj56SPK0r/0a3udLJB81VUm5GxBpK6BiySl8CkY3Yb
        n10bhvBfR+L8luCuvMmXKeopQnwrjRqU2XnQLODvg==
X-ME-Sender: <xms:g67vXYoel1BAGTsg5iDOS_jPaGl0vrU5euYoodmCDDpXis6vguDHvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkfggtgesthdtredttddttdenucfhrhhomheptehlhihsshgrucft
    ohhsshcuoehhihesrghlhihsshgrrdhisheqnecukfhppeejledrvdefhedruddvfedrud
    ehfeenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhsnecuvehl
    uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:g67vXS7yJIqk4oiSO2_XD6hKzEA2mUFFtyY_hq6z_g_JW4pTpc2Vxw>
    <xmx:g67vXYNeY-tnl4HZSy6j_lpgqfwXOafnkXpKiH9Ve8Zo2H5KiQvbHA>
    <xmx:g67vXUP5-0mJChTthckGIKMo6Wb3gBHdc8tsSi1OJKbfBfr6xiY7tA>
    <xmx:hK7vXdzuISu9OFCA9EOrt6RULcUdpOrqe3i1oQSVvqvIHWtVU-0Cqg>
Received: from x220.qyliss.net (p4feb7b99.dip0.t-ipconnect.de [79.235.123.153])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6E1018005C;
        Tue, 10 Dec 2019 09:41:07 -0500 (EST)
Received: by x220.qyliss.net (Postfix, from userid 1000)
        id 33C301455C4; Tue, 10 Dec 2019 14:41:04 +0000 (UTC)
From:   Alyssa Ross <hi@alyssa.is>
To:     linux-kernel@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, linux-crypto@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org
Subject: Bogus dependency for HW_RANDOM_VIRTIO with oldconfig
Date:   Tue, 10 Dec 2019 14:41:04 +0000
Message-ID: <87wob4tf9b.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I'm new here and not sure if I'm contacting the correct people/groups --
please point me in the right direction if not.  I don't know if the
culprit here is Kconfig, the virtio Kconfig file, the hw_random Kconfig
file, or some combination of those.

I believe I have discovered an issue with the order in which make
oldconfig asks for virtio-related options, and would appreciate some
advice on how to solve it:

HW_RANDOM_VIRTIO=y depends on VIRTIO=y.  In my kernel, VIRTIO=y is
selected by VIRITO_PCI=y, but when make oldconfig prompts for
HW_RANDOM_VIRTIO, VIRTIO_PCI has not been prompted for yet, and so
VIRTIO is still set to m.

This means that it's not possible for me to set HW_RANDOM_VIRTIO=y using
oldconfig without setting an VIRTIO-selecting option I don't need, but
that is prompted for _before_ HW_RANDOM_VIRTIO.  One such option that I
have identified so far is VOP.  It is prompted for before
HW_RANDOM_VIRTIO, and so if I set VOP=y it is now possible to set
HW_RANDOM_VIRTIO.

When using menuconfig on a config file generated with oldconfig, that
does not have HW_RANDOM_VIRTIO enabled, I am able to set HW_RANDOM=y and
HW_RANDOM_VIRTIO=y, and after saving I can confirm that no other changes
have been made to the configuration file.  This tells me that there's no
need for a dependency on e.g. VOP, except when using oldconfig.

So, I think there is an ordering issue here, and that oldconfig
should not prompt for HW_RANDOM_VIRTIO until after any option that might
select VIRTIO=y.

I would be happy to try to submit or test a patch to fix this, but I
don't know where to go from here.
