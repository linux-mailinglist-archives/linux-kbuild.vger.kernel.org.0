Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7CCAC96E8
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 05:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbfJCDSq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 23:18:46 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:35154 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfJCDSq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:46 -0400
Received: by mail-pf1-f170.google.com with SMTP id 205so796815pfw.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:user-agent:date:from:to:cc:cc:subject:references
         :mime-version:content-disposition;
        bh=WJnoA0tm0M/WLiofepjSBGZEGRAkvj4KkExcBG2Bxl8=;
        b=Zqe3pHuiOriFsz1qveHW1/gKrVb4Pt2571mTRh6kf0+Svyz6zH88gl7AxibwL1F5zx
         8l6oht5HFvFnW4VHpgDzKKD9N29nqF5JcnPX4snxQMVJoRTWEn+DRoW95AYFmouwRIbe
         8OsZ1pJ95iik0TLjNEhMobPV6Cd1I0tNaeT+zLCeAV8j2h5g6eoqWTPozPjde4lljQad
         8cfmDBqHuG1u5KtWh2HewS9A1vNqdtKWgeG/ngf9Mm2XOKTi7LpKmZgEh3FHQD4Y7EmJ
         9z/ZEAbjA4MQhxprgIm1xd6QUnViQtBj7xSBVevQlYp+kYxjDzGoARgD8z6a8pfZ6YGN
         pDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:user-agent:date:from:to:cc:cc:subject
         :references:mime-version:content-disposition;
        bh=WJnoA0tm0M/WLiofepjSBGZEGRAkvj4KkExcBG2Bxl8=;
        b=i7mNDFlm8A+6X1YRwLtfB6HNYsunzHAPQmlat/LeuqLDm+UWz7E35JpiM74J0hOGJB
         bEpDdJ/2xpQ9qSFFwX9NE+E+Xe6N/uweb0/ifSlNSX6Ki6lLvEm61xIUQFVlcXL6GXju
         X9sZud7HbnF/Bzl6SMoINvkZLbV/MjDOG0fRWewK40Wxox0XjubIlXCnNgeQ9btiVWqh
         uOGWON8J/1KADIF98v1HX/jnjVHESsuGV+nJ9LEzn6seNwpkO2nvEIYGWftFtMVplmXZ
         nm/A7QlhCof1SAn+YBDMCkLMLvHEj6xAVNQTwA/RCbkgKF35XUkhPYSByc8mv6Sx8z0T
         fe1w==
X-Gm-Message-State: APjAAAVtrl0BZ5EbZmsyxytPIWB9YtmqbvAXaL+ko4YzYAXDqN3rx4Td
        vlbXQDREnWjxql3FIKzXwoJiKQfg
X-Google-Smtp-Source: APXvYqxTvCAguoAIKOR9tMzEQXDbMcNFQwnyyXxv+W9QrsGt4SK+248nulFSyF0NTPP89h37nO8x7A==
X-Received: by 2002:a62:3403:: with SMTP id b3mr8426964pfa.35.1570072725226;
        Wed, 02 Oct 2019 20:18:45 -0700 (PDT)
Received: from localhost ([2601:1c0:6280:3f0::9a1f])
        by smtp.gmail.com with ESMTPSA id i132sm721175pgd.47.2019.10.02.20.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:44 -0700 (PDT)
Message-Id: <20191003031312.313485229@gmail.com>
User-Agent: quilt/0.65
Date:   Wed, 02 Oct 2019 20:13:14 -0700
From:   rd.dunlab@gmail.com
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rd.dunlab@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     rdunlap@infradead.org
Subject: [PATCH 2/4] scripts: namespace.pl: add some x86 object files to nmexception
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-x86-excepts.patch
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These x86 object files do not have any exports or public symbols
so they can be excluded from the namespace checking.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 2/4:
 scripts/namespace.pl |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -91,6 +91,8 @@ my %nmexception = (
     'arch/x86/lib/thunk_32'		=> 1,
     'arch/x86/lib/cmpxchg'		=> 1,
     'arch/x86/vdso/vdso32/note'		=> 1,
+    'arch/x86/entry/vdso/vdso-note.o'	=> 1,
+    'arch/x86/entry/vdso/vdso32/note.o'	=> 1,
     'lib/irq_regs'			=> 1,
     'usr/initramfs_data'		=> 1,
     'drivers/scsi/aic94xx/aic94xx_dump'	=> 1,


