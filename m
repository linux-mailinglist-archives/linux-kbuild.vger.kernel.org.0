Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F6E9BA82
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2019 03:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfHXBf3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Aug 2019 21:35:29 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:44054 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbfHXBf2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Aug 2019 21:35:28 -0400
Received: by mail-pl1-f202.google.com with SMTP id t2so6845656plq.11
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Aug 2019 18:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RZYwg2AKNWWbK5AlePl3YpD83HqbQqaQ/S9W/auEYuc=;
        b=sXlKKJhgEU1wa6b+t1Kfk3Us9JBNqB6qgFrYAorUjpNahnQtVB62F129r9jqW7As2D
         TECRv23j+orFXVoF1btyTlgKbGavDLv/mRXRpxUvewJTVsSyWUiwJR/MDWHL2k4m7043
         cnxd+RK+ZXWwaD0m4kGAzCv3TPvws/OkUrPxVWvZj7C8gOUsEIbG1ulzMU+UBC5ulBWq
         dWbj8dEXXE7CGrs/FCxd7vyonAjP9xvohhPSk8O9Rj98/htG5iBLR1KI8Hh4Pbg0s00U
         4YCNUKyFTqpEwz4Jf4CPs5qIZGCq3zkZi2UB5XVr4PO3/OBx5gUJAlDS2TXKFE4g9qqr
         g5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RZYwg2AKNWWbK5AlePl3YpD83HqbQqaQ/S9W/auEYuc=;
        b=XowVSDW49wEUn5twhjKc8k1XeNxXVV4qN2hZi6hki5znrhTdur+oR5Yl74sKPvnsHx
         h209bIRe2xz2Zbv3+UEUc61ejAGn6YIWWaAzaorRDbLq9wN3ozopIzaJVU5ClPCrH7qX
         LfCxNHmIwQ1+jISa5NVcImNiiDcvHP9Fw8kllWXM4ZCx/XVNokb978WAOS5kMQsXJC9o
         6nAup7yA30539v7Cx6GWO8DbTYrJpD85XTTC/ecjcs2pdWOVIb9HNWPT83q4Mdal70eN
         wCy4qXr3VGo8suvnKqd8OLJgRhBJ6jpGMEbDvtHvY6rWvIvYNbPlOTb3HSt/f4sPgH+B
         LS7A==
X-Gm-Message-State: APjAAAXZfET7FVWlFNh2nMpEI/Emvs0aYaPEIy2W4WmI23VLFBftOhhc
        pVtq7f3Q5GwCt3/+W/fHqT57WiklevMUkWBqFXZVNw==
X-Google-Smtp-Source: APXvYqxeho9rBF0ZZ6VsD/UiYLMznIviw0ZlKZiyS4hv5yytF5NdlNUif2Pu10B+ZY4kXv3ubxh1pUBcBlFmg94D169gig==
X-Received: by 2002:a63:c03:: with SMTP id b3mr6561436pgl.23.1566610527139;
 Fri, 23 Aug 2019 18:35:27 -0700 (PDT)
Date:   Fri, 23 Aug 2019 18:34:25 -0700
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Message-Id: <20190824013425.175645-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190824013425.175645-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
index f0bd77e8a8a2..0cac78807137 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12965,12 +12965,14 @@ F:	Documentation/filesystems/proc.txt
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
2.23.0.187.g17f5b7556c-goog

