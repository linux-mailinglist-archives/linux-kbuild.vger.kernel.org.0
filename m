Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A946FEE0C0
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 14:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfKDNMD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 08:12:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41126 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729025AbfKDNMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 08:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572873122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=mEeFwMQ/ppa/j4TsLmopSIuCw8suIuDki26NbkIs/yI=;
        b=X9ErsW0Uhrtv0NcMN2PWimGcPTPzZnSQ9Jb806ii6pftW3gWZHMyMJUpvuFyC5LImyFdv/
        IiBIkxgQ7jC/vaO9PR5UbLVzRcrP8K9GoE8OsYmMN98VHF2CsIZbJ23ACe7BD9hS5YcmGh
        kXzIo3hMr9q6VupudFrgdLeLxtPhv8g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-qKi2yTdgMN28zujMgtFAKg-1; Mon, 04 Nov 2019 08:12:01 -0500
Received: by mail-wr1-f69.google.com with SMTP id u2so4288959wrm.7
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Nov 2019 05:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w29442xfvO7j2EoGslKoTV7tRbFcx9AseEe7FfaZKW8=;
        b=LHK4oVsyIg5nSL/EO6rzpaaNnhc/xJCvGKfBYqVLe4KgxOGGlTR6nx5tRqoQ+TH/a9
         UWAofdaOo6rBXhXJZv6kIk3wi4rp/3yoqsKTkCwrRhDarCocoq6nFggislFjvlpG8/gf
         opyLPwe+7W5wmlikInu4fa2fgY69MIGgBXslU/7A4b6hvP+2nt+Li5rsL+ohVbgg0h/T
         9mgi3930KvoebDV6MNyiHosOd2XS8TXea4zXLOHqsLY8o2tTd6+6kY0IsU/HN8n2j4tb
         L2P1kQFQAfTCdnCChKbcJy0GlXrbrPvi9jB53DyppAi03mgiuE0zoOX6Vx3BZqivtBOI
         7ILA==
X-Gm-Message-State: APjAAAUxTrubNOLTjXV/EBsWedAJNFn/cjpcMzs2qpCM4R9lyl6fEoPf
        6aZYRzPqKyzwXEa+OtJ4l2hqsq39kEAQMS5GsZnUmHEx9N+AuNTjmUFxJhjQOvyl2RiUSRRDpPH
        HHKzTmz1KKEjkuhK61cncuRgL
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr5467099wml.161.1572873119559;
        Mon, 04 Nov 2019 05:11:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwizl7SZT7hN7psw0/wzgb6PYDjICq1xPSIvHIRgo+xuWpaqRzauG4APe//qiXTTIEVhAb5g==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr5467078wml.161.1572873119326;
        Mon, 04 Nov 2019 05:11:59 -0800 (PST)
Received: from mcroce-redhat.mxp.redhat.com (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.gmail.com with ESMTPSA id q2sm15309813wmq.30.2019.11.04.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:11:58 -0800 (PST)
From:   Matteo Croce <mcroce@redhat.com>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: Add make dir-pkg build option
Date:   Mon,  4 Nov 2019 14:11:44 +0100
Message-Id: <20191104131144.14333-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-MC-Unique: qKi2yTdgMN28zujMgtFAKg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add a 'dir-pkg' target which just creates the same directory structures
as in tar-pkg, but doesn't package anything.
Useful when the user wants to copy the kernel tree on a machine using
ssh, rsync or whatever.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 scripts/Makefile.package | 3 ++-
 scripts/package/buildtar | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 56eadcc48d46..36600ad1d5e6 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -103,7 +103,7 @@ snap-pkg:
=20
 # tarball targets
 # ------------------------------------------------------------------------=
---
-tar-pkgs :=3D tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
+tar-pkgs :=3D dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
 PHONY +=3D $(tar-pkgs)
 $(tar-pkgs):
 =09$(MAKE) -f $(srctree)/Makefile
@@ -147,6 +147,7 @@ help:
 =09@echo '  deb-pkg             - Build both source and binary deb kernel =
packages'
 =09@echo '  bindeb-pkg          - Build only the binary kernel deb package=
'
 =09@echo '  snap-pkg            - Build only the binary kernel snap packag=
e (will connect to external hosts)'
+=09@echo '  dir-pkg             - Build the kernel as a plain directory st=
ructure'
 =09@echo '  tar-pkg             - Build the kernel as an uncompressed tarb=
all'
 =09@echo '  targz-pkg           - Build the kernel as a gzip compressed ta=
rball'
 =09@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed t=
arball'
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 2f66c81e4021..77c7caefede1 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
=20
 #
-# buildtar 0.0.4
+# buildtar 0.0.5
 #
 # (C) 2004-2006 by Jan-Benedict Glaw <jbglaw@lug-owl.de>
 #
@@ -24,7 +24,7 @@ tarball=3D"${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
 # Figure out how to compress, if requested at all
 #
 case "${1}" in
-=09tar-pkg)
+=09dir-pkg|tar-pkg)
 =09=09opts=3D
 =09=09;;
 =09targz-pkg)
@@ -125,6 +125,10 @@ case "${ARCH}" in
 =09=09;;
 esac
=20
+if [ "${1}" =3D dir-pkg ]; then
+=09echo "Kernel tree successfully created in $tmpdir"
+=09exit 0
+fi
=20
 #
 # Create the tarball
--=20
2.23.0

