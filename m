Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B75434856
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 11:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhJTJwG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 05:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhJTJwE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 05:52:04 -0400
Received: from out3.mail.ruhr-uni-bochum.de (out3.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:8:1001::8693:359b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18E3C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 02:49:50 -0700 (PDT)
Received: from mx3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out3.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HZ5SF1lBHz8S3H;
        Wed, 20 Oct 2021 11:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634723389; bh=KkxkAGWOoWRlhmMW/7vza9LiR80gL0bs9baNZTeSPSg=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=V5CTrcsgyzC8MQHmTWYyRQ5+YSxoc/PhIQVigIlcY/39+jjVSsW06zC6ofHeoAQ4H
         ELqvVQh9mHrt9lUbZFsuxBqLptRpkWSjx/6Tcs6FNh/ePnu++/zLo12lJ3rpwOdo+D
         a+i8aQvozWFTIQDUm7mfsp89Zx80r1I9ZPXBhawM=
Received: from out3.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx3.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HZ5SD3skMz8SFg;
        Wed, 20 Oct 2021 11:49:48 +0200 (CEST)
X-RUB-Notes: Internal origin=IPv6:2a05:3e00:c:1001::8693:2aec
X-Envelope-Sender: <thorsten.berger@rub.de>
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:c:1001::8693:2aec])
        by out3.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HZ5SD0hgxz8SFP;
        Wed, 20 Oct 2021 11:49:48 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx3.mail.ruhr-uni-bochum.de
Received: from [192.168.188.22] (unknown [5.63.49.65])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HZ5SC58rWzDgyf;
        Wed, 20 Oct 2021 11:49:47 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <fdbbc1a6-5806-85a0-5b37-206558facaab@rub.de>
Date:   Wed, 20 Oct 2021 11:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [RFC 12/12] Simplify dependencies for MODULE_SIG_KEY_TYPE_RSA &
 MODULE_SIG_KEY_TYPE_ECDSA
Content-Language: en-US
From:   Thorsten Berger <thorsten.berger@rub.de>
To:     linux-kbuild@vger.kernel.org
Cc:     "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <c2b36549-5c9e-2314-bc68-b81b7c77a561@rub.de>
In-Reply-To: <c2b36549-5c9e-2314-bc68-b81b7c77a561@rub.de>
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


