Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142E7351087
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Apr 2021 10:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhDAICL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Apr 2021 04:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbhDAIBx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Apr 2021 04:01:53 -0400
X-Greylist: delayed 459 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Apr 2021 01:01:53 PDT
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16122C0613E6;
        Thu,  1 Apr 2021 01:01:53 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4F9wcv3lyCzQk1Y;
        Thu,  1 Apr 2021 10:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:references:in-reply-to:message-id:from:from
        :date:date:received; s=mail20150812; t=1617264108; bh=5V1MdvL7YC
        8mVZKfU9szLtKJFoYBtXMkN3Yon1JEiHM=; b=G0AyDYnBdxfI9/snr0bPAutkON
        LpO7nRJbVUa5KRfAN/ryNMnK7qBm9ncSpJ1546u9AFdXqkYGD+gxD+5jf4XgV3wa
        72J2u25OnsGMithZo2aObiDBYikj1aY4AWNxUyslpQBXx9u1IC5vvYJkv0KA/GQ+
        HGDuyBJsfAxJY7op1FS0leU12OfXE5hIoWGd37GUZccbagHtHG2Pt2BdQQJOkp2j
        JUdFkupizo0yzuLCSEBKwDRiZ9DBp90vx0F/kOIHCXhtiGG/M9UZoLuXIsZrSRGv
        aeUNB7jYSsik1DuelN7mZ3WA3RB4o9S85z1F+oCJ2c5iBELIiyBXnp5BElNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1617264109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5V1MdvL7YC8mVZKfU9szLtKJFoYBtXMkN3Yon1JEiHM=;
        b=KQ/vkqM1BHlzIDsPMdL72r2R3771zg144k5E9+uDpVxONOJWPra9ZnaEdjbSUpjq75O5dW
        jCH/EPncm714aD8hehSf9pq3OTLTYOZpmkkZH2EYzPcrLFJWuGmurLR25WPZWAdb1FNf1D
        qi7Tori3uzRe0goEYmiNqdzI1bzI8qZn7ZYpR57WuYe7+B6ycNZgi3DpgKmp+gyD0O9cfu
        QlOlmh/UriKDmn3i5rn5hepsmlMnva7qzvV56GKSuV4Ekn4MBsknTYzbPiOawURZ7lfSUJ
        Axmao3NFqStM0bybgx2fzPXyOVSlCvOM2qW2JMRHiCm7xPc67E/cRwPKp+N06w==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id cm216P1dCBau; Thu,  1 Apr 2021 10:01:48 +0200 (CEST)
Date:   Thu, 1 Apr 2021 10:01:47 +0200 (CEST)
From:   torvic9@mailbox.org
To:     =?UTF-8?Q?Piotr_G=C3=B3rski?= <lucjan.lucjanov@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "oleksandr@natalenko.name" <oleksandr@natalenko.name>,
        "terrelln@fb.com" <terrelln@fb.com>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>
Message-ID: <1118697629.5907.1617264107835@office.mailbox.org>
In-Reply-To: <722602000.5829.1617263646814@office.mailbox.org>
References: <722602000.5829.1617263646814@office.mailbox.org>
Subject: Re: [PATCH] init: add support for zstd compressed modules
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 1.19 / 15.00 / 15.00
X-Rspamd-Queue-Id: 68D8A17BD
X-Rspamd-UID: f965c0
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks Piotr, good work!
Question: Is `-T0` really faster in this particular case than the default `-T1`? Are modules installed sequentially?
I also saw that Masahiro did some work on modules_install, moving MODULE_COMPRESS from the base Makefile to scripts/Makefile.modinst, so perhaps this should also be moved there at a later point.

(sorry for double post)

Tor Vic
