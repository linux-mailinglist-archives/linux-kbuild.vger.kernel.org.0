Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865B320BB50
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 23:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgFZVVC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 17:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgFZVVB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 17:21:01 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A821C03E979;
        Fri, 26 Jun 2020 14:21:01 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id h28so7995479edz.0;
        Fri, 26 Jun 2020 14:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :mime-version:content-disposition:user-agent;
        bh=lFptft2lFlGgH6Ls5S7552RJmoH/AEQDRgWhsRsHtUE=;
        b=nKPvNBBeTfgW8XKWlK6PPtRA6K+ZMGEPx8hxN8Cncw+i0usEnRaAp8urMZy2m3ScTc
         fE3GpcISVMrBM1L1IfcSxg8uBTj4sw340qYS3A72FSC1YVOHeXkBeaFsT76/C05C6mdx
         lkJfONrK5eECqod0Yex48il7pnVPT6CSijmamHtEYZ9xCo03S4tk1psYPu4kco7ne79q
         xCLmCvQ2d0xfP9LnkBPnp8zwaekVmzfXy5Zt1LbNiAwS0np4MWPUe/2sGDvWqqMhvcGg
         fpRHJ2XF7wrEAjsqD5O6HgginW2dObkUQaiOiOIZ2BsXHAAKo9ctXh47suKIFqfS2CHW
         spcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition:user-agent;
        bh=lFptft2lFlGgH6Ls5S7552RJmoH/AEQDRgWhsRsHtUE=;
        b=ppsQWYYhcUGVBmx46f8lU7mNbIBjKXFpxcs3VsY7qrKs9gwavxmkozmvBX99uUffqd
         rF7q5yKwRFBqNZunaB641xbEmFFwSGHajhWCE1JV1clnf5KhxgfS7+t3d+SJlnjYLVx7
         SULLmQoTqrN5748BpBSbjThfyHjiWpX7qfasDAo4HLSUtAjXVsUa6za4oIUdSsMOJO7K
         xzIPIBt2ZUnoK6lZMaoOoM0CjkmXUK6mHxMwWFybDZbD6lc6IHp8sEHLU1NFdhY8DXP9
         xDjZoj+dOoPk0+7Lq/W8LdG7nyXltOTbYvQ4SYfHNqxTu7/6F8PADPddJ8isMA6PMUA9
         ePLg==
X-Gm-Message-State: AOAM5332pPELwvw8ZCJ2xUNBJf4WedSgum16lOpkeI2+YQQd1Ptks55u
        CFvhLEPcnsN512t+xoNi2CA/5qy0jpM=
X-Google-Smtp-Source: ABdhPJx4ebV6dX3wrvLlYT2vl15qIO6y7j6T7jEUaS7hHoa0turcJ862VRbr3mXYrH8UxENn1/89eA==
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr5396146edt.26.1593206460170;
        Fri, 26 Jun 2020 14:21:00 -0700 (PDT)
Received: from dumbo ([2a0b:f4c1::6])
        by smtp.gmail.com with ESMTPSA id b4sm5853484edx.96.2020.06.26.14.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 14:20:58 -0700 (PDT)
Received: from cavok by dumbo with local (Exim 4.92)
        (envelope-from <cavok@dumbo>)
        id 1jovmK-0006pd-8X; Fri, 26 Jun 2020 23:20:56 +0200
Date:   Fri, 26 Jun 2020 23:20:56 +0200
From:   Domenico Andreoli <domenico.andreoli@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3] kbuild: buildtar: add dtbs support
Message-ID: <20200626212056.GA25753@dumbo>
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

v3:
 - Check CONFIG_OF_EARLY_FLATTREE=y instead of ARCH before installing dtbs

v2:
 - Destination path includes the kernel version, as expected

Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>

---
 scripts/package/buildtar |    7 +++++++
 1 file changed, 7 insertions(+)

Index: b/scripts/package/buildtar
===================================================================
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -125,6 +125,13 @@ case "${ARCH}" in
 		;;
 esac
 
+#
+# Install dtbs
+#
+if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
+	$MAKE ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
+fi
+
 if [ "${1}" = dir-pkg ]; then
 	echo "Kernel tree successfully created in $tmpdir"
 	exit 0

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
