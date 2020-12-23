Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5922D2E183D
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 06:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgLWFFG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 00:05:06 -0500
Received: from mail-pg1-f170.google.com ([209.85.215.170]:34863 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgLWFFG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 00:05:06 -0500
Received: by mail-pg1-f170.google.com with SMTP id n7so9863185pgg.2
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Dec 2020 21:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=qTlWHX8xbr5lptXIW5iRadklEKQCIzvuwZ52dIXN/sQ=;
        b=CJhppa++v8M0FtDG6qQhEJvQrC9OKUP7X3b26AirvDIDAO6JVzSc5F6ZZ7ZlYuts3O
         lG7P8UsU88ooLoXkP86sNejPZMjXGNPlCdj4InyWrYLSoWhQBdKlwPtBGgtoKzeh6pwC
         5ptFaKUuEYJ0zDZyWF5JAmdt3hb6Hed0ajrRhupEhUCy5V5QTbVUtBvnbSaOmMtKQJ94
         c8W0Qy/XUBh+4bNN7hhKwBsfV5Jpr5e3xnXXwa4JgTlukDAyxC9ATQoe8paYxPqoFSky
         cJIEkG1UbvDLjIARUjSBuyo6Xlcw5hAi9f4XooIcgZTaSk+APQmaB5fa3jru/hTcEubQ
         5DAw==
X-Gm-Message-State: AOAM532XU7qF82MCn3RrWBy2LQbXHNuvUbSynmg01UWmHMzemyLl1Far
        dDTzBFZnGgrt2de2g/m7q1PXjhiLoBJdaQ==
X-Google-Smtp-Source: ABdhPJzAYbK4oEw7gMOV6ONuPr3tzEzXKszb9Mn6JW9aylQsin8YXnfXEmBBkOFMYCBjiKTgoBz5WQ==
X-Received: by 2002:a63:ca49:: with SMTP id o9mr22679522pgi.439.1608699865767;
        Tue, 22 Dec 2020 21:04:25 -0800 (PST)
Received: from macbook.local (ae142046.dynamic.ppp.asahi-net.or.jp. [14.3.142.46])
        by smtp.gmail.com with ESMTPSA id z12sm21979352pfn.186.2020.12.22.21.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 21:04:25 -0800 (PST)
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
From:   John Millikin <john@john-millikin.com>
Subject: [PATCH v2] kconfig: Support building mconf with vendor sysroot
 ncurses.
Message-ID: <64b8db11-deeb-924f-7174-a7208190dce3@john-millikin.com>
Date:   Wed, 23 Dec 2020 14:04:23 +0900
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Changes the final fallback path in the ncurses locator for mconf
to support host compilers with a non-default sysroot.

This is similar to the hardcoded search for ncurses under
'/usr/include', but can support compilers that keep their default
header and library directories elsewhere.

For nconfig, do nothing because the only vendor compiler I'm aware
of with this layout (Apple Clang) ships an ncurses version that's too
old for nconfig anyway.

Signed-off-by: John Millikin <john@john-millikin.com>
---
Changes in v2:
  - Replace the existing check for '/usr/include/ncurses.h' instead of
    preserving it, per review feedback.

 scripts/kconfig/mconf-cfg.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index aa68ec95620d..abb9252bde9e 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -33,7 +33,10 @@ if [ -f /usr/include/ncurses/ncurses.h ]; then
     exit 0
 fi
 
-if [ -f /usr/include/ncurses.h ]; then
+# As a final fallback before giving up, check if $HOSTCC knows of a default
+# ncurses installation (e.g. from a vendor-specific sysroot).
+echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1
+if [ $? -eq 0 ]; then
     echo cflags=\"-D_GNU_SOURCE\"
     echo libs=\"-lncurses\"
     exit 0
-- 
