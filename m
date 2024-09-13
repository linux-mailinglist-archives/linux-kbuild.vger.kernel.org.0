Return-Path: <linux-kbuild+bounces-3536-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6751A978671
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99F441C22E27
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76FC558A5;
	Fri, 13 Sep 2024 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNQvplq5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8526289;
	Fri, 13 Sep 2024 17:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247548; cv=none; b=FukbtXzG7M0+LbdpYeRyoR4QD8bRVgVsKeGOEuVi9C5Z9uAOnTcU0iVTNofXjlPUgYyDZVYfUqa9rL96V7IqMps5fbFdVEDolLKMC9DTwQILmG0/L+7Y2Y0ACwAdPdpgwOHsgckIst90Jn1oBQtpCc31dcru8OAlJvesX0fjvHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247548; c=relaxed/simple;
	bh=H9kveRfdju8ns72LcPXYG/4RQWRRAydT+wUcFu68scs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMfSSgthceVblXUcy1olWmpOnRN4HvFMr1DWOCOvqAG9OjrwChdy2SIrwW9GnC6Ch8pi5c+bWsAxmGZYUFska/Th06x/35Tc939T4tKP3IK3u8JN8szkpNttBKc5bWmq8ilVbwy9kHN8ztLEJNr6EVwsjmnxszGfXy7ZYU9Cq0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNQvplq5; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso2261545276.1;
        Fri, 13 Sep 2024 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247546; x=1726852346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cEZGMSLED3ck6QOM4TXiWYAj0JjuuDQKVgX6GelLEIE=;
        b=mNQvplq5hE0ywWaTeCe5iJPnPqQDFaI8EvMdYLw6dnE7FgLcNbaAbXFTPtDS1qGnMK
         8H5eDk86wIbpj8jojE+hbHk/R1l9VVtcADosRIFJ5Jbd/3LIf3Ae7RIdlPU+vdAxe1Po
         spqMeOvwn3wXwCztQs9intHK/kPFFWhUcDalZ2cTJ2Yi/ZHNCLaBJIFC54+lrATHzgpv
         9N8IDwgPdDdu0A/meRCSHa+BD48jBPx32hjJ1LIsPwuJvmzSx+DB5egLfHoZMsYtgc6C
         lQqOvoSOEy2peCiOyZjsnlv20okHYkaOenB7jtrMgSafrp7+1o6TQSOdPDVTLm7jqBr+
         /FKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247546; x=1726852346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEZGMSLED3ck6QOM4TXiWYAj0JjuuDQKVgX6GelLEIE=;
        b=wKp8wLe7MA/szk+GYjpF8XyAJHWa8cq+qV7a/0Q3/StM0969Em30s3FhMwtJKCSnPh
         PFWtztIeI11gQ4gH1uzLkjQ6B+1efHqKwCROoJbNRkvRUZpeB2cuZ44kNBtdCqluu014
         /aWZHcux40QQytksJrCeNqmmV1KQfuiX3mzj4pvXFGXdq8RAMf+D+thLw6HHTHq/8GSo
         6Th9Zc+AVtmfzgwK51WwYandU6sR1pKQ+LMF+7BIS6F8w7KDbLVCKVl5WFYIqSvHaZ/m
         g4Slb9LrFh9eHYW+7hmFGNK+b/tTVHP0VPnOIlMMQ9zRjAgyb1RAG3KwewNYS/o7t+Bx
         PVDg==
X-Forwarded-Encrypted: i=1; AJvYcCU7tPrD7iK7UyNbYGVV5A3CiIv9nhwxjiyhCBTMKFjrx0BLyC6TdptKudNJlDxEfJp/ypv8Fec6lnx7dIY=@vger.kernel.org, AJvYcCUwICjlJYtNVZpezMhkgtZWuhxW5m30C8frbEih796gnz7yib/IlDaoY3SBQKzNECHgzxMIXlnRUUiHpQAd@vger.kernel.org
X-Gm-Message-State: AOJu0YwctNQlcy2u83tm2oBCVRe9YOxmQmiQoYm+Dz0V6LTaDJeVGbKH
	nQdN0/RaMcWMmtZJQu9ZDBxHAimug+ldeVSZ7gC7BNunxi9xkEKw
X-Google-Smtp-Source: AGHT+IG3vkUO7+T3bpL/p/OzMwdPW18H25pT1BnBjy00McmJ1NFB3hUeNbvsE3PcdtNSotLvonRptw==
X-Received: by 2002:a05:690c:6206:b0:6db:c6d8:e11e with SMTP id 00721157ae682-6dbc6d8e528mr55403597b3.11.1726247546210;
        Fri, 13 Sep 2024 10:12:26 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db96499e36sm14585547b3.71.2024.09.13.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:25 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: 
Date: Fri, 13 Sep 2024 13:11:55 -0400
Message-ID: <20240913171205.22126-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	
Date: Fri, 13 Sep 2024 11:52:16 -0400
Subject: [PATCH 0/7] linux-kbuild: fix: process configs set to "y"

An assumption made in this script is that the config options do not need
to be processed because they will simply be in the new config file. This
assumption is incorrect. 

Process the config entries set to "y" because those config entries might
have dependencies set to "m". If a config entry is set to "m" and is not
loaded directly into the machine, the script will currently turn off
that config entry; however, if that turned off config entry is a
dependency for a "y" option. that means the config entry set to "y"
will also be turned off later when the conf executive file is called. 

Here is a model of the problem (arrows show dependency): 

Original config file
Config_1 (m) <-- Config_2 (y) 

Config_1 is not loaded in this example, so it is turned off. 
After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
Config_1 (n) <-- Config_2 (y) 

After  scripts/kconfig/conf
Config_1 (n) <-- Config_2 (n) 


It should also be noted that any module in the dependency chain will
also be turned off, even if that module is loaded directly onto the
computer. Here is an example: 

Original config file
Config_1 (m) <-- Config_2 (y) <-- Config_3 (m)

Config_3 will be loaded in this example.
After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
Config_1 (n) <-- Config_2 (y) <-- Config_3 (m)

After scripts/kconfig/conf
Config_1 (n) <-- Config_2 (n) <-- Config_3 (n)


I discovered this problem when I ran "make localmodconfig" on a generic
Ubuntu config file. Many hardware devices were not recognized once the
kernel was installed and booted. Another way to reproduced the error I
had is to run "make localmodconfig" twice. The standard error might display
warnings that certain modules should be selected but no config files are
turned on that select that module. 

With the changes in this series patch, all modules are loaded properly
and all of the hardware is loaded when the kernel is installed and
booted.  


David Hunter (7):
  linux-kbuild: fix: config option can be bool
  linux-kbuild: fix: missing variable operator
  linux-kbuild: fix: ensure all defaults are tracked
  linux-kbuild: fix: ensure selected configs were turned on in original
  linux-kbuild: fix: implement choice for kconfigs
  linux-kbuild: fix: configs with defaults do not need a prompt
  linux-kbuild: fix: process config options set to "y"

 scripts/kconfig/streamline_config.pl | 77 ++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 11 deletions(-)

-- 
2.43.0


