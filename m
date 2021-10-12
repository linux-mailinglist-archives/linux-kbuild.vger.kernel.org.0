Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC9442AC9E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 20:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbhJLSzT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 14:55:19 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35971 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbhJLSzO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 14:55:14 -0400
Received: from leknes.fjasle.eu ([92.116.69.156]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N1feo-1mlBed29zE-011yD0; Tue, 12 Oct 2021 20:52:51 +0200
Received: from fjasle.eu (localhost [IPv6:::1])
        by leknes.fjasle.eu (Postfix) with ESMTP id D83683C007;
        Tue, 12 Oct 2021 20:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1634064767; bh=7zC+WU8rJSnsIS5MS/l/G4k7mDre/ViawLNf4HaOAng=;
        h=From:To:Cc:Subject:Date:From;
        b=F4oj/qS12S6P1MZfApXUCHML0BQqwnUAa2PgiZ+LJoXiBG2WEAWlru3jkk2ES5HwH
         pwpcY0sQbt5vakvMPmp8UoAdOg3XHOEPM9NsxYKFJX8ix8L63719QVuQlEF8BLKcIw
         JPHHwfQy42W05Pgphk1tNfJIR2hoLZGRGw0gpTBs=
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        =?UTF-8?q?Thomas=20K=C3=BChnel?= <thomas.kuehnel@avm.de>
Subject: [PATCH v2] initramfs: Check timestamp to prevent broken cpio archive
Date:   Tue, 12 Oct 2021 18:52:34 +0000
Message-Id: <20211012185234.3295982-1-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NeJxAKI2+LIiBxhxiGuPj3uVVd5QakhhDqeBj6VLA6ETCJvkL86
 buOppCzqk9YTh4beTvYxXTXEATsGCfWO1brETAaR7315IkAst26AkhTIdYwqHsU6OMBuXqf
 VF4CoKIooxsPDOmJaaSYkktZJHmK1o/tsBqHTxEvyzg8c0YY9+FQ8gW+8odOsRJXs+PJwCP
 cjaYAn9nDPrVcSQR+m/7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NgeIJsSzXho=:H/IYCmVXQbA/Y3KLxqLYf5
 hlQ050XIsGVoLSsy0XhjriQptdoMA0CeIrHuEo0TcR5YK4GhkqVB4NaydinS8UUUqfRzI/ue4
 k8TuKi9SHpAntBE5y9AZsw3HGGereSYbjbP9aBkoUb+1hk3aRqyiUE96MMnWsU/dvz9l3iDBn
 zNS971eczXtqksltPVIenE349dBnS8mtixmzHf+4IBHICBWcqMuF/DrRcQkQ+Wk+pgkA8rz4l
 U7FTUuUaYxsC/jG07mlkWi/IDirhSEtM2Vme+afpUwPpvpLCLqFAP5b7SvV37pS/ZnIc+3KxE
 585UjH7Qpm5f4PljZWMIAEpM4YbVvYv/SdHYBaK0aNt02w9KrxVgLnA3lwAx9xpU/6aIK6czQ
 EE1qID7qr0BpcyQx9k5V3n3Fj0or+znP8Ifq+cCI9hs7FYfB3yI4VNrcwIaS2qIM4mfK9eZEy
 mOltvXnD4nfEKZvEABUc698Ga+ZP0+4SuFsOZKHvIXcq8PT+PnoYT/+wh0zedLCCsr1v1oIJp
 7FezmPyfzqYuQAKWrTtuTBoCQKEZ5/L2QFVOMvJcv5P7OMDmV8Fj/D56L/JaVZedPRsCqOsdM
 9eYhcLsjZze1w7xkOkAox52LoX86JKEvBOpwzyLVmX0yFRO+1BdK2zhZGqX6CXOLH8XhycG43
 8e5xafO9NlT3RYKWMweRAkRwQ1w6GTnlP8NrYdEzs8KlGOAjP+naqKQ81Aaf2QCjuPh+o5bVA
 gqEfzgR+w2B5Az9a9Stx5h3krPiBNfTM8Q0qGg==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Cpio format reserves 8 bytes for an ASCII representation of a time_t timestamp.
While 2106-02-07 06:28:15 UTC (time_t = 0xffffffff) is still some years in the
future, a poorly chosen date string for KBUILD_BUILD_TIMESTAMP, converted into
seconds since the epoch, might lead to exceeded cpio timestamp limits that
result in a broken cpio archive.  Add timestamp checks to prevent overrun of
the 8-byte cpio header field.

My colleague Thomas Kühnel discovered the behaviour, when we accidentally fed
SOURCE_DATE_EPOCH to KBUILD_BUILD_TIMESTAMP as is: some timestamps (e.g.
1607420928 = 2021-12-08 10:48:48) will be interpreted by `date` as a valid date
specification of science fictional times (here: year 160742).  Even though this
is bad input for KBUILD_BUILD_TIMESTAMP, it should not break the initramfs
cpio format.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
Cc: Thomas Kühnel <thomas.kuehnel@avm.de>
---
 usr/gen_init_cpio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
Changes v1 to v2:
  * add timezone name (UTC) to specific time stamps
  * fix typo: results -> result 

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 03b21189d58b..584ea45cff70 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -320,6 +320,12 @@ static int cpio_mkfile(const char *name, const char *location,
 		goto error;
 	}
 
+	if (buf.st_mtime > 0xffffffff) {
+		fprintf(stderr, "%s: Timestamp exceeds maximum cpio timestamp, clipping.\n",
+			location);
+		buf.st_mtime = 0xffffffff;
+	}
+
 	filebuf = malloc(buf.st_size);
 	if (!filebuf) {
 		fprintf (stderr, "out of memory\n");
@@ -551,6 +557,17 @@ int main (int argc, char *argv[])
 		}
 	}
 
+	/*
+	 * Timestamps after 2106-02-07 06:28:15 UTC have an ascii hex time_t
+	 * representation that exceeds 8 chars and breaks the cpio header
+	 * specification.
+	 */
+	if (default_mtime > 0xffffffff) {
+		fprintf(stderr, "ERROR: Timestamp 0x%08x too large for cpio format\n",
+			default_mtime);
+		exit(1);
+	}
+
 	if (argc - optind != 1) {
 		usage(argv[0]);
 		exit(1);
-- 
2.30.1

