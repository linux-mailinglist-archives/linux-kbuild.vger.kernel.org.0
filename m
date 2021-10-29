Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4061A43FF7E
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 17:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhJ2Pbr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 11:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhJ2Pbr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 11:31:47 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E12C061570;
        Fri, 29 Oct 2021 08:29:18 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521356;
        bh=xpkQwOJ7rx6E7Tl8iUgiaBxrMqco6gv/RoKR4AOF7aA=;
        h=From:To:Cc:Subject:Date:From;
        b=apdbY5SvWPXfqQ3QIb2YfkeYUapqFBCQM3itUQq5AD5/K5895K0QHwqDdYETsBCqt
         hV1EGtz/iOl0mtnhd1MUNQ3zlRTGDBUgNftBBOi/XS+Py0nmD8LdA1MCyvQ0CMz44g
         UwBlgMqjvULYhrtjmPWawPID6+1eAnmMwj8iFTvE=
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
Date:   Fri, 29 Oct 2021 17:28:55 +0200
Message-Id: <20211029152901.297939-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently as soon as any ISHTP device appears all available ISHTP device
drivers are loaded automatically.
This series extends the MODULE_DEVICE_TABLE() functionality to properly handle
the ishtp bus and switches the drivers over to use it.

Patch 1 adds the infrastructure to handle ishtp devices via MODULE_DEVICE_TABLE()
Patch 2 replaces some inlined constants with ones now defined by mod_devicetable.h
Patches 3-6 migrate all ishtp drivers to MODULE_DEVICE_TABLE()

Note: This patchset is based on the pdx86/for-next tree because that contains
one of the drivers that is not yet in the other trees.

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Mark Gross <markgross@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Benson Leung <bleung@chromium.org>

Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

Thomas Weißschuh (6):
  HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()
  HID: intel-ish-hid: use constants for modaliases
  HID: intel-ish-hid: fw-loader: only load for matching devices
  HID: intel-ish-hid: hid-client: only load for matching devices
  platform/chrome: chros_ec_ishtp: only load for matching devices
  platform/x86: isthp_eclite: only load for matching devices

 drivers/hid/intel-ish-hid/ishtp-fw-loader.c  |  7 +++++-
 drivers/hid/intel-ish-hid/ishtp-hid-client.c |  7 +++++-
 drivers/hid/intel-ish-hid/ishtp/bus.c        |  4 ++--
 drivers/platform/chrome/cros_ec_ishtp.c      |  7 +++++-
 drivers/platform/x86/intel/ishtp_eclite.c    |  7 +++++-
 include/linux/mod_devicetable.h              | 13 +++++++++++
 scripts/mod/devicetable-offsets.c            |  3 +++
 scripts/mod/file2alias.c                     | 24 ++++++++++++++++++++
 8 files changed, 66 insertions(+), 6 deletions(-)


base-commit: 85303db36b6e170917a7bc6aae4898c31a5272a0
-- 
2.33.1

