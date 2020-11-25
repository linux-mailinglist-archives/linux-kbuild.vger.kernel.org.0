Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34ABC2C360D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Nov 2020 02:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgKYBGQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 20:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgKYBGP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 20:06:15 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BF5C0613D6
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 17:06:15 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id g17so640162qtr.8
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 17:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=LWSBBypiCceYz/1N+OWyFHqimM37DnMC7WIdp8v8J/k=;
        b=jyGmvyKvKBnpsECtCqsQ05tvZeBdxw4pog6NJbouHvSP9CR87rizr49l1VOfFiqmJd
         lsad/3QmnSzSrs3/Kt+zprZUgGWDWkrLtyul16lu9fL2M2GHRnmx+kftXIMCU3AeYebK
         FmVV08ySI2sYobf17rPqU/Z8jf48+GAJj6qiUakYYdAu/pV7ELgHuZH+kV8SYaxLeGck
         1AHM6g+tdIbe5osN/ZYrVRHFBWkU1dEV4KJNTfnppwxfQpKSHHFPJFKTNbm9xxO3BJq6
         6D0e6qhwpLUEpl4Heuo9r4j2d/hgPbt119r2vhKfFqbVRo6BH0oSke0+DDx/tZ9JSxWe
         3Sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LWSBBypiCceYz/1N+OWyFHqimM37DnMC7WIdp8v8J/k=;
        b=X79GMHN6CtKRViZ0tecQ/ay4HJAs/OMQ1POKYLJxFOty/1o/g5Ltrt+lxay39Iq1S5
         j8ygLXzH+Xe9FvonNkcIzLJKhqKeNm9SskoVfinsxfpd+xmSGEfj6FUvuRjfsikh5DRz
         3Pch3A2hz3nyftMxdx4bVT79aE70jQAM0FmZx76VNmZWAHTzSO8TBuhTtWWq4XNEgreQ
         hAfmNq1P/jJny/8kb7iJ49j6kMhUP0HZogM1SnLXe3trG5GvJ/um6B/mHeH7BG4/CmTZ
         aoqaIRT7sf9ILcuoEEM9SEfsbbfnKKrtBqftUAYMCXKnbEEtVDNpwkCOpwrqPXLrl8MS
         pWcA==
X-Gm-Message-State: AOAM53050yfxAFsUXS8G55U+IrDKIKmWUtbLuVdL9/Df5tw8d/m6XA+G
        oh+qLz5Y617zOI7WZ3eMdQ6dUWW1W2ww2b3ARMQ=
X-Google-Smtp-Source: ABdhPJxvBrygdk3HdeyKFg8OiHokuZgJARvcPMf5W/jLYdLDdZrass7OjAchUIBzbGPqv7UTIiHa6r/JHP55f2N2wQo=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6214:17c1:: with SMTP id
 cu1mr1033248qvb.32.1606266374502; Tue, 24 Nov 2020 17:06:14 -0800 (PST)
Date:   Wed, 25 Nov 2020 01:05:39 +0000
In-Reply-To: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
Message-Id: <20201125010541.309848-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2 0/2] Adds support to capture module's SCM version
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

I have updated the patchset to:

 *) Include Documentation.
 *) Use a consistent output pattern for the SCM version.

In my debugging, I found that the vermagic reported by modinfo can actually
vary based on how the module was loaded. For example, if you have a module in
the initramfs that is newer than the module on disk, then the initramfs module
will be loaded (not the one on disk) during boot. Then, when you run the
command:

  $ modinfo MODULENAME

The vermagic returned will actually be the vermagic of the module on disk and
not the one in the initramfs which was actually loaded. With that being said,
adding this scmversion attribute ensures that you can *always* get the correct
SCM version of the module that loaded.

Please take a look at the updated patch and provide any comments you find.

Thanks,
Will

Will McVicker (2):
  scripts/setlocalversion: allow running in a subdir
  modules: add scmversion field

 Documentation/ABI/stable/sysfs-module | 17 +++++++++++++++++
 include/linux/module.h                |  1 +
 kernel/module.c                       |  2 ++
 scripts/Makefile.modpost              | 20 ++++++++++++++++++++
 scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
 scripts/setlocalversion               |  5 ++---
 6 files changed, 65 insertions(+), 4 deletions(-)

-- 
2.29.2.454.gaff20da3a2-goog

