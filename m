Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0B5150FE9
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 19:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgBCSsk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 13:48:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:39862 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728176AbgBCSsk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 13:48:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 14DE3ABB3;
        Mon,  3 Feb 2020 18:48:38 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, f.fainelli@gmail.com,
        yamada.masahiro@socionext.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: Introduce multi_v7_lpae_defconfig
Date:   Mon,  3 Feb 2020 19:48:17 +0100
Message-Id: <20200203184820.4433-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This series introduces a new configuration target,
multi_v7_lpae_defconfig, built by merging the config fragment
lpae.config with mult_v7_defconfig. Ultimately needed in order for
Raspberry Pi 4's PCIe bus to work on arm builds, but which may benefit
other boards out there.

---

Changes since RFC:
 - Move merge function into the scripts directory.

Nicolas Saenz Julienne (2):
  kbuild: Add config fragment merge functionality
  ARM: add multi_v7_lpae_defconfig

 arch/arm/Makefile            |  4 ++++
 arch/arm/configs/lpae.config |  1 +
 arch/powerpc/Makefile        | 12 +-----------
 scripts/Makefile.defconf     | 15 +++++++++++++++
 4 files changed, 21 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/configs/lpae.config
 create mode 100644 scripts/Makefile.defconf

-- 
2.25.0

