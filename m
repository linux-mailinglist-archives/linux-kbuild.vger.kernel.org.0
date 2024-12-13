Return-Path: <linux-kbuild+bounces-5132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E059F1A25
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 00:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E13188E0D2
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 23:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4C01BE871;
	Fri, 13 Dec 2024 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W2Eshdft"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462BF1B6CE0
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132957; cv=none; b=YiOkPrVdhC+WtGzSU56clP81npAcYGiZ1IfGQKhQeq0h3CCltu8G7WS0OBnsS1ezhx8MPLFI0ZyqOxqWN3juHa3tnzx1QxTLvY9iy+hrrjzw8AHJNJhLeqR5yJH3eumLRzhV6vb9LsbUVXLz1Mo+fNv9PbbOsRbwOs6bPGX8Bm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132957; c=relaxed/simple;
	bh=0j+16PpN+91mUK3wyIrIzkLt+SoJgk/lLKUzYw0f3S4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEKDOWR5zRr+qCS4k4iZqJsnNLSGfFX9DCuydVCBMdlC+O9pNOJeVBdsHJqNnJSiMKtcc3nc8olmT/x2uJJD2iPOKqR6vMZJTbZ9E+dieX/uDD5b82U9YvMB07oVdQaWTvMnk9DW8/I/Xlk0wB9sZj3pbT/8sGarhl4YWzbHI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W2Eshdft; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso27599335ad.2
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 15:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132954; x=1734737754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTFT9yz4pM1OFjc+buOwPNQT6jdZkXPwXL3n28Tfbzs=;
        b=W2EshdftAyJ6NblwCEAydEKCaUT53b1xn6OfAegr3VF7mcgTirF+/EGRt9yxay2RqF
         P5lXmURy8jRXOYs5d5KgAqTotxBotiEdT2p3cj6LL+jD6m3ZWqj0RPncE22MzA2w1btf
         e95aYPfaT9Ii008A46qgYbZ3QJ6jQPc3+cfwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132954; x=1734737754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTFT9yz4pM1OFjc+buOwPNQT6jdZkXPwXL3n28Tfbzs=;
        b=gITwmtqtcTQkipOoulAFCyERyXMCmiEAT8hoxrgaMnXcvT2Uarb0gE6mBDmAPKaIqk
         6NZDptJuHiZIcD7P5fZAyy71aW49f6zNZt6laRN5pS6WM991V5EzUFrT/ts07/WiNepQ
         S6X7fnArr0G2XNJuZhgUiYOIfUmpOeGGnI+oKBhJkUPUvSltzCrZYgLiBrkTpMRucYAD
         RyDEGtpZ1TyTZyqWJey5DwYGCToc9mBJNZqb0K3IgCfz0qdPLCUtc2z4RrPiWaBtrf1J
         wzvSdh1kITdLUrvwAAkdKYxoMLGTrq0GGNAK2WHQw0uNs/B9n98nQ1Qa1XsCSGS8TRgv
         Pg2w==
X-Forwarded-Encrypted: i=1; AJvYcCUTkRt9qlP4jJvslUDx0GbMoZIMeqzlboJeTrPAEQoyuMUe2/0+h6D7hu3bePXjL6fKCSl/GBiDgrapGEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrvE1l5zeqrVd878FjlrxntO1pP8UICcMhQUozXu4BPYf6p+W5
	339fgIYoTbYDTqJ4VeuMnTYoe/aGcT1fr9qOCNFowNNbTysvl9ebgp2kA70JjQ==
X-Gm-Gg: ASbGncuD8nOLkP/NE9kOvVW9ioA3/RpHWemEB5e9GditJG5MBJNCvXaww242eWAmztC
	UUgtXDTzbmWjxQ8sNRa6nt085PQhQ/OfgoTNB4dt8+Y4CJSui//Nk3RIn/erJc2dE7gC+cA6tku
	0h6ghurTA9pfwo/35/nEFmBrXq5yb+SNIQqRmSNTwqmk5wKp65afCCqeVBV7ZOkfJbMHHmGYNjG
	fb2LfODA2txWKdy5JEzOVwwdVMClaX5SihDk3S3EuSAYZ9aE9SNRFZsbWWAaXYLJK7vkPuIHEMH
	2YMCGX1nG+vxDZUvIM6JqUqErQIqlGU=
X-Google-Smtp-Source: AGHT+IG5j4AMarUnG2ZSC8v4QEARGsFW4ax9MqO8wiJjh8pP/1TphunmTJECxAqe49LgP2wG4I0BzA==
X-Received: by 2002:a17:902:e542:b0:211:3275:3fe with SMTP id d9443c01a7336-21892a22a56mr48820505ad.17.1734132954576;
        Fri, 13 Dec 2024 15:35:54 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1dcb1c0sm3024755ad.65.2024.12.13.15.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:54 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/8] Thunderbolt and DP altmode support for cros-ec-typec
Date: Fri, 13 Dec 2024 15:35:41 -0800
Message-ID: <20241213233552.451927-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
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

Changes in v5:
- Rebase with module_alias_printf
- Add lockdep, missing includes and fix up block comment style.
- Extract port altmode ".active" changes to its own patch
- Put dev_err on single line.
- Slip clang-format a washington to look the other way.
- Use list_for_each_entry and simplify conditional statement within
- Include missing headers for altmodes
- Consistent use of `adata` for altmode data
- Fix incorrect alloc size of dp_data

Changes in v4:
- Large refactor to use cable_altmodes
- Fixed ordering of cable mode enter/exit (SOP', SOP", then port for
  enter; reverse order for exit)
- Other small fixes from v3 feedback
- memset struct typec_altmode_desc
- Add CONFIG_CROS_EC_TYPEC_ALTMODES for Makefile use
- Move ap_driven_altmode check to common vdm function
- Add locking to protect shared data
- Update enter/exit error messages
- Update Makefile + Kconfig to use CONFIG_CROS_EC_TYPEC_ALTMODES
- Add locking in vdm function

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series
- Revert rename of TYPEC_TBT_MODE
- Remove mode from typec_device_id
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

Changes in v1:
- Delay cable + plug checks so that the module doesn't fail to probe
  if cable + plug information isn't available by the time the partner
  altmode is registered.
- Remove unncessary brace after if (IS_ERR(plug))

Abhishek Pandit-Subedi (7):
  usb: typec: Only use SVID for matching altmodes
  usb: typec: Make active on port altmode writable
  usb: typec: Print err when displayport fails to enter
  platform/chrome: cros_ec_typec: Update partner altmode active
  platform/chrome: cros_ec_typec: Displayport support
  platform/chrome: cros_ec_typec: Thunderbolt support
  platform/chrome: cros_ec_typec: Disable tbt on port

Heikki Krogerus (1):
  usb: typec: Add driver for Thunderbolt 3 Alternate Mode

 MAINTAINERS                                  |   3 +
 drivers/platform/chrome/Kconfig              |   7 +
 drivers/platform/chrome/Makefile             |   4 +
 drivers/platform/chrome/cros_ec_typec.c      |  46 ++-
 drivers/platform/chrome/cros_ec_typec.h      |   1 +
 drivers/platform/chrome/cros_typec_altmode.c | 373 ++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  51 +++
 drivers/usb/typec/altmodes/Kconfig           |   9 +
 drivers/usb/typec/altmodes/Makefile          |   2 +
 drivers/usb/typec/altmodes/displayport.c     |   4 +-
 drivers/usb/typec/altmodes/nvidia.c          |   2 +-
 drivers/usb/typec/altmodes/thunderbolt.c     | 388 +++++++++++++++++++
 drivers/usb/typec/bus.c                      |   6 +-
 drivers/usb/typec/class.c                    |   9 +-
 include/linux/usb/typec.h                    |   2 +
 include/linux/usb/typec_tbt.h                |   1 +
 scripts/mod/devicetable-offsets.c            |   1 -
 scripts/mod/file2alias.c                     |   9 +-
 18 files changed, 885 insertions(+), 33 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.c
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

-- 
2.47.1.613.gc27f4b7a9f-goog


