Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E800C78E8EF
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Aug 2023 10:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237697AbjHaI7i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Aug 2023 04:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjHaI7h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Aug 2023 04:59:37 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094C1CEA
        for <linux-kbuild@vger.kernel.org>; Thu, 31 Aug 2023 01:59:35 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7a294a4ee4bso336435241.0
        for <linux-kbuild@vger.kernel.org>; Thu, 31 Aug 2023 01:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693472374; x=1694077174; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3obhhr1c1tp+Q041IXHHUVhbx7xv5G8BTXj38JrnreM=;
        b=GPNAGWxsQv+q++H+/wYyFc0yAeDtn2o4CxOawf4aTgwHmwekXi5gAB7pBjoco1dVOB
         9tsv/Y+DQy6x0A05nz/ZCDwu+8lkXCaoA7hOxHZx3uP4kpBGz2siLv02J3srB+Y0EUTO
         Z3RGw01PfZZgFgshdjzSIFtMz0wDXd3LcMnig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693472374; x=1694077174;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3obhhr1c1tp+Q041IXHHUVhbx7xv5G8BTXj38JrnreM=;
        b=Fkns+b4zE7htWk1z5kffslJSxmv0NgW8E7NQSvkGPEhtQ1r+fcxF7UUKMu3gfne24P
         4orFVv1jsbWqx2jfM436vY1Ca00LBIL5iYLPlWfIiFZO+AcH1wpkUfqbE9QewJk3pZYQ
         sug1bmFLDetnsxhtoKpN63dTTwUIWsXbSkVxglgHU/5eVpsB5x8WhVr2HQgjBHNfeVcH
         Eq5RYz9n/gfp7GFb16mCX5YK52di1NPU7YrTQ5Z0DbEIF3QMU6Yjfb2EVWLqeUUUdSAh
         fweBzcmWii3AWZNzU3iWN4b3VOs5kbQv5m98pNpMaEUFL/UxGUxpC3TqhlrP4ZwqJpb6
         7eHw==
X-Gm-Message-State: AOJu0YwwgpTumyaC1oh0ln6d2sad63qWLG/tLigpvAxQWibTZYmUywa9
        TV0t0C3k88idw2rcUCET9OaRnLCWf3RPNB99E4rqXHhO4IGU2DrdV9A=
X-Google-Smtp-Source: AGHT+IEQ2ffuD+cjVttRxz6RtT7d42haXSyrFyza9dITNK50OlkvqQ7l/Qq4AIaNydGVmlD08Fjn4977y5npq/7Vf4M=
X-Received: by 2002:a67:be0f:0:b0:44d:4c07:f203 with SMTP id
 x15-20020a67be0f000000b0044d4c07f203mr957608vsq.17.1693472374138; Thu, 31 Aug
 2023 01:59:34 -0700 (PDT)
MIME-Version: 1.0
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 31 Aug 2023 16:59:22 +0800
Message-ID: <CAGXv+5EU-qvTee1f0kicZA-er2Li=EcV0zWdOGUPoqdOxi69vw@mail.gmail.com>
Subject: make -jN modules_install breakage in next-20230831
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Cc:     linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I observed some breakage with `make -jN moudles_install`. The scripts produce
some bogus paths, which `cp` then complains it can't find.

I run the following for my workflow.

  $ nice -n 10 sh -c "make -j72 Image.lzma dtbs && ./pack-mod.sh && cb/sign.sh"

pack-mod.sh is what fails. It basically does:

    make -j72 modules
    make -j72 modules_install INSTALL_MOD_PATH=${TMPDIR}
    depmod ...
    tar ...
    cleanup

I get errors like the following:


  CALL    scripts/checksyscalls.sh
  CALL    scripts/checksyscalls.sh
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/arch/arm64/crypto/sha1-ce.ko
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/arch/arm64/crypto/chacha-neon.ko
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/arch/arm64/crypto/poly1305-neon.ko
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/kernel/time/test_udelay.ko
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/kernel/configs.ko
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/fs/nfs_common/grace.ko
cp: cannot create regular file
'tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/kernel/time/test_udelay.ko':
No such file or directory
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/fs/nls/nls_cp437.ko
make[2]: *** [scripts/Makefile.modinst:127:
tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/kernel/time/test_udelay.ko]
Error 1
make[2]: *** Waiting for unfinished jobs....
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/fs/nls/nls_ascii.ko
cp: cannot create regular file
'tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/kernel/configs.ko':
No such file or directory
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/fs/nls/nls_iso8859-1.ko
  INSTALL tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/fs/nls/nls_utf8.ko
make[2]: *** [scripts/Makefile.modinst:128:
tmp.7i3QCV3ac8/lib/modules/6.5.0-next-20230831-13697-g09d3bd189478-dirty/kernel/kernel/configs.ko]
Error 1
make[1]: *** [/usr/local/google/home/wenst/linux/mtk/Makefile:1822:
modules_install] Error 2
make: *** [Makefile:234: __sub-make] Error 2


Note the duplicate "kernel/" in the path for test_udelay.ko and configs.ko.

If I revert commit 3ee3181f8721 ("Merge branch 'for-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git"),
then everything works again. Not sure which commit is to blame though.


Regards
ChenYu
