Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2741EC96EA
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 05:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbfJCDS5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 23:18:57 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37165 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfJCDS5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id c17so848653pgg.4
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:user-agent:date:from:to:cc:cc:subject:references
         :mime-version:content-disposition;
        bh=ie/U1Zcuh8RdMqZUnFoQXG+oRqB4eveVOE4B9nig3Ng=;
        b=maGmJ5vc5GYmzkYkfRHfhiGqgcWMOuzPGKIlb6Bde9Y2UeTNLCi1r/iedrx6CLjj2a
         i/vIkXT/mt3iSDy49W/jfxBdfnrz8eO96DChO2pFioINRxWIzYqElCAjzAwJHjbLpIWi
         NQVxYO9tNWY15K94AoSnFgM3WjTZeCpZBh+GJrGF6T2//nFAi+wM2VXWQYy475I8Qglh
         qxRYsbDAOFFvZ9SDWOdB0+dM1LBPe4qtohXPNlAtlQPlhMG2InX/Db07+FCYTnr6xS6y
         2imccsaXxMZXlkih6/TzsvXsPyMc3y7cMB/8Fz/JAB1zYXcNdcZszXWYg1GmZCfIBDFY
         9uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:user-agent:date:from:to:cc:cc:subject
         :references:mime-version:content-disposition;
        bh=ie/U1Zcuh8RdMqZUnFoQXG+oRqB4eveVOE4B9nig3Ng=;
        b=AAFlDEjxXxI4IAgYhWI5SjURq/TbSDqDiQKog/AC/BApeEErbMXIPleuSdDLqO9v2K
         PWG1zaQA8VQvXFnfRZ4v6IoJU7tyQCPsivZtADxnE+Ytly7zJLcRZoeJDNQWxh9K9D5w
         smxP37XhdmU55OHRQfQnncJSeJMYQCHFDo97EmMQJj7AjoTVqDeftFAZq2JmiyQ3/l5r
         jHqI0GHwZr/pY8vla1XTW2FJxsGLweC+lVuPeWJgjdKYUdKmkkkRrHqM4gCCFCrSvZXp
         mHY6Cx8TG2shayUC+TxY2V3dGvpbUx2tuX0WPrBP8TB88mV6MI7nMQmMGiTLFU8ECEsz
         0ZVw==
X-Gm-Message-State: APjAAAVc60+YIF+XtcFiMCc15ZqT9A57UC9PkFePYV8z+geyuXjnveTN
        q6xA0GN28QeHPULYboMcyk8zq8Kb
X-Google-Smtp-Source: APXvYqwKwtDWzjIBrPagnYJH22dC+acPmkjI4fyCp1R7rH6rsnrhmuH7eBlp6d/mF0f5XoULC1q1JA==
X-Received: by 2002:a62:1a4d:: with SMTP id a74mr191297pfa.179.1570072736558;
        Wed, 02 Oct 2019 20:18:56 -0700 (PDT)
Received: from localhost ([2601:1c0:6280:3f0::9a1f])
        by smtp.gmail.com with ESMTPSA id g9sm561686pjl.20.2019.10.02.20.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:55 -0700 (PDT)
Message-Id: <20191003031312.433635881@gmail.com>
User-Agent: quilt/0.65
Date:   Wed, 02 Oct 2019 20:13:16 -0700
From:   rd.dunlab@gmail.com
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rd.dunlab@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     rdunlap@infradead.org
Subject: [PATCH 4/4] scripts: namespace.pl: add blank section separator line
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-blank-sep-line.patch
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Most namespace report sections are separated by blank lines, but a
blank line is needed before the "multiply defined" output as a
separator, to make it easier to find the beginning of this section
of output.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 4/4:
 scripts/namespace.pl |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -368,6 +368,7 @@ sub drop_def
 
 sub list_multiply_defined
 {
+	printf "\n";
 	foreach my $name (keys(%def)) {
 		if ($#{$def{$name}} > 0) {
 			# Special case for cond_syscall


