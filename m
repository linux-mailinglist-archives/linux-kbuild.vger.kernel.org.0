Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF1942ADA4
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 22:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhJLUOr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 16:14:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43527 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLUOq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 16:14:46 -0400
Received: from leknes.fjasle.eu ([92.116.69.156]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MV5KC-1m9Kp83Dss-00S6dc; Tue, 12 Oct 2021 22:12:28 +0200
Received: from fjasle.eu (localhost [IPv6:::1])
        by leknes.fjasle.eu (Postfix) with ESMTP id B65E73C062;
        Tue, 12 Oct 2021 22:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1634069545; bh=7ioTkt/dIjLk+061oxZYUFxlbF1EIkze9bV8n/8WIAM=;
        h=From:To:Cc:Subject:Date:From;
        b=Gm3QLty+4pzW172OIZbpnFwajmLWAagvrulwZ9egM83NzpQ048sneoiFCTdQPHi6a
         txtzGM9zy1jx7F9Q4PQLLJWMoXv3H3QD6i/wbXypRLQkajgq/42GmSDd/eNL7Kt/Yp
         RiNoH02CIkvH4TzWNad/Dx7V+BEvHpATXoznW9Rk=
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        =?UTF-8?q?Thomas=20K=C3=BChnel?= <thomas.kuehnel@avm.de>
Subject: [PATCH v3] initramfs: Check timestamp to prevent broken cpio archive
Date:   Tue, 12 Oct 2021 20:12:20 +0000
Message-Id: <20211012201220.3310806-1-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7M7rZdSNQCf+6LRAbTcmVz5U6yF0PAE5lTK23NpjRlIo847dyqZ
 Y2gD1zIb5dL/BV2T+x76T+wy+G8079CPWzyyGHjK9laKoG5Pmp10HBXA2cOOHM65ErED5d8
 6gJIkWcGB7v6jtf7ViW/Q7xzxD8CpZOyZw3IWQG0gJSBQUznBPOWPFaXp7UBvXp4+OJVOr+
 xGwgIO5eRMSPmlllcr2oA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jBrS5+DHFrY=:mF/3GpKrMCsYBu5PW7VxId
 NC4sGvqO9EazT6GSK8iLnNBZZQUXQVmmHDiT7GqC3/QCZ4CMe3lElL4Dwgk+ReCaqk+TfdazY
 zq+dbmN4+SZQtI/bLTrJkNtKVoH6+sejQ2LM4xvhAO2y1w+cUlul/OjqmMPjdOFNUcNAXuo3M
 3T7rF4fGkcP60KwCIirgqUMXqBBLL8k0lpti2ilo2EASua6qbmBL7xI7kYvmEhqkvD64vFMCu
 AKS9/5jL5uFJHwvYgbE7y1ngqhJaeLq1DlJ4cRtmPIxPCRNrmpwsMT/6VKBHXeRDKfF33Fsri
 Su9NLfEftrsPTrejp3HcKMmbivhyvs0DS5ATaOyUr1fLeCPz/1jhRYzASwADmsBN9nHWkpPMC
 pylv/33m577m7An4K1z8lkJKKjo+G4dX+fQcMOLJaIK1uhkwmzFvOVQjAbw9vxVrGpmFdOsK+
 oxD28j1aTt/9pYVSN2+Kurit5Hq9xNK1UztOZJJB64RMAfocYnwEbueBb6htSB/UB4zg1Jmv2
 uxuHiz2E50py9Us3X1/u1V7sAIDFbEokq9tKIMjEwpKM9zggYUOwdQFU3wTFYfsjcInD8++Yw
 MTMLm6+SmngHTrUdDsMoV13lEL5j6R0iNjS9aKk2PBc6Lb4xgn5ILddZXMUiYlnPilU1zdCuY
 OH3WyDsWBYuavVca3gEdBhv5QQOZ+MlxVYneWp3aWfFTSY0uYYuqncTPJZWjdIGgWIp0y399n
 D+OO52AuFV1sKAa7w+D9jU79Prao+tvfZs8Wpw==
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
1607420928 = 2021-12-08 9:48:48 UTC) will be interpreted by `date` as a valid
date specification of science fictional times (here: year 160742).  Even though
this is bad input for KBUILD_BUILD_TIMESTAMP, it should not break the initramfs
cpio format.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
Cc: Thomas Kühnel <thomas.kuehnel@avm.de>
---
 usr/gen_init_cpio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 03b21189d58b..97aeeecf7386 100644
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
@@ -551,6 +557,16 @@ int main (int argc, char *argv[])
 		}
 	}
 
+	/*
+	 * Timestamps after 2106-02-07 06:28:15 UTC have an ascii hex time_t
+	 * representation that exceeds 8 chars and breaks the cpio header
+	 * specification.
+	 */
+	if (default_mtime > 0xffffffff) {
+		fprintf(stderr, "ERROR: Timestamp too large for cpio format\n");
+		exit(1);
+	}
+
 	if (argc - optind != 1) {
 		usage(argv[0]);
 		exit(1);
-- 
2.30.1

