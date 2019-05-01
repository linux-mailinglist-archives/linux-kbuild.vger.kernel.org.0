Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499DF11011
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2019 01:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfEAXFU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 May 2019 19:05:20 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:37255 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfEAXFI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 May 2019 19:05:08 -0400
Received: by mail-yw1-f74.google.com with SMTP id c67so1162325ywb.4
        for <linux-kbuild@vger.kernel.org>; Wed, 01 May 2019 16:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=PRLXnvg3FnToIBJTwXVR7d2TK/MHZSW5pjHfdNwtr7Q=;
        b=K5TwnumODggM3WBroA2xjKir+Hf59I1szowVRTt0lzCy/25DKO4Auoy9KuasdBqFUu
         UWvBOKOTmtxVhAOl4er1T2140+nu1Bz+99TiGL9+yTK//z+jqboMkU5aijHYP0BbYsOh
         P/McaehM5toEAU772+pJGpQWNEZx5xhfrNPAJoKaW0IpWIVJaq0KjD8R8F3QXpB30i5m
         XrT04TmEJJAw/8yrNXA4XJeGyU/uVcdsIpKRYnl9kRb2X6reSvrGJiWqLpi2xAFDwIgz
         M+mClrFoRM5PxaczMRkZTVN0VXOBXS2l+ZY6dXc7xjKICM5LbtnpXVDT7unPYWdXqa7Y
         wpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PRLXnvg3FnToIBJTwXVR7d2TK/MHZSW5pjHfdNwtr7Q=;
        b=QSidj7FgMJLanuSciUYPQh/B1ozFe7QwB6spGaZywFTeB44KyI/MIIk6NexFrRr33o
         OS3uM3zhv5qhmcKoH5ouffV0C4SnoLh3Lvk6qLgm3cLCfrMWafH0XqAEIqHuLNsAmtgj
         pHyJ8N1saZv1TEDaSw1MWv2ayc03KKg6KSuVER5GKCJCVC9az+yLtwz1+c5D/MBFpYe/
         7SxJIMOaNwNt+u6hO28BV7kzsM6sd8JXaqtE4wZtryTFTEElu+hHEE8G+pMrzWjJGVry
         WEwv7gEtOBO54GhNDXGZg7PVL9cfBgKx9U3AbqQVcu4jPB8CBqNAVolCbic2zjFHDy+b
         BUXQ==
X-Gm-Message-State: APjAAAVJLjWFm7HCYWMa1oyx6Ur6clXFXUouRLFYrrBc8Qfv4yK7lXnB
        dVS4d97MrkNq0NL+5D3uugQc2f4EdNoCGsT4FNuYHA==
X-Google-Smtp-Source: APXvYqxSccXA/VUA/6JwG1W+T505ogTb6cCEY1XA3skvxQHV+dYiYJA75B70f0UwwhMZGG1vCcs3UYjo4MLfLh9fEqXVcw==
X-Received: by 2002:a25:aa87:: with SMTP id t7mr327533ybi.419.1556751907604;
 Wed, 01 May 2019 16:05:07 -0700 (PDT)
Date:   Wed,  1 May 2019 16:01:26 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-18-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 17/17] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
        joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
        pmladek@suse.com, richard@nod.at, rientjes@google.com,
        rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c78ae95c56b80..23cc97332c3d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12524,6 +12524,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.21.0.593.g511ec345e18-goog

