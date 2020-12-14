Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE89A2D9551
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Dec 2020 10:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgLNJbg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Dec 2020 04:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730038AbgLNJba (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Dec 2020 04:31:30 -0500
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA95CC0613D3
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Dec 2020 01:30:49 -0800 (PST)
Received: by mail-vk1-xa42.google.com with SMTP id l187so3750726vki.6
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Dec 2020 01:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=p6a8zIGEYd/dUK9tmUWZsvDn+M6hDmHSJE85v0a6mTE=;
        b=NRHKzaTAJbv8q/yoExkQdIFi5aom63CJhgwXsnhH0X85eASbJAQhqH/CLNPmdSecd3
         c2L3JC/uS4IZy7GJoZeHa6jAASqOVgZgzqE5wKHH0549gJT2Qv8ntRe2RF6SU5il89RX
         Z2ZVG2R7EXQMDNN82F5nSs3LHMrywP/2WyMySKbnV8YYby5U1i/92PPpphBiZyRJ0MVb
         DQ08AO5RfCrUP++J0gyB6qoONrkHeAW2L/dntoyEIAFA3XJTxDZb6qiZwsd+S5/+oxao
         sFSD6sQcT47Q2uTBIPOoMPcF/Jt8hpNobm04V3NmM2bRXQl5BKfnLzUyo5cddKNMvGdr
         +KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=p6a8zIGEYd/dUK9tmUWZsvDn+M6hDmHSJE85v0a6mTE=;
        b=dQtuw/JAlw7ctIDkvwtN13D9ajRvzQPeV/RAVXMWQ7YjEPe1zvW5iihenwDj6Ybd7D
         4aaaaS5VM/tDHfrqm912p72cNa0Gw1UHS168Vl1hA5L3JAlVZrAVvuWBac+nGpHxEl+S
         g1tmvaHJ+vVScPwVBpseuSqoJvvd9rxHoH0No6VXL8ekOrTgsiyMam6mflj/wOr5khbJ
         uiwHhkOhb21myPayPWKIerqi2IcZ7fkeLtncUa+Hanld5TgQYdWw1H+bX2+BiQCwJKzW
         jhn/8yP/kAWoLP7DbEvPAd/URVxpISVLT5QuyqqnmodbKTVp1OdTnfVcKdwBMES8G7WO
         r39g==
X-Gm-Message-State: AOAM5339KD+ZeuBDodjihWcwHnqyHLE/Hmr7o9gVrtR3maGVBPvUzzfD
        eIhkCT2xKqrGiy1HeL8a25My5qKkazbu0Z3l2xU=
X-Google-Smtp-Source: ABdhPJytfuVdeVUuaFg4X75X5huB2dWNVuyotJxpnOjw5xgxpICDT+cwwsMmjUaH/KMfwz+nzT+NcL2Bc9JornPDrx8=
X-Received: by 2002:a1f:b40c:: with SMTP id d12mr23747586vkf.17.1607938248870;
 Mon, 14 Dec 2020 01:30:48 -0800 (PST)
MIME-Version: 1.0
From:   John Millikin <jmillikin@gmail.com>
Date:   Mon, 14 Dec 2020 18:30:37 +0900
Message-ID: <CAL1ky9qQtFnJ0+2BBu6OwafaZex9_i+DQJgs3Nij2J06tge26w@mail.gmail.com>
Subject: [PATCH] kconfig: Support building mconf with vendor sysroot ncurses.
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adds a new fallback path in the ncurses locator for mconf to support
host compilers with a non-default sysroot.

This is similar to the hardcoded search for ncurses under
'/usr/include', but can support compilers that keep their default
header and library directories elsewhere.

For nconfig, do nothing because the only vendor compiler I'm aware
of with this layout (Apple Clang) ships an ncurses version that's too
old for nconfig anyway.

Signed-off-by: John Millikin <john@john-millikin.com>
---
 scripts/kconfig/mconf-cfg.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index aa68ec95620d..d38f44976418 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -39,6 +39,15 @@ if [ -f /usr/include/ncurses.h ]; then
  exit 0
 fi

+# As a final fallback before giving up, check if $HOSTCC knows of a default
+# ncurses installation (e.g. from a vendor-specific sysroot).
+echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1
+if [ $? -eq 0 ]; then
+ echo cflags=\"-D_GNU_SOURCE\"
+ echo libs=\"-lncurses\"
+ exit 0
+fi
+
 echo >&2 "*"
 echo >&2 "* Unable to find the ncurses package."
 echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
-- 
2.24.3 (Apple Git-128)
