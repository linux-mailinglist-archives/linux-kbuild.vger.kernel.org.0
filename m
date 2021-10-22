Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46A0437857
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 15:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhJVNvR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 09:51:17 -0400
Received: from out2.mail.ruhr-uni-bochum.de ([134.147.42.229]:47310 "EHLO
        out2.mail.ruhr-uni-bochum.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230342AbhJVNvR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 09:51:17 -0400
Received: from mx2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out2.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HbQgG4gCQz8S9h;
        Fri, 22 Oct 2021 15:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634910538; bh=C2c85tDUngTKhSntZh80PofANUmmI3eomXZ2LxXNAvw=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=V3Uvmn0bHZjZpkxhWx2MzKo2Lk/g5qfLjsTygyp6kJ8xkVE9n13a0dCYwP/FGn+Jf
         4qfjI0kX+ytZ2jjBWfMO4kWQtlQUVQviiuHvpPI4U2g7yn8MlSEUPZynprXVm4/zTk
         y14/slZz0XdBOqwJeQATNnHmkyGyXaFx74BTnksA=
Received: from out2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx2.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HbQgG42Xmz8SBs;
        Fri, 22 Oct 2021 15:48:58 +0200 (CEST)
X-RUB-Notes: Internal origin=134.147.42.236
X-Envelope-Sender: <thorsten.berger@rub.de>
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [134.147.42.236])
        by out2.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HbQgG1G31z8SB4;
        Fri, 22 Oct 2021 15:48:58 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx2.mail.ruhr-uni-bochum.de
Received: from [10.150.66.4] (nb02.ig09.ruhr-uni-bochum.de [10.150.66.4])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HbQgF6tFXzDh0h;
        Fri, 22 Oct 2021 15:48:57 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <60888f89-5e0d-5ab0-61dc-903be05a906b@rub.de>
Date:   Fri, 22 Oct 2021 15:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [RFC v3 12/12] Simplify dependencies for MODULE_SIG_KEY_TYPE_RSA &
 MODULE_SIG_KEY_TYPE_ECDSA
Content-Language: en-US
From:   Thorsten Berger <thorsten.berger@rub.de>
To:     linux-kbuild@vger.kernel.org
Cc:     deltaone@debian.org, phayax@gmail.com,
        Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
In-Reply-To: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
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

This choice group presents a problem as it is possible that no option can be
chosen when the choice group is visible.
Every option contains additional dependencies compared to the group. Hence it
is possible that the group is visible, but not a single option can be chosen
as these additional dependencies are not satisfied.
By moving these additional dependencies from the options into the group, a
visible choice group ensures that both options can be chosen.

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


