Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6012580750
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2019 18:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388873AbfHCQo3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Aug 2019 12:44:29 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44575 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388134AbfHCQo3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Aug 2019 12:44:29 -0400
Received: by mail-vs1-f67.google.com with SMTP id v129so53334034vsb.11
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Aug 2019 09:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Avufe+b7e+4Imjlz7leZp5HGqXon2BQg34tGWhcU5uM=;
        b=Dhg4a0trvnFa2QrA/si5nyuqFJDAo2Nqffn5wOHZqFArSQiHQcZDUwk6CoVBlZUYaD
         ZJW2wtGAqxv+xybVaHHvAG7ogpqafMh1KnYS4uGNSH0YfBXcKjquTXOCYITxjIW+La+O
         tCMXPNM09X2XdH9YnRHD1p+4a9fIeH4Q5k9abIoKS8WRV9wXDdw4lBNjmNocOecmrv6Q
         0YmPeBlAoXP4RHucVZbar0j9m7T54/aMtVJ7xKfxMXEnOT5RaSV1f8hneHGE9kaGK4K3
         iYbB5eyHMTZy80xCrvLn8upCjd5rHkfQ9bzXwin5Ynp+EeScFI4qLDOQAMzOIHx1okfW
         PKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Avufe+b7e+4Imjlz7leZp5HGqXon2BQg34tGWhcU5uM=;
        b=LdDXQW2PIxw3yAwMaAJTqBYFg6ZypbeRYIGRO5NhsPkB3Qf9SL6/VbS9Q6Lqd28vax
         PP3GJf2cpwOfC91J5le0YRN7yUObYafjAXuWE55OVvJRRABre3GMs4hVgDCklnsa0orp
         gbVxCOIQLyQuIOZR1Rs3vnzRhLFBLLxZ15Z42QUsjoks1NMlV+Eei2RCyZAcK32iVKif
         RWLM9SasQvk+TxPj7hiYBdRDE4njAQQyvnYopcCbk58NkG/2VMtyrt/iIs9kT+6fytpV
         ZSOUE17GScl7PQnFtyAHx2JfWRy9cW8hX4jgv4DRrCMXRm8EsezDyBl4lhUW3TWeqUMj
         SL/w==
X-Gm-Message-State: APjAAAUr4AQr1qh8dQ2/lbazGPaAjxpr1hNfMFANltLuAkWARp9EyUsJ
        bRmo/QBo+LltlpHeY2pbABntn/QCtCDCQfL9tNugYbKmzLQ=
X-Google-Smtp-Source: APXvYqwil9bo2H/7rUb/oGBybhIrynMkY4CatNEPRWZkbVuNGIXux9bnWbE5/p/LzCvXG3ieIsomHDl/zvAHMlNx0Js=
X-Received: by 2002:a67:eb12:: with SMTP id a18mr2957191vso.119.1564850668734;
 Sat, 03 Aug 2019 09:44:28 -0700 (PDT)
MIME-Version: 1.0
From:   Thomas Albers <thomas.gameiro@googlemail.com>
Date:   Sat, 3 Aug 2019 11:44:18 -0500
Message-ID: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
Subject: make_kernelconfig fails in OpenWRT buildroot
To:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello!

When you say "make kernel_menuconfig" in OpenWRT buildroot kernel
configuration fails, like so:
$ make kernel_menuconfig
make[3]: Entering directory
'/home/ta/openwrt/build_dir/target-arm_cortex-a15+neon-vfpv4_musl_eabi/linux-ipq806x/linux-4.14.134'
  HOSTCC  scripts/kconfig/mconf.o
  HOSTCC  scripts/kconfig/lxdialog/checklist.o
  HOSTCC  scripts/kconfig/lxdialog/util.o
  HOSTCC  scripts/kconfig/lxdialog/inputbox.o
  HOSTCC  scripts/kconfig/lxdialog/textbox.o
  HOSTCC  scripts/kconfig/lxdialog/yesno.o
  HOSTCC  scripts/kconfig/lxdialog/menubox.o
  HOSTLD  scripts/kconfig/mconf
/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
scripts/kconfig/lxdialog/checklist.o: undefined reference to symbol
'keypad'
/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../x86_64-pc-linux-gnu/bin/ld:
/lib64/libtinfow.so.6: error adding symbols: DSO missing from command
line
collect2: error: ld returned 1 exit status

Steps to reproduce (see
https://openwrt.org/docs/guide-developer/build-system/use-buildsystem)
$ git clone https://github.com/openwrt/openwrt.git
$ make menuconfig
$ make defconfig
$ make kernel_menuconfig

It seems that the bug was introduced here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd65465b7016dc6d9fa5c2f39cc706c231c9a089
when menuconfig no longer used pkg-config to find the ncurses libraries.
Also see a related bug report from Gentoo: https://bugs.gentoo.org/457530
and the OpenWRT bug report:
https://bugs.openwrt.org/index.php?do=details&task_id=2423

Thanks,
Thomas
