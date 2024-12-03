Return-Path: <linux-kbuild+bounces-4958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5669E1921
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524E4160FB4
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739B91E22F3;
	Tue,  3 Dec 2024 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VumS0izP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF831E22EE;
	Tue,  3 Dec 2024 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221305; cv=none; b=LbDgDI5YH3TClRZt3eyoQrYQ1B4WNzAXIrNWyy+nuPFvx5VpvXtkXWHzvaXGuJwonPbOwoQr+vHQ7+SwUFtdJgD692ops9LIvphQFI74LJXBqZ3N7jJT/SmuG2raLLFQuDM26nXMNUAROKpG3avcomGf0NI7ZG7r9pexB/5HCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221305; c=relaxed/simple;
	bh=UlW/czJjONkNb/3Z0A/fAA8C7IZI+kMdfIEk3tZL8Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=En0C7823IUA/00fbin6Fsk51BRjiaxDoHVAOQTmtXAADstz766u/FxWd/zHsLzmm8ogIf40T26cqUj221h6tlgQ2ZE7D+xZd8JrQkUuP2zT0CnU4k2kdWdwWav7R24RLC8tOd3VmRkL999Zm7TXAJTMto5DKrosg+AE7Kj2/LPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VumS0izP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE21C4CED6;
	Tue,  3 Dec 2024 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733221305;
	bh=UlW/czJjONkNb/3Z0A/fAA8C7IZI+kMdfIEk3tZL8Qc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VumS0izPR00hpPLv4SGMBJzP9hwGl5ISU8a2a5l410tYS6++bPexoSqIGbcS2ck44
	 Ie0tmhZlVToV8LaU650/J3U9IFrGe7dBUZjw9u19yLy019oqG05vPMxLsc2rib6ZBU
	 YSQXwZP+BvUDB3o9vf7bTXrbhDyHGHK3Eb6C1RG/2/6i4CaAcISVqkWh9zKe2Cbvgo
	 kr/TI9/Nwodtd9M5thfhJx9AgBOp2SQucbsH4Fsp1HxKIVZS9hpP5hGGC0wAzvOjyY
	 9d2JNp4xmVyCIernKgKOrI+QjqDX9dVz7C6FCVPCA6j1TywXy5HBSRlYdT3K+gxJfU
	 CR+Bkp6th5Hhg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthias Maennich <maennich@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] module: Convert default symbol namespace to string literal
Date: Tue,  3 Dec 2024 19:21:07 +0900
Message-ID: <20241203102124.3147478-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203102124.3147478-1-masahiroy@kernel.org>
References: <20241203102124.3147478-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit cdd30ebb1b9f ("module: Convert symbol namespace to string
literal") only converted MODULE_IMPORT_NS() and EXPORT_SYMBOL_NS(),
leaving DEFAULT_SYMBOL_NAMESPACE as a macro expansion.

This commit converts DEFAULT_SYMBOL_NAMESPACE in the same way to
avoid annoyance for the default namespace as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/core-api/symbol-namespaces.rst                  | 4 ++--
 .../translations/it_IT/core-api/symbol-namespaces.rst         | 4 ++--
 .../translations/zh_CN/core-api/symbol-namespaces.rst         | 4 ++--
 drivers/cdx/Makefile                                          | 2 +-
 drivers/crypto/intel/iaa/Makefile                             | 2 +-
 drivers/crypto/intel/qat/qat_common/Makefile                  | 2 +-
 drivers/dma/idxd/Makefile                                     | 2 +-
 drivers/gpio/gpio-idio-16.c                                   | 2 +-
 drivers/hwmon/nct6775-core.c                                  | 2 +-
 drivers/i2c/busses/i2c-designware-common.c                    | 2 +-
 drivers/i2c/busses/i2c-designware-master.c                    | 2 +-
 drivers/i2c/busses/i2c-designware-slave.c                     | 2 +-
 drivers/pwm/core.c                                            | 2 +-
 drivers/pwm/pwm-dwc-core.c                                    | 2 +-
 drivers/pwm/pwm-lpss.c                                        | 2 +-
 drivers/tty/serial/sc16is7xx.c                                | 2 +-
 drivers/usb/storage/Makefile                                  | 2 +-
 include/linux/export.h                                        | 2 +-
 18 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 55886b4e6aea..27a9cccc792c 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -68,7 +68,7 @@ is to define the default namespace in the ``Makefile`` of the subsystem. E.g. to
 export all symbols defined in usb-common into the namespace USB_COMMON, add a
 line like this to drivers/usb/common/Makefile::
 
-	ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON
+	ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE='"USB_COMMON"'
 
 That will affect all EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL() statements. A
 symbol exported with EXPORT_SYMBOL_NS() while this definition is present, will
@@ -79,7 +79,7 @@ A second option to define the default namespace is directly in the compilation
 unit as preprocessor statement. The above example would then read::
 
 	#undef  DEFAULT_SYMBOL_NAMESPACE
-	#define DEFAULT_SYMBOL_NAMESPACE USB_COMMON
+	#define DEFAULT_SYMBOL_NAMESPACE "USB_COMMON"
 
 within the corresponding compilation unit before any EXPORT_SYMBOL macro is
 used.
diff --git a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
index df152c2c55db..6ee713988531 100644
--- a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
@@ -69,7 +69,7 @@ Per esempio per esportare tutti i simboli definiti in usb-common nello spazio
 dei nomi USB_COMMON, si può aggiungere la seguente linea in
 drivers/usb/common/Makefile::
 
-	ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON
+	ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE='"USB_COMMON"'
 
 Questo cambierà tutte le macro EXPORT_SYMBOL() ed EXPORT_SYMBOL_GPL(). Invece,
 un simbolo esportato con EXPORT_SYMBOL_NS() non verrà cambiato e il simbolo
@@ -79,7 +79,7 @@ Una seconda possibilità è quella di definire il simbolo di preprocessore
 direttamente nei file da compilare. L'esempio precedente diventerebbe::
 
 	#undef  DEFAULT_SYMBOL_NAMESPACE
-	#define DEFAULT_SYMBOL_NAMESPACE USB_COMMON
+	#define DEFAULT_SYMBOL_NAMESPACE "USB_COMMON"
 
 Questo va messo prima di un qualsiasi uso di EXPORT_SYMBOL.
 
diff --git a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
index fc7f3797dcee..b1bec219912d 100644
--- a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
@@ -66,7 +66,7 @@
 子系统的 ``Makefile`` 中定义默认命名空间。例如，如果要将usb-common中定义的所有符号导
 出到USB_COMMON命名空间，可以在drivers/usb/common/Makefile中添加这样一行::
 
-       ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON
+       ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE='"USB_COMMON"'
 
 这将影响所有 EXPORT_SYMBOL() 和 EXPORT_SYMBOL_GPL() 语句。当这个定义存在时，
 用EXPORT_SYMBOL_NS()导出的符号仍然会被导出到作为命名空间参数传递的命名空间中，
@@ -76,7 +76,7 @@
 成::
 
        #undef  DEFAULT_SYMBOL_NAMESPACE
-       #define DEFAULT_SYMBOL_NAMESPACE USB_COMMON
+       #define DEFAULT_SYMBOL_NAMESPACE "USB_COMMON"
 
 应置于相关编译单元中任何 EXPORT_SYMBOL 宏之前
 
diff --git a/drivers/cdx/Makefile b/drivers/cdx/Makefile
index 749a3295c2bd..3ca7068a3052 100644
--- a/drivers/cdx/Makefile
+++ b/drivers/cdx/Makefile
@@ -5,7 +5,7 @@
 # Copyright (C) 2022-2023, Advanced Micro Devices, Inc.
 #
 
-ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=CDX_BUS
+ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE='"CDX_BUS"'
 
 obj-$(CONFIG_CDX_BUS) += cdx.o controller/
 
diff --git a/drivers/crypto/intel/iaa/Makefile b/drivers/crypto/intel/iaa/Makefile
index b64b208d2344..55bda7770fac 100644
--- a/drivers/crypto/intel/iaa/Makefile
+++ b/drivers/crypto/intel/iaa/Makefile
@@ -3,7 +3,7 @@
 # Makefile for IAA crypto device drivers
 #
 
-ccflags-y += -I $(srctree)/drivers/dma/idxd -DDEFAULT_SYMBOL_NAMESPACE=IDXD
+ccflags-y += -I $(srctree)/drivers/dma/idxd -DDEFAULT_SYMBOL_NAMESPACE='"IDXD"'
 
 obj-$(CONFIG_CRYPTO_DEV_IAA_CRYPTO) := iaa_crypto.o
 
diff --git a/drivers/crypto/intel/qat/qat_common/Makefile b/drivers/crypto/intel/qat/qat_common/Makefile
index eac73cbfdd38..7acf9c576149 100644
--- a/drivers/crypto/intel/qat/qat_common/Makefile
+++ b/drivers/crypto/intel/qat/qat_common/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CRYPTO_DEV_QAT) += intel_qat.o
-ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=CRYPTO_QAT
+ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE='"CRYPTO_QAT"'
 intel_qat-objs := adf_cfg.o \
 	adf_isr.o \
 	adf_ctl_drv.o \
diff --git a/drivers/dma/idxd/Makefile b/drivers/dma/idxd/Makefile
index 2b4a0d406e1e..9ff9d7b87b64 100644
--- a/drivers/dma/idxd/Makefile
+++ b/drivers/dma/idxd/Makefile
@@ -1,4 +1,4 @@
-ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=IDXD
+ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE='"IDXD"'
 
 obj-$(CONFIG_INTEL_IDXD_BUS) += idxd_bus.o
 idxd_bus-y := bus.o
diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index 53b1eb876a12..2c9512589297 100644
--- a/drivers/gpio/gpio-idio-16.c
+++ b/drivers/gpio/gpio-idio-16.c
@@ -14,7 +14,7 @@
 
 #include "gpio-idio-16.h"
 
-#define DEFAULT_SYMBOL_NAMESPACE GPIO_IDIO_16
+#define DEFAULT_SYMBOL_NAMESPACE "GPIO_IDIO_16"
 
 #define IDIO_16_DAT_BASE 0x0
 #define IDIO_16_OUT_BASE IDIO_16_DAT_BASE
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index ee04795b98aa..c243b51837d2 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -57,7 +57,7 @@
 #include "nct6775.h"
 
 #undef DEFAULT_SYMBOL_NAMESPACE
-#define DEFAULT_SYMBOL_NAMESPACE HWMON_NCT6775
+#define DEFAULT_SYMBOL_NAMESPACE "HWMON_NCT6775"
 
 #define USE_ALTERNATE
 
diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 857783d458fb..183a35038eef 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -29,7 +29,7 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW_COMMON
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW_COMMON"
 
 #include "i2c-designware-core.h"
 
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 69705cc7e607..c8cbe5b1aeb1 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -22,7 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
 
 #include "i2c-designware-core.h"
 
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index a98dcddacece..dc2b788eac5b 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -16,7 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+#define DEFAULT_SYMBOL_NAMESPACE	"I2C_DW"
 
 #include "i2c-designware-core.h"
 
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 9c733877e98e..675b252d9c8c 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -6,7 +6,7 @@
  * Copyright (C) 2011-2012 Avionic Design GmbH
  */
 
-#define DEFAULT_SYMBOL_NAMESPACE PWM
+#define DEFAULT_SYMBOL_NAMESPACE "PWM"
 
 #include <linux/acpi.h>
 #include <linux/module.h>
diff --git a/drivers/pwm/pwm-dwc-core.c b/drivers/pwm/pwm-dwc-core.c
index c8425493b95d..6dabec93a3c6 100644
--- a/drivers/pwm/pwm-dwc-core.c
+++ b/drivers/pwm/pwm-dwc-core.c
@@ -9,7 +9,7 @@
  * Author: Raymond Tan <raymond.tan@intel.com>
  */
 
-#define DEFAULT_SYMBOL_NAMESPACE dwc_pwm
+#define DEFAULT_SYMBOL_NAMESPACE "dwc_pwm"
 
 #include <linux/bitops.h>
 #include <linux/export.h>
diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 867e2bc8c601..3b99feb3bb49 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -19,7 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/time.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE PWM_LPSS
+#define DEFAULT_SYMBOL_NAMESPACE "PWM_LPSS"
 
 #include "pwm-lpss.h"
 
diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index 9d0c971e49f5..a3093e09309f 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -8,7 +8,7 @@
  */
 
 #undef DEFAULT_SYMBOL_NAMESPACE
-#define DEFAULT_SYMBOL_NAMESPACE SERIAL_NXP_SC16IS7XX
+#define DEFAULT_SYMBOL_NAMESPACE "SERIAL_NXP_SC16IS7XX"
 
 #include <linux/bits.h>
 #include <linux/clk.h>
diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
index 46635fa4a340..28db337f190b 100644
--- a/drivers/usb/storage/Makefile
+++ b/drivers/usb/storage/Makefile
@@ -8,7 +8,7 @@
 
 ccflags-y := -I $(srctree)/drivers/scsi
 
-ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_STORAGE
+ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE='"USB_STORAGE"'
 
 obj-$(CONFIG_USB_UAS)		+= uas.o
 obj-$(CONFIG_USB_STORAGE)	+= usb-storage.o
diff --git a/include/linux/export.h b/include/linux/export.h
index f5f3950a1e42..2633df4d31e6 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -60,7 +60,7 @@
 #endif
 
 #ifdef DEFAULT_SYMBOL_NAMESPACE
-#define _EXPORT_SYMBOL(sym, license)	__EXPORT_SYMBOL(sym, license, __stringify(DEFAULT_SYMBOL_NAMESPACE))
+#define _EXPORT_SYMBOL(sym, license)	__EXPORT_SYMBOL(sym, license, DEFAULT_SYMBOL_NAMESPACE)
 #else
 #define _EXPORT_SYMBOL(sym, license)	__EXPORT_SYMBOL(sym, license, "")
 #endif
-- 
2.43.0


