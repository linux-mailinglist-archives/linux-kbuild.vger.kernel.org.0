Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F653BC3F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2019 10:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392187AbfIXIRs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Sep 2019 04:17:48 -0400
Received: from s3.sipsolutions.net ([144.76.43.62]:37660 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388712AbfIXIRs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Sep 2019 04:17:48 -0400
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <johannes@sipsolutions.net>)
        id 1iCg0z-00008t-OU; Tue, 24 Sep 2019 10:17:41 +0200
Message-ID: <c8cbee753dc0306fd7597f43a45e05d99d404b29.camel@sipsolutions.net>
Subject: static EXPORT_SYMBOL checker causes false positives on ARCH=um
From:   Johannes Berg <johannes@sipsolutions.net>
To:     linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
        Denis Efremov <efremov@linux.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Emil Velikov <emil.l.velikov@gmail.com>
Cc:     linux-kbuild@vger.kernel.org
Date:   Tue, 24 Sep 2019 10:17:40 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

With the new commit 15bfc2348d54 ("modpost: check for static
EXPORT_SYMBOL* functions") we get a lot of warnings on ARCH=um builds:

WARNING: "rename" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "lseek" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "ftruncate64" [vmlinux] is a static EXPORT_SYMBOL
[...]
see https://p.sipsolutions.net/7232995f34907b9d.txt


This hack fixes *most* of them:

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 820eed87fb43..3e443563ebea 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1931,12 +1931,18 @@ static void check_sec_ref(struct module *mod, const char *modname,
 static char *remove_dot(char *s)
 {
 	size_t n = strcspn(s, ".");
+	char *at;
 
 	if (n && s[n]) {
 		size_t m = strspn(s + n + 1, "0123456789");
 		if (m && (s[n + m] == '.' || s[n + m] == 0))
 			s[n] = 0;
 	}
+
+	at = strchr(s, '@');
+	if (at)
+		*at = 0;
+
 	return s;
 }
 

(but obviously just serves to give you an idea of what's going on).


With that, only two remain for me:

WARNING: "__guard" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "__stack_smash_handler" [vmlinux] is a static EXPORT_SYMBOL

and I think that's because they don't even exist at all, so arguably the
code shouldn't export them, but I didn't find a way to detect at build
time if -fstack-protector was enabled or not?

Any thoughts?

Thanks,
johannes

