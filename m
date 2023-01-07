Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D806A660DAD
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jan 2023 11:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjAGKQq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Jan 2023 05:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjAGKQo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jan 2023 05:16:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54CA271B4
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Jan 2023 02:16:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49DAA60AE4
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Jan 2023 10:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40F3C433D2
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Jan 2023 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673086602;
        bh=rkJDIkBl3ZSE0jaDiEPxN/L389QTct8mzqQLw9qqMNQ=;
        h=From:Date:Subject:To:Cc:From;
        b=NZKJx7Jsm251wl9Yml4HWRuvg6jlfMwisJnB3bmWs72H6r4xK7b00N3Mu7uDMrN3v
         nPG69RjVjrG3sOf2T6dzA7OW8Bsn3tP2GHRaIhnPkX89eOKAgYGxDLcXTQYp/lr2uk
         qWKc2DCxnqHv5cvg5iieEcvBzHwr/lYdTRuNK74YVdrWpQADWtjo7+PbCZDsPLdq3j
         pSaxnCLjY25SB2k0u5Mo6+YKfnS4dHK1UJZ8W+hnKp2QhC89m3nJhyTpO+Xr7hrHyO
         ibV3ZfP2N5wjDfYSm6vGA5jVqF9xZnm5sdb1lOJeqp/eTdluhrpiz4vbGb9OY9PeJU
         Uv3X3zPq5kpZA==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1442977d77dso4056257fac.6
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Jan 2023 02:16:41 -0800 (PST)
X-Gm-Message-State: AFqh2kqv7+bQrBj5jhirTxKNRUi/2tEmPk+w6iqOHalJ1qXsEnzUlIjr
        ZJ1+/oZTZ/LHfh2OxTfsX1CxLlOPf1yS+Y5PPgo=
X-Google-Smtp-Source: AMrXdXvmEbVbVrBrfabMBmBobpDxTPhhZM70q1oVll6EWFkbSM2J13nz5tY7iGhkrTF3NbM40V8fgvKA4E96AeHo7B8=
X-Received: by 2002:a05:6870:cc89:b0:150:39e2:c688 with SMTP id
 ot9-20020a056870cc8900b0015039e2c688mr2635017oab.287.1673086600814; Sat, 07
 Jan 2023 02:16:40 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 7 Jan 2023 19:16:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
Message-ID: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.2-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Linus,

Please pull some Kbuild fixes.

Thank you.




The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.2-2

for you to fetch changes up to 735aec59afb18c3e2da0a637037e69ad62dbda6a:

  kbuild: readd -w option when vmlinux.o or Module.symver is missing
(2023-01-05 16:53:48 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.2 (2nd)

 - Fix single *.ko build

 - Fix module builds when vmlinux.o or Module.symver is missing

----------------------------------------------------------------
Masahiro Yamada (2):
      kbuild: fix single *.ko build
      kbuild: readd -w option when vmlinux.o or Module.symver is missing

 Makefile                 | 2 +-
 scripts/Makefile.modpost | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)


Best Regards
Masahiro Yamada
