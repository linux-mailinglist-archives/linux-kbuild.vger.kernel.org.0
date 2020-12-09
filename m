Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7802D421E
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 13:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731280AbgLIMZW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 07:25:22 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:36575 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731193AbgLIMZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 07:25:22 -0500
Received: by mail-wr1-f53.google.com with SMTP id t16so1535664wra.3;
        Wed, 09 Dec 2020 04:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=6x0GCUPcAfrZcQTRmWpRnm+GHCbccir9ezaJsmnqExQ=;
        b=KUKPMwnwNK79GVBkEO6jBCg5KCcV8L+52522fCCD3RLoigXshA+RJmVe3lDZeX6zee
         Y4Q3S3DSdLrLtzHtRn6BIedwv25zvaKiMHfxWpCekhIuruj3MMk/qmoH9/42C3nU850A
         P9eL9hSGg/ato01wJFIqknVFlrb2pTdcvM1dpDNPk9IcW8p9bVYV4JLYDFQr1AW+XRtK
         f/9WgzrN59dKeD3ojkZwHn3zBwKFgks9qyaWF+tGlZrWNoqqXRSz8FPmkjVEkFZ1MXb9
         qAqgrJaeD82i3k1jcdJ7lzE0oRGqaq5IK2NrAcur/McHk18EbD35V9DFuBknb1QWl4gA
         DZ1Q==
X-Gm-Message-State: AOAM531SSeD3o2IAbQVA/xxGzq4+DLvuMEs3Kufh9t1In+UodMAn82Nn
        qpXSverzKNa1hJNe9oLlxyFnIHUIaA4=
X-Google-Smtp-Source: ABdhPJzu9S9z0QpTjCK3645zlC/7S1P1B2FoljHaekxm2M3UCiXJEzQ42uX7SjDmMeQwsXZy+in4OQ==
X-Received: by 2002:adf:b343:: with SMTP id k3mr2398931wrd.202.1607516680222;
        Wed, 09 Dec 2020 04:24:40 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id e17sm2860390wrw.84.2020.12.09.04.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 04:24:39 -0800 (PST)
Date:   Wed, 9 Dec 2020 13:24:37 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dominique Martinet <asmadeus@codewreck.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Broken /usr/bin/env (invalid option)
Message-ID: <20201209122437.GA26815@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Dominique,

Your commit ece075366294 ("ld-version: use /usr/bin/env awk for
shebank") breaks current linux-next on Ubuntu 16.04:

    $ make defconfig

    make[1]: Entering directory '/mnt/data2/linux/linux-upstream/out'
      GEN     Makefile
    *** Default configuration is based on 'multi_v7_defconfig'
    /usr/bin/env: invalid option -- 'S'
    Try '/usr/bin/env --help' for more information.
    init/Kconfig:39: syntax error
    init/Kconfig:38: invalid statement
    ../scripts/kconfig/Makefile:80: recipe for target 'defconfig' failed
    make[2]: *** [defconfig] Error 1
    /mnt/data2/linux/linux-upstream/Makefile:602: recipe for target 'defconfig' failed
    make[1]: *** [defconfig] Error 2
    make[1]: Leaving directory '/mnt/data2/linux/linux-upstream/out'
    Makefile:185: recipe for target '__sub-make' failed
    make: *** [__sub-make] Error 2

https://krzk.eu/#/builders/12/builds/1170/steps/4/logs/stdio

It's not possible to build anything...

Best regards,
Krzysztof

