Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0BB33D89A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 17:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbhCPQEG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 12:04:06 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:34367 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238427AbhCPQDv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 12:03:51 -0400
Received: by mail-qk1-f178.google.com with SMTP id t4so35770821qkp.1;
        Tue, 16 Mar 2021 09:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jn7puAXTFIhUgyhOIBysq+fpBrgiBa64dIrmZ+W414k=;
        b=M+YQ9TlY04X/j18BA/TRM0Oe8hV7wqHEv0dEN0gW4a7p8rQdNY0/3QKHpaPa9mkHST
         R9+ypkZ1b9xRnTR+MriVC/1u9K3t4dRQ93vTChiUh60rHLx4wD8Z2LqvWsRM/xSJVElt
         ZH1BvjYYS5zilDWqyJJs20wkbSiG9fl5D/8FAmAjXBByIPRhqGawo42mfwclDJeyXxGQ
         JHda22+BiqXKufNX1WQBUl26Dp5YwxByXe3evoj4tTb+4kZT2WwMt6mrOs8VnFebXbkC
         thwjDmTxpP4+tDmcIO/ddkm08uA9/uATI1gl+FXbEzI8rEERhncuWtV66VC+6p4YStEi
         iW+Q==
X-Gm-Message-State: AOAM531do70N6FedErJwtxgI2CmSfEtRyzBIiS0W+4stfSaoAsnUJOOl
        FTCpGSu90uNLtMJrntfkoFg=
X-Google-Smtp-Source: ABdhPJyqbY6J/1me1tmRW0knalPGMK+IS3TX+RaT2yJfiWve0JHHpTrsJdMXTcl+jVayjXVyv/EdDA==
X-Received: by 2002:a05:620a:46:: with SMTP id t6mr298549qkt.358.1615910630576;
        Tue, 16 Mar 2021 09:03:50 -0700 (PDT)
Received: from MacBook-Pro.internal.carlosedp.com (201-0-65-182.dsl.telesp.net.br. [201.0.65.182])
        by smtp.googlemail.com with ESMTPSA id k8sm12080356qth.74.2021.03.16.09.03.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Mar 2021 09:03:50 -0700 (PDT)
From:   Carlos de Paula <me@carlosedp.com>
Cc:     david.abdurachmanov@sifive.com, Carlos de Paula <me@carlosedp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH] kbuild: buildtar: add riscv support
Date:   Tue, 16 Mar 2021 13:02:43 -0300
Message-Id: <20210316160242.61712-1-me@carlosedp.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make 'make tar-pkg' and 'tarbz2-pkg' work on riscv.

Signed-off-by: Carlos de Paula <me@carlosedp.com>
---
 scripts/package/buildtar | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 936198a90477..221aa7df008d 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -123,10 +123,18 @@ case "${ARCH}" in
 				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 				break
 			fi
 		done
 		;;
+	riscv)
+		for i in Image.bz2 Image.gz Image; do
+			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
+				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+				break
+			fi
+		done
+		;;
 	*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
 		echo "" >&2
 		echo '** ** **  WARNING  ** ** **' >&2
 		echo "" >&2
-- 
2.20.1

