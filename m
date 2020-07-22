Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB18228FB6
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jul 2020 07:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgGVFec (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 01:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGVFec (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 01:34:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C328C061794;
        Tue, 21 Jul 2020 22:34:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x72so580440pfc.6;
        Tue, 21 Jul 2020 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ZfWlwCH54AqAy5SVcPssePKiah1fkND2uxw3IEAeNg=;
        b=gevWZ7JVCnYoPCBeQKrhjOSlMv8Lhy+c7ihXuPF76RsyyJ9555v+HOOEe4yzWqGKQm
         lOaxmoSjNXM6eQ4g1VXrx2lhnhcHkPT+q2K/KK5eIIeq9LL4qLm9tcahmwYGBI0l+S/H
         Bhp84Mp3/OpWAe/9NFDVOWwSqJwGheqOXGWO4qv/omL8hiNpfCyKeDTX+jB4dmx6dR61
         0+S+mSgHMvT5Ndhb2JhKnvwwllkSJPkJWE+rD5VkcLJ2k5Pa01EooyTF2bMfAwQxe8De
         Y4yI5YFg+lueod6AV/TV//G48CXnGTousPsd1pah7jVATavV6Vi3ZxazEza/UVN5JKH7
         X0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ZfWlwCH54AqAy5SVcPssePKiah1fkND2uxw3IEAeNg=;
        b=X4uCqEOQQ7neGXcI6dRvjdE+bOXjL9NQlUQdqDvillJaDujJEzXn2W3cjVxL1wCg0d
         rqCM0Z7ZwOYxv6qF0s3iB15g1cKHPp9l0E4BCunVBpF+5/0u+p2Gz14+IizwhHX8ry1Y
         dBFlYPY/fE45r7ovhiRhukTRJSBVpAYVe5iwMbDT/VLYN0GnDRKLWCRxBw9RTLvFFvV9
         kGsfLFqZ3Dsb28VuXewwPbRjH8jlgfwQq9mkRRq4W9Qmt0T7LP6hSWTowxuRW0g+A16x
         D1PN60T66/t2vrdhwRzw3SCmT6Ni+sAO0pKCxM61tNSQn0vHS1HqHjhNGW+IEPdCsfAt
         XhQg==
X-Gm-Message-State: AOAM532HbGTBTIn8tBynhFEI/pUxtptzh/4g7LSlA1HD0NNK3Lt7LukU
        CSZI9WEKfZM7sOMEd8De2YI=
X-Google-Smtp-Source: ABdhPJxoDuOnhLaDsDsJSfYHskC9/Di/I/7obMVU5KcpT3nsNyDo/y7XOyuTxXeavF5eftOIRIpa/w==
X-Received: by 2002:a63:b956:: with SMTP id v22mr25304322pgo.242.1595396071675;
        Tue, 21 Jul 2020 22:34:31 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
        by smtp.gmail.com with ESMTPSA id q5sm22536608pfc.130.2020.07.21.22.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 22:34:31 -0700 (PDT)
From:   Max Filippov <jcmvbkbc@gmail.com>
To:     linux-xtensa@linux-xtensa.org
Cc:     Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 0/2] xtensa: boot targets cleanup
Date:   Tue, 21 Jul 2020 22:34:15 -0700
Message-Id: <20200722053417.5915-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

this small clean up in the xtensa boot subdirectory adds more targets to
the 'targets' variable to avoid unnecessary rebuils.

Max Filippov (2):
  xtensa: move vmlinux.bin[.gz] to boot subdirectory
  xtensa: add uImage and xipImage to targets

 arch/xtensa/boot/Makefile              | 12 +++++++-----
 arch/xtensa/boot/boot-elf/Makefile     |  4 ++--
 arch/xtensa/boot/boot-redboot/Makefile |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.20.1

