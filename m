Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B304D6311F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 08:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfGIGfk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 02:35:40 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:35385 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfGIGfi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 02:35:38 -0400
Received: by mail-vk1-f201.google.com with SMTP id g2so76426vkl.2
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jul 2019 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
        b=mtI4pp7LQ+cFZTh7ol2m1CVrFBewx1Tr/aWCfVl2aenkSg1IeUTYlk6HdJcDVl9V3V
         qVnZm5/t/x2Gb6ReZi2m8DZTmZwO2iCuHQhftas4io72KmTBubu7P5AHRRuPzTtzbHUk
         vDhVlpDpGXMhYDhnt//uJxs2dzo45RkBUi1IjbK6/9WPuyRnq7YWsBQp/82+MaG5On/B
         bp2850T8S0Sa0vYFLBGRkb7fOdx7Rw8cRDFhVg0SOdCTFhey727SPz2DbRtsbn4Alddl
         22XhrfmGEwv1NUR9lNPXJPkGMxadaTLFT1pkHIKy2X+DGjvjaEp4IaeI0b46n7FB7Z0j
         kXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
        b=Jta11XvxLrI3/l5y96no/es5yWBRoWk+jO26pKBXtO5AGrT1nZPi8ys8VmYRVEZyQ+
         SHiwtxuMZQloLxex3fe3+n8tn88qE3/H2Wc8mbFrLWj6nJzWR1UlY9RAgW/tw1mhivxr
         julD3VRyvaTWvYH7TVBsQwJVzJLaZDGB+ye/coGIcR0ujWHk5iesu3egb5AH1lr3izdA
         WGSbSgVTTNFDXQ/KL4aj3NalTm7qf6QUo2aZ5KoyAF13vr0bQQxwwGrKwDOxolgVwDsF
         KLnFqlyxi92vTqHr0TEQ/UTuUuppgL7FqDTcd0yJQDb0GgOm+08xGcb7wtKt+2zfOS+U
         plEQ==
X-Gm-Message-State: APjAAAWqOLNCvDK/ZDV/P6A19ozCjvZPRgZyY8qb55d7l9peNbbi4Q0E
        La/R4Vpt1PLgtKY7b1jMiPJYoV306AZky6DqmcNRLg==
X-Google-Smtp-Source: APXvYqyW1g9KdJQPX3pyGwybskRq1kFabR+QXx1JMZJMEoqi+vbrQt4/L8S6b2Fnm4tYbGfikHj5lP0KQVa29yIOSMpklA==
X-Received: by 2002:a1f:6045:: with SMTP id u66mr3906864vkb.54.1562654137349;
 Mon, 08 Jul 2019 23:35:37 -0700 (PDT)
Date:   Mon,  8 Jul 2019 23:30:23 -0700
In-Reply-To: <20190709063023.251446-1-brendanhiggins@google.com>
Message-Id: <20190709063023.251446-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v7 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section,
and add Iurii as a maintainer.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Iurii Zaikin <yzaikin@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48d04d180a988..f8204c75114da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12721,12 +12721,14 @@ F:	Documentation/filesystems/proc.txt
 PROC SYSCTL
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Kees Cook <keescook@chromium.org>
+M:	Iurii Zaikin <yzaikin@google.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.22.0.410.gd8fdbe21b5-goog

