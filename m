Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE8C4424E2
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Nov 2021 01:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhKBAxc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 20:53:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:48638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhKBAxc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 20:53:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DDBF26052B;
        Tue,  2 Nov 2021 00:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635814257;
        bh=g45dLqWom2UdJNNut6ZLhl2OWeLMplRUVSgsw/zzjSM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=CohSnDhPnaYAyL7RzROQEbDtm+nEfj8tr8WRbDD3KlaAbwmlYwkSnJVcvz35vmS6w
         opwh6VKBvtpzRpe3T236IVlsXo7uXbE3Er988VdHfEbTUxMNardbSEtbaoJ8GjbEEH
         OktRfQSXcnUTu2poIpMDZwOG40sFOAkwnRDjYKjvdXluFdHyRmwD9G/mIIn7Vf+zRu
         DIJLAjCKqxn3vQLtjYrNqbTEvIWx1LHwfUYHLQ3WRmrpTOeLJRKL3di6+/B5TS/RfJ
         TmI7xIpoS3fYylXCYus1rxKFP1ls04GzXE+1684H2Rc0sZP7R+oWc2DiQbA4DmpVh+
         vwifQnRoEPVTg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C8AE560A0F;
        Tue,  2 Nov 2021 00:50:57 +0000 (UTC)
Subject: Re: [GIT PULL] hardening updates for v5.16-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <202111010917.75B96F4E@keescook>
References: <202111010917.75B96F4E@keescook>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <202111010917.75B96F4E@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v5.16-rc1
X-PR-Tracked-Commit-Id: 6425392acf24b6d469932dd1b217dc7b20d6447f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f594e28d805aca2c6e158cc647f133cab58a8bb4
Message-Id: <163581425776.14115.13508046273767600131.pr-tracker-bot@kernel.org>
Date:   Tue, 02 Nov 2021 00:50:57 +0000
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        James Morris <jmorris@namei.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, "KE.LI" <like1@oppo.com>,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Will Deacon <will@kernel.org>,
        Ye Guojin <ye.guojin@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 1 Nov 2021 09:20:52 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v5.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f594e28d805aca2c6e158cc647f133cab58a8bb4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
