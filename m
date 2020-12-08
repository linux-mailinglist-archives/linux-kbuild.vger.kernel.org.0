Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A8C2D3354
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 21:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731360AbgLHUQM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 15:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731107AbgLHUNB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 15:13:01 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2A8C061793
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Dec 2020 12:12:13 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id l8so3121268ybj.16
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Dec 2020 12:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=iPNyURoyyg37PtP5buaF7be4u+mklyusgvVkQ9lf5c4=;
        b=d8kI5DC6RP4DJ49rtv3HRDmO4lX8xauTeqDg/yxTGOoLSDqV4wdfCyFv+CcWvtjldX
         4ejQ3sBafhcxKGySlAHEv1lExckfO6zdtRI3cxmx+Ps0/PWoqXlh3RLRpjVB8eeFRVTq
         5BuqliT5XjXJdQBUHIet86bv4wvG53o48LmzyhRCFmL5UfX9v3Z1Dmh5U1T2edPYRjYL
         Gq0RyizZJ+a2Das9vAKJIf17GswbLZ/KzC9s/vsYO/GA5lZko3lLclFbZ0k7yRwaHg0S
         g7jUg2MRJ7776jHriyV4cRG32UwIwgIKjnpRF2H/P7xImiQdCgVrcUHZFHZC3xzUylYD
         PfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iPNyURoyyg37PtP5buaF7be4u+mklyusgvVkQ9lf5c4=;
        b=DIk/SmbJe+Dz2aYE7LSY3iVR8SVjvLwd0lVrL9i0qurvVABmi1U91xLFBpzvJbee5r
         gg60TcJh/fDkzeK9cp7YIuhgMnaIUKN+zMyo+0NDoMWQkb2MBr3bdR7rPtwvnqvBM0wS
         Ddo3dUY8rEai9uZNq5XGTVpJna2wLSp9qE1SlMLn+RPdisvSB9Kz/O1jGq3hR1hRBceq
         lLJ7wcq5fte1sNKX9cNC1W5O1y9t50Rp5cTgBoKdJPCZMb64JlDgf7snrCVc9YWgM20l
         I59Znj7g7HrglgwSLvgr/Nr0Ru0E0WMikqE+XIAeMkXWjwLVoMZduxbG4WZIRB+5mCMD
         DOrw==
X-Gm-Message-State: AOAM530DUT8FZJN5PuqVhYjR8BGDjjR7QNjmFKLeoYkSAdPoxnTDHMRA
        y66scNL58ErpzvaSo9Wg1oXD4zp7eg9ONWsaVvw=
X-Google-Smtp-Source: ABdhPJwMJgfuO061kxGkmUoA9VEBMsGmQvj/8WZA4Ev6G7KxHkHqqvemJJmaP6cJeK0oakrTQPUUr/G0FMzTPMjrftk=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a25:cb45:: with SMTP id
 b66mr27002244ybg.185.1607457914395; Tue, 08 Dec 2020 12:05:14 -0800 (PST)
Date:   Tue,  8 Dec 2020 20:05:06 +0000
In-Reply-To: <20201207153116.GA15772@linux-8ccs>
Message-Id: <20201208200508.4107399-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20201207153116.GA15772@linux-8ccs>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v3 0/2] modules: add scmversion field
From:   Will McVicker <willmcvicker@google.com>
To:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi All,

Thanks Jessica for the feedback! I have updated the commit message to
include the justification and common use cases for the patch series. I
have also added the config MODULE_SCMVERSION so that this is not enabled
by default.

Please take a look and let me know of any concerns or issues found.

Thanks,
Will

Will McVicker (2):
  scripts/setlocalversion: allow running in a subdir
  modules: introduce the MODULE_SCMVERSION config

 Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
 include/linux/module.h                |  1 +
 init/Kconfig                          | 12 ++++++++++++
 kernel/module.c                       |  2 ++
 scripts/Makefile.modpost              | 22 ++++++++++++++++++++++
 scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
 scripts/setlocalversion               |  5 ++---
 7 files changed, 80 insertions(+), 4 deletions(-)

-- 
2.29.2.576.ga3fc446d84-goog

