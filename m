Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3344EF0CFA
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 04:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbfKFDZf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 22:25:35 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44604 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730722AbfKFDZf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 22:25:35 -0500
Received: by mail-pg1-f196.google.com with SMTP id f19so7040737pgk.11;
        Tue, 05 Nov 2019 19:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZ9lkkci6pKeEdFVcQhyyIPl89Y2Rlc/g654IW2BVYE=;
        b=JzQru7Z3AaJn7R0aSsgraOmEA7KeTIIljmZSOWXGG2vySHItlKOOBVfspE6HWMPsEg
         pqMHFxVYyFP8hGqUrx7mINMV5/Do00fli3eq7RsMrzewPc+HESfZZ3bBTX+0AjxA+V3I
         UDnEKe/B/dQtXbAemxUj0QTYlIeOBJxZpWARFyqWljzdLQ2aRhI0+v/gNlaMGrgaP7AJ
         woPwoGH8VyLt8PZUqnuz+EZ9eSIBSZTDLKWvOJjF+nQwHrQKZPcMMQCHDcS3FDMUT3xi
         OvWWBDZKMhz/rNXU0qlIIiXVo1URGgDqZ0JOPy+FENYMvNNFQossr2wljq3bTgjdrIra
         /h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZ9lkkci6pKeEdFVcQhyyIPl89Y2Rlc/g654IW2BVYE=;
        b=St6SDGxVDfSPowSpZYSajr3OFqL75pYDhF6IkfUN0kVg5MAX2Q5ol7/8XNhQeoWm5H
         N9pOqIfz0fck1Ic/cZ8+NIkdoF+hr/pXrBS6/JoHOxARqr4WE3HrURBDxBXtRuNUbql5
         EnrpyjSx7QAda4I5xrXxKvqF9WfvhuwHZe52n1y4Sh6ytlrluLSTrlWBh5IPKyCvsbu+
         eW0I+f90lgGHwH3Ykt1XEQT+Im1ylv1t3h0NOeKHTjSVLyEKQ+7fSl7dDfmrNUBMPIPy
         LVqLH2vZ0lEVgh20SkoUMCHDNUl4TA2V1djyxI61KE2vf99NsJWTxbhavxD7wtIvR/b4
         u+9A==
X-Gm-Message-State: APjAAAXuwNcJoRHQhetFatyK/ksyV3pqO59Z7tZJiC5ki/ZOcZh9BD6f
        mTmA7JJOLcFTYCtBHGwiEW8=
X-Google-Smtp-Source: APXvYqwro9Stb+DAkjMscZZVEidtu5306PSy3hJ/xbhMOdIYLywDLS/lqdMi3uSsAdv5hRwjOMOO6w==
X-Received: by 2002:a63:480c:: with SMTP id v12mr237892pga.385.1573010734786;
        Tue, 05 Nov 2019 19:25:34 -0800 (PST)
Received: from Gentoo.localdomain ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id q42sm889794pja.16.2019.11.05.19.25.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 19:25:34 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     alexander.kapshuk@gmail.com
Cc:     rdunlap@infradead.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH]scripts:ver_linux:Removed yacc from the checklist
Date:   Wed,  6 Nov 2019 08:55:07 +0530
Message-Id: <20191106032507.17380-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Removed yacc from the checklist

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/ver_linux | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index 397497cf9430..85005d6b7f10 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -34,7 +34,6 @@ BEGIN {
 	printversion("Nfs-utils", version("showmount --version"))
 	printversion("Bison", version("bison --version"))
 	printversion("Flex", version("flex --version"))
-	printversion("Yacc", version("yacc --version"))
 
 	while (getline <"/proc/self/maps" > 0) {
 		if (/libc.*\.so$/) {
-- 
2.23.0

