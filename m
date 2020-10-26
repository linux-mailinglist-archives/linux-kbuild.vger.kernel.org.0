Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8572299492
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 18:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782051AbgJZR5p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 13:57:45 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36308 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782040AbgJZR5o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 13:57:44 -0400
Received: by mail-pl1-f193.google.com with SMTP id r10so5096704plx.3
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2020 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WU3hID4rRFAfybLKsH6+3te5KdmTCS1oR9J+E9Kmf60=;
        b=RmpKg4D4H93vwtvZknkbx3qsbYiuQISLZRbZIAWleMErWgdkSz9mEdzY86om5DxhXm
         bNBM6juO4iHCKF5yrUxLgPtYo3WQ4t3bqLXEGzmXmPIPW/bilEXqnewaEqm3/QYI3uPo
         7TbvmANVW/D0I5a5Y+Z0lswVWE9pWzeJimBf3VWrM5GDxg9by513JLpsg+pvW2OMHNx/
         5IAeSY9tR+oewkEtWIiOPomZ11+kbstV+xIyja//xRgS9NRvMD+GIX4CftV0+DfflCLS
         57pq4KROnHZ+ykYHeQAB567OoTLDPANGzO7oB6haIPT85QKz7RxtNyslKuxevCakxUP4
         aLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WU3hID4rRFAfybLKsH6+3te5KdmTCS1oR9J+E9Kmf60=;
        b=BLXlWyWcbT0SG/pqw70FfBqQMMVrkKjaRW61cUwbai6Ipo5XUA9OfLqCKXfUGuh8hS
         kWObasdr/FfyyvyKE0STBd/kA0qjXg9xugt+C2viXqBs/usjbMYP8ys0z0HGdXNA65Eu
         mZvFWwElGmgt+7ZCeKqQlE1o/lfBBkbBMZOJreZk20R3RyrYPkaSDExn5/PUrWWnJosw
         E71HD365kwTy2idN6Sj56I8SSt+JI2FjVE2pqDbfrwL2ONHyLMZcZ7hvZFASKVOt1Aky
         uKFrVEEGGHx4OcYqDKOS/OTOvBNWJq2UasnJxg+s48uruN0tILEx68v4D5sYtsB4TayM
         e31g==
X-Gm-Message-State: AOAM530/9IM29ncs8dTOnObuRU70S4UptwnTBYYJt+2GeFig2wgO28Mt
        ZJrxE43RvkU2FgPFwvWC41l3
X-Google-Smtp-Source: ABdhPJzZvz44Tk4SHKhCGs9eVHRNgAAOnqgaIe89LtwV7lyl4vApI18Ycg1afAgRWbBo9/A0iBCJfw==
X-Received: by 2002:a17:90b:3598:: with SMTP id mm24mr22162836pjb.172.1603735064009;
        Mon, 26 Oct 2020 10:57:44 -0700 (PDT)
Received: from localhost.localdomain ([116.68.74.56])
        by smtp.gmail.com with ESMTPSA id o65sm11583088pga.42.2020.10.26.10.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:57:43 -0700 (PDT)
From:   Vaishnav M A <vaishnav@beagleboard.org>
To:     johan@kernel.org
Cc:     ribalda@kernel.org, robh@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, masahiroy@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kbuild@vger.kernel.org,
        jkridner@beagleboard.org, drew@beagleboard.org,
        robertcnelson@beagleboard.org, vaishnav@beagleboard.org
Subject: [RFC PATCH 0/5] Add serdev_device_id for platform instantiation
Date:   Mon, 26 Oct 2020 23:27:13 +0530
Message-Id: <20201026175718.965773-1-vaishnav@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch series aims to add serdev_device_id to the serdev drivers
so as to support platform instantiation of a serdev device.The first
two patches adding the serdev_device_id has already been once submitted
by Ricardo Ribalda Delgado(in CC) here:
https://lore.kernel.org/lkml/20180611115240.32606-1-ricardo.ribalda@gmail.com/

The problem currently trying to solved is bit different from dynamically
loading/removing serdev devices as addressed in the original patch series,
the aim now is to attach a serdev driver once to a device that is not a part of
the device tree or the ACPI table, Eg. a device on a greybus created gbphy uart.

The patches were tested with a set of uBlox GNSS Receiver Clicks on a PocketBeagle.
The serdev_device_id table is exported only for a single driver(drivers/gnss/ubx.c)
for reference.

Ricardo Ribalda (2):
  serdev: Add serdev_device_id
  file2alias: Support for serdev devices

Vaishnav M A (3):
  serdev: add of_ helper to get serdev controller
  gnss: ubx add MODULE_DEVICE_TABLE(serdev)
  gnss: change of_property_read to device_property_read

 drivers/gnss/serial.c             |  3 +-
 drivers/gnss/ubx.c                |  9 +++++
 drivers/tty/serdev/core.c         | 58 +++++++++++++++++++++++++++----
 include/linux/mod_devicetable.h   | 10 ++++++
 include/linux/serdev.h            |  5 +++
 scripts/mod/devicetable-offsets.c |  3 ++
 scripts/mod/file2alias.c          | 10 ++++++
 7 files changed, 90 insertions(+), 8 deletions(-)

-- 
2.25.1

