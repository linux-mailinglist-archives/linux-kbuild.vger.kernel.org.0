Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFD5433D85
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Oct 2021 19:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbhJSRea (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Oct 2021 13:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhJSRea (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Oct 2021 13:34:30 -0400
Received: from out1.mail.ruhr-uni-bochum.de (out1.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:8:1001::8693:3595])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AE3C06161C
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Oct 2021 10:32:17 -0700 (PDT)
Received: from mx1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out1.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HYgmG6njwz8S8V;
        Tue, 19 Oct 2021 19:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634664735; bh=4XIsgXMrXQowSlD3puJKXa9C3mRsSG+mVf9ZjDhgnlI=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=0+f/sK0jR4r9N/KlfK99hbop+RZldK2zIu0JVcZzcqqTillW8dJL936wF4j3HZhlw
         z/KDKL4zwmryiO8UPnBO4wJO9/WokPu4ilp3vMrrXPxSSLj9WTHqvgWEqg1/oC70Ox
         VLA9nMjrbq1TjEUxQ6AVEsz1iYVjGHWjKDAcnfVA=
Received: from out1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx1.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HYgmG5jmpz8SCT;
        Tue, 19 Oct 2021 19:32:14 +0200 (CEST)
X-Envelope-Sender: <thorsten.berger@rub.de>
X-RUB-Notes: Internal origin=134.147.42.236
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [134.147.42.236])
        by out1.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HYgmG4N32z8SBc;
        Tue, 19 Oct 2021 19:32:14 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx1.mail.ruhr-uni-bochum.de
Received: from [10.150.66.4] (nb02.ig09.ruhr-uni-bochum.de [10.150.66.4])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HYgmG2dq4zDh0m;
        Tue, 19 Oct 2021 19:32:14 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <8d0a7ed2-d763-f4cf-3618-3c3772c096a6@rub.de>
Date:   Tue, 19 Oct 2021 19:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [RFC 3/3] Simplify dependencies for MODULE_SIG_KEY_TYPE_RSA &,
 MODULE_SIG_KEY_TYPE_ECDSA.
Content-Language: en-US
From:   Thorsten Berger <thorsten.berger@rub.de>
To:     linux-kbuild@vger.kernel.org
Cc:     "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
In-Reply-To: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Co-developed-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Patrick Franz <deltaone@debian.org>
Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
Suggested-by: Sarah Nadi <nadi@ualberta.ca>
Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>

---
 certs/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/certs/Kconfig b/certs/Kconfig
index ae7f2e876a31..f69c92e5bc30 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -17,6 +17,7 @@ config MODULE_SIG_KEY
 
 choice
     prompt "Type of module signing key to be generated"
+    depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
     default MODULE_SIG_KEY_TYPE_RSA
     help
      The type of module signing key type to generate. This option
@@ -24,14 +25,12 @@ choice
 
 config MODULE_SIG_KEY_TYPE_RSA
     bool "RSA"
-    depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
     help
      Use an RSA key for module signing.
 
 config MODULE_SIG_KEY_TYPE_ECDSA
     bool "ECDSA"
     select CRYPTO_ECDSA
-    depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
     help
      Use an elliptic curve key (NIST P384) for module signing. Consider
      using a strong hash like sha256 or sha384 for hashing modules.

-- 
2.33.0
 

-- 
Prof. Dr. Thorsten Berger
Chair of Software Engineering

Center of Computer Science
Faculty of Electr. Engr. and IT
Ruhr University Bochum, Germany

http://www.thorsten-berger.net
Tel.: +49 (0) 234 32 25975
Mob.: +49 (0) 160 926 878 10
Skype: tberger.work

