Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BC6425B33
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Oct 2021 20:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhJGTBX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Oct 2021 15:01:23 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:54739 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243786AbhJGTBX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Oct 2021 15:01:23 -0400
Received: from leknes.fjasle.eu ([92.116.68.143]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M1qfu-1mWMkf1URE-002H2G; Thu, 07 Oct 2021 20:59:25 +0200
Received: from fjasle.eu (localhost [IPv6:::1])
        by leknes.fjasle.eu (Postfix) with ESMTP id 40DA83C06F;
        Thu,  7 Oct 2021 20:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1633633158; bh=Al5VQncosW6gMbmHglErvfc7HN+e1uuuItjctYY5GMg=;
        h=From:To:Cc:Subject:Date:From;
        b=tbs41ntPkChtryCvXWr4qfInSI8VoDhH2YJ07i+1mwO9klLIWm3YCRJj8qQXDlbWY
         DqMXiVWi+rp5ieSu5qXOAytI2IA8H2v73o9mNly3skK8pV+X17gBhK1VDoXoLO5dez
         iPwnNHI6VmsRL5xiMNA44i1bkuiUi3IMiDiEBhIA=
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        =?UTF-8?q?Thomas=20K=C3=BChnel?= <thomas.kuehnel@avm.de>
Subject: [PATCH] initramfs: Check timestamp to prevent broken cpio archive
Date:   Thu,  7 Oct 2021 20:59:00 +0200
Message-Id: <20211007185900.2801788-1-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jMDQqrEUzR9bz/jy0qHpXeN4fR9UfFqA3gjX36ov9LL41M3Nuli
 mtqgGAa9qfUgYJ8CWCFiQcvsEMozQ+bjHXdCkL1oLP1yMAOGIgyzbdWzDJoY1DfNaBytswa
 1USFIlsGTfPwZJJpsLndSP9Qs3cnneTauHbVsJmrBWTZVpES5efyHbuaQHisr9DnZxFmHXB
 qIKwyytDqba57LmV09mDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H3JWKoUfafk=:qcsBtBXUphnZjyyOlaFQWj
 GwhLBYntaPxDi42mLnOaCRFH63Rq5oJ2gqIsfjTuwYTAcCz57rdV6ZuAR61blKSC6wW7Pthbp
 pMORAJ9pX0VPYWaseO02qfEPaSV6294J1ykzIcn8/qineVNm6/4Lq8EY1GtSI5j5TQe7qWWMY
 CfoP2FHTcSyhiEx79177BVxNl628SN96UP6aXsEFEbvp8DAs/zWLjRphyg9l38Fbyy3lf6x1F
 BbLC+fjHeYouvXkYNe9xmIMEyyih3xvi/fKR0BA02L5R8Eg57o5vIiCARmu+W8ievSuY17ixR
 7EXp/mS1p/okUELQAHk/SPxnJeej6JXnhALMEcFkFuX1jssH3yFZSLZuBPmhboPM1o+pkgn0b
 P0qoPbg3dqJPO07TF32HYe5FFfhiCv1agC+NN5MTipwpkGPvREJLYZANZwFxV6D0ADQ/gkI4b
 Pslwtp0aN7Y6WUtYl/3IrUqOQShSpX1054xQPOVCpknIjQkbXhsmP2ugKo6YVkdLl68IPkSwr
 T9iLb62l1smLSOJzjVZAzjq2lFoSSQ/5PmlX9sSLze//T97Ct5TnKnpOrHlSsiiBLgUrdxKpj
 rEwqkHJ7jHC0n2JLfqstFa3x4sERDjWw5b0dLF/tQZ+vzKFxQ7UBszy9oWiGeYo9p6BEBBvUz
 v448CGuKeJx8Z8e9VLk80tTDwLbGrWO+OQa/AH0RV4W+QKWNxbh3aU4RGg16w0LhpX2F83Nov
 bBS0GBUyCEfQKXnXCvJuGuGLH6wJwEAveHDsgA==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Cpio format reserves 8 bytes for an ASCII representation of a time_t timestamp.
While 2106-02-07 06:28:15 (time_t = 0xffffffff) is still some years in the
future, a poorly chosen date string for KBUILD_BUILD_TIMESTAMP, converted into
seconds since the epoch, might lead to exceeded cpio timestamp limits that
results in a broken cpio archive.  Add timestamp checks to prevent overrun of
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

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 03b21189d58b..983dcdd35925 100644
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
+	 * Timestamps after 2106-02-07 06:28:15 have an ascii hex time_t
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

