Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523A720A64F
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 22:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406877AbgFYUCe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 16:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406569AbgFYUCa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 16:02:30 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F85C08C5C1;
        Thu, 25 Jun 2020 13:02:30 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p20so7138648ejd.13;
        Thu, 25 Jun 2020 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :mime-version:content-disposition:user-agent;
        bh=KU/v6+2DOdvIsmduAhT4XCqT7f4mndQHgA5loa7da7E=;
        b=bLcd7AmBcntHJVg6yWN+LmMvaumSKrnWGLfVojQ8fAiBtvXi1wdBnKKjrAuFA/wllb
         sYB+IasSGFd2JogZn/3nl0lq8FU4nxeqSD1j3JLChTk0QXtINMrAF28vUjLUfq/WOM7w
         fgGzPuiWOytlE7uuQN6m5D5DZkQEH+oUaKx+36Io9+mpA/s8YVe1pDmZiVgJapHtZTGd
         OioPH1Xwm4qtDQlUUp3+EIYi3xHosCAf/aUcXR0E13JuUtyhYrrEvECgmaqMdVyZQRay
         zLCXCLNqLEhdRBnS9vpkn0LD0F9qxNhzNlwCG9gc6IOWt3Hjb3gK/jO7aE6LSnqqY+ne
         8NMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition:user-agent;
        bh=KU/v6+2DOdvIsmduAhT4XCqT7f4mndQHgA5loa7da7E=;
        b=pzBDlPPDyLA0uZxTgx0hWENwthVAeRiajv/crukIgApd19xK6gUFwrbkjCQT5QKi1/
         K1QkiuGTEher2cOk+fh4L0mQDJfkklVbTUzgP6ze0stMiFiyVMpmACqiuRNp0Fl2jalD
         wuI+2rndctqI2e7LSw+3y0JdviZSB7PoPpfKZYVQ5FPHUBblxQLDouaM4dZ17rWnvBu+
         uirG14RUGP5FsxwZ3QdfQMUKqvqwg117cOF/54spDjysuqheRmiDYpnfmEvr/jxH2VIt
         Z4ha2GbsrdI+BpVbLwjS3E2d76oIM+l+OZ/mR32yweZBvC3eHDdnR7ZJ6qMSEXjLIDxD
         jchw==
X-Gm-Message-State: AOAM530UUCz1ZBDcUZbNOWdl3z4mIJYOJM/ThSL8Sxs85vqSnZ8oI+Wz
        l9stqosnU11BNlWH0XEqulliE85yh2c=
X-Google-Smtp-Source: ABdhPJylS7fld5NZPXNPiYC0Sr2vP0jnnoCFRK8XyzLYqww4f2O2kxlrmzlAGz6vYKywdD93RRqKQA==
X-Received: by 2002:a17:906:2b50:: with SMTP id b16mr20143974ejg.410.1593115349163;
        Thu, 25 Jun 2020 13:02:29 -0700 (PDT)
Received: from dumbo (tor-exit-6.zbau.f3netze.de. [2a0b:f4c0:16c:6::1])
        by smtp.gmail.com with ESMTPSA id k22sm19321586edr.93.2020.06.25.13.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 13:02:28 -0700 (PDT)
Received: from cavok by dumbo with local (Exim 4.92)
        (envelope-from <cavok@dumbo>)
        id 1joY4n-00050n-Ro; Thu, 25 Jun 2020 22:02:25 +0200
Date:   Thu, 25 Jun 2020 22:02:25 +0200
From:   Domenico Andreoli <domenico.andreoli@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH] kbuild: buildtar: add arm64 dtbs support
Message-ID: <20200625200225.GA18977@dumbo>
Mail-Followup-To: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Make 'make tar-pkg' install dtbs on arm64.

Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>

---
 scripts/package/buildtar |    9 +++++++++
 1 file changed, 9 insertions(+)

Index: b/scripts/package/buildtar
===================================================================
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -125,6 +125,15 @@ case "${ARCH}" in
 		;;
 esac
 
+#
+# Install dtbs
+#
+case "${ARCH}" in
+	arm64)
+		make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs" dtbs_install
+		;;
+esac
+
 if [ "${1}" = dir-pkg ]; then
 	echo "Kernel tree successfully created in $tmpdir"
 	exit 0

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
