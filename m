Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9863A1148
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jun 2021 12:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237186AbhFIKj5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Jun 2021 06:39:57 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:37229
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237198AbhFIKj4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Jun 2021 06:39:56 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Amfh3+qs+5CcBxG8QGpbQx2Jo7skDctV00zEX?=
 =?us-ascii?q?/kB9WHVpm62j5qeTdZEgv3LJYVkqKRMdcLy7WZVoOEmyyXcX2/h0AV7BZmfbUQ?=
 =?us-ascii?q?KTRekI0WKI+UyCJ8SRzI5gPN9bAs1DIey1KVRhl8717Cm0euxN/OW6?=
X-IronPort-AV: E=Sophos;i="5.83,260,1616454000"; 
   d="scan'208";a="383923574"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 12:15:55 +0200
Date:   Wed, 9 Jun 2021 12:15:55 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Makefile: make modules install output
Message-ID: <alpine.DEB.2.22.394.2106091033070.5695@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

make modules install used to end up with something like

  INSTALL sound/usb/usx2y/snd-usb-usx2y.ko
  INSTALL sound/x86/snd-hdmi-lpe-audio.ko
  INSTALL sound/xen/snd_xen_front.ko
  INSTALL virt/lib/irqbypass.ko
  DEPMOD  5.12.0-rc2myfix-00015-gc6f886546cb8

From v5.13-rc1, it gives:

  STRIP   /lib/modules/5.13.0-rc1myfix/kernel/fs/btrfs/btrfs.ko
  STRIP   /lib/modules/5.13.0-rc1myfix/kernel/fs/xfs/xfs.ko
  STRIP   /lib/modules/5.13.0-rc1myfix/kernel/net/mac80211/mac80211.ko
  STRIP   /lib/modules/5.13.0-rc1myfix/kernel/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko
  STRIP   /lib/modules/5.13.0-rc1myfix/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
  DEPMOD  /lib/modules/5.13.0-rc1myfix

Is the full path name considered to be an improvement?  For the names of
the modules, it doesn't much matter, but the DEPMOD line was a convenient
way to get the full kernel name for subsequent rebooting.

thanks,
julia
