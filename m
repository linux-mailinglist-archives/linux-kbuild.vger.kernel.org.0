Return-Path: <linux-kbuild+bounces-4551-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746E9C0EE7
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9F71F2213A
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5372170B2;
	Thu,  7 Nov 2024 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oTthrFLj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5741213140
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Nov 2024 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007895; cv=none; b=uGA9SucHUwhwoihkpb8qLjpVWUB97qqC26D8tTH6fy+9N3VrUok5TdWYZ5fodKtFrSKr0qOwMmfSrSCHpZRv2kpmJzeo6hy2jRrnxc1uBqNfJHfjtB3591+zQksuf4Z4Y4GYohs0opjgXs32im8VU8yLqFumIUKkCHDS9dIZQWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007895; c=relaxed/simple;
	bh=FhVtDKAHLNobaF3Xr7MJKIpcbXekOH7CtAljMKvTH6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liropENwASLAFJyhgQO1HUIRJCBC2MUGrhlSXU3uZCWHcsrKMS+aWhhU8DOcZax6eUcRw0N4qVWiCPn5NB28tEe2esSq8iPfj//jufNP/2ABxJbYN1LikctzRaStW8LSV9V84xu0TP3zecodh0W9I2orKTkX5gD5Z34OnlwqW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oTthrFLj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so948088a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Nov 2024 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007893; x=1731612693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbvSClt+dAXUM1kgWg8I5q9vyT6fSjbN1Ij//6r0NEI=;
        b=oTthrFLjxQ4Wkc6O4vxIf8kr2X3q4wRMAT9adKQzxRe8tm4r4AlgWyIEb5vpkoDZQf
         LjyrIYV736lZ0bnHUgsMqeKGw0k0lDWnZXksat1lyKGkPXUXeJX23irry424C5urqWXc
         u33lzg5mgFD3Jh/xmch1yODDHdbzrKC8oHxjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007893; x=1731612693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbvSClt+dAXUM1kgWg8I5q9vyT6fSjbN1Ij//6r0NEI=;
        b=nQ+o3VhWGVWNkVlK6DqkC7bbzynYEreas0dQ4y1N+MVWXtVk/J5Lrg/2k/LRvC10tP
         wDV9+B34OF7KBE/i07jk15Nv6410CPO+b+d+iOhAvd8AlSJN6WSdUBq00koA8IBxxth8
         5hhbz7WKpn+alfyJNfxOrvJ56S5WdZ1AGrfV7K0TeAL9hvJx+U3GcJPtJqmQ99U2OcNY
         Aydvsa2mvpght9aehrs4XeWOVKo3gtEJNpbEVFlFj6vC15fKRH4kstZYjCPSkLa7qcef
         /OSALWYvldlhfWKSFkxK+sfpNuVDRLuMz3K+smLS2Urt/aldXrCpvOlJRev2aMBtmt+3
         kYdA==
X-Forwarded-Encrypted: i=1; AJvYcCWDDwO/w6sSoY26zKW1x2g2cpBLpw6yI4P4r2I4qEOpCs5cY96FnkhqBxii03rbX8QlJz+ccHkK+ISM938=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGsmYaGqlJ1yKleJ++deG0UhUgtIe7QJJev/gwlUjNk9slxAjR
	A49Zsh0yQnHJ3dX6rmzUzl9CcVKh/RR7UDNrEhuOYEc8xznIRsRMJEZ4mtmy3Q==
X-Google-Smtp-Source: AGHT+IEbLiBW3PaYgjufhiOm00mstGi5fV/4ArJUPxEYJmyYx8kjZqmIWOQFXW/GQR4cVKjQcYgHcw==
X-Received: by 2002:a17:90a:e7cb:b0:2e2:e8fc:e0dd with SMTP id 98e67ed59e1d1-2e9b1748ba3mr394578a91.35.1731007892871;
        Thu, 07 Nov 2024 11:31:32 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e9a5f8f4e2sm2071802a91.26.2024.11.07.11.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:32 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] Thunderbolt and DP altmode support for cros-ec-typec
Date: Thu,  7 Nov 2024 11:29:53 -0800
Message-ID: <20241107193021.2690050-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Heikki, Tzung-Bi et al,

This patch series adds support for alternate mode entry for the
cros-ec-typec driver for Displayport and Thunderbolt.

Thunderbolt support is added by adapting an RFC Heikki had posted
previously:

https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogerus@linux.intel.com/

A few comments on the series:

* The cros-ec interface will not accept any VDOs/VDMs so we simply
  ignore any configurations we are passed (i.e. DPConfigure). This means
  the sysfs control of DP lanes won't work.
* ChromeOS has two modes of operation for alt-modes: entirely EC driven
  or AP-driven from userspace (via the typec daemon). Thus, we don't
  expect the kernel alt-mode drivers to auto-enter modes in all cases.
  This series allows auto-enter for displayport but disables it for TBT
  for this reason.

This was tested with a ChromeOS Brya device using kernel 6.6 and built
with allmodconfig for linux-usb.

Thanks,
Abhishek

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series
- Revert rename of TYPEC_TBT_MODE
- Remove mode from typec_device_id
- Use port.active instead of introducing auto-enter field
- Introduce inactive field to typec_altmode_desc to set default value
  for active.
- Always make port 'active' field writable
- Refactored typec_altmode_dp_data per review request
- Removed unused vdm operations during altmode registration
- Fix usage of TBT sid and mode.
- Removed unused vdm operations during altmode registration
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match
- Use <linux/usb/typec_tbt.h> and add missing TBT_CABLE_ROUNDED
- Pass struct typec_thunderbolt_data to typec_altmode_notify
- Rename TYPEC_TBT_MODE to USB_TYPEC_TBT_MODE
- Use USB_TYPEC_TBT_SID and USB_TYPEC_TBT_MODE for device id
- Change module license to GPL due to checkpatch warning
- Refactored displayport into cros_typec_altmode.c to extract common
  implementation between altmodes
- Refactored thunderbolt support into cros_typec_altmode.c
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

Abhishek Pandit-Subedi (6):
  usb: typec: Only use SVID for matching altmodes
  usb: typec: Check port is active before enter mode on probe
  platform/chrome: cros_ec_typec: Update partner altmode active
  platform/chrome: cros_ec_typec: Displayport support
  platform/chrome: cros_ec_typec: Thunderbolt support
  platform/chrome: cros_ec_typec: Disable tbt on port

Heikki Krogerus (1):
  usb: typec: Add driver for Thunderbolt 3 Alternate Mode

 MAINTAINERS                                  |   3 +
 drivers/platform/chrome/Makefile             |   7 +
 drivers/platform/chrome/cros_ec_typec.c      |  47 ++-
 drivers/platform/chrome/cros_ec_typec.h      |   1 +
 drivers/platform/chrome/cros_typec_altmode.c | 360 +++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  48 +++
 drivers/usb/typec/altmodes/Kconfig           |   9 +
 drivers/usb/typec/altmodes/Makefile          |   2 +
 drivers/usb/typec/altmodes/displayport.c     |   9 +-
 drivers/usb/typec/altmodes/nvidia.c          |   2 +-
 drivers/usb/typec/altmodes/thunderbolt.c     | 312 ++++++++++++++++
 drivers/usb/typec/bus.c                      |   6 +-
 drivers/usb/typec/class.c                    |   9 +-
 include/linux/usb/typec.h                    |   2 +
 include/linux/usb/typec_tbt.h                |   1 +
 scripts/mod/devicetable-offsets.c            |   1 -
 scripts/mod/file2alias.c                     |   4 +-
 17 files changed, 793 insertions(+), 30 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.c
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

-- 
2.47.0.277.g8800431eea-goog


