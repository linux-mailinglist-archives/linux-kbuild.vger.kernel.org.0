Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223BD661116
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jan 2023 19:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjAGSnR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Jan 2023 13:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbjAGSnQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jan 2023 13:43:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAAC482B3
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Jan 2023 10:43:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2789FB802C4
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Jan 2023 18:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C29B0C433EF;
        Sat,  7 Jan 2023 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673116992;
        bh=7y0ii0V5eIVZvh1u+jhGken8Zwt5dxFLiW5P+vAC7P0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=RIkIs5/nGqHmIRcBoG7ghzvSyugnOqbIIepe3jttHpacHr/QQnwrDzEX1k6rKBj/x
         e2XwezsopmVTNSKro+28VykaCaHetC0Wunw1FybUgrNenUJ/ffqIAebR/ESmWmvqBE
         UODyJiAdzM4tGIEiLQB5My8T1cSTmkCh03gENRmtR2BQSwW5sMRB6YvBROB3aAErht
         Cu+Ufy8+LZd9n6uAmRd1PF2r57V53OmlNheK4Vpxp7YZTfY59La5esgioUDsu7q9aK
         g+hE75bX9KPigv717reOCxAYC58OxOb7iqHZpsQtvQ2h+f63+Bu+X4Xnw1b5eplwxf
         XVpEbINkZnQ+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9D63E5724A;
        Sat,  7 Jan 2023 18:43:12 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.2-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
References: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.2-2
X-PR-Tracked-Commit-Id: 735aec59afb18c3e2da0a637037e69ad62dbda6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7c4127a29ce222c9fa4fb4ae5b15e182a1ee5c9
Message-Id: <167311699268.9095.10330813377295740669.pr-tracker-bot@kernel.org>
Date:   Sat, 07 Jan 2023 18:43:12 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 7 Jan 2023 19:16:04 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7c4127a29ce222c9fa4fb4ae5b15e182a1ee5c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
