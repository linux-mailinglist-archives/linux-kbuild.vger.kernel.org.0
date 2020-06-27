Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD70320C13E
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jun 2020 14:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgF0MZL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jun 2020 08:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgF0MZL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 08:25:11 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31666C03E979;
        Sat, 27 Jun 2020 05:25:11 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ga4so11782655ejb.11;
        Sat, 27 Jun 2020 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :mime-version:content-disposition:user-agent;
        bh=bKj5E7fN4L3i4q9pH++a2sUBIVlAsTMv8ldQxeQKvCI=;
        b=mWYU/pH0sAu3pR53puM2h/R6Nbq7ZFJLtWEnsXU3IxMRWOy8pcW3NALxiIkpWiUmG9
         gUtjAE7eVSqqLpGyntER/yQE/31wKfDKKTwdqXKUkP8YDg4oAwGYEaz32u5Ca+UVCSuc
         HPaznexwlCqn8IOhTmWwASqxMJ/8/I75/g0W/BNnlUS7TWLXPsdp1o3o5PDlZ832L/jX
         Bh0QFxU2TBmvhma7PEWY9PWWvO3tIoq8Ai3HDjpigkUok/Khy3yof7qy3IYpLKwjSZ2X
         lMtY1VXyd0fa5Lwb54QcGlLQ/OTKK+V40E26jDcBHCNAnVRaHCp9T+pTm/0dLDhn7cl9
         CobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition:user-agent;
        bh=bKj5E7fN4L3i4q9pH++a2sUBIVlAsTMv8ldQxeQKvCI=;
        b=mWzVyzmgAL5DddWdUdsa9yfFzD/5+aUMThCPzZNiC59Bdy1nsy2mLx4ywsFXbvbmzj
         P3P3vaAJJ7xyIl9bRAQqciAdpPPH1yX/AuznW2m1imguTSC/uOcLMazDdpwXbkil1Mo0
         phMViB8svf3einPTQOTqSdKyRxEIoDEVuF2b44rEYhFYYRLoFb3v7y51EjxB9dDzuyze
         lnOGeDWsVKkeLa2KPv4kwG1Wv/A8ubE2Q2gkYdlY1NBt7lEIGzCXGy1kHMPT1RfpJx+E
         8dFqjElGd0LATLQAhm+IhZS8OeF+13YbaXojiSEBnNJHYW3SkA3DDhl10rlx0SJbWvcY
         +t/g==
X-Gm-Message-State: AOAM530Eh31LDMXeI7ZNzJPUXm9ue4Kn5FwfV4zOmRZrqFYCPAP6Y16k
        2huUFkxTQL7DtiPdrHxLGEuecwRnhJw=
X-Google-Smtp-Source: ABdhPJzAdmAJUqUIp9Tq+ONgQVfdOecfXBUf95JnGwQipAeqFBs/N8kBJidFJEeJ56tV0s5CoERgYA==
X-Received: by 2002:a17:906:7115:: with SMTP id x21mr6395079ejj.86.1593260709897;
        Sat, 27 Jun 2020 05:25:09 -0700 (PDT)
Received: from dumbo ([2a0b:f4c2:2::1])
        by smtp.gmail.com with ESMTPSA id lx26sm20642632ejb.112.2020.06.27.05.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 05:25:09 -0700 (PDT)
Received: from cavok by dumbo with local (Exim 4.92)
        (envelope-from <cavok@dumbo>)
        id 1jp9tJ-0001cI-Nb; Sat, 27 Jun 2020 14:25:05 +0200
Date:   Sat, 27 Jun 2020 14:25:05 +0200
From:   Domenico Andreoli <domenico.andreoli@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v4] kbuild: buildtar: add dtbs support
Message-ID: <20200627122505.GA6095@dumbo>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli@linux.com>

Make 'make tar-pkg' install dtbs.

v4:
 - Install the dtbs before modules & kernel, not after
 - Check for the dtbs_install target before attempting to invoke it

v3:
 - Check for CONFIG_OF_EARLY_FLATTREE=y instead of ARCH before installing dtbs

v2:
 - Add the kernel release to the destination path

Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>

---
 scripts/package/buildtar |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: b/scripts/package/buildtar
===================================================================
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -53,6 +53,18 @@ rm -rf -- "${tmpdir}"
 mkdir -p -- "${tmpdir}/boot"
 dirs=boot
 
+
+#
+# Try to install dtbs
+#
+if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
+	# Only some architectures with OF support have this target
+	if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
+		$MAKE ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
+    fi
+fi
+
+
 #
 # Try to install modules
 #

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
