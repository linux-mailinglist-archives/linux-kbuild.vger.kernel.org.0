Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E831E6A587
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 11:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387440AbfGPJoA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 05:44:00 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:45070 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387439AbfGPJn7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 05:43:59 -0400
Received: by mail-pg1-f201.google.com with SMTP id n3so2465780pgh.12
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=z+RsQ5cMJRNJEspG7oJoFcFROmHPEJhG9JB06H11s3Q=;
        b=CUY4X28sB+ODqLkExBF1TPtKPBrP8z61MsztlmFA3r3gT07JFbpBdEO5woSX6qXc5N
         7BJpPco1WgRlDYy/qo0/eQlbH81eSVuboFms9Vfai0ZrWDbY3TxcYEjJ862ij9z1VGEB
         1XEk67DEtl2x2z0HdpX/hfuCpUB44Qgi9Z5nNVY0IvyFXpJdsd7uca/G6oZFZDgCNkBl
         9KwMhzPT+UvSiWeRn/CMWIFt4CB2a/Hi+EdyU8gaY+ftONCJpCEIb11YwL2UTJXycDAy
         5pyhBy52Rf1DEP5nqhHWDX5FpEAPRVHHNegfFxUpAFP0dG/QMJ9n8t8pRQ9jJ7cscePK
         Kt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=z+RsQ5cMJRNJEspG7oJoFcFROmHPEJhG9JB06H11s3Q=;
        b=p9pTuKDNvDD3Rn+4vKfsCbDDRT8raAHnUg2Z0spNWY0a/AIbhNsyPrawVE7K5651MM
         kOFuKXTtZRZvKl1ZqMkoS5cGYyLcuOM0B8Feedvf0qFRt1BgWLra5CnNGrxxanaRsMIu
         ywmmJtkinugry8ZIs1VTJo6yTdlUdEYjFoVvwWGFdE+UVsoQkbqnzYD+ZCtGkV+G0Sdc
         poT/KjXsuP/oVgkCI3eXxGY/bIBAauxUlsn1HEnu/01TFytrOmFe+Vnur2XpQPwrJJH9
         YXGJjPfNb6n3w4iH+urXdqdVkaAao0n9CBk32T53kb0Q+Rhe1Es0w22Jpp93tMIeLiMU
         PvcA==
X-Gm-Message-State: APjAAAU5DK5OKl0qvyxu+QNu1YSdJvl1xBleyCtKEqBdHwQzxsWSRCU2
        XTldvnEO9Z7L7hb252n4atBExRVl54aRt44AMuq7JQ==
X-Google-Smtp-Source: APXvYqx6tsQcpzZYDcAwRrqh43EK99hhlzkdZq0K9nskPImImgYN/CiLbSuAKeIKHVdKNAnHBHuOTFF9uImlQQjUAKlIJg==
X-Received: by 2002:a63:f401:: with SMTP id g1mr33239239pgi.314.1563270238515;
 Tue, 16 Jul 2019 02:43:58 -0700 (PDT)
Date:   Tue, 16 Jul 2019 02:43:02 -0700
In-Reply-To: <20190716094302.180360-1-brendanhiggins@google.com>
Message-Id: <20190716094302.180360-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190716094302.180360-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v10 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
2.22.0.510.g264f2c817a-goog

