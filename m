Return-Path: <linux-kbuild+bounces-3580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FAF97A424
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 16:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1EE4286461
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 14:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF1315575B;
	Mon, 16 Sep 2024 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3KRdDHS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E94145341;
	Mon, 16 Sep 2024 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497060; cv=none; b=KPPbfES6qfq904vHMB668hoC1fvgPhOAPmYx01/fDFdu0aPE8DaMdhUN8Y04RNZmyuHyOXVZ7SZvgrLMEd1XOOBylK4k0eQgSV6b0udR73Xh3eQvDBNULVVU6QlD74OMuhWuvKU5K08Dn/g6VMeiGbNQSRCRBXwrT4dXmQFu5dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497060; c=relaxed/simple;
	bh=HCrmuW3dR9M02oUBEsakxjUb6fYvC4XD7LtHBzobUfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3QBZnkZYIe+wQL/VY5olTI96a9Ws5iXbg2Cw4E8phZAkVerDlW+Z+FW2s194czdJDbkHi8BJefygr94zvsLNoqc6dIxk5mZMRoYYG1WSrm0l7gCZjSHmbK6MlNtGlt9riFRo0v7HrwjQMTyT40B9Yc+NeTOloQx9etEbt0IhIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3KRdDHS; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0b7efa1c1bso4349397276.3;
        Mon, 16 Sep 2024 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726497058; x=1727101858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPqv6Sz3zjpMesSKmef2fhFRmwMP8B3HlSiukgAgFqw=;
        b=I3KRdDHSspdiCmHN5cs2dMihA2YlSkQr/gLF36ej4odyaFIxBAaQSMW1//vpdxRswm
         x2hO0BfN/7cBHVhQWgBHgBxK68xEihgApstZWXlwd528Tb3O6tqrrt+iIJbJdkJ4Xz3s
         7Agt42NAfstajnJSz9X/tFdiYHLxU+E7ewrksYfO1na2wntT7NXWPn3J2q92pzbtBvC2
         7qmuv4i+AWc7piJk/NQSg4O73ZeSFhNA593hkEFDAsiBhNuOEQgqX6WlumNj2II2alz/
         8CrjTVo1kLkGRgQWfINdtYHCLm8FIoSiWSOG4suJezDepLQHpZUZIVVXQ3ppv0xLBfme
         KR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726497058; x=1727101858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPqv6Sz3zjpMesSKmef2fhFRmwMP8B3HlSiukgAgFqw=;
        b=Rya7wbvEA/z2Ar2xhbLiwpQnDqIRuguvtBfpG24PABIEl9qD7hHTQOXCcoyYu0zUp3
         y/KSSTrivwk2X4pshIOpnLPcC5xnVUVkzyqreU7WKrrWJRJ3Tj4NeXJkE51UiWpot7Dn
         DHL0M/a7E0YeuF3rzFIHEQZa2e9hsrRU900705MUbdp4Kra8cOclrGZiT/p469KBMGE7
         PgWF6F26MNThlR+1JD96y/fialegOr9TCfc737ZT+30mrZzzVz4SFYkjy9Kb5tCJgtFa
         RVTBBXDBgqwuxk1NYcNXFNm7lXiMWr1h/t6Bwg/9dhDOZx1LVefm+nUagRSoaXaKt/E4
         8zrA==
X-Forwarded-Encrypted: i=1; AJvYcCWDqC03DIHNmoM9S9KYk1qM3p9Lw0FP35dlEISCFyeavlgLGABwtl/toncDupKI/j674KSe0ytoisOwcT4=@vger.kernel.org, AJvYcCWpVKilkCh6hR+7jhNkq9qvXp2H2GjamwBBLxB+iF0QFXDyAxt7Ubj+9FOeEfSsphwzl69esNKKEmnN50SP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84iB6HP8VwymsKJN4cOw0LcXyJqmkJ8T3D1NvBAlQEP/+WgiN
	4J9x4Z8TfELmpCd2ag7yJWK0KIrGfU9z21v95n2H16kUiTWu23/yGPBWvw==
X-Google-Smtp-Source: AGHT+IFWqgB/T7rpaUcfqLhHRzirRihOVgXtwiGm08nFHbjF+jQJmLL6l3AQoC2D4ZzcuuGuNMuthA==
X-Received: by 2002:a05:6902:1502:b0:e1f:a30:2f59 with SMTP id 3f1490d57ef6-e1f0a3030d9mr6050510276.32.1726497055281;
        Mon, 16 Sep 2024 07:30:55 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1dc139f8afsm984101276.64.2024.09.16.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 07:30:54 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH v2 0/7] linux-kbuild: fix: process configs set to "y"
Date: Mon, 16 Sep 2024 10:29:37 -0400
Message-ID: <20240916142939.754911-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

--- 
V2: 
	- Put in subject. 
V1:
	- https://lore.kernel.org/all/20240913171205.22126-1-david.hunter.linux@gmail.com/

--- 
 scripts/kconfig/streamline_config.pl | 77 ++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 11 deletions(-)

 


