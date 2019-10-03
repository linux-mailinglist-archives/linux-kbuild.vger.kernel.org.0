Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D1FC96E7
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 05:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbfJCDSf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 23:18:35 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33210 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfJCDSe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:34 -0400
Received: by mail-pl1-f193.google.com with SMTP id d22so814913pls.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:user-agent:date:from:to:cc:cc:subject:references
         :mime-version:content-disposition;
        bh=VGrVpW2aAhFH90JeCO++2rAJTKOSABk/5lPnC/zThDY=;
        b=kCjQ5S+eJssjcDDRhLgubqpvJYKKPPDrgWysfM+rTlMF98Bs0hEFhALGp3UaSbNGVr
         XtW1ElWYIvKSRsUf/jHOKSs7zu88iS3Rh516tWxTy0QYm+Yo8/n859zm3DSLSkRcrlQP
         xdYEd4b4IxkHj/eTF8sx6u4NLr24cO+QzEAo7g9+lutJnFcR1u9BHQ81o/1ncP8wQTSr
         qOxaI7amePaQ6Pq6iuoTF+Jz+9EY4qtitasLfeBjGX62P/qcLohJD1LthjFHcIZ1wb8i
         DwL8ytPQ4OyXNxoJJ7q9tmHuh3tTSDGeK+TTSwjKLrMxQc9ZfphOaB1LTZMotrn0628H
         IbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:user-agent:date:from:to:cc:cc:subject
         :references:mime-version:content-disposition;
        bh=VGrVpW2aAhFH90JeCO++2rAJTKOSABk/5lPnC/zThDY=;
        b=Q9TrtNln1y7Yyk52Rjhi4Hcy4GDfTc1Pf99g9QouynECHIkA7lB4vbMvqa2uWY5JeG
         jgeDLb6++FlwDdI5SNeNowqgIOxwES4ZkC0oxdR7ivyttDzFgajmrwaOnawuJjlWFGow
         m0hMCAPJKPvCDSAKQVBTRt2UqlxdfsX2r0U/6DBbogS+IANW01CKjD2UhznDlt3D/dfC
         W3cJ9gWL4+8m4xetLcZj5X0HR56GxWUKDsObhAx89Er+ENPCWy7V7jQ8f1Qg2DGAyKTS
         Y8fNDri88+5BQWKkyG4jyEjY+CfSncbCu7yhHPukoHF7MdRBfGBVGCRUMCBE/sMNflpl
         COYQ==
X-Gm-Message-State: APjAAAWhfqOX6CjLSxOhhKH/ouEBVcGMulSBwSnoV2T6SPCllEc7hWq6
        qX0H+XLBcD2WjJleL7f7opPI9A/Y
X-Google-Smtp-Source: APXvYqy7mMzvkCQUssROtXnKC2KWkRgNJcveadAI/fXdbJICNVK11vNyE75aEKvHNcRy3rEAjgZ9AA==
X-Received: by 2002:a17:902:7d92:: with SMTP id a18mr7220472plm.243.1570072712655;
        Wed, 02 Oct 2019 20:18:32 -0700 (PDT)
Received: from localhost ([2601:1c0:6280:3f0::9a1f])
        by smtp.gmail.com with ESMTPSA id f3sm725442pgj.62.2019.10.02.20.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:31 -0700 (PDT)
Message-Id: <20191003031312.252507322@gmail.com>
User-Agent: quilt/0.65
Date:   Wed, 02 Oct 2019 20:13:13 -0700
From:   rd.dunlab@gmail.com
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rd.dunlab@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     rdunlap@infradead.org
Subject: [PATCH 1/4] scripts: namespace.pl: handle lib-ksyms.o as lib.a
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-check-fix002.patch
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix these warnings:
  No source file found for drivers/firmware/efi/libstub/lib-ksyms.o
  No source file found for arch/x86/lib/lib-ksyms.o
  No source file found for lib/lib-ksyms.o

In scripts/Makefile.build, any resulting lib-ksyms.o file is renamed to
lib.a, so handle that rename here also.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 1/4:
 scripts/namespace.pl |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -231,6 +231,9 @@ sub do_nm
 		return;
 	}
 	($source = $basename) =~ s/\.o$//;
+	if ($basename eq "lib-ksyms.o") { # modified in scripts/Makefile.build
+		$basename = "lib.a";	# from lib.a to lib-ksyms.o
+	}
 	if (-e "$source.c" || -e "$source.S") {
 		$source = File::Spec->catfile($objtree, $File::Find::dir, $source)
 	} else {


